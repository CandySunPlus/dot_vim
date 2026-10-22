// White paper & pen ink — Ghostty custom shader
// 纹理较厚的白纸（冷压水彩纸质感）+ 墨水笔。纸纹同时作用于背景和文字。
// 需配合浅色主题，PAPER_BG 必须与 Ghostty 的 `background` 一致。

const vec3  PAPER_BG  = vec3(0.965, 0.957, 0.933); // #f6f4ee

// —— 纸张 ——
const float RELIEF    = 0.9;   // 纸面凹凸的光影强度（厚重感主要来自这里）
const float GRAIN     = 0.025; // 细颗粒
const float FIBERS    = 0.12;  // 纤维丝
const float UNEVEN    = 0.02;  // 大面积明暗不均
const float VIGNETTE  = 0.05;  // 边缘轻微变暗（中性灰，不泛黄）

// —— 墨迹 ——
const float INK_WOBBLE = 0.4;  // 笔画边缘抖动（像素）
const float INK_BLEED  = 0.25; // 渗墨柔化 0..1
const float INK_ROUGH  = 0.35; // 边缘毛糙
const float INK_VARY   = 0.15; // 墨色深浅不均
const float INK_SKIP   = 0.35; // 纸面凸起处笔尖蹭不到墨

float hash(vec2 p) {
    p = fract(p * vec2(123.34, 456.21));
    p += dot(p, p + 45.32);
    return fract(p.x * p.y);
}

float vnoise(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash(i), hash(i + vec2(1, 0)), u.x),
               mix(hash(i + vec2(0, 1)), hash(i + vec2(1, 1)), u.x), u.y);
}

float fbm(vec2 p) {
    float v = 0.0, a = 0.5;
    mat2 r = mat2(1.6, 1.2, -1.2, 1.6);
    for (int i = 0; i < 5; i++) { v += a * vnoise(p); p = r * p; a *= 0.5; }
    return v;
}

// 纸面高度：中频的"齿"+ 稍大的起伏
float height(vec2 p) {
    return fbm(p * 0.09) * 0.65 + fbm(p * 0.03 + 11.0) * 0.35;
}

float fibers(vec2 p) {
    float f = 0.0;
    for (int k = 0; k < 4; k++) {
        float ang = float(k) * 1.7 + 0.3;
        vec2 q = mat2(cos(ang), -sin(ang), sin(ang), cos(ang)) * p + float(k) * 37.0;
        float n = vnoise(q * vec2(0.035, 0.7));
        f += pow(1.0 - abs(n * 2.0 - 1.0), 14.0) * vnoise(q * 0.02);
    }
    return clamp(f, 0.0, 1.0);
}

vec3 paper(vec2 px, vec2 res, float h) {
    // 左上方打光的浮雕
    float hx = height(px + vec2(1.0, 0.0)) - height(px - vec2(1.0, 0.0));
    float hy = height(px + vec2(0.0, 1.0)) - height(px - vec2(0.0, 1.0));
    float light = (-hx + hy) * 0.7071;

    vec3 c = PAPER_BG;
    c *= 1.0 + RELIEF * light;
    c *= 1.0 - 0.03 * (h - 0.5);
    c *= 1.0 + GRAIN * (hash(px) - 0.5) * 2.0;
    c *= 1.0 + UNEVEN * (fbm(px * 0.002 + 7.0) - 0.5) * 2.0;
    c *= 1.0 - FIBERS * 0.4 * fibers(px);
    vec2 d = px / res - 0.5;
    c *= 1.0 - VIGNETTE * smoothstep(0.35, 0.75, length(d * vec2(1.0, res.y / res.x) * 1.2));
    return c;
}

vec3 absorb(vec2 px, vec2 res) {
    vec3 s = texture(iChannel0, px / res).rgb;
    return 1.0 - clamp(s / PAPER_BG, 0.0, 1.1);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 res = iResolution.xy;
    vec2 px = fragCoord;
    float h = height(px);

    vec2 wob = vec2(vnoise(px * 0.18), vnoise(px * 0.18 + 19.0)) - 0.5;
    vec2 p = px + wob * 2.0 * INK_WOBBLE;

    vec3 a = absorb(p, res);

    vec3 blur = vec3(0.0);
    for (int i = 0; i < 8; i++) {
        float t = float(i) * 0.7853982;
        blur += absorb(p + vec2(cos(t), sin(t)) * 1.2, res);
    }
    blur /= 8.0;
    a = mix(a, max(a, blur * 0.9), INK_BLEED);

    float cov = max(a.r, max(a.g, a.b));
    if (cov > 0.002) {
        float n = vnoise(px * 0.55) * 0.6 + hash(px * 1.7) * 0.4;
        float covR = clamp(cov + (n - 0.5) * INK_ROUGH * 4.0 * cov * (1.0 - cov), 0.0, 1.0);
        a *= covR / cov;
    }

    a *= 1.0 - INK_VARY * fbm(px * 0.035 + 3.0);
    a *= 1.0 - INK_SKIP * smoothstep(0.6, 0.78, h);

    vec3 col = paper(px, res, h) * (1.0 - clamp(a, -0.1, 1.0));
    fragColor = vec4(col, 1.0);
}

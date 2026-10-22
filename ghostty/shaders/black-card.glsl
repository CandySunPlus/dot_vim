// Matte black writing paper & fountain pen — Ghostty custom shader
// 哑光微灰的黑色书写纸（带随机的锐利横向纤维纹）+ 钢笔墨水。
// 需配合深色主题，PAPER_BG 必须与 Ghostty 的 `background` 一致。

const vec3  PAPER_BG  = vec3(0.141, 0.141, 0.149); // #242426

// —— 纸张 ——
const float GRAIN     = 0.05;  // 细颗粒
const float MOTTLE    = 0.035; // 纸浆成形的细小云状斑驳
const float UNEVEN    = 0.02;  // 大面积极轻微的明暗不均
const float STREAKS   = 0.10;  // 横向纤维纹强度
const float STREAK_DENSITY = 0.35; // 横向纹出现的比例 0..1

// —— 钢笔墨 ——
const float INK_OPACITY = 0.95; // 遮盖力
const float INK_WOBBLE  = 0.3;  // 笔画边缘抖动（像素）
const float INK_ROUGH   = 0.2;  // 边缘毛糙
const float INK_SHADE   = 0.40; // 墨色浓淡（钢笔 shading，最有"笔写感"的一项）
const float INK_RIM     = 0.35; // 笔画边缘墨水堆积更浓
const float INK_FEATHER = 0.30; // 墨水沿横向纤维洇出的细丝
const float INK_GRAIN   = 0.05; // 纸面颗粒透过墨层

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

// 横向纤维：沿 x 拉得很长、沿 y 只有 1~2 像素，再阈值化得到锐利边缘。
// 返回 -1..1（亮纹为正，暗纹为负）
float streaks(vec2 px) {
    float row  = vnoise(vec2(px.x * 0.004, px.y * 0.9));
    float seg  = smoothstep(1.0 - STREAK_DENSITY, 1.0 - STREAK_DENSITY + 0.15,
                            vnoise(vec2(px.x * 0.0025 + 5.0, px.y * 0.06)));
    float lite = smoothstep(0.68, 0.74, row);
    float dark = smoothstep(0.68, 0.74, 1.0 - row);
    return (lite - 0.7 * dark) * seg;
}

// 横向纤维的"通道"，墨水沿它洇开
float fiberChannel(vec2 px) {
    return smoothstep(0.62, 0.72, vnoise(vec2(px.x * 0.05, px.y * 1.1 + 13.0)));
}

vec3 delta(vec2 px, vec2 res) {
    return max(texture(iChannel0, px / res).rgb - PAPER_BG, 0.0);
}

float coverage(vec3 d) {
    return clamp(max(d.r, max(d.g, d.b)) / (1.0 - PAPER_BG.r), 0.0, 1.0);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 res = iResolution.xy;
    vec2 px = fragCoord;
    float grain = hash(px) - 0.5;

    // —— 纸 ——
    vec3 c = PAPER_BG;
    c *= 1.0 + GRAIN * grain * 2.0;
    c *= 1.0 + MOTTLE * (fbm(px * 0.12) - 0.5) * 2.0;
    c *= 1.0 + UNEVEN * (fbm(px * 0.008 + 7.0) - 0.5) * 2.0;
    c *= 1.0 + STREAKS * streaks(px);

    // —— 墨 ——
    vec2 wob = vec2(vnoise(px * 0.18), vnoise(px * 0.18 + 19.0)) - 0.5;
    vec2 p = px + wob * 2.0 * INK_WOBBLE;
    vec3 ink = delta(p, res);
    float cov = coverage(ink);

    // 周围一圈的平均覆盖率，用来找笔画边缘
    float ring = 0.0;
    for (int i = 0; i < 8; i++) {
        float t = float(i) * 0.7853982;
        ring += coverage(delta(p + vec2(cos(t), sin(t)) * 1.5, res));
    }
    ring /= 8.0;

    // 边缘毛糙（只扰动半覆盖像素）
    if (cov > 0.002) {
        float n = vnoise(px * 0.6) * 0.6 + hash(px * 1.7) * 0.4;
        float covR = clamp(cov + (n - 0.5) * INK_ROUGH * 4.0 * cov * (1.0 - cov), 0.0, 1.0);
        ink *= covR / cov;
        cov = covR;
    }

    // 边缘积墨：笔画内部靠近边缘处更浓
    ink *= 1.0 + INK_RIM * clamp(cov - ring, 0.0, 1.0) * 2.0;

    // 浓淡：笔画尺度的缓慢变化 + 一点更细的起伏
    float shade = fbm(px * 0.045 + 3.0) * 0.75 + vnoise(px * 0.2 + 9.0) * 0.25;
    ink *= 1.0 - INK_SHADE * shade;

    // 洇墨：沿横向纤维从笔画两侧渗出细丝
    if (cov < 0.3) {
        float ch = fiberChannel(px);
        if (ch > 0.0) {
            vec3 f = vec3(0.0);
            for (int k = 1; k <= 3; k++) {
                float w = 1.0 - float(k) / 4.0;
                f = max(f, delta(p + vec2(float(k), 0.0), res) * w);
                f = max(f, delta(p - vec2(float(k), 0.0), res) * w);
            }
            ink = max(ink, f * ch * INK_FEATHER);
        }
    }

    ink *= 1.0 + INK_GRAIN * grain * 2.0;

    fragColor = vec4(c + ink * INK_OPACITY, 1.0);
}

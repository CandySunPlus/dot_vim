// Matte black paper & fountain pen — Ghostty custom shader
// 纸纹思路参考 paper.design 的 Paper Texture（github.com/paper-design/shaders）：
// 细节纹理（颗粒 roughness + 纤维 fiber）不做浮雕光照，直接作为图案混入纸色；
// 墨迹与纸纹相乘，并沿纤维梯度轻微扭曲，从而"长"在纸上。
// 需配合深色主题，PAPER_BG 必须与 Ghostty 的 `background` 一致。

const vec3  PAPER_BG    = vec3(0.141, 0.141, 0.149); // #242426 纸色
const vec3  PAPER_TEX   = vec3(0.188, 0.188, 0.200); // #303033 纹理色（纤维/颗粒趋向的颜色，黑纸上偏亮）

// —— 纸纹 ——
const float ROUGHNESS      = 0.20; // 颗粒
const float ROUGHNESS_SIZE = 2.6;  // 颗粒尺寸（像素）
const float FIBER          = 0.65; // 纤维
const float FIBER_SIZE     = 9.0;  // 纤维最粗一层的尺寸（像素），越大越舒展
const float DROPS          = 0.10; // 零星的暗斑
const float DROPS_SIZE     = 70.0; // 暗斑间距（像素）

// —— 光照（只有整体明暗，不对细节打光）——
const vec2  LAMP_POS  = vec2(0.15, 1.15); // 光源中心（窗口 uv，左上方外侧，y 向上）
const float LAMP      = 0.12;  // 远离光源一侧的变暗程度
const float VIGNETTE  = 0.08;

// —— 钢笔墨 ——
const float INK_OPACITY = 0.95; // 遮盖力
const float INK_DISTORT = 0.35; // 墨迹随纤维扭曲（像素）
const float INK_ROUGH   = 0.2;  // 边缘毛糙
const float INK_SHADE   = 0.40; // 墨色浓淡（钢笔 shading）
const float INK_RIM     = 0.35; // 笔画边缘墨水堆积更浓
const float INK_TEXTURE = 0.45; // 纸纹透过墨层的程度

// Dave Hoskins hash：格点上无方向性相关
float hash(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * 0.1031);
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.x + p3.y) * p3.z);
}

vec2 hash22(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

float vnoise(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(mix(hash(i), hash(i + vec2(1, 0)), u.x),
               mix(hash(i + vec2(0, 1)), hash(i + vec2(1, 1)), u.x), u.y);
}

// 值噪声的解析梯度
vec2 vgrad(vec2 p) {
    vec2 i = floor(p), f = fract(p);
    float a = hash(i), b = hash(i + vec2(1, 0)), c = hash(i + vec2(0, 1)), d = hash(i + vec2(1, 1));
    vec2 u = f * f * (3.0 - 2.0 * f);
    vec2 du = 8.0 * f * (1.0 - f);
    return vec2(du.x * mix(b - a, d - c, u.y), du.y * mix(c - a, d - b, u.x));
}

float fbm(vec2 p) {
    float v = 0.0, a = 0.5;
    mat2 r = mat2(1.6, 1.2, -1.2, 1.6);
    for (int i = 0; i < 5; i++) { v += a * vnoise(p); p = r * p; a *= 0.5; }
    return v;
}

// 颗粒：两组噪声之差的平方，大部分平坦、偶有亮点
float roughness(vec2 px) {
    vec2 q = px / ROUGHNESS_SIZE;
    float n1 = vnoise(q) * 0.6 + vnoise(q * 2.1 + 3.0) * 0.4;
    float n2 = vnoise(q + 57.0) * 0.6 + vnoise(q * 2.1 + 91.0) * 0.4;
    float d = 0.5 + n1 - n2;
    return 3.0 * d * d - 0.7;
}

// 纤维：多层旋转噪声梯度之和，取长度得到弯曲交织的细丝
vec2 fiberGrad(vec2 px) {
    vec2 grad = vec2(0.0);
    float amp = 1.0, scale = 1.0, freq = 1.0 / FIBER_SIZE;
    for (int i = 0; i < 5; i++) {
        float an = float(i) * 0.8 + 0.3;
        float rc = cos(an), rs = sin(an);
        vec2 q = px * freq;
        q = vec2(rc * q.x - rs * q.y, rs * q.x + rc * q.y) + float(i) * 17.0;
        vec2 g = vgrad(q);
        grad += amp * scale * vec2(rc * g.x + rs * g.y, -rs * g.x + rc * g.y);
        scale *= 1.7;
        amp *= 0.5;
        freq *= 1.7;
    }
    return grad;
}

float drops(vec2 uv) {
    vec2 i = floor(uv), f = fract(uv);
    float m = 1.0;
    for (int y = -1; y <= 1; y++)
        for (int x = -1; x <= 1; x++) {
            vec2 nb = vec2(float(x), float(y));
            vec2 pos = nb + hash22(i + nb) - f;
            m *= min(1.0, dot(pos, pos));
        }
    return 0.5 * clamp((sqrt(sqrt(m)) - 0.09) / (0.08 - 0.09), 0.0, 1.0);
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
    vec2 uv = px / res;

    // —— 纸 ——
    vec2 fg = fiberGrad(px);
    float fiber = clamp(0.333 * length(fg), 0.0, 1.0);
    float pattern = clamp(ROUGHNESS * roughness(px) + FIBER * fiber, 0.0, 1.0);

    float lamp = 1.0 - LAMP * smoothstep(0.2, 2.0, length((uv - LAMP_POS) * vec2(res.x / res.y, 1.0)));
    vec2 d = uv - 0.5;
    lamp *= 1.0 - VIGNETTE * smoothstep(0.3, 0.8, length(d * vec2(1.0, res.y / res.x) * 1.2));

    vec3 paper = mix(PAPER_BG, PAPER_TEX, pattern);
    paper *= 1.0 - DROPS * drops(px / DROPS_SIZE);
    paper *= lamp;

    // —— 墨：采样位置沿纤维梯度扭曲 ——
    vec2 p = px + fg * (INK_DISTORT / 3.0);
    vec3 ink = delta(p, res);
    float cov = coverage(ink);

    if (cov > 0.002) {
        float ring = 0.0;
        for (int i = 0; i < 8; i++) {
            float t = float(i) * 0.7853982;
            ring += coverage(delta(p + vec2(cos(t), sin(t)) * 1.5, res));
        }
        ring /= 8.0;

        // 边缘毛糙（只扰动半覆盖像素）
        float nz = vnoise(px * 0.6) * 0.6 + hash(px * 1.7) * 0.4;
        float covR = clamp(cov + (nz - 0.5) * INK_ROUGH * 4.0 * cov * (1.0 - cov), 0.0, 1.0);
        ink *= covR / cov;
        cov = covR;

        // 边缘积墨 + 浓淡
        ink *= 1.0 + INK_RIM * clamp(cov - ring, 0.0, 1.0) * 2.0;
        float shade = fbm(px * 0.045 + 3.0) * 0.75 + vnoise(px * 0.2 + 9.0) * 0.25;
        ink *= 1.0 - INK_SHADE * shade;

        // 纸纹透过墨层（与纸纹相乘）
        ink *= 1.0 - INK_TEXTURE * pattern;

        paper += ink * INK_OPACITY * lamp;
    }

    fragColor = vec4(paper, 1.0);
}

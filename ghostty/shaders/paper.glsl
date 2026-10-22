// Paper & fountain pen — Ghostty custom shader（深浅主题通用）
// 纸纹思路参考 paper.design 的 Paper Texture（github.com/paper-design/shaders）：
// 细节纹理（颗粒 roughness + 纤维 fiber）不做浮雕光照，直接作为图案混入纸色；
// 墨迹与纸纹结合，并沿纤维梯度轻微扭曲，从而"长"在纸上。
//
// 纸色不写死：从窗口左下角的内边距处读取终端背景色，因此跟随当前主题
// （如 Catppuccin Latte / Mocha）自动切换；需要 window-padding 不为 0。
//   深色背景 → 黑纸 + 浅色笔：笔墨叠加在纸上
//   浅色背景 → 白纸 + 钢笔：纸吸收墨水（乘法）

// —— 纸纹 ——
const float ROUGHNESS      = 0.20; // 颗粒
const float ROUGHNESS_SIZE = 2.6;  // 颗粒尺寸（像素）
const float FIBER          = 0.65; // 纤维
const float FIBER_SIZE     = 9.0;  // 纤维最粗一层的尺寸（像素），越大越舒展
const float DROPS          = 0.10; // 零星的暗斑（浅色纸上自动减弱）
const float DROPS_SIZE     = 70.0; // 暗斑间距（像素）
const float TEX_DARK       = 1.28; // 深色纸：纹理色 = 纸色 × 此值（同色相略亮）
const float TEX_LIGHT      = 0.955; // 浅色纸：纹理色 = 纸色 × 此值（同色相略暗；白纸上暗纹更显眼，所以更接近 1）

// —— 光照（只有整体明暗，不对细节打光）——
const vec2  LAMP_POS  = vec2(0.15, 1.15); // 光源中心（窗口 uv，左上方外侧，y 向上）
const float LAMP      = 0.12;  // 远离光源一侧的变暗程度（浅色纸上自动减半）
const float VIGNETTE  = 0.08;

// —— 钢笔墨 ——
const float INK_OPACITY = 0.95; // 遮盖力
const float INK_DISTORT = 0.35; // 墨迹随纤维扭曲（像素）
const float INK_ROUGH   = 0.2;  // 边缘毛糙
const float INK_SHADE   = 0.40; // 墨色浓淡（钢笔 shading）
const float INK_RIM     = 0.35; // 笔画边缘墨水堆积更浓
const float INK_TEXTURE = 0.45; // 纸纹透过墨层的程度（浅色纸上自动减半）

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

// 颗粒：两组噪声之差的平方，大部分平坦、偶有突起
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

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 res = iResolution.xy;
    vec2 px = fragCoord;
    vec2 uv = px / res;

    // 从内边距读取纸色（终端背景色）
    vec3 bg = texture(iChannel0, vec2(1.5) / res).rgb;
    bool light = dot(bg, vec3(0.2126, 0.7152, 0.0722)) > 0.5;

    // —— 纸 ——
    vec2 fg = fiberGrad(px);
    float fiber = clamp(0.333 * length(fg), 0.0, 1.0);
    float pattern = clamp(ROUGHNESS * roughness(px) + FIBER * fiber, 0.0, 1.0);

    float lampAmt = light ? LAMP * 0.5 : LAMP;
    float lamp = 1.0 - lampAmt * smoothstep(0.2, 2.0, length((uv - LAMP_POS) * vec2(res.x / res.y, 1.0)));
    vec2 d = uv - 0.5;
    lamp *= 1.0 - VIGNETTE * smoothstep(0.3, 0.8, length(d * vec2(1.0, res.y / res.x) * 1.2));

    vec3 tex = clamp(bg * (light ? TEX_LIGHT : TEX_DARK), 0.0, 1.0);
    vec3 paper = mix(bg, tex, pattern);
    paper *= 1.0 - (light ? DROPS * 0.3 : DROPS) * drops(px / DROPS_SIZE);
    paper *= lamp;

    // —— 墨：采样位置沿纤维梯度扭曲 ——
    vec2 p = px + fg * (INK_DISTORT / 3.0);
    // 深色纸：墨 = 比纸亮出的部分（叠加）；浅色纸：墨 = 纸被吸收的比例（乘法）
    vec3 room = light ? max(bg, vec3(1e-3)) : max(1.0 - bg, vec3(1e-3));
    #define INK(q) (light ? (1.0 - texture(iChannel0, (q) / res).rgb / room) \
                          : (texture(iChannel0, (q) / res).rgb - bg))
    #define COV(v) clamp(max(abs(v.r), max(abs(v.g), abs(v.b))) / (light ? 1.0 : max(room.r, max(room.g, room.b))), 0.0, 1.0)

    vec3 ink = INK(p);
    float cov = COV(ink);

    if (cov > 0.002) {
        float ring = 0.0;
        for (int i = 0; i < 8; i++) {
            float t = float(i) * 0.7853982;
            vec3 r = INK(p + vec2(cos(t), sin(t)) * 1.5);
            ring += COV(r);
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

        // 纸纹透过墨层
        ink *= 1.0 - (light ? INK_TEXTURE * 0.5 : INK_TEXTURE) * pattern;

        if (light) paper *= 1.0 - clamp(ink * INK_OPACITY, -0.5, 1.0);
        else       paper += ink * INK_OPACITY * lamp;
    }

    fragColor = vec4(paper, 1.0);
}

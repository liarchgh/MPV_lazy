// Copyright (c) 2023 bjin (https://github.com/bjin/mpv-prescalers)
// Modifications Copyright (c) 2023 Artoriuz
// Changes: Replaced the AR solution with a simpler 4-tap clipper
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

//!DESC [ravu_zoom_pc_r3] (luma, r3)
//!HOOK LUMA
//!BIND HOOKED
//!BIND ravu_zoom_lut3
//!WIDTH OUTPUT.w
//!HEIGHT OUTPUT.h
//!OFFSET ALIGN
//!WHEN HOOKED.w OUTPUT.w < HOOKED.h OUTPUT.h < *
#define LUTPOS(x, lut_size) mix(0.5 / (lut_size), 1.0 - 0.5 / (lut_size), (x))
vec4 hook() {
vec2 pos = HOOKED_pos * HOOKED_size;
vec2 subpix = fract(pos - 0.5);
pos -= subpix;
subpix = LUTPOS(subpix, vec2(9.0));
vec2 subpix_inv = 1.0 - subpix;
subpix /= vec2(5.0, 288.0);
subpix_inv /= vec2(5.0, 288.0);
float ar_strength = 0.8;
float sample0  = HOOKED_tex((pos + vec2(-2.0,-2.0)) * HOOKED_pt).x;
float sample1  = HOOKED_tex((pos + vec2(-2.0,-1.0)) * HOOKED_pt).x;
float sample2  = HOOKED_tex((pos + vec2(-2.0,0.0)) * HOOKED_pt).x;
float sample3  = HOOKED_tex((pos + vec2(-2.0,1.0)) * HOOKED_pt).x;
float sample4  = HOOKED_tex((pos + vec2(-2.0,2.0)) * HOOKED_pt).x;
float sample5  = HOOKED_tex((pos + vec2(-2.0,3.0)) * HOOKED_pt).x;
float sample6  = HOOKED_tex((pos + vec2(-1.0,-2.0)) * HOOKED_pt).x;
float sample7  = HOOKED_tex((pos + vec2(-1.0,-1.0)) * HOOKED_pt).x;
float sample8  = HOOKED_tex((pos + vec2(-1.0,0.0)) * HOOKED_pt).x;
float sample9  = HOOKED_tex((pos + vec2(-1.0,1.0)) * HOOKED_pt).x;
float sample10 = HOOKED_tex((pos + vec2(-1.0,2.0)) * HOOKED_pt).x;
float sample11 = HOOKED_tex((pos + vec2(-1.0,3.0)) * HOOKED_pt).x;
float sample12 = HOOKED_tex((pos + vec2(0.0,-2.0)) * HOOKED_pt).x;
float sample13 = HOOKED_tex((pos + vec2(0.0,-1.0)) * HOOKED_pt).x;
float sample14 = HOOKED_tex((pos + vec2(0.0,0.0)) * HOOKED_pt).x;
float sample15 = HOOKED_tex((pos + vec2(0.0,1.0)) * HOOKED_pt).x;
float sample16 = HOOKED_tex((pos + vec2(0.0,2.0)) * HOOKED_pt).x;
float sample17 = HOOKED_tex((pos + vec2(0.0,3.0)) * HOOKED_pt).x;
float sample18 = HOOKED_tex((pos + vec2(1.0,-2.0)) * HOOKED_pt).x;
float sample19 = HOOKED_tex((pos + vec2(1.0,-1.0)) * HOOKED_pt).x;
float sample20 = HOOKED_tex((pos + vec2(1.0,0.0)) * HOOKED_pt).x;
float sample21 = HOOKED_tex((pos + vec2(1.0,1.0)) * HOOKED_pt).x;
float sample22 = HOOKED_tex((pos + vec2(1.0,2.0)) * HOOKED_pt).x;
float sample23 = HOOKED_tex((pos + vec2(1.0,3.0)) * HOOKED_pt).x;
float sample24 = HOOKED_tex((pos + vec2(2.0,-2.0)) * HOOKED_pt).x;
float sample25 = HOOKED_tex((pos + vec2(2.0,-1.0)) * HOOKED_pt).x;
float sample26 = HOOKED_tex((pos + vec2(2.0,0.0)) * HOOKED_pt).x;
float sample27 = HOOKED_tex((pos + vec2(2.0,1.0)) * HOOKED_pt).x;
float sample28 = HOOKED_tex((pos + vec2(2.0,2.0)) * HOOKED_pt).x;
float sample29 = HOOKED_tex((pos + vec2(2.0,3.0)) * HOOKED_pt).x;
float sample30 = HOOKED_tex((pos + vec2(3.0,-2.0)) * HOOKED_pt).x;
float sample31 = HOOKED_tex((pos + vec2(3.0,-1.0)) * HOOKED_pt).x;
float sample32 = HOOKED_tex((pos + vec2(3.0,0.0)) * HOOKED_pt).x;
float sample33 = HOOKED_tex((pos + vec2(3.0,1.0)) * HOOKED_pt).x;
float sample34 = HOOKED_tex((pos + vec2(3.0,2.0)) * HOOKED_pt).x;
float sample35 = HOOKED_tex((pos + vec2(3.0,3.0)) * HOOKED_pt).x;

float pix_min = 1e8;
// pix_min = min(pix_min, sample0 );
// pix_min = min(pix_min, sample1 );
// pix_min = min(pix_min, sample2 );
// pix_min = min(pix_min, sample3 );
// pix_min = min(pix_min, sample4 );
// pix_min = min(pix_min, sample5 );
// pix_min = min(pix_min, sample6 );
// pix_min = min(pix_min, sample7 );
// pix_min = min(pix_min, sample8 );
// pix_min = min(pix_min, sample9 );
// pix_min = min(pix_min, sample10);
// pix_min = min(pix_min, sample11);
// pix_min = min(pix_min, sample12);
// pix_min = min(pix_min, sample13);
pix_min = min(pix_min, sample14);
pix_min = min(pix_min, sample15);
// pix_min = min(pix_min, sample16);
// pix_min = min(pix_min, sample17);
// pix_min = min(pix_min, sample18);
// pix_min = min(pix_min, sample19);
pix_min = min(pix_min, sample20);
pix_min = min(pix_min, sample21);
// pix_min = min(pix_min, sample22);
// pix_min = min(pix_min, sample23);
// pix_min = min(pix_min, sample24);
// pix_min = min(pix_min, sample25);
// pix_min = min(pix_min, sample26);
// pix_min = min(pix_min, sample27);
// pix_min = min(pix_min, sample28);
// pix_min = min(pix_min, sample29);
// pix_min = min(pix_min, sample30);
// pix_min = min(pix_min, sample31);
// pix_min = min(pix_min, sample32);
// pix_min = min(pix_min, sample33);
// pix_min = min(pix_min, sample34);
// pix_min = min(pix_min, sample35);

float pix_max = -1e8;
// pix_max = max(pix_max, sample0 );
// pix_max = max(pix_max, sample1 );
// pix_max = max(pix_max, sample2 );
// pix_max = max(pix_max, sample3 );
// pix_max = max(pix_max, sample4 );
// pix_max = max(pix_max, sample5 );
// pix_max = max(pix_max, sample6 );
// pix_max = max(pix_max, sample7 );
// pix_max = max(pix_max, sample8 );
// pix_max = max(pix_max, sample9 );
// pix_max = max(pix_max, sample10);
// pix_max = max(pix_max, sample11);
// pix_max = max(pix_max, sample12);
// pix_max = max(pix_max, sample13);
pix_max = max(pix_max, sample14);
pix_max = max(pix_max, sample15);
// pix_max = max(pix_max, sample16);
// pix_max = max(pix_max, sample17);
// pix_max = max(pix_max, sample18);
// pix_max = max(pix_max, sample19);
pix_max = max(pix_max, sample20);
pix_max = max(pix_max, sample21);
// pix_max = max(pix_max, sample22);
// pix_max = max(pix_max, sample23);
// pix_max = max(pix_max, sample24);
// pix_max = max(pix_max, sample25);
// pix_max = max(pix_max, sample26);
// pix_max = max(pix_max, sample27);
// pix_max = max(pix_max, sample28);
// pix_max = max(pix_max, sample29);
// pix_max = max(pix_max, sample30);
// pix_max = max(pix_max, sample31);
// pix_max = max(pix_max, sample32);
// pix_max = max(pix_max, sample33);
// pix_max = max(pix_max, sample34);
// pix_max = max(pix_max, sample35);

vec3 abd = vec3(0.0);
float gx, gy;
gx = (sample13-sample1)/2.0;
gy = (sample8-sample6)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (sample14-sample2)/2.0;
gy = (-sample10+8.0*sample9-8.0*sample7+sample6)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (sample15-sample3)/2.0;
gy = (-sample11+8.0*sample10-8.0*sample8+sample7)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (sample16-sample4)/2.0;
gy = (sample11-sample9)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (-sample25+8.0*sample19-8.0*sample7+sample1)/12.0;
gy = (sample14-sample12)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (-sample26+8.0*sample20-8.0*sample8+sample2)/12.0;
gy = (-sample16+8.0*sample15-8.0*sample13+sample12)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-sample27+8.0*sample21-8.0*sample9+sample3)/12.0;
gy = (-sample17+8.0*sample16-8.0*sample14+sample13)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-sample28+8.0*sample22-8.0*sample10+sample4)/12.0;
gy = (sample17-sample15)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (-sample31+8.0*sample25-8.0*sample13+sample7)/12.0;
gy = (sample20-sample18)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (-sample32+8.0*sample26-8.0*sample14+sample8)/12.0;
gy = (-sample22+8.0*sample21-8.0*sample19+sample18)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-sample33+8.0*sample27-8.0*sample15+sample9)/12.0;
gy = (-sample23+8.0*sample22-8.0*sample20+sample19)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.07901060453704994;
gx = (-sample34+8.0*sample28-8.0*sample16+sample10)/12.0;
gy = (sample23-sample21)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (sample31-sample19)/2.0;
gy = (sample26-sample24)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
gx = (sample32-sample20)/2.0;
gy = (-sample28+8.0*sample27-8.0*sample25+sample24)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (sample33-sample21)/2.0;
gy = (-sample29+8.0*sample28-8.0*sample26+sample25)/12.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.06153352068439959;
gx = (sample34-sample22)/2.0;
gy = (sample29-sample27)/2.0;
abd += vec3(gx * gx, gx * gy, gy * gy) * 0.04792235409415088;
float a = abd.x, b = abd.y, d = abd.z;
float T = a + d, D = a * d - b * b;
float delta = sqrt(max(T * T / 4.0 - D, 0.0));
float L1 = T / 2.0 + delta, L2 = T / 2.0 - delta;
float sqrtL1 = sqrt(L1), sqrtL2 = sqrt(L2);
float theta = mix(mod(atan(L1 - a, b) + 3.141592653589793, 3.141592653589793), 0.0, abs(b) < 1.192092896e-7);
float lambda = sqrtL1;
float mu = mix((sqrtL1 - sqrtL2) / (sqrtL1 + sqrtL2), 0.0, sqrtL1 + sqrtL2 < 1.192092896e-7);
float angle = floor(theta * 24.0 / 3.141592653589793);
float strength = mix(mix(0.0, 1.0, lambda >= 0.004), mix(2.0, 3.0, lambda >= 0.05), lambda >= 0.016);
float coherence = mix(mix(0.0, 1.0, mu >= 0.25), 2.0, mu >= 0.5);
float coord_y = ((angle * 4.0 + strength) * 3.0 + coherence) / 288.0;
float res = 0.0;
vec4 w;
w = texture(ravu_zoom_lut3, vec2(0.0, coord_y) + subpix);
res += sample0 * w[0];
res += sample1 * w[1];
res += sample2 * w[2];
res += sample3 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.2, coord_y) + subpix);
res += sample4 * w[0];
res += sample5 * w[1];
res += sample6 * w[2];
res += sample7 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.4, coord_y) + subpix);
res += sample8 * w[0];
res += sample9 * w[1];
res += sample10 * w[2];
res += sample11 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.6, coord_y) + subpix);
res += sample12 * w[0];
res += sample13 * w[1];
res += sample14 * w[2];
res += sample15 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.8, coord_y) + subpix);
res += sample16 * w[0];
res += sample17 * w[1];
w = texture(ravu_zoom_lut3, vec2(0.0, coord_y) + subpix_inv);
res += sample35 * w[0];
res += sample34 * w[1];
res += sample33 * w[2];
res += sample32 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.2, coord_y) + subpix_inv);
res += sample31 * w[0];
res += sample30 * w[1];
res += sample29 * w[2];
res += sample28 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.4, coord_y) + subpix_inv);
res += sample27 * w[0];
res += sample26 * w[1];
res += sample25 * w[2];
res += sample24 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.6, coord_y) + subpix_inv);
res += sample23 * w[0];
res += sample22 * w[1];
res += sample21 * w[2];
res += sample20 * w[3];
w = texture(ravu_zoom_lut3, vec2(0.8, coord_y) + subpix_inv);
res += sample19 * w[0];
res += sample18 * w[1];
res = mix(res, clamp(res, pix_min, pix_max), ar_strength);
return vec4(res, 0.0, 0.0, 0.0);
}
//!TEXTURE ravu_zoom_lut3
//!SIZE 45 2592
//!FORMAT rgba16f
//!FILTER LINEAR
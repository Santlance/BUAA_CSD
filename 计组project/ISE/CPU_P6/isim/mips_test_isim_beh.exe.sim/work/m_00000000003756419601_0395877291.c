/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/asus/Desktop/ISE/CPU_P6/PIPELINE_M.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static int ng5[] = {0, 0};
static int ng6[] = {1, 0};



static void Cont_118_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = (t0 + 4520);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memcpy(t7, t3, 8);
    xsi_driver_vfirst_trans(t2, 0, 31);
    t8 = (t0 + 4392);
    *((int *)t8) = 1;

LAB1:    return;
}

static void Cont_120_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t33[8];
    char t34[8];
    char t35[8];
    char t45[8];
    char t46[8];
    char t60[8];
    char t61[8];
    char t64[8];
    char t91[8];
    char t92[8];
    char t93[8];
    char t103[8];
    char t104[8];
    char t114[8];
    char t115[8];
    char t129[8];
    char t130[8];
    char t133[8];
    char t160[8];
    char t161[8];
    char t162[8];
    char t172[8];
    char t173[8];
    char t183[8];
    char t184[8];
    char t198[8];
    char t199[8];
    char t202[8];
    char t229[8];
    char t230[8];
    char t231[8];
    char t241[8];
    char t242[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t36;
    char *t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t62;
    char *t63;
    char *t65;
    char *t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t86;
    char *t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    char *t94;
    char *t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t105;
    char *t106;
    char *t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    char *t116;
    char *t117;
    char *t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    unsigned int t128;
    char *t131;
    char *t132;
    char *t134;
    char *t135;
    unsigned int t136;
    unsigned int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    unsigned int t144;
    unsigned int t145;
    unsigned int t146;
    unsigned int t147;
    char *t148;
    char *t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    char *t155;
    char *t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t163;
    char *t164;
    char *t165;
    unsigned int t166;
    unsigned int t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    unsigned int t171;
    char *t174;
    char *t175;
    char *t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t185;
    char *t186;
    char *t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    unsigned int t193;
    unsigned int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    char *t200;
    char *t201;
    char *t203;
    char *t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    unsigned int t208;
    unsigned int t209;
    unsigned int t210;
    unsigned int t211;
    unsigned int t212;
    unsigned int t213;
    unsigned int t214;
    unsigned int t215;
    unsigned int t216;
    char *t217;
    char *t218;
    unsigned int t219;
    unsigned int t220;
    unsigned int t221;
    unsigned int t222;
    unsigned int t223;
    char *t224;
    char *t225;
    unsigned int t226;
    unsigned int t227;
    unsigned int t228;
    char *t232;
    char *t233;
    char *t234;
    unsigned int t235;
    unsigned int t236;
    unsigned int t237;
    unsigned int t238;
    unsigned int t239;
    unsigned int t240;
    char *t243;
    char *t244;
    char *t245;
    unsigned int t246;
    unsigned int t247;
    unsigned int t248;
    unsigned int t249;
    unsigned int t250;
    unsigned int t251;
    unsigned int t252;
    unsigned int t253;
    unsigned int t254;
    unsigned int t255;
    char *t256;
    char *t257;
    char *t258;
    char *t259;
    char *t260;
    char *t261;
    char *t262;

LAB0:    t1 = (t0 + 3576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t56 = *((unsigned int *)t4);
    t57 = (~(t56));
    t58 = *((unsigned int *)t29);
    t59 = (t57 || t58);
    if (t59 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t60, 8);

LAB20:    t257 = (t0 + 4584);
    t258 = (t257 + 56U);
    t259 = *((char **)t258);
    t260 = (t259 + 56U);
    t261 = *((char **)t260);
    memcpy(t261, t3, 8);
    xsi_driver_vfirst_trans(t257, 0, 31);
    t262 = (t0 + 4408);
    *((int *)t262) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t36 = (t0 + 1048U);
    t37 = *((char **)t36);
    memset(t35, 0, 8);
    t36 = (t35 + 4);
    t38 = (t37 + 4);
    t39 = *((unsigned int *)t37);
    t40 = (t39 >> 0);
    *((unsigned int *)t35) = t40;
    t41 = *((unsigned int *)t38);
    t42 = (t41 >> 0);
    *((unsigned int *)t36) = t42;
    t43 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t43 & 255U);
    t44 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t44 & 255U);
    xsi_vlogtype_concat(t34, 8, 8, 1U, t35, 8);
    t47 = (t0 + 1528U);
    t48 = *((char **)t47);
    memset(t46, 0, 8);
    t47 = (t46 + 4);
    t49 = (t48 + 4);
    t50 = *((unsigned int *)t48);
    t51 = (t50 >> 8);
    *((unsigned int *)t46) = t51;
    t52 = *((unsigned int *)t49);
    t53 = (t52 >> 8);
    *((unsigned int *)t47) = t53;
    t54 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t54 & 16777215U);
    t55 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t55 & 16777215U);
    xsi_vlogtype_concat(t45, 24, 24, 1U, t46, 24);
    xsi_vlogtype_concat(t33, 32, 32, 2U, t45, 24, t34, 8);
    goto LAB13;

LAB14:    t62 = (t0 + 1368U);
    t63 = *((char **)t62);
    t62 = ((char*)((ng2)));
    memset(t64, 0, 8);
    t65 = (t63 + 4);
    t66 = (t62 + 4);
    t67 = *((unsigned int *)t63);
    t68 = *((unsigned int *)t62);
    t69 = (t67 ^ t68);
    t70 = *((unsigned int *)t65);
    t71 = *((unsigned int *)t66);
    t72 = (t70 ^ t71);
    t73 = (t69 | t72);
    t74 = *((unsigned int *)t65);
    t75 = *((unsigned int *)t66);
    t76 = (t74 | t75);
    t77 = (~(t76));
    t78 = (t73 & t77);
    if (t78 != 0)
        goto LAB24;

LAB21:    if (t76 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t64) = 1;

LAB24:    memset(t61, 0, 8);
    t80 = (t64 + 4);
    t81 = *((unsigned int *)t80);
    t82 = (~(t81));
    t83 = *((unsigned int *)t64);
    t84 = (t83 & t82);
    t85 = (t84 & 1U);
    if (t85 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t80) != 0)
        goto LAB27;

LAB28:    t87 = (t61 + 4);
    t88 = *((unsigned int *)t61);
    t89 = *((unsigned int *)t87);
    t90 = (t88 || t89);
    if (t90 > 0)
        goto LAB29;

LAB30:    t125 = *((unsigned int *)t61);
    t126 = (~(t125));
    t127 = *((unsigned int *)t87);
    t128 = (t126 || t127);
    if (t128 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t87) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t61) > 0)
        goto LAB35;

LAB36:    memcpy(t60, t129, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t60, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB23:    t79 = (t64 + 4);
    *((unsigned int *)t64) = 1;
    *((unsigned int *)t79) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t61) = 1;
    goto LAB28;

LAB27:    t86 = (t61 + 4);
    *((unsigned int *)t61) = 1;
    *((unsigned int *)t86) = 1;
    goto LAB28;

LAB29:    t94 = (t0 + 1528U);
    t95 = *((char **)t94);
    memset(t93, 0, 8);
    t94 = (t93 + 4);
    t96 = (t95 + 4);
    t97 = *((unsigned int *)t95);
    t98 = (t97 >> 0);
    *((unsigned int *)t93) = t98;
    t99 = *((unsigned int *)t96);
    t100 = (t99 >> 0);
    *((unsigned int *)t94) = t100;
    t101 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t101 & 255U);
    t102 = *((unsigned int *)t94);
    *((unsigned int *)t94) = (t102 & 255U);
    xsi_vlogtype_concat(t92, 8, 8, 1U, t93, 8);
    t105 = (t0 + 1048U);
    t106 = *((char **)t105);
    memset(t104, 0, 8);
    t105 = (t104 + 4);
    t107 = (t106 + 4);
    t108 = *((unsigned int *)t106);
    t109 = (t108 >> 0);
    *((unsigned int *)t104) = t109;
    t110 = *((unsigned int *)t107);
    t111 = (t110 >> 0);
    *((unsigned int *)t105) = t111;
    t112 = *((unsigned int *)t104);
    *((unsigned int *)t104) = (t112 & 255U);
    t113 = *((unsigned int *)t105);
    *((unsigned int *)t105) = (t113 & 255U);
    xsi_vlogtype_concat(t103, 8, 8, 1U, t104, 8);
    t116 = (t0 + 1528U);
    t117 = *((char **)t116);
    memset(t115, 0, 8);
    t116 = (t115 + 4);
    t118 = (t117 + 4);
    t119 = *((unsigned int *)t117);
    t120 = (t119 >> 16);
    *((unsigned int *)t115) = t120;
    t121 = *((unsigned int *)t118);
    t122 = (t121 >> 16);
    *((unsigned int *)t116) = t122;
    t123 = *((unsigned int *)t115);
    *((unsigned int *)t115) = (t123 & 65535U);
    t124 = *((unsigned int *)t116);
    *((unsigned int *)t116) = (t124 & 65535U);
    xsi_vlogtype_concat(t114, 16, 16, 1U, t115, 16);
    xsi_vlogtype_concat(t91, 32, 32, 3U, t114, 16, t103, 8, t92, 8);
    goto LAB30;

LAB31:    t131 = (t0 + 1368U);
    t132 = *((char **)t131);
    t131 = ((char*)((ng3)));
    memset(t133, 0, 8);
    t134 = (t132 + 4);
    t135 = (t131 + 4);
    t136 = *((unsigned int *)t132);
    t137 = *((unsigned int *)t131);
    t138 = (t136 ^ t137);
    t139 = *((unsigned int *)t134);
    t140 = *((unsigned int *)t135);
    t141 = (t139 ^ t140);
    t142 = (t138 | t141);
    t143 = *((unsigned int *)t134);
    t144 = *((unsigned int *)t135);
    t145 = (t143 | t144);
    t146 = (~(t145));
    t147 = (t142 & t146);
    if (t147 != 0)
        goto LAB41;

LAB38:    if (t145 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t133) = 1;

LAB41:    memset(t130, 0, 8);
    t149 = (t133 + 4);
    t150 = *((unsigned int *)t149);
    t151 = (~(t150));
    t152 = *((unsigned int *)t133);
    t153 = (t152 & t151);
    t154 = (t153 & 1U);
    if (t154 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t149) != 0)
        goto LAB44;

LAB45:    t156 = (t130 + 4);
    t157 = *((unsigned int *)t130);
    t158 = *((unsigned int *)t156);
    t159 = (t157 || t158);
    if (t159 > 0)
        goto LAB46;

LAB47:    t194 = *((unsigned int *)t130);
    t195 = (~(t194));
    t196 = *((unsigned int *)t156);
    t197 = (t195 || t196);
    if (t197 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t156) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t130) > 0)
        goto LAB52;

LAB53:    memcpy(t129, t198, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t60, 32, t91, 32, t129, 32);
    goto LAB37;

LAB35:    memcpy(t60, t91, 8);
    goto LAB37;

LAB40:    t148 = (t133 + 4);
    *((unsigned int *)t133) = 1;
    *((unsigned int *)t148) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t130) = 1;
    goto LAB45;

LAB44:    t155 = (t130 + 4);
    *((unsigned int *)t130) = 1;
    *((unsigned int *)t155) = 1;
    goto LAB45;

LAB46:    t163 = (t0 + 1528U);
    t164 = *((char **)t163);
    memset(t162, 0, 8);
    t163 = (t162 + 4);
    t165 = (t164 + 4);
    t166 = *((unsigned int *)t164);
    t167 = (t166 >> 0);
    *((unsigned int *)t162) = t167;
    t168 = *((unsigned int *)t165);
    t169 = (t168 >> 0);
    *((unsigned int *)t163) = t169;
    t170 = *((unsigned int *)t162);
    *((unsigned int *)t162) = (t170 & 65535U);
    t171 = *((unsigned int *)t163);
    *((unsigned int *)t163) = (t171 & 65535U);
    xsi_vlogtype_concat(t161, 16, 16, 1U, t162, 16);
    t174 = (t0 + 1048U);
    t175 = *((char **)t174);
    memset(t173, 0, 8);
    t174 = (t173 + 4);
    t176 = (t175 + 4);
    t177 = *((unsigned int *)t175);
    t178 = (t177 >> 0);
    *((unsigned int *)t173) = t178;
    t179 = *((unsigned int *)t176);
    t180 = (t179 >> 0);
    *((unsigned int *)t174) = t180;
    t181 = *((unsigned int *)t173);
    *((unsigned int *)t173) = (t181 & 255U);
    t182 = *((unsigned int *)t174);
    *((unsigned int *)t174) = (t182 & 255U);
    xsi_vlogtype_concat(t172, 8, 8, 1U, t173, 8);
    t185 = (t0 + 1528U);
    t186 = *((char **)t185);
    memset(t184, 0, 8);
    t185 = (t184 + 4);
    t187 = (t186 + 4);
    t188 = *((unsigned int *)t186);
    t189 = (t188 >> 24);
    *((unsigned int *)t184) = t189;
    t190 = *((unsigned int *)t187);
    t191 = (t190 >> 24);
    *((unsigned int *)t185) = t191;
    t192 = *((unsigned int *)t184);
    *((unsigned int *)t184) = (t192 & 255U);
    t193 = *((unsigned int *)t185);
    *((unsigned int *)t185) = (t193 & 255U);
    xsi_vlogtype_concat(t183, 8, 8, 1U, t184, 8);
    xsi_vlogtype_concat(t160, 32, 32, 3U, t183, 8, t172, 8, t161, 16);
    goto LAB47;

LAB48:    t200 = (t0 + 1368U);
    t201 = *((char **)t200);
    t200 = ((char*)((ng4)));
    memset(t202, 0, 8);
    t203 = (t201 + 4);
    t204 = (t200 + 4);
    t205 = *((unsigned int *)t201);
    t206 = *((unsigned int *)t200);
    t207 = (t205 ^ t206);
    t208 = *((unsigned int *)t203);
    t209 = *((unsigned int *)t204);
    t210 = (t208 ^ t209);
    t211 = (t207 | t210);
    t212 = *((unsigned int *)t203);
    t213 = *((unsigned int *)t204);
    t214 = (t212 | t213);
    t215 = (~(t214));
    t216 = (t211 & t215);
    if (t216 != 0)
        goto LAB58;

LAB55:    if (t214 != 0)
        goto LAB57;

LAB56:    *((unsigned int *)t202) = 1;

LAB58:    memset(t199, 0, 8);
    t218 = (t202 + 4);
    t219 = *((unsigned int *)t218);
    t220 = (~(t219));
    t221 = *((unsigned int *)t202);
    t222 = (t221 & t220);
    t223 = (t222 & 1U);
    if (t223 != 0)
        goto LAB59;

LAB60:    if (*((unsigned int *)t218) != 0)
        goto LAB61;

LAB62:    t225 = (t199 + 4);
    t226 = *((unsigned int *)t199);
    t227 = *((unsigned int *)t225);
    t228 = (t226 || t227);
    if (t228 > 0)
        goto LAB63;

LAB64:    t252 = *((unsigned int *)t199);
    t253 = (~(t252));
    t254 = *((unsigned int *)t225);
    t255 = (t253 || t254);
    if (t255 > 0)
        goto LAB65;

LAB66:    if (*((unsigned int *)t225) > 0)
        goto LAB67;

LAB68:    if (*((unsigned int *)t199) > 0)
        goto LAB69;

LAB70:    memcpy(t198, t256, 8);

LAB71:    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t129, 32, t160, 32, t198, 32);
    goto LAB54;

LAB52:    memcpy(t129, t160, 8);
    goto LAB54;

LAB57:    t217 = (t202 + 4);
    *((unsigned int *)t202) = 1;
    *((unsigned int *)t217) = 1;
    goto LAB58;

LAB59:    *((unsigned int *)t199) = 1;
    goto LAB62;

LAB61:    t224 = (t199 + 4);
    *((unsigned int *)t199) = 1;
    *((unsigned int *)t224) = 1;
    goto LAB62;

LAB63:    t232 = (t0 + 1528U);
    t233 = *((char **)t232);
    memset(t231, 0, 8);
    t232 = (t231 + 4);
    t234 = (t233 + 4);
    t235 = *((unsigned int *)t233);
    t236 = (t235 >> 0);
    *((unsigned int *)t231) = t236;
    t237 = *((unsigned int *)t234);
    t238 = (t237 >> 0);
    *((unsigned int *)t232) = t238;
    t239 = *((unsigned int *)t231);
    *((unsigned int *)t231) = (t239 & 16777215U);
    t240 = *((unsigned int *)t232);
    *((unsigned int *)t232) = (t240 & 16777215U);
    xsi_vlogtype_concat(t230, 24, 24, 1U, t231, 24);
    t243 = (t0 + 1048U);
    t244 = *((char **)t243);
    memset(t242, 0, 8);
    t243 = (t242 + 4);
    t245 = (t244 + 4);
    t246 = *((unsigned int *)t244);
    t247 = (t246 >> 0);
    *((unsigned int *)t242) = t247;
    t248 = *((unsigned int *)t245);
    t249 = (t248 >> 0);
    *((unsigned int *)t243) = t249;
    t250 = *((unsigned int *)t242);
    *((unsigned int *)t242) = (t250 & 255U);
    t251 = *((unsigned int *)t243);
    *((unsigned int *)t243) = (t251 & 255U);
    xsi_vlogtype_concat(t241, 8, 8, 1U, t242, 8);
    xsi_vlogtype_concat(t229, 32, 32, 2U, t241, 8, t230, 24);
    goto LAB64;

LAB65:    t256 = ((char*)((ng5)));
    goto LAB66;

LAB67:    xsi_vlog_unsigned_bit_combine(t198, 32, t229, 32, t256, 32);
    goto LAB71;

LAB69:    memcpy(t198, t229, 8);
    goto LAB71;

}

static void Cont_126_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t11[8];
    char t38[8];
    char t39[8];
    char t40[8];
    char t50[8];
    char t51[8];
    char t65[8];
    char t66[8];
    char t67[8];
    char t77[8];
    char t78[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t52;
    char *t53;
    char *t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t68;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    char *t79;
    char *t80;
    char *t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    char *t93;

LAB0:    t1 = (t0 + 3824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(126, ng0);
    t2 = (t0 + 1368U);
    t5 = *((char **)t2);
    t2 = (t0 + 1328U);
    t7 = (t2 + 72U);
    t8 = *((char **)t7);
    t9 = ((char*)((ng6)));
    xsi_vlog_generic_get_index_select_value(t6, 32, t5, t8, 2, t9, 32, 1);
    t10 = ((char*)((ng5)));
    memset(t11, 0, 8);
    t12 = (t6 + 4);
    t13 = (t10 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = *((unsigned int *)t12);
    t18 = *((unsigned int *)t13);
    t19 = (t17 ^ t18);
    t20 = (t16 | t19);
    t21 = *((unsigned int *)t12);
    t22 = *((unsigned int *)t13);
    t23 = (t21 | t22);
    t24 = (~(t23));
    t25 = (t20 & t24);
    if (t25 != 0)
        goto LAB7;

LAB4:    if (t23 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t11) = 1;

LAB7:    memset(t4, 0, 8);
    t27 = (t11 + 4);
    t28 = *((unsigned int *)t27);
    t29 = (~(t28));
    t30 = *((unsigned int *)t11);
    t31 = (t30 & t29);
    t32 = (t31 & 1U);
    if (t32 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t27) != 0)
        goto LAB10;

LAB11:    t34 = (t4 + 4);
    t35 = *((unsigned int *)t4);
    t36 = *((unsigned int *)t34);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB12;

LAB13:    t61 = *((unsigned int *)t4);
    t62 = (~(t61));
    t63 = *((unsigned int *)t34);
    t64 = (t62 || t63);
    if (t64 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t34) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t65, 8);

LAB20:    t88 = (t0 + 4648);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    t91 = (t90 + 56U);
    t92 = *((char **)t91);
    memcpy(t92, t3, 8);
    xsi_driver_vfirst_trans(t88, 0, 31);
    t93 = (t0 + 4424);
    *((int *)t93) = 1;

LAB1:    return;
LAB6:    t26 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t33 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t33) = 1;
    goto LAB11;

LAB12:    t41 = (t0 + 1048U);
    t42 = *((char **)t41);
    memset(t40, 0, 8);
    t41 = (t40 + 4);
    t43 = (t42 + 4);
    t44 = *((unsigned int *)t42);
    t45 = (t44 >> 0);
    *((unsigned int *)t40) = t45;
    t46 = *((unsigned int *)t43);
    t47 = (t46 >> 0);
    *((unsigned int *)t41) = t47;
    t48 = *((unsigned int *)t40);
    *((unsigned int *)t40) = (t48 & 65535U);
    t49 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t49 & 65535U);
    xsi_vlogtype_concat(t39, 16, 16, 1U, t40, 16);
    t52 = (t0 + 1528U);
    t53 = *((char **)t52);
    memset(t51, 0, 8);
    t52 = (t51 + 4);
    t54 = (t53 + 4);
    t55 = *((unsigned int *)t53);
    t56 = (t55 >> 16);
    *((unsigned int *)t51) = t56;
    t57 = *((unsigned int *)t54);
    t58 = (t57 >> 16);
    *((unsigned int *)t52) = t58;
    t59 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t59 & 65535U);
    t60 = *((unsigned int *)t52);
    *((unsigned int *)t52) = (t60 & 65535U);
    xsi_vlogtype_concat(t50, 16, 16, 1U, t51, 16);
    xsi_vlogtype_concat(t38, 32, 32, 2U, t50, 16, t39, 16);
    goto LAB13;

LAB14:    t68 = (t0 + 1528U);
    t69 = *((char **)t68);
    memset(t67, 0, 8);
    t68 = (t67 + 4);
    t70 = (t69 + 4);
    t71 = *((unsigned int *)t69);
    t72 = (t71 >> 0);
    *((unsigned int *)t67) = t72;
    t73 = *((unsigned int *)t70);
    t74 = (t73 >> 0);
    *((unsigned int *)t68) = t74;
    t75 = *((unsigned int *)t67);
    *((unsigned int *)t67) = (t75 & 65535U);
    t76 = *((unsigned int *)t68);
    *((unsigned int *)t68) = (t76 & 65535U);
    xsi_vlogtype_concat(t66, 16, 16, 1U, t67, 16);
    t79 = (t0 + 1048U);
    t80 = *((char **)t79);
    memset(t78, 0, 8);
    t79 = (t78 + 4);
    t81 = (t80 + 4);
    t82 = *((unsigned int *)t80);
    t83 = (t82 >> 0);
    *((unsigned int *)t78) = t83;
    t84 = *((unsigned int *)t81);
    t85 = (t84 >> 0);
    *((unsigned int *)t79) = t85;
    t86 = *((unsigned int *)t78);
    *((unsigned int *)t78) = (t86 & 65535U);
    t87 = *((unsigned int *)t79);
    *((unsigned int *)t79) = (t87 & 65535U);
    xsi_vlogtype_concat(t77, 16, 16, 1U, t78, 16);
    xsi_vlogtype_concat(t65, 32, 32, 2U, t77, 16, t66, 16);
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t38, 32, t65, 32);
    goto LAB20;

LAB18:    memcpy(t3, t38, 8);
    goto LAB20;

}

static void Cont_128_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t39[8];
    char t40[8];
    char t42[8];
    char t75[8];
    char t76[8];
    char t78[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t41;
    char *t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t77;
    char *t79;
    char *t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    char *t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    unsigned int t99;
    char *t100;
    char *t101;
    unsigned int t102;
    unsigned int t103;
    unsigned int t104;
    char *t105;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    char *t111;
    char *t112;
    char *t113;
    char *t114;
    char *t115;
    char *t116;

LAB0:    t1 = (t0 + 4072U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(128, ng0);
    t2 = (t0 + 1208U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t35 = *((unsigned int *)t4);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t39, 8);

LAB20:    t105 = (t0 + 4712);
    t112 = (t105 + 56U);
    t113 = *((char **)t112);
    t114 = (t113 + 56U);
    t115 = *((char **)t114);
    memcpy(t115, t3, 8);
    xsi_driver_vfirst_trans(t105, 0, 31);
    t116 = (t0 + 4440);
    *((int *)t116) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 1848U);
    t34 = *((char **)t33);
    goto LAB13;

LAB14:    t33 = (t0 + 1208U);
    t41 = *((char **)t33);
    t33 = ((char*)((ng2)));
    memset(t42, 0, 8);
    t43 = (t41 + 4);
    t44 = (t33 + 4);
    t45 = *((unsigned int *)t41);
    t46 = *((unsigned int *)t33);
    t47 = (t45 ^ t46);
    t48 = *((unsigned int *)t43);
    t49 = *((unsigned int *)t44);
    t50 = (t48 ^ t49);
    t51 = (t47 | t50);
    t52 = *((unsigned int *)t43);
    t53 = *((unsigned int *)t44);
    t54 = (t52 | t53);
    t55 = (~(t54));
    t56 = (t51 & t55);
    if (t56 != 0)
        goto LAB24;

LAB21:    if (t54 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t42) = 1;

LAB24:    memset(t40, 0, 8);
    t58 = (t42 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t42);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t58) != 0)
        goto LAB27;

LAB28:    t65 = (t40 + 4);
    t66 = *((unsigned int *)t40);
    t67 = *((unsigned int *)t65);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB29;

LAB30:    t71 = *((unsigned int *)t40);
    t72 = (~(t71));
    t73 = *((unsigned int *)t65);
    t74 = (t72 || t73);
    if (t74 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t65) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t40) > 0)
        goto LAB35;

LAB36:    memcpy(t39, t75, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t34, 32, t39, 32);
    goto LAB20;

LAB18:    memcpy(t3, t34, 8);
    goto LAB20;

LAB23:    t57 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t57) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t40) = 1;
    goto LAB28;

LAB27:    t64 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB28;

LAB29:    t69 = (t0 + 2008U);
    t70 = *((char **)t69);
    goto LAB30;

LAB31:    t69 = (t0 + 1208U);
    t77 = *((char **)t69);
    t69 = ((char*)((ng3)));
    memset(t78, 0, 8);
    t79 = (t77 + 4);
    t80 = (t69 + 4);
    t81 = *((unsigned int *)t77);
    t82 = *((unsigned int *)t69);
    t83 = (t81 ^ t82);
    t84 = *((unsigned int *)t79);
    t85 = *((unsigned int *)t80);
    t86 = (t84 ^ t85);
    t87 = (t83 | t86);
    t88 = *((unsigned int *)t79);
    t89 = *((unsigned int *)t80);
    t90 = (t88 | t89);
    t91 = (~(t90));
    t92 = (t87 & t91);
    if (t92 != 0)
        goto LAB41;

LAB38:    if (t90 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t78) = 1;

LAB41:    memset(t76, 0, 8);
    t94 = (t78 + 4);
    t95 = *((unsigned int *)t94);
    t96 = (~(t95));
    t97 = *((unsigned int *)t78);
    t98 = (t97 & t96);
    t99 = (t98 & 1U);
    if (t99 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t94) != 0)
        goto LAB44;

LAB45:    t101 = (t76 + 4);
    t102 = *((unsigned int *)t76);
    t103 = *((unsigned int *)t101);
    t104 = (t102 || t103);
    if (t104 > 0)
        goto LAB46;

LAB47:    t107 = *((unsigned int *)t76);
    t108 = (~(t107));
    t109 = *((unsigned int *)t101);
    t110 = (t108 || t109);
    if (t110 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t101) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t76) > 0)
        goto LAB52;

LAB53:    memcpy(t75, t111, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t39, 32, t70, 32, t75, 32);
    goto LAB37;

LAB35:    memcpy(t39, t70, 8);
    goto LAB37;

LAB40:    t93 = (t78 + 4);
    *((unsigned int *)t78) = 1;
    *((unsigned int *)t93) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t76) = 1;
    goto LAB45;

LAB44:    t100 = (t76 + 4);
    *((unsigned int *)t76) = 1;
    *((unsigned int *)t100) = 1;
    goto LAB45;

LAB46:    t105 = (t0 + 2168U);
    t106 = *((char **)t105);
    goto LAB47;

LAB48:    t105 = (t0 + 1848U);
    t111 = *((char **)t105);
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t75, 32, t106, 32, t111, 32);
    goto LAB54;

LAB52:    memcpy(t75, t106, 8);
    goto LAB54;

}


extern void work_m_00000000003756419601_0395877291_init()
{
	static char *pe[] = {(void *)Cont_118_0,(void *)Cont_120_1,(void *)Cont_126_2,(void *)Cont_128_3};
	xsi_register_didat("work_m_00000000003756419601_0395877291", "isim/mips_test_isim_beh.exe.sim/work/m_00000000003756419601_0395877291.didat");
	xsi_register_executes(pe);
}

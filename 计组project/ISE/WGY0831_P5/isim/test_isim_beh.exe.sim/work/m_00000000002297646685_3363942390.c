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
static const char *ng0 = "C:/Users/asus/cpucode/cmp.v";
static unsigned int ng1[] = {5U, 0U};
static unsigned int ng2[] = {4U, 0U};
static unsigned int ng3[] = {6U, 0U};
static int ng4[] = {0, 0};
static unsigned int ng5[] = {7U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {0U, 0U};



static void Cont_35_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(35, ng0);
    t2 = (t0 + 1048U);
    t4 = *((char **)t2);
    memset(t3, 0, 8);
    t2 = (t3 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 26);
    *((unsigned int *)t3) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 26);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t10 & 63U);
    t11 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t11 & 63U);
    t12 = (t0 + 3512);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memset(t16, 0, 8);
    t17 = 63U;
    t18 = t17;
    t19 = (t3 + 4);
    t20 = *((unsigned int *)t3);
    t17 = (t17 & t20);
    t21 = *((unsigned int *)t19);
    t18 = (t18 & t21);
    t22 = (t16 + 4);
    t23 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t23 | t17);
    t24 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t24 | t18);
    xsi_driver_vfirst_trans(t12, 0, 5);
    t25 = (t0 + 3416);
    *((int *)t25) = 1;

LAB1:    return;
}

static void Always_36_1(char *t0)
{
    char t10[8];
    char t26[8];
    char t30[8];
    char t46[8];
    char t54[8];
    char t83[8];
    char t86[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    unsigned int t12;
    unsigned int t13;
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
    char *t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    char *t53;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    char *t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    char *t82;
    char *t84;
    char *t85;

LAB0:    t1 = (t0 + 3096U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 3432);
    *((int *)t2) = 1;
    t3 = (t0 + 3128);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);
    t4 = (t0 + 1528U);
    t5 = *((char **)t4);

LAB5:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t4, 6);
    if (t6 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB12;

LAB13:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 6, t2, 6);
    if (t6 == 1)
        goto LAB14;

LAB15:
LAB17:
LAB16:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB18:    goto LAB2;

LAB6:    xsi_set_current_line(38, ng0);
    t7 = (t0 + 1208U);
    t8 = *((char **)t7);
    t7 = (t0 + 1368U);
    t9 = *((char **)t7);
    memset(t10, 0, 8);
    t7 = (t8 + 4);
    t11 = (t9 + 4);
    t12 = *((unsigned int *)t8);
    t13 = *((unsigned int *)t9);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t7);
    t16 = *((unsigned int *)t11);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t7);
    t20 = *((unsigned int *)t11);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB20;

LAB19:    if (t21 != 0)
        goto LAB21;

LAB22:    t25 = (t0 + 1928);
    xsi_vlogvar_assign_value(t25, t10, 0, 0, 1);
    goto LAB18;

LAB8:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1368U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t7);
    t14 = (t12 ^ t13);
    t15 = *((unsigned int *)t3);
    t16 = *((unsigned int *)t8);
    t17 = (t15 ^ t16);
    t18 = (t14 | t17);
    t19 = *((unsigned int *)t3);
    t20 = *((unsigned int *)t8);
    t21 = (t19 | t20);
    t22 = (~(t21));
    t23 = (t18 & t22);
    if (t23 != 0)
        goto LAB26;

LAB23:    if (t21 != 0)
        goto LAB25;

LAB24:    *((unsigned int *)t10) = 1;

LAB26:    t11 = (t0 + 1928);
    xsi_vlogvar_assign_value(t11, t10, 0, 0, 1);
    goto LAB18;

LAB10:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t10) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t3) = t17;
    memset(t26, 0, 8);
    t8 = (t10 + 4);
    t18 = *((unsigned int *)t8);
    t19 = (~(t18));
    t20 = *((unsigned int *)t10);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t8) != 0)
        goto LAB29;

LAB30:    t11 = (t26 + 4);
    t23 = *((unsigned int *)t26);
    t27 = (!(t23));
    t28 = *((unsigned int *)t11);
    t29 = (t27 || t28);
    if (t29 > 0)
        goto LAB31;

LAB32:    memcpy(t54, t26, 8);

LAB33:    t82 = (t0 + 1928);
    xsi_vlogvar_assign_value(t82, t54, 0, 0, 1);
    goto LAB18;

LAB12:    xsi_set_current_line(41, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t26, 0, 8);
    t3 = (t26 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t26) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t3) = t17;
    memset(t10, 0, 8);
    t8 = (t26 + 4);
    t18 = *((unsigned int *)t8);
    t19 = (~(t18));
    t20 = *((unsigned int *)t26);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB48;

LAB46:    if (*((unsigned int *)t8) == 0)
        goto LAB45;

LAB47:    t9 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t9) = 1;

LAB48:    memset(t30, 0, 8);
    t11 = (t10 + 4);
    t23 = *((unsigned int *)t11);
    t27 = (~(t23));
    t28 = *((unsigned int *)t10);
    t29 = (t28 & t27);
    t33 = (t29 & 1U);
    if (t33 != 0)
        goto LAB49;

LAB50:    if (*((unsigned int *)t11) != 0)
        goto LAB51;

LAB52:    t25 = (t30 + 4);
    t34 = *((unsigned int *)t30);
    t35 = *((unsigned int *)t25);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB53;

LAB54:    memcpy(t83, t30, 8);

LAB55:    t85 = (t0 + 1928);
    xsi_vlogvar_assign_value(t85, t83, 0, 0, 1);
    goto LAB18;

LAB14:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 16);
    *((unsigned int *)t10) = t13;
    t14 = *((unsigned int *)t7);
    t15 = (t14 >> 16);
    *((unsigned int *)t3) = t15;
    t16 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t16 & 31U);
    t17 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t17 & 31U);

LAB68:    t8 = ((char*)((ng7)));
    t73 = xsi_vlog_unsigned_case_compare(t10, 5, t8, 5);
    if (t73 == 1)
        goto LAB69;

LAB70:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t10, 5, t2, 5);
    if (t6 == 1)
        goto LAB71;

LAB72:
LAB74:
LAB73:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB75:    goto LAB18;

LAB20:    *((unsigned int *)t10) = 1;
    goto LAB22;

LAB21:    t24 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB22;

LAB25:    t9 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB26;

LAB27:    *((unsigned int *)t26) = 1;
    goto LAB30;

LAB29:    t9 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB30;

LAB31:    t24 = (t0 + 1208U);
    t25 = *((char **)t24);
    t24 = ((char*)((ng4)));
    memset(t30, 0, 8);
    t31 = (t25 + 4);
    t32 = (t24 + 4);
    t33 = *((unsigned int *)t25);
    t34 = *((unsigned int *)t24);
    t35 = (t33 ^ t34);
    t36 = *((unsigned int *)t31);
    t37 = *((unsigned int *)t32);
    t38 = (t36 ^ t37);
    t39 = (t35 | t38);
    t40 = *((unsigned int *)t31);
    t41 = *((unsigned int *)t32);
    t42 = (t40 | t41);
    t43 = (~(t42));
    t44 = (t39 & t43);
    if (t44 != 0)
        goto LAB37;

LAB34:    if (t42 != 0)
        goto LAB36;

LAB35:    *((unsigned int *)t30) = 1;

LAB37:    memset(t46, 0, 8);
    t47 = (t30 + 4);
    t48 = *((unsigned int *)t47);
    t49 = (~(t48));
    t50 = *((unsigned int *)t30);
    t51 = (t50 & t49);
    t52 = (t51 & 1U);
    if (t52 != 0)
        goto LAB38;

LAB39:    if (*((unsigned int *)t47) != 0)
        goto LAB40;

LAB41:    t55 = *((unsigned int *)t26);
    t56 = *((unsigned int *)t46);
    t57 = (t55 | t56);
    *((unsigned int *)t54) = t57;
    t58 = (t26 + 4);
    t59 = (t46 + 4);
    t60 = (t54 + 4);
    t61 = *((unsigned int *)t58);
    t62 = *((unsigned int *)t59);
    t63 = (t61 | t62);
    *((unsigned int *)t60) = t63;
    t64 = *((unsigned int *)t60);
    t65 = (t64 != 0);
    if (t65 == 1)
        goto LAB42;

LAB43:
LAB44:    goto LAB33;

LAB36:    t45 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t45) = 1;
    goto LAB37;

LAB38:    *((unsigned int *)t46) = 1;
    goto LAB41;

LAB40:    t53 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB41;

LAB42:    t66 = *((unsigned int *)t54);
    t67 = *((unsigned int *)t60);
    *((unsigned int *)t54) = (t66 | t67);
    t68 = (t26 + 4);
    t69 = (t46 + 4);
    t70 = *((unsigned int *)t68);
    t71 = (~(t70));
    t72 = *((unsigned int *)t26);
    t73 = (t72 & t71);
    t74 = *((unsigned int *)t69);
    t75 = (~(t74));
    t76 = *((unsigned int *)t46);
    t77 = (t76 & t75);
    t78 = (~(t73));
    t79 = (~(t77));
    t80 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t80 & t78);
    t81 = *((unsigned int *)t60);
    *((unsigned int *)t60) = (t81 & t79);
    goto LAB44;

LAB45:    *((unsigned int *)t10) = 1;
    goto LAB48;

LAB49:    *((unsigned int *)t30) = 1;
    goto LAB52;

LAB51:    t24 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB52;

LAB53:    t31 = (t0 + 1208U);
    t32 = *((char **)t31);
    t31 = ((char*)((ng4)));
    memset(t46, 0, 8);
    t45 = (t32 + 4);
    if (*((unsigned int *)t45) != 0)
        goto LAB57;

LAB56:    t47 = (t31 + 4);
    if (*((unsigned int *)t47) != 0)
        goto LAB57;

LAB60:    if (*((unsigned int *)t32) > *((unsigned int *)t31))
        goto LAB58;

LAB59:    memset(t54, 0, 8);
    t58 = (t46 + 4);
    t37 = *((unsigned int *)t58);
    t38 = (~(t37));
    t39 = *((unsigned int *)t46);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB61;

LAB62:    if (*((unsigned int *)t58) != 0)
        goto LAB63;

LAB64:    t42 = *((unsigned int *)t30);
    t43 = *((unsigned int *)t54);
    t44 = (t42 & t43);
    *((unsigned int *)t83) = t44;
    t60 = (t30 + 4);
    t68 = (t54 + 4);
    t69 = (t83 + 4);
    t48 = *((unsigned int *)t60);
    t49 = *((unsigned int *)t68);
    t50 = (t48 | t49);
    *((unsigned int *)t69) = t50;
    t51 = *((unsigned int *)t69);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB65;

LAB66:
LAB67:    goto LAB55;

LAB57:    t53 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB59;

LAB58:    *((unsigned int *)t46) = 1;
    goto LAB59;

LAB61:    *((unsigned int *)t54) = 1;
    goto LAB64;

LAB63:    t59 = (t54 + 4);
    *((unsigned int *)t54) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB64;

LAB65:    t55 = *((unsigned int *)t83);
    t56 = *((unsigned int *)t69);
    *((unsigned int *)t83) = (t55 | t56);
    t82 = (t30 + 4);
    t84 = (t54 + 4);
    t57 = *((unsigned int *)t30);
    t61 = (~(t57));
    t62 = *((unsigned int *)t82);
    t63 = (~(t62));
    t64 = *((unsigned int *)t54);
    t65 = (~(t64));
    t66 = *((unsigned int *)t84);
    t67 = (~(t66));
    t73 = (t61 & t63);
    t77 = (t65 & t67);
    t70 = (~(t73));
    t71 = (~(t77));
    t72 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t72 & t70);
    t74 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t74 & t71);
    t75 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t75 & t70);
    t76 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t76 & t71);
    goto LAB67;

LAB69:    xsi_set_current_line(43, ng0);
    t9 = (t0 + 1208U);
    t11 = *((char **)t9);
    memset(t26, 0, 8);
    t9 = (t26 + 4);
    t24 = (t11 + 4);
    t18 = *((unsigned int *)t11);
    t19 = (t18 >> 31);
    t20 = (t19 & 1);
    *((unsigned int *)t26) = t20;
    t21 = *((unsigned int *)t24);
    t22 = (t21 >> 31);
    t23 = (t22 & 1);
    *((unsigned int *)t9) = t23;
    t25 = (t0 + 1928);
    xsi_vlogvar_assign_value(t25, t26, 0, 0, 1);
    goto LAB75;

LAB71:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    memset(t30, 0, 8);
    t3 = (t30 + 4);
    t7 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = (t12 >> 31);
    t14 = (t13 & 1);
    *((unsigned int *)t30) = t14;
    t15 = *((unsigned int *)t7);
    t16 = (t15 >> 31);
    t17 = (t16 & 1);
    *((unsigned int *)t3) = t17;
    memset(t26, 0, 8);
    t8 = (t30 + 4);
    t18 = *((unsigned int *)t8);
    t19 = (~(t18));
    t20 = *((unsigned int *)t30);
    t21 = (t20 & t19);
    t22 = (t21 & 1U);
    if (t22 != 0)
        goto LAB79;

LAB77:    if (*((unsigned int *)t8) == 0)
        goto LAB76;

LAB78:    t9 = (t26 + 4);
    *((unsigned int *)t26) = 1;
    *((unsigned int *)t9) = 1;

LAB79:    memset(t46, 0, 8);
    t11 = (t26 + 4);
    t23 = *((unsigned int *)t11);
    t27 = (~(t23));
    t28 = *((unsigned int *)t26);
    t29 = (t28 & t27);
    t33 = (t29 & 1U);
    if (t33 != 0)
        goto LAB80;

LAB81:    if (*((unsigned int *)t11) != 0)
        goto LAB82;

LAB83:    t25 = (t46 + 4);
    t34 = *((unsigned int *)t46);
    t35 = *((unsigned int *)t25);
    t36 = (t34 || t35);
    if (t36 > 0)
        goto LAB84;

LAB85:    memcpy(t86, t46, 8);

LAB86:    t85 = (t0 + 1928);
    xsi_vlogvar_assign_value(t85, t86, 0, 0, 1);
    goto LAB75;

LAB76:    *((unsigned int *)t26) = 1;
    goto LAB79;

LAB80:    *((unsigned int *)t46) = 1;
    goto LAB83;

LAB82:    t24 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB83;

LAB84:    t31 = (t0 + 1208U);
    t32 = *((char **)t31);
    t31 = ((char*)((ng4)));
    memset(t54, 0, 8);
    t45 = (t32 + 4);
    if (*((unsigned int *)t45) != 0)
        goto LAB88;

LAB87:    t47 = (t31 + 4);
    if (*((unsigned int *)t47) != 0)
        goto LAB88;

LAB91:    if (*((unsigned int *)t32) < *((unsigned int *)t31))
        goto LAB90;

LAB89:    *((unsigned int *)t54) = 1;

LAB90:    memset(t83, 0, 8);
    t58 = (t54 + 4);
    t37 = *((unsigned int *)t58);
    t38 = (~(t37));
    t39 = *((unsigned int *)t54);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB92;

LAB93:    if (*((unsigned int *)t58) != 0)
        goto LAB94;

LAB95:    t42 = *((unsigned int *)t46);
    t43 = *((unsigned int *)t83);
    t44 = (t42 & t43);
    *((unsigned int *)t86) = t44;
    t60 = (t46 + 4);
    t68 = (t83 + 4);
    t69 = (t86 + 4);
    t48 = *((unsigned int *)t60);
    t49 = *((unsigned int *)t68);
    t50 = (t48 | t49);
    *((unsigned int *)t69) = t50;
    t51 = *((unsigned int *)t69);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB96;

LAB97:
LAB98:    goto LAB86;

LAB88:    t53 = (t54 + 4);
    *((unsigned int *)t54) = 1;
    *((unsigned int *)t53) = 1;
    goto LAB90;

LAB92:    *((unsigned int *)t83) = 1;
    goto LAB95;

LAB94:    t59 = (t83 + 4);
    *((unsigned int *)t83) = 1;
    *((unsigned int *)t59) = 1;
    goto LAB95;

LAB96:    t55 = *((unsigned int *)t86);
    t56 = *((unsigned int *)t69);
    *((unsigned int *)t86) = (t55 | t56);
    t82 = (t46 + 4);
    t84 = (t83 + 4);
    t57 = *((unsigned int *)t46);
    t61 = (~(t57));
    t62 = *((unsigned int *)t82);
    t63 = (~(t62));
    t64 = *((unsigned int *)t83);
    t65 = (~(t64));
    t66 = *((unsigned int *)t84);
    t67 = (~(t66));
    t73 = (t61 & t63);
    t77 = (t65 & t67);
    t70 = (~(t73));
    t71 = (~(t77));
    t72 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t72 & t70);
    t74 = *((unsigned int *)t69);
    *((unsigned int *)t69) = (t74 & t71);
    t75 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t75 & t70);
    t76 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t76 & t71);
    goto LAB98;

}


extern void work_m_00000000002297646685_3363942390_init()
{
	static char *pe[] = {(void *)Cont_35_0,(void *)Always_36_1};
	xsi_register_didat("work_m_00000000002297646685_3363942390", "isim/test_isim_beh.exe.sim/work/m_00000000002297646685_3363942390.didat");
	xsi_register_executes(pe);
}

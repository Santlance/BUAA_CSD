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
static const char *ng0 = "C:/Users/asus/cpucode/alu.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {2, 0};
static int ng4[] = {3, 0};
static int ng5[] = {4, 0};
static int ng6[] = {5, 0};
static int ng7[] = {6, 0};
static int ng8[] = {7, 0};
static int ng9[] = {16, 0};
static int ng10[] = {8, 0};
static int ng11[] = {9, 0};
static int ng12[] = {10, 0};
static int ng13[] = {31, 0};
static int ng14[] = {11, 0};



static void Always_27_0(char *t0)
{
    char t10[8];
    char t42[8];
    char t43[8];
    char t48[8];
    char t49[8];
    char t59[8];
    char t68[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    int t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    char *t41;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    char *t57;
    char *t58;
    char *t60;
    char *t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    char *t66;
    char *t67;
    char *t69;
    char *t70;
    char *t71;
    char *t72;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t4, 32);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng10)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng14)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t6 == 1)
        goto LAB29;

LAB30:
LAB32:
LAB31:    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB33:    goto LAB2;

LAB7:    xsi_set_current_line(29, ng0);
    t7 = (t0 + 1048U);
    t8 = *((char **)t7);
    t7 = (t0 + 1208U);
    t9 = *((char **)t7);
    t11 = *((unsigned int *)t8);
    t12 = *((unsigned int *)t9);
    t13 = (t11 & t12);
    *((unsigned int *)t10) = t13;
    t7 = (t8 + 4);
    t14 = (t9 + 4);
    t15 = (t10 + 4);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t14);
    t18 = (t16 | t17);
    *((unsigned int *)t15) = t18;
    t19 = *((unsigned int *)t15);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB34;

LAB35:
LAB36:    t41 = (t0 + 1768);
    xsi_vlogvar_assign_value(t41, t10, 0, 0, 32);
    goto LAB33;

LAB9:    xsi_set_current_line(30, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t10) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t10 + 4);
    t16 = *((unsigned int *)t3);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    *((unsigned int *)t9) = t18;
    t19 = *((unsigned int *)t9);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB37;

LAB38:
LAB39:    t23 = (t0 + 1768);
    xsi_vlogvar_assign_value(t23, t10, 0, 0, 32);
    goto LAB33;

LAB11:    xsi_set_current_line(31, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_add(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB33;

LAB13:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    xsi_vlog_unsigned_minus(t10, 32, t4, 32, t7, 32);
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t10, 0, 0, 32);
    goto LAB33;

LAB15:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1048U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t10) = t12;
    t13 = *((unsigned int *)t8);
    t16 = (t13 >> 0);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t17 & 31U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 31U);
    memset(t42, 0, 8);
    xsi_vlog_unsigned_lshift(t42, 32, t4, 32, t10, 5);
    t9 = (t0 + 1768);
    xsi_vlogvar_assign_value(t9, t42, 0, 0, 32);
    goto LAB33;

LAB17:    xsi_set_current_line(34, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1048U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t10) = t12;
    t13 = *((unsigned int *)t8);
    t16 = (t13 >> 0);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t17 & 31U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 31U);
    memset(t42, 0, 8);
    xsi_vlog_unsigned_rshift(t42, 32, t4, 32, t10, 5);
    t9 = (t0 + 1768);
    xsi_vlogvar_assign_value(t9, t42, 0, 0, 32);
    goto LAB33;

LAB19:    xsi_set_current_line(35, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    *((unsigned int *)t10) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t10 + 4);
    t16 = *((unsigned int *)t3);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    *((unsigned int *)t9) = t18;
    t19 = *((unsigned int *)t9);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB40;

LAB41:
LAB42:    t14 = (t0 + 1768);
    xsi_vlogvar_assign_value(t14, t10, 0, 0, 32);
    goto LAB33;

LAB21:    xsi_set_current_line(36, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng9)));
    memset(t10, 0, 8);
    xsi_vlog_unsigned_lshift(t10, 32, t4, 32, t3, 32);
    t7 = (t0 + 1768);
    xsi_vlogvar_assign_value(t7, t10, 0, 0, 32);
    goto LAB33;

LAB23:    xsi_set_current_line(37, ng0);
    t3 = (t0 + 1208U);
    t4 = *((char **)t3);
    t3 = (t0 + 1048U);
    t7 = *((char **)t3);
    memset(t42, 0, 8);
    t3 = (t42 + 4);
    t8 = (t7 + 4);
    t11 = *((unsigned int *)t7);
    t12 = (t11 >> 0);
    *((unsigned int *)t42) = t12;
    t13 = *((unsigned int *)t8);
    t16 = (t13 >> 0);
    *((unsigned int *)t3) = t16;
    t17 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t17 & 31U);
    t18 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t18 & 31U);
    memset(t43, 0, 8);
    xsi_vlog_signed_arith_rshift(t43, 32, t4, 32, t42, 5);
    t9 = (t0 + 1768);
    xsi_vlogvar_assign_value(t9, t43, 0, 0, 32);
    goto LAB33;

LAB25:    xsi_set_current_line(38, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 | t12);
    *((unsigned int *)t42) = t13;
    t3 = (t4 + 4);
    t8 = (t7 + 4);
    t9 = (t42 + 4);
    t16 = *((unsigned int *)t3);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    *((unsigned int *)t9) = t18;
    t19 = *((unsigned int *)t9);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB43;

LAB44:
LAB45:    memset(t10, 0, 8);
    t23 = (t10 + 4);
    t24 = (t42 + 4);
    t37 = *((unsigned int *)t42);
    t38 = (~(t37));
    *((unsigned int *)t10) = t38;
    *((unsigned int *)t23) = 0;
    if (*((unsigned int *)t24) != 0)
        goto LAB47;

LAB46:    t46 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t46 & 4294967295U);
    t47 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t47 & 4294967295U);
    t41 = (t0 + 1768);
    xsi_vlogvar_assign_value(t41, t10, 0, 0, 32);
    goto LAB33;

LAB27:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t43, 0, 8);
    t3 = (t43 + 4);
    t7 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 31);
    t13 = (t12 & 1);
    *((unsigned int *)t43) = t13;
    t16 = *((unsigned int *)t7);
    t17 = (t16 >> 31);
    t18 = (t17 & 1);
    *((unsigned int *)t3) = t18;
    t8 = (t0 + 1208U);
    t9 = *((char **)t8);
    memset(t48, 0, 8);
    t8 = (t48 + 4);
    t14 = (t9 + 4);
    t19 = *((unsigned int *)t9);
    t20 = (t19 >> 31);
    t21 = (t20 & 1);
    *((unsigned int *)t48) = t21;
    t22 = *((unsigned int *)t14);
    t25 = (t22 >> 31);
    t26 = (t25 & 1);
    *((unsigned int *)t8) = t26;
    memset(t49, 0, 8);
    t15 = (t43 + 4);
    t23 = (t48 + 4);
    t27 = *((unsigned int *)t43);
    t28 = *((unsigned int *)t48);
    t29 = (t27 ^ t28);
    t30 = *((unsigned int *)t15);
    t31 = *((unsigned int *)t23);
    t32 = (t30 ^ t31);
    t35 = (t29 | t32);
    t36 = *((unsigned int *)t15);
    t37 = *((unsigned int *)t23);
    t38 = (t36 | t37);
    t39 = (~(t38));
    t40 = (t35 & t39);
    if (t40 != 0)
        goto LAB51;

LAB48:    if (t38 != 0)
        goto LAB50;

LAB49:    *((unsigned int *)t49) = 1;

LAB51:    memset(t42, 0, 8);
    t41 = (t49 + 4);
    t44 = *((unsigned int *)t41);
    t45 = (~(t44));
    t46 = *((unsigned int *)t49);
    t47 = (t46 & t45);
    t50 = (t47 & 1U);
    if (t50 != 0)
        goto LAB52;

LAB53:    if (*((unsigned int *)t41) != 0)
        goto LAB54;

LAB55:    t52 = (t42 + 4);
    t53 = *((unsigned int *)t42);
    t54 = *((unsigned int *)t52);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB56;

LAB57:    t62 = *((unsigned int *)t42);
    t63 = (~(t62));
    t64 = *((unsigned int *)t52);
    t65 = (t63 || t64);
    if (t65 > 0)
        goto LAB58;

LAB59:    if (*((unsigned int *)t52) > 0)
        goto LAB60;

LAB61:    if (*((unsigned int *)t42) > 0)
        goto LAB62;

LAB63:    memcpy(t10, t68, 8);

LAB64:    t72 = (t0 + 1768);
    xsi_vlogvar_assign_value(t72, t10, 0, 0, 32);
    goto LAB33;

LAB29:    xsi_set_current_line(40, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t7 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t4 + 4);
    if (*((unsigned int *)t3) != 0)
        goto LAB71;

LAB70:    t8 = (t7 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB71;

LAB74:    if (*((unsigned int *)t4) < *((unsigned int *)t7))
        goto LAB72;

LAB73:    t14 = (t0 + 1768);
    xsi_vlogvar_assign_value(t14, t10, 0, 0, 32);
    goto LAB33;

LAB34:    t21 = *((unsigned int *)t10);
    t22 = *((unsigned int *)t15);
    *((unsigned int *)t10) = (t21 | t22);
    t23 = (t8 + 4);
    t24 = (t9 + 4);
    t25 = *((unsigned int *)t8);
    t26 = (~(t25));
    t27 = *((unsigned int *)t23);
    t28 = (~(t27));
    t29 = *((unsigned int *)t9);
    t30 = (~(t29));
    t31 = *((unsigned int *)t24);
    t32 = (~(t31));
    t33 = (t26 & t28);
    t34 = (t30 & t32);
    t35 = (~(t33));
    t36 = (~(t34));
    t37 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t37 & t35);
    t38 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t38 & t36);
    t39 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t39 & t35);
    t40 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t40 & t36);
    goto LAB36;

LAB37:    t21 = *((unsigned int *)t10);
    t22 = *((unsigned int *)t9);
    *((unsigned int *)t10) = (t21 | t22);
    t14 = (t4 + 4);
    t15 = (t7 + 4);
    t25 = *((unsigned int *)t14);
    t26 = (~(t25));
    t27 = *((unsigned int *)t4);
    t33 = (t27 & t26);
    t28 = *((unsigned int *)t15);
    t29 = (~(t28));
    t30 = *((unsigned int *)t7);
    t34 = (t30 & t29);
    t31 = (~(t33));
    t32 = (~(t34));
    t35 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t35 & t31);
    t36 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t36 & t32);
    goto LAB39;

LAB40:    t21 = *((unsigned int *)t10);
    t22 = *((unsigned int *)t9);
    *((unsigned int *)t10) = (t21 | t22);
    goto LAB42;

LAB43:    t21 = *((unsigned int *)t42);
    t22 = *((unsigned int *)t9);
    *((unsigned int *)t42) = (t21 | t22);
    t14 = (t4 + 4);
    t15 = (t7 + 4);
    t25 = *((unsigned int *)t14);
    t26 = (~(t25));
    t27 = *((unsigned int *)t4);
    t33 = (t27 & t26);
    t28 = *((unsigned int *)t15);
    t29 = (~(t28));
    t30 = *((unsigned int *)t7);
    t34 = (t30 & t29);
    t31 = (~(t33));
    t32 = (~(t34));
    t35 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t35 & t31);
    t36 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t36 & t32);
    goto LAB45;

LAB47:    t39 = *((unsigned int *)t10);
    t40 = *((unsigned int *)t24);
    *((unsigned int *)t10) = (t39 | t40);
    t44 = *((unsigned int *)t23);
    t45 = *((unsigned int *)t24);
    *((unsigned int *)t23) = (t44 | t45);
    goto LAB46;

LAB50:    t24 = (t49 + 4);
    *((unsigned int *)t49) = 1;
    *((unsigned int *)t24) = 1;
    goto LAB51;

LAB52:    *((unsigned int *)t42) = 1;
    goto LAB55;

LAB54:    t51 = (t42 + 4);
    *((unsigned int *)t42) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB55;

LAB56:    t56 = (t0 + 1048U);
    t57 = *((char **)t56);
    t56 = (t0 + 1208U);
    t58 = *((char **)t56);
    memset(t59, 0, 8);
    t56 = (t57 + 4);
    if (*((unsigned int *)t56) != 0)
        goto LAB66;

LAB65:    t60 = (t58 + 4);
    if (*((unsigned int *)t60) != 0)
        goto LAB66;

LAB69:    if (*((unsigned int *)t57) < *((unsigned int *)t58))
        goto LAB67;

LAB68:    goto LAB57;

LAB58:    t66 = (t0 + 1048U);
    t67 = *((char **)t66);
    t66 = (t0 + 1008U);
    t69 = (t66 + 72U);
    t70 = *((char **)t69);
    t71 = ((char*)((ng13)));
    xsi_vlog_generic_get_index_select_value(t68, 32, t67, t70, 2, t71, 32, 1);
    goto LAB59;

LAB60:    xsi_vlog_unsigned_bit_combine(t10, 32, t59, 32, t68, 32);
    goto LAB64;

LAB62:    memcpy(t10, t59, 8);
    goto LAB64;

LAB66:    t61 = (t59 + 4);
    *((unsigned int *)t59) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB68;

LAB67:    *((unsigned int *)t59) = 1;
    goto LAB68;

LAB71:    t9 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB73;

LAB72:    *((unsigned int *)t10) = 1;
    goto LAB73;

}


extern void work_m_00000000003929490251_2725559894_init()
{
	static char *pe[] = {(void *)Always_27_0};
	xsi_register_didat("work_m_00000000003929490251_2725559894", "isim/test_isim_beh.exe.sim/work/m_00000000003929490251_2725559894.didat");
	xsi_register_executes(pe);
}

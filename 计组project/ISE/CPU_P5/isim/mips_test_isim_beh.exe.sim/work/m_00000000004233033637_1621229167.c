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
static const char *ng0 = "C:/Users/asus/Desktop/ISE/CPU_P5/PIPELINE_D.v";
static int ng1[] = {0, 0};
static int ng2[] = {32, 0};
static int ng3[] = {1, 0};
static const char *ng4 = "%d@%h: $%d <= %h";
static int ng5[] = {4, 0};



static void Initial_135_0(char *t0)
{
    char t5[8];
    char t14[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(135, ng0);

LAB2:    xsi_set_current_line(136, ng0);
    xsi_set_current_line(136, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3048);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 3048);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_less(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(137, ng0);
    t12 = ((char*)((ng1)));
    t13 = (t0 + 2888);
    t16 = (t0 + 2888);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 2888);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 3048);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB6;

LAB7:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 3048);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng3)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 3048);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB6:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, *((unsigned int *)t15), t35, 0LL);
    goto LAB7;

}

static void Cont_140_1(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(140, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2888);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2888);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 1528U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 5144);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 5032);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_141_2(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(141, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2888);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2888);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 1688U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 5208);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 5048);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_143_3(char *t0)
{
    char t13[8];
    char t15[8];
    char t16[8];
    char t37[16];
    char t38[8];
    char t59[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    int t28;
    char *t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    int t36;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
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
    unsigned int t57;
    unsigned int t58;
    char *t60;
    char *t61;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(143, ng0);
    t2 = (t0 + 5064);
    *((int *)t2) = 1;
    t3 = (t0 + 4744);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(143, ng0);

LAB5:    xsi_set_current_line(144, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(148, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB15;

LAB16:
LAB17:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(144, ng0);

LAB9:    xsi_set_current_line(145, ng0);
    xsi_set_current_line(145, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3048);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);

LAB10:    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_less(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    goto LAB8;

LAB11:    xsi_set_current_line(146, ng0);
    t12 = ((char*)((ng1)));
    t14 = (t0 + 2888);
    t17 = (t0 + 2888);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 2888);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 3048);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_convert_array_indices(t15, t16, t19, t22, 2, 1, t25, 32, 1);
    t26 = (t15 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (!(t27));
    t29 = (t16 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB13;

LAB14:    xsi_set_current_line(145, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng3)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 3048);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB10;

LAB13:    t33 = *((unsigned int *)t15);
    t34 = *((unsigned int *)t16);
    t35 = (t33 - t34);
    t36 = (t35 + 1);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, *((unsigned int *)t16), t36, 0LL);
    goto LAB14;

LAB15:    xsi_set_current_line(148, ng0);

LAB18:    xsi_set_current_line(149, ng0);
    t4 = xsi_vlog_time(t37, 1000.0000000000000, 1000.0000000000000);
    t5 = (t0 + 2168U);
    t11 = *((char **)t5);
    t5 = ((char*)((ng5)));
    memset(t13, 0, 8);
    xsi_vlog_unsigned_minus(t13, 32, t11, 32, t5, 32);
    t12 = (t0 + 1848U);
    t14 = *((char **)t12);
    t12 = (t0 + 1848U);
    t17 = *((char **)t12);
    t12 = ((char*)((ng1)));
    memset(t38, 0, 8);
    t18 = (t17 + 4);
    t19 = (t12 + 4);
    t27 = *((unsigned int *)t17);
    t30 = *((unsigned int *)t12);
    t33 = (t27 ^ t30);
    t34 = *((unsigned int *)t18);
    t39 = *((unsigned int *)t19);
    t40 = (t34 ^ t39);
    t41 = (t33 | t40);
    t42 = *((unsigned int *)t18);
    t43 = *((unsigned int *)t19);
    t44 = (t42 | t43);
    t45 = (~(t44));
    t46 = (t41 & t45);
    if (t46 != 0)
        goto LAB22;

LAB19:    if (t44 != 0)
        goto LAB21;

LAB20:    *((unsigned int *)t38) = 1;

LAB22:    memset(t16, 0, 8);
    t21 = (t38 + 4);
    t47 = *((unsigned int *)t21);
    t48 = (~(t47));
    t49 = *((unsigned int *)t38);
    t50 = (t49 & t48);
    t51 = (t50 & 1U);
    if (t51 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t21) != 0)
        goto LAB25;

LAB26:    t23 = (t16 + 4);
    t52 = *((unsigned int *)t16);
    t53 = *((unsigned int *)t23);
    t54 = (t52 || t53);
    if (t54 > 0)
        goto LAB27;

LAB28:    t55 = *((unsigned int *)t16);
    t56 = (~(t55));
    t57 = *((unsigned int *)t23);
    t58 = (t56 || t57);
    if (t58 > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t23) > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t16) > 0)
        goto LAB33;

LAB34:    memcpy(t15, t26, 8);

LAB35:    xsi_vlogfile_write(1, 0, 0, ng4, 5, t0, (char)118, t37, 64, (char)118, t13, 32, (char)118, t14, 5, (char)118, t15, 32);
    xsi_set_current_line(150, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t16, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t27 = (t9 ^ t10);
    t30 = (t8 | t27);
    t33 = *((unsigned int *)t4);
    t34 = *((unsigned int *)t5);
    t39 = (t33 | t34);
    t40 = (~(t39));
    t41 = (t30 & t40);
    if (t41 != 0)
        goto LAB39;

LAB36:    if (t39 != 0)
        goto LAB38;

LAB37:    *((unsigned int *)t16) = 1;

LAB39:    memset(t15, 0, 8);
    t12 = (t16 + 4);
    t42 = *((unsigned int *)t12);
    t43 = (~(t42));
    t44 = *((unsigned int *)t16);
    t45 = (t44 & t43);
    t46 = (t45 & 1U);
    if (t46 != 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t12) != 0)
        goto LAB42;

LAB43:    t17 = (t15 + 4);
    t47 = *((unsigned int *)t15);
    t48 = *((unsigned int *)t17);
    t49 = (t47 || t48);
    if (t49 > 0)
        goto LAB44;

LAB45:    t50 = *((unsigned int *)t15);
    t51 = (~(t50));
    t52 = *((unsigned int *)t17);
    t53 = (t51 || t52);
    if (t53 > 0)
        goto LAB46;

LAB47:    if (*((unsigned int *)t17) > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t15) > 0)
        goto LAB50;

LAB51:    memcpy(t13, t20, 8);

LAB52:    t19 = (t0 + 2888);
    t21 = (t0 + 2888);
    t22 = (t21 + 72U);
    t23 = *((char **)t22);
    t24 = (t0 + 2888);
    t25 = (t24 + 64U);
    t26 = *((char **)t25);
    t29 = (t0 + 1848U);
    t60 = *((char **)t29);
    xsi_vlog_generic_convert_array_indices(t38, t59, t23, t26, 2, 1, t60, 5, 2);
    t29 = (t38 + 4);
    t54 = *((unsigned int *)t29);
    t28 = (!(t54));
    t61 = (t59 + 4);
    t55 = *((unsigned int *)t61);
    t31 = (!(t55));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB53;

LAB54:    goto LAB17;

LAB21:    t20 = (t38 + 4);
    *((unsigned int *)t38) = 1;
    *((unsigned int *)t20) = 1;
    goto LAB22;

LAB23:    *((unsigned int *)t16) = 1;
    goto LAB26;

LAB25:    t22 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB26;

LAB27:    t24 = ((char*)((ng1)));
    goto LAB28;

LAB29:    t25 = (t0 + 2008U);
    t26 = *((char **)t25);
    goto LAB30;

LAB31:    xsi_vlog_unsigned_bit_combine(t15, 32, t24, 32, t26, 32);
    goto LAB35;

LAB33:    memcpy(t15, t24, 8);
    goto LAB35;

LAB38:    t11 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB39;

LAB40:    *((unsigned int *)t15) = 1;
    goto LAB43;

LAB42:    t14 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB43;

LAB44:    t18 = ((char*)((ng1)));
    goto LAB45;

LAB46:    t19 = (t0 + 2008U);
    t20 = *((char **)t19);
    goto LAB47;

LAB48:    xsi_vlog_unsigned_bit_combine(t13, 32, t18, 32, t20, 32);
    goto LAB52;

LAB50:    memcpy(t13, t18, 8);
    goto LAB52;

LAB53:    t56 = *((unsigned int *)t38);
    t57 = *((unsigned int *)t59);
    t35 = (t56 - t57);
    t36 = (t35 + 1);
    xsi_vlogvar_wait_assign_value(t19, t13, 0, *((unsigned int *)t59), t36, 0LL);
    goto LAB54;

}


extern void work_m_00000000004233033637_1621229167_init()
{
	static char *pe[] = {(void *)Initial_135_0,(void *)Cont_140_1,(void *)Cont_141_2,(void *)Always_143_3};
	xsi_register_didat("work_m_00000000004233033637_1621229167", "isim/mips_test_isim_beh.exe.sim/work/m_00000000004233033637_1621229167.didat");
	xsi_register_executes(pe);
}

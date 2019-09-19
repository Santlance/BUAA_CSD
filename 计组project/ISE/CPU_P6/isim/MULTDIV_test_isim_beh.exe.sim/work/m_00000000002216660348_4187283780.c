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
static const char *ng0 = "C:/Users/asus/Desktop/ISE/CPU_P6/PIPELINE_E.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {5, 0};
static int ng4[] = {2, 0};
static int ng5[] = {3, 0};
static int ng6[] = {10, 0};
static int ng7[] = {4, 0};
static int ng8[] = {6, 0};
static unsigned int ng9[] = {1U, 0U};



static void Cont_182_0(char *t0)
{
    char t6[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;

LAB0:    t1 = (t0 + 3648U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(182, ng0);
    t2 = (t0 + 2728);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t4 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB5;

LAB4:    t8 = (t5 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB6;

LAB7:    t10 = (t0 + 4312);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memset(t14, 0, 8);
    t15 = 1U;
    t16 = t15;
    t17 = (t6 + 4);
    t18 = *((unsigned int *)t6);
    t15 = (t15 & t18);
    t19 = *((unsigned int *)t17);
    t16 = (t16 & t19);
    t20 = (t14 + 4);
    t21 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t21 | t15);
    t22 = *((unsigned int *)t20);
    *((unsigned int *)t20) = (t22 | t16);
    xsi_driver_vfirst_trans(t10, 0, 0);
    t23 = (t0 + 4216);
    *((int *)t23) = 1;

LAB1:    return;
LAB5:    t9 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB7;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB7;

}

static void Always_184_1(char *t0)
{
    char t14[16];
    char t15[16];
    char t16[16];
    char t17[8];
    char t18[8];
    char t19[8];
    char t22[8];
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
    int t13;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 3896U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(184, ng0);
    t2 = (t0 + 4232);
    *((int *)t2) = 1;
    t3 = (t0 + 3928);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(184, ng0);

LAB5:    xsi_set_current_line(185, ng0);
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

LAB7:    xsi_set_current_line(190, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(222, ng0);
    t2 = (t0 + 2008U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB37;

LAB38:
LAB39:
LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(185, ng0);

LAB9:    xsi_set_current_line(186, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(187, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(188, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);
    goto LAB8;

LAB10:    xsi_set_current_line(190, ng0);

LAB13:    xsi_set_current_line(191, ng0);
    t4 = (t0 + 1848U);
    t5 = *((char **)t4);

LAB14:    t4 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 4, t4, 32);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng7)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t13 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t13 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng8)));
    t13 = xsi_vlog_unsigned_case_compare(t5, 4, t2, 32);
    if (t13 == 1)
        goto LAB25;

LAB26:
LAB28:
LAB27:    xsi_set_current_line(216, ng0);

LAB36:    xsi_set_current_line(217, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(218, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 32, 0LL);

LAB29:    goto LAB12;

LAB15:    xsi_set_current_line(192, ng0);

LAB30:    xsi_set_current_line(193, ng0);
    t11 = ((char*)((ng3)));
    t12 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    xsi_set_current_line(194, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    xsi_vlogtype_sign_extend(t14, 64, t3, 32);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    xsi_vlogtype_sign_extend(t15, 64, t4, 32);
    xsi_vlog_signed_multiply(t16, 64, t14, 64, t15, 64);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t16, 0, 0, 32, 0LL);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t16, 32, 0, 32, 0LL);
    goto LAB29;

LAB17:    xsi_set_current_line(196, ng0);

LAB31:    xsi_set_current_line(197, ng0);
    t3 = ((char*)((ng3)));
    t4 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    xsi_set_current_line(198, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    xsi_vlog_unsigned_multiply(t14, 64, t3, 32, t4, 32);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t14, 0, 0, 32, 0LL);
    t11 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t11, t14, 32, 0, 32, 0LL);
    goto LAB29;

LAB19:    xsi_set_current_line(200, ng0);

LAB32:    xsi_set_current_line(201, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    xsi_set_current_line(202, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    memset(t19, 0, 8);
    xsi_vlog_signed_divide(t19, 32, t3, 32, t4, 32);
    t2 = (t0 + 1528U);
    t11 = *((char **)t2);
    t2 = (t0 + 1688U);
    t12 = *((char **)t2);
    memset(t22, 0, 8);
    xsi_vlog_signed_mod(t22, 32, t11, 32, t12, 32);
    xsi_vlogtype_concat(t14, 64, 64, 2U, t22, 32, t19, 32);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t14, 0, 0, 32, 0LL);
    t23 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t23, t14, 32, 0, 32, 0LL);
    goto LAB29;

LAB21:    xsi_set_current_line(204, ng0);

LAB33:    xsi_set_current_line(205, ng0);
    t3 = ((char*)((ng6)));
    t4 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 4, 0LL);
    xsi_set_current_line(206, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 1688U);
    t4 = *((char **)t2);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_divide(t17, 32, t3, 32, t4, 32);
    t2 = (t0 + 1528U);
    t11 = *((char **)t2);
    t2 = (t0 + 1688U);
    t12 = *((char **)t2);
    memset(t18, 0, 8);
    xsi_vlog_unsigned_mod(t18, 32, t11, 32, t12, 32);
    xsi_vlogtype_concat(t14, 64, 64, 2U, t18, 32, t17, 32);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t14, 0, 0, 32, 0LL);
    t23 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t23, t14, 32, 0, 32, 0LL);
    goto LAB29;

LAB23:    xsi_set_current_line(208, ng0);

LAB34:    xsi_set_current_line(209, ng0);
    t3 = (t0 + 1528U);
    t4 = *((char **)t3);
    t3 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t3, t4, 0, 0, 32, 0LL);
    xsi_set_current_line(210, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t11 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t11, t4, 0, 0, 32, 0LL);
    goto LAB29;

LAB25:    xsi_set_current_line(212, ng0);

LAB35:    xsi_set_current_line(213, ng0);
    t3 = (t0 + 2408);
    t4 = (t3 + 56U);
    t11 = *((char **)t4);
    t12 = (t0 + 2408);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 32, 0LL);
    xsi_set_current_line(214, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t0 + 2568);
    xsi_vlogvar_wait_assign_value(t2, t3, 0, 0, 32, 0LL);
    goto LAB29;

LAB37:    xsi_set_current_line(222, ng0);

LAB40:    xsi_set_current_line(223, ng0);
    t4 = (t0 + 2728);
    t11 = (t4 + 56U);
    t12 = *((char **)t11);
    t23 = ((char*)((ng9)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 4, t12, 4, t23, 4);
    t24 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t24, t17, 0, 0, 4, 0LL);
    goto LAB39;

}


extern void work_m_00000000002216660348_4187283780_init()
{
	static char *pe[] = {(void *)Cont_182_0,(void *)Always_184_1};
	xsi_register_didat("work_m_00000000002216660348_4187283780", "isim/MULTDIV_test_isim_beh.exe.sim/work/m_00000000002216660348_4187283780.didat");
	xsi_register_executes(pe);
}

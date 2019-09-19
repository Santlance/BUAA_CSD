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
static const char *ng0 = "C:/Users/asus/Desktop/ISE/CPU_P5/DECODER_T.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {33U, 0U};
static unsigned int ng3[] = {35U, 0U};
static unsigned int ng4[] = {13U, 0U};
static unsigned int ng5[] = {15U, 0U};
static unsigned int ng6[] = {1U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {17U, 0U};



static void Always_91_0(char *t0)
{
    char t4[8];
    char t16[8];
    char t30[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    int t15;
    char *t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    int t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 2368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 2688);
    *((int *)t2) = 1;
    t3 = (t0 + 2400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(91, ng0);

LAB5:    xsi_set_current_line(92, ng0);
    t5 = (t0 + 1048U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t5 = (t4 + 4);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 26);
    *((unsigned int *)t4) = t9;
    t10 = *((unsigned int *)t7);
    t11 = (t10 >> 26);
    *((unsigned int *)t5) = t11;
    t12 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t12 & 63U);
    t13 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t13 & 63U);

LAB6:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t14, 6);
    if (t15 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB17;

LAB18:
LAB20:
LAB19:    xsi_set_current_line(127, ng0);

LAB46:    xsi_set_current_line(128, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(94, ng0);
    t17 = (t0 + 1048U);
    t18 = *((char **)t17);
    memset(t16, 0, 8);
    t17 = (t16 + 4);
    t19 = (t18 + 4);
    t20 = *((unsigned int *)t18);
    t21 = (t20 >> 0);
    *((unsigned int *)t16) = t21;
    t22 = *((unsigned int *)t19);
    t23 = (t22 >> 0);
    *((unsigned int *)t17) = t23;
    t24 = *((unsigned int *)t16);
    *((unsigned int *)t16) = (t24 & 63U);
    t25 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t25 & 63U);

LAB22:    t26 = ((char*)((ng2)));
    t27 = xsi_vlog_unsigned_case_compare(t16, 6, t26, 6);
    if (t27 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB25;

LAB26:
LAB28:
LAB27:    xsi_set_current_line(101, ng0);

LAB32:    xsi_set_current_line(102, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB29:    goto LAB21;

LAB9:    xsi_set_current_line(105, ng0);

LAB33:    xsi_set_current_line(106, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB21;

LAB11:    xsi_set_current_line(108, ng0);

LAB34:    xsi_set_current_line(109, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB21;

LAB13:    xsi_set_current_line(111, ng0);

LAB35:    xsi_set_current_line(112, ng0);
    t3 = ((char*)((ng6)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB21;

LAB15:    xsi_set_current_line(114, ng0);

LAB36:    xsi_set_current_line(115, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB21;

LAB17:    xsi_set_current_line(117, ng0);

LAB37:    xsi_set_current_line(118, ng0);
    t3 = (t0 + 1048U);
    t5 = *((char **)t3);
    memset(t30, 0, 8);
    t3 = (t30 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 16);
    *((unsigned int *)t30) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 16);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t12 & 31U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 31U);

LAB38:    t7 = ((char*)((ng8)));
    t27 = xsi_vlog_unsigned_case_compare(t30, 5, t7, 5);
    if (t27 == 1)
        goto LAB39;

LAB40:
LAB42:
LAB41:    xsi_set_current_line(122, ng0);

LAB45:    xsi_set_current_line(123, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB43:    goto LAB21;

LAB23:    xsi_set_current_line(95, ng0);

LAB30:    xsi_set_current_line(96, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 1448);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 2);
    goto LAB29;

LAB25:    xsi_set_current_line(98, ng0);

LAB31:    xsi_set_current_line(99, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB29;

LAB39:    xsi_set_current_line(119, ng0);

LAB44:    xsi_set_current_line(120, ng0);
    t14 = ((char*)((ng1)));
    t17 = (t0 + 1448);
    xsi_vlogvar_assign_value(t17, t14, 0, 0, 2);
    goto LAB43;

}


extern void work_m_00000000003088967988_0700353811_init()
{
	static char *pe[] = {(void *)Always_91_0};
	xsi_register_didat("work_m_00000000003088967988_0700353811", "isim/mips_test_isim_beh.exe.sim/work/m_00000000003088967988_0700353811.didat");
	xsi_register_executes(pe);
}

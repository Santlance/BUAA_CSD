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
static const char *ng0 = "C:/Users/asus/cpucode/decoder.v";
static unsigned int ng1[] = {11U, 0U};
static int ng2[] = {0, 0};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {10U, 0U};
static unsigned int ng5[] = {14U, 0U};
static unsigned int ng6[] = {8U, 0U};
static unsigned int ng7[] = {9U, 0U};
static unsigned int ng8[] = {15U, 0U};
static unsigned int ng9[] = {13U, 0U};
static unsigned int ng10[] = {3U, 0U};
static unsigned int ng11[] = {1U, 0U};
static unsigned int ng12[] = {0U, 0U};
static unsigned int ng13[] = {35U, 0U};



static void Always_177_0(char *t0)
{
    char t4[8];
    char t18[8];
    char t19[8];
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
    char *t16;
    char *t17;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(177, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(177, ng0);

LAB5:    xsi_set_current_line(178, ng0);
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

LAB12:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB25;

LAB26:
LAB28:
LAB27:    xsi_set_current_line(224, ng0);

LAB48:    xsi_set_current_line(225, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(226, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB29:    goto LAB2;

LAB7:    xsi_set_current_line(179, ng0);

LAB30:    xsi_set_current_line(180, ng0);
    t16 = ((char*)((ng2)));
    t17 = (t0 + 1448);
    xsi_vlogvar_assign_value(t17, t16, 0, 0, 2);
    xsi_set_current_line(181, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB9:    xsi_set_current_line(183, ng0);

LAB31:    xsi_set_current_line(184, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(185, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB11:    xsi_set_current_line(187, ng0);

LAB32:    xsi_set_current_line(188, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(189, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB13:    xsi_set_current_line(191, ng0);

LAB33:    xsi_set_current_line(192, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(193, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB15:    xsi_set_current_line(195, ng0);

LAB34:    xsi_set_current_line(196, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(197, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB17:    xsi_set_current_line(199, ng0);

LAB35:    xsi_set_current_line(200, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(201, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB19:    xsi_set_current_line(203, ng0);

LAB36:    xsi_set_current_line(204, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(205, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB21:    xsi_set_current_line(207, ng0);

LAB37:    xsi_set_current_line(208, ng0);
    t3 = ((char*)((ng3)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(209, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB23:    xsi_set_current_line(212, ng0);
    t3 = (t0 + 1048U);
    t5 = *((char **)t3);
    memset(t18, 0, 8);
    t3 = (t18 + 4);
    t6 = (t5 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t18) = t9;
    t10 = *((unsigned int *)t6);
    t11 = (t10 >> 0);
    *((unsigned int *)t3) = t11;
    t12 = *((unsigned int *)t18);
    *((unsigned int *)t18) = (t12 & 63U);
    t13 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t13 & 63U);
    t7 = ((char*)((ng7)));
    memset(t19, 0, 8);
    t14 = (t18 + 4);
    t16 = (t7 + 4);
    t20 = *((unsigned int *)t18);
    t21 = *((unsigned int *)t7);
    t22 = (t20 ^ t21);
    t23 = *((unsigned int *)t14);
    t24 = *((unsigned int *)t16);
    t25 = (t23 ^ t24);
    t26 = (t22 | t25);
    t27 = *((unsigned int *)t14);
    t28 = *((unsigned int *)t16);
    t29 = (t27 | t28);
    t30 = (~(t29));
    t31 = (t26 & t30);
    if (t31 != 0)
        goto LAB41;

LAB38:    if (t29 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t19) = 1;

LAB41:    t32 = (t19 + 4);
    t33 = *((unsigned int *)t32);
    t34 = (~(t33));
    t35 = *((unsigned int *)t19);
    t36 = (t35 & t34);
    t37 = (t36 != 0);
    if (t37 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(216, ng0);

LAB46:    xsi_set_current_line(217, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    xsi_set_current_line(218, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB44:    goto LAB29;

LAB25:    xsi_set_current_line(220, ng0);

LAB47:    xsi_set_current_line(221, ng0);
    t3 = ((char*)((ng2)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    xsi_set_current_line(222, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB29;

LAB40:    t17 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB41;

LAB42:    xsi_set_current_line(212, ng0);

LAB45:    xsi_set_current_line(213, ng0);
    t38 = ((char*)((ng3)));
    t39 = (t0 + 1448);
    xsi_vlogvar_assign_value(t39, t38, 0, 0, 2);
    xsi_set_current_line(214, ng0);
    t2 = ((char*)((ng11)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);
    goto LAB44;

}


extern void work_m_00000000003751669300_3973636782_init()
{
	static char *pe[] = {(void *)Always_177_0};
	xsi_register_didat("work_m_00000000003751669300_3973636782", "isim/test_isim_beh.exe.sim/work/m_00000000003751669300_3973636782.didat");
	xsi_register_executes(pe);
}

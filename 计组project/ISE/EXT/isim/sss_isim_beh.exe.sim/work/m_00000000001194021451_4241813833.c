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
static const char *ng0 = "C:/Users/asus/Desktop/ISE/EXT/ext.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};



static void Always_27_0(char *t0)
{
    char t7[8];
    char t10[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

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
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t4, 2);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 2, t2, 2);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:
LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(29, ng0);

LAB18:    xsi_set_current_line(30, ng0);
    t8 = (t0 + 1048U);
    t9 = *((char **)t8);
    xsi_vlogtype_sign_extend(t7, 32, t9, 16);
    t8 = (t0 + 1608);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 32);
    goto LAB17;

LAB9:    xsi_set_current_line(32, ng0);

LAB19:    xsi_set_current_line(33, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memcpy(t7, t4, 8);
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 32);
    goto LAB17;

LAB11:    xsi_set_current_line(35, ng0);

LAB20:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1048U);
    t8 = *((char **)t4);
    memset(t10, 0, 8);
    t4 = (t10 + 4);
    t9 = (t8 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 0);
    *((unsigned int *)t10) = t12;
    t13 = *((unsigned int *)t9);
    t14 = (t13 >> 0);
    *((unsigned int *)t4) = t14;
    t15 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t15 & 65535U);
    t16 = *((unsigned int *)t4);
    *((unsigned int *)t4) = (t16 & 65535U);
    xsi_vlogtype_concat(t7, 32, 32, 2U, t10, 16, t3, 16);
    t17 = (t0 + 1608);
    xsi_vlogvar_assign_value(t17, t7, 0, 0, 32);
    goto LAB17;

LAB13:    xsi_set_current_line(38, ng0);

LAB21:    xsi_set_current_line(39, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    xsi_vlogtype_sign_extend(t7, 32, t4, 16);
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 32);
    xsi_set_current_line(40, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t8 = ((char*)((ng1)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_lshift(t7, 32, t4, 32, t8, 1);
    t9 = (t0 + 1608);
    xsi_vlogvar_assign_value(t9, t7, 0, 0, 32);
    goto LAB17;

}


extern void work_m_00000000001194021451_4241813833_init()
{
	static char *pe[] = {(void *)Always_27_0};
	xsi_register_didat("work_m_00000000001194021451_4241813833", "isim/sss_isim_beh.exe.sim/work/m_00000000001194021451_4241813833.didat");
	xsi_register_executes(pe);
}

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
static const char *ng0 = "C:/Users/asus/Desktop/ISE/CPU_P6/DECODER_T.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {33U, 0U};
static unsigned int ng3[] = {35U, 0U};
static unsigned int ng4[] = {32U, 0U};
static unsigned int ng5[] = {34U, 0U};
static unsigned int ng6[] = {37U, 0U};
static unsigned int ng7[] = {36U, 0U};
static unsigned int ng8[] = {38U, 0U};
static unsigned int ng9[] = {39U, 0U};
static unsigned int ng10[] = {4U, 0U};
static unsigned int ng11[] = {2U, 0U};
static unsigned int ng12[] = {6U, 0U};
static unsigned int ng13[] = {3U, 0U};
static unsigned int ng14[] = {7U, 0U};
static unsigned int ng15[] = {42U, 0U};
static unsigned int ng16[] = {43U, 0U};
static unsigned int ng17[] = {9U, 0U};
static unsigned int ng18[] = {16U, 0U};
static unsigned int ng19[] = {18U, 0U};
static unsigned int ng20[] = {1U, 0U};
static unsigned int ng21[] = {11U, 0U};
static unsigned int ng22[] = {10U, 0U};
static unsigned int ng23[] = {14U, 0U};
static unsigned int ng24[] = {12U, 0U};
static unsigned int ng25[] = {8U, 0U};
static unsigned int ng26[] = {13U, 0U};
static unsigned int ng27[] = {15U, 0U};



static void Always_201_0(char *t0)
{
    char t4[8];
    char t16[8];
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

LAB2:    xsi_set_current_line(201, ng0);
    t2 = (t0 + 2688);
    *((int *)t2) = 1;
    t3 = (t0 + 2400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(201, ng0);

LAB5:    xsi_set_current_line(202, ng0);
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

LAB8:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng2)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng21)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng22)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng23)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng24)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng17)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng25)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng26)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng27)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 6, t2, 6);
    if (t15 == 1)
        goto LAB35;

LAB36:
LAB38:
LAB37:    xsi_set_current_line(308, ng0);

LAB116:    xsi_set_current_line(309, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB39:    goto LAB2;

LAB7:    xsi_set_current_line(204, ng0);
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

LAB40:    t26 = ((char*)((ng2)));
    t27 = xsi_vlog_unsigned_case_compare(t16, 6, t26, 6);
    if (t27 == 1)
        goto LAB41;

LAB42:    t2 = ((char*)((ng3)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB43;

LAB44:    t2 = ((char*)((ng4)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB45;

LAB46:    t2 = ((char*)((ng5)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB47;

LAB48:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB49;

LAB50:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB51;

LAB52:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB53;

LAB54:    t2 = ((char*)((ng9)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB55;

LAB56:    t2 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB57;

LAB58:    t2 = ((char*)((ng10)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB59;

LAB60:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB61;

LAB62:    t2 = ((char*)((ng12)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB63;

LAB64:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB65;

LAB66:    t2 = ((char*)((ng14)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB67;

LAB68:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB69;

LAB70:    t2 = ((char*)((ng16)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB71;

LAB72:    t2 = ((char*)((ng17)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB73;

LAB74:    t2 = ((char*)((ng18)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB75;

LAB76:    t2 = ((char*)((ng19)));
    t15 = xsi_vlog_unsigned_case_compare(t16, 6, t2, 6);
    if (t15 == 1)
        goto LAB77;

LAB78:
LAB80:
LAB79:    xsi_set_current_line(262, ng0);

LAB101:    xsi_set_current_line(263, ng0);
    t2 = ((char*)((ng13)));
    t3 = (t0 + 1448);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 2);

LAB81:    goto LAB39;

LAB9:    xsi_set_current_line(266, ng0);

LAB102:    xsi_set_current_line(267, ng0);
    t3 = ((char*)((ng20)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB11:    xsi_set_current_line(269, ng0);

LAB103:    xsi_set_current_line(270, ng0);
    t3 = ((char*)((ng20)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB13:    xsi_set_current_line(272, ng0);

LAB104:    xsi_set_current_line(273, ng0);
    t3 = ((char*)((ng20)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB15:    xsi_set_current_line(275, ng0);

LAB105:    xsi_set_current_line(276, ng0);
    t3 = ((char*)((ng20)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB17:    xsi_set_current_line(278, ng0);

LAB106:    xsi_set_current_line(279, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB19:    xsi_set_current_line(281, ng0);

LAB107:    xsi_set_current_line(282, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB21:    xsi_set_current_line(284, ng0);

LAB108:    xsi_set_current_line(285, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB23:    xsi_set_current_line(287, ng0);

LAB109:    xsi_set_current_line(288, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB25:    xsi_set_current_line(290, ng0);

LAB110:    xsi_set_current_line(291, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB27:    xsi_set_current_line(293, ng0);

LAB111:    xsi_set_current_line(294, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB29:    xsi_set_current_line(296, ng0);

LAB112:    xsi_set_current_line(297, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB31:    xsi_set_current_line(299, ng0);

LAB113:    xsi_set_current_line(300, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB33:    xsi_set_current_line(302, ng0);

LAB114:    xsi_set_current_line(303, ng0);
    t3 = ((char*)((ng20)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB35:    xsi_set_current_line(305, ng0);

LAB115:    xsi_set_current_line(306, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB39;

LAB41:    xsi_set_current_line(205, ng0);

LAB82:    xsi_set_current_line(206, ng0);
    t28 = ((char*)((ng1)));
    t29 = (t0 + 1448);
    xsi_vlogvar_assign_value(t29, t28, 0, 0, 2);
    goto LAB81;

LAB43:    xsi_set_current_line(208, ng0);

LAB83:    xsi_set_current_line(209, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB45:    xsi_set_current_line(211, ng0);

LAB84:    xsi_set_current_line(212, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB47:    xsi_set_current_line(214, ng0);

LAB85:    xsi_set_current_line(215, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB49:    xsi_set_current_line(217, ng0);

LAB86:    xsi_set_current_line(218, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB51:    xsi_set_current_line(220, ng0);

LAB87:    xsi_set_current_line(221, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB53:    xsi_set_current_line(223, ng0);

LAB88:    xsi_set_current_line(224, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB55:    xsi_set_current_line(226, ng0);

LAB89:    xsi_set_current_line(227, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB57:    xsi_set_current_line(229, ng0);

LAB90:    xsi_set_current_line(230, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB59:    xsi_set_current_line(232, ng0);

LAB91:    xsi_set_current_line(233, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB61:    xsi_set_current_line(235, ng0);

LAB92:    xsi_set_current_line(236, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB63:    xsi_set_current_line(238, ng0);

LAB93:    xsi_set_current_line(239, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB65:    xsi_set_current_line(241, ng0);

LAB94:    xsi_set_current_line(242, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB67:    xsi_set_current_line(244, ng0);

LAB95:    xsi_set_current_line(245, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB69:    xsi_set_current_line(247, ng0);

LAB96:    xsi_set_current_line(248, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB71:    xsi_set_current_line(250, ng0);

LAB97:    xsi_set_current_line(251, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB73:    xsi_set_current_line(253, ng0);

LAB98:    xsi_set_current_line(254, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB75:    xsi_set_current_line(256, ng0);

LAB99:    xsi_set_current_line(257, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

LAB77:    xsi_set_current_line(259, ng0);

LAB100:    xsi_set_current_line(260, ng0);
    t3 = ((char*)((ng1)));
    t5 = (t0 + 1448);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 2);
    goto LAB81;

}


extern void work_m_00000000003088967988_0700353811_init()
{
	static char *pe[] = {(void *)Always_201_0};
	xsi_register_didat("work_m_00000000003088967988_0700353811", "isim/mips_test_isim_beh.exe.sim/work/m_00000000003088967988_0700353811.didat");
	xsi_register_executes(pe);
}

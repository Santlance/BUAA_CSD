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
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static int ng4[] = {0, 0};
static int ng5[] = {1, 0};



static void Cont_207_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char t38[8];
    char t39[8];
    char t45[8];
    char t61[8];
    char t62[8];
    char t68[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
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
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t41;
    char *t42;
    char *t44;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    char *t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t64;
    char *t65;
    char *t67;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    char *t84;
    char *t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    unsigned int t90;
    unsigned int t91;
    char *t92;
    unsigned int t93;
    unsigned int t94;
    char *t95;
    unsigned int t96;
    unsigned int t97;
    char *t98;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(207, ng0);
    t2 = (t0 + 1048U);
    t5 = *((char **)t2);
    t2 = (t0 + 1208U);
    t6 = *((char **)t2);
    memset(t7, 0, 8);
    t2 = (t5 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t2);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t2);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t7) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t7 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t7);
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

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t85 = (t0 + 3352);
    t86 = (t85 + 56U);
    t87 = *((char **)t86);
    t88 = (t87 + 56U);
    t89 = *((char **)t88);
    memset(t89, 0, 8);
    t90 = 3U;
    t91 = t90;
    t92 = (t3 + 4);
    t93 = *((unsigned int *)t3);
    t90 = (t90 & t93);
    t94 = *((unsigned int *)t92);
    t91 = (t91 & t94);
    t95 = (t89 + 4);
    t96 = *((unsigned int *)t89);
    *((unsigned int *)t89) = (t96 | t90);
    t97 = *((unsigned int *)t95);
    *((unsigned int *)t95) = (t97 | t91);
    xsi_driver_vfirst_trans(t85, 0, 1);
    t98 = (t0 + 3256);
    *((int *)t98) = 1;

LAB1:    return;
LAB6:    t21 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng1)));
    goto LAB13;

LAB14:    t41 = (t0 + 1048U);
    t42 = *((char **)t41);
    t41 = (t0 + 1208U);
    t44 = *((char **)t41);
    memset(t45, 0, 8);
    xsi_vlog_signed_greater(t45, 32, t42, 32, t44, 32);
    memset(t39, 0, 8);
    t41 = (t45 + 4);
    t46 = *((unsigned int *)t41);
    t47 = (~(t46));
    t48 = *((unsigned int *)t45);
    t49 = (t48 & t47);
    t50 = (t49 & 1U);
    if (t50 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t41) != 0)
        goto LAB23;

LAB24:    t52 = (t39 + 4);
    t53 = *((unsigned int *)t39);
    t54 = *((unsigned int *)t52);
    t55 = (t53 || t54);
    if (t55 > 0)
        goto LAB25;

LAB26:    t57 = *((unsigned int *)t39);
    t58 = (~(t57));
    t59 = *((unsigned int *)t52);
    t60 = (t58 || t59);
    if (t60 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t52) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t39) > 0)
        goto LAB31;

LAB32:    memcpy(t38, t61, 8);

LAB33:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 2, t33, 2, t38, 2);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

LAB21:    *((unsigned int *)t39) = 1;
    goto LAB24;

LAB23:    t51 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t51) = 1;
    goto LAB24;

LAB25:    t56 = ((char*)((ng2)));
    goto LAB26;

LAB27:    t64 = (t0 + 1048U);
    t65 = *((char **)t64);
    t64 = (t0 + 1208U);
    t67 = *((char **)t64);
    memset(t68, 0, 8);
    xsi_vlog_signed_less(t68, 32, t65, 32, t67, 32);
    memset(t62, 0, 8);
    t64 = (t68 + 4);
    t69 = *((unsigned int *)t64);
    t70 = (~(t69));
    t71 = *((unsigned int *)t68);
    t72 = (t71 & t70);
    t73 = (t72 & 1U);
    if (t73 != 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t64) != 0)
        goto LAB36;

LAB37:    t75 = (t62 + 4);
    t76 = *((unsigned int *)t62);
    t77 = *((unsigned int *)t75);
    t78 = (t76 || t77);
    if (t78 > 0)
        goto LAB38;

LAB39:    t80 = *((unsigned int *)t62);
    t81 = (~(t80));
    t82 = *((unsigned int *)t75);
    t83 = (t81 || t82);
    if (t83 > 0)
        goto LAB40;

LAB41:    if (*((unsigned int *)t75) > 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t62) > 0)
        goto LAB44;

LAB45:    memcpy(t61, t84, 8);

LAB46:    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t38, 2, t56, 2, t61, 2);
    goto LAB33;

LAB31:    memcpy(t38, t56, 8);
    goto LAB33;

LAB34:    *((unsigned int *)t62) = 1;
    goto LAB37;

LAB36:    t74 = (t62 + 4);
    *((unsigned int *)t62) = 1;
    *((unsigned int *)t74) = 1;
    goto LAB37;

LAB38:    t79 = ((char*)((ng3)));
    goto LAB39;

LAB40:    t84 = ((char*)((ng1)));
    goto LAB41;

LAB42:    xsi_vlog_unsigned_bit_combine(t61, 2, t79, 2, t84, 2);
    goto LAB46;

LAB44:    memcpy(t61, t79, 8);
    goto LAB46;

}

static void Cont_211_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t7[8];
    char *t1;
    char *t2;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;

LAB0:    t1 = (t0 + 2936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(211, ng0);
    t2 = (t0 + 1048U);
    t6 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t7, 0, 8);
    xsi_vlog_signed_greatereq(t7, 32, t6, 32, t2, 32);
    memset(t4, 0, 8);
    t8 = (t7 + 4);
    t9 = *((unsigned int *)t8);
    t10 = (~(t9));
    t11 = *((unsigned int *)t7);
    t12 = (t11 & t10);
    t13 = (t12 & 1U);
    if (t13 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t8) != 0)
        goto LAB6;

LAB7:    t15 = (t4 + 4);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t15);
    t18 = (t16 || t17);
    if (t18 > 0)
        goto LAB8;

LAB9:    t20 = *((unsigned int *)t4);
    t21 = (~(t20));
    t22 = *((unsigned int *)t15);
    t23 = (t21 || t22);
    if (t23 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t15) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t24, 8);

LAB16:    t25 = (t0 + 3416);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memset(t29, 0, 8);
    t30 = 1U;
    t31 = t30;
    t32 = (t3 + 4);
    t33 = *((unsigned int *)t3);
    t30 = (t30 & t33);
    t34 = *((unsigned int *)t32);
    t31 = (t31 & t34);
    t35 = (t29 + 4);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t29) = (t36 | t30);
    t37 = *((unsigned int *)t35);
    *((unsigned int *)t35) = (t37 | t31);
    xsi_driver_vfirst_trans(t25, 0, 0);
    t38 = (t0 + 3272);
    *((int *)t38) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t14 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB7;

LAB8:    t19 = ((char*)((ng5)));
    goto LAB9;

LAB10:    t24 = ((char*)((ng4)));
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 32, t19, 32, t24, 32);
    goto LAB16;

LAB14:    memcpy(t3, t19, 8);
    goto LAB16;

}


extern void work_m_00000000002634601336_1579609468_init()
{
	static char *pe[] = {(void *)Cont_207_0,(void *)Cont_211_1};
	xsi_register_didat("work_m_00000000002634601336_1579609468", "isim/mips_test_isim_beh.exe.sim/work/m_00000000002634601336_1579609468.didat");
	xsi_register_executes(pe);
}

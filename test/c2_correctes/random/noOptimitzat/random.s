.global _start
.bss
	var1:	.fill	1, 1, 0
	var2:	.fill	1, 1, 0
.data
.text
_start:
call	jada_init
/* trueConst = true */
movb	$1, var1
/* falseConst = false */
movb	$0, var2
/* goto e23 */
jmp	e23
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$696, %rsp
lea	-49(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-251(%rbp), %rax
movq	%rax, -218(%rbp)

lea	-457(%rbp), %rax
movq	%rax, -420(%rbp)

lea	-651(%rbp), %rax
movq	%rax, -640(%rbp)

/*  */
subq	$8, %rsp

/* t9 = 1 */
movl	$1, -53(%rbp)
/* t10 = 0 */
movl	$0, -57(%rbp)
/* t8[t10] = t9 */
movl	-53(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-57(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t11 = I */
movb	$73, -58(%rbp)
/* t12 = 4 */
movl	$4, -62(%rbp)
/* t8[t12] = t11 */
movb	-58(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-62(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t13 = n */
movb	$110, -63(%rbp)
/* t14 = 5 */
movl	$5, -67(%rbp)
/* t8[t14] = t13 */
movb	-63(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-67(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t15 = t */
movb	$116, -68(%rbp)
/* t16 = 6 */
movl	$6, -72(%rbp)
/* t8[t16] = t15 */
movb	-68(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-72(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t17 = r */
movb	$114, -73(%rbp)
/* t18 = 7 */
movl	$7, -77(%rbp)
/* t8[t18] = t17 */
movb	-73(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-77(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t19 = o */
movb	$111, -78(%rbp)
/* t20 = 8 */
movl	$8, -82(%rbp)
/* t8[t20] = t19 */
movb	-78(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-82(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t21 = d */
movb	$100, -83(%rbp)
/* t22 = 9 */
movl	$9, -87(%rbp)
/* t8[t22] = t21 */
movb	-83(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-87(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t23 = u */
movb	$117, -88(%rbp)
/* t24 = 10 */
movl	$10, -92(%rbp)
/* t8[t24] = t23 */
movb	-88(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-92(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t25 = e */
movb	$101, -93(%rbp)
/* t26 = 11 */
movl	$11, -97(%rbp)
/* t8[t26] = t25 */
movb	-93(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-97(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t27 = i */
movb	$105, -98(%rbp)
/* t28 = 12 */
movl	$12, -102(%rbp)
/* t8[t28] = t27 */
movb	-98(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-102(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t29 = x */
movb	$120, -103(%rbp)
/* t30 = 13 */
movl	$13, -107(%rbp)
/* t8[t30] = t29 */
movb	-103(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-107(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t31 =   */
movb	$32, -108(%rbp)
/* t32 = 14 */
movl	$14, -112(%rbp)
/* t8[t32] = t31 */
movb	-108(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-112(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t33 = e */
movb	$101, -113(%rbp)
/* t34 = 15 */
movl	$15, -117(%rbp)
/* t8[t34] = t33 */
movb	-113(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-117(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t35 = l */
movb	$108, -118(%rbp)
/* t36 = 16 */
movl	$16, -122(%rbp)
/* t8[t36] = t35 */
movb	-118(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-122(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t37 =   */
movb	$32, -123(%rbp)
/* t38 = 17 */
movl	$17, -127(%rbp)
/* t8[t38] = t37 */
movb	-123(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-127(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t39 = v */
movb	$118, -128(%rbp)
/* t40 = 18 */
movl	$18, -132(%rbp)
/* t8[t40] = t39 */
movb	-128(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-132(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t41 = a */
movb	$97, -133(%rbp)
/* t42 = 19 */
movl	$19, -137(%rbp)
/* t8[t42] = t41 */
movb	-133(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-137(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t43 = l */
movb	$108, -138(%rbp)
/* t44 = 20 */
movl	$20, -142(%rbp)
/* t8[t44] = t43 */
movb	-138(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-142(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t45 = o */
movb	$111, -143(%rbp)
/* t46 = 21 */
movl	$21, -147(%rbp)
/* t8[t46] = t45 */
movb	-143(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-147(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t47 = r */
movb	$114, -148(%rbp)
/* t48 = 22 */
movl	$22, -152(%rbp)
/* t8[t48] = t47 */
movb	-148(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-152(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t49 =   */
movb	$32, -153(%rbp)
/* t50 = 23 */
movl	$23, -157(%rbp)
/* t8[t50] = t49 */
movb	-153(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-157(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t51 = m */
movb	$109, -158(%rbp)
/* t52 = 24 */
movl	$24, -162(%rbp)
/* t8[t52] = t51 */
movb	-158(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-162(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t53 = � */
movb	$-61, -163(%rbp)
/* t54 = 25 */
movl	$25, -167(%rbp)
/* t8[t54] = t53 */
movb	-163(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-167(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t55 = � */
movb	$-83, -168(%rbp)
/* t56 = 26 */
movl	$26, -172(%rbp)
/* t8[t56] = t55 */
movb	-168(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-172(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 = n */
movb	$110, -173(%rbp)
/* t58 = 27 */
movl	$27, -177(%rbp)
/* t8[t58] = t57 */
movb	-173(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-177(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t59 = i */
movb	$105, -178(%rbp)
/* t60 = 28 */
movl	$28, -182(%rbp)
/* t8[t60] = t59 */
movb	-178(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-182(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t61 = m */
movb	$109, -183(%rbp)
/* t62 = 29 */
movl	$29, -187(%rbp)
/* t8[t62] = t61 */
movb	-183(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-187(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t63 = : */
movb	$58, -188(%rbp)
/* t64 = 30 */
movl	$30, -192(%rbp)
/* t8[t64] = t63 */
movb	-188(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-192(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t65 =   */
movb	$32, -193(%rbp)
/* t66 = 31 */
movl	$31, -197(%rbp)
/* t8[t66] = t65 */
movb	-193(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-197(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t67 =   */
movb	$0, -198(%rbp)
/* t68 = 32 */
movl	$32, -202(%rbp)
/* t8[t68] = t67 */
movb	-198(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-202(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t8 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t8 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t8 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e11: skip */
e11:
/*  */
subq	$8, %rsp

/* t69 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -206(%rbp)
addq	$8, %rsp
/* minim = t69 */
movl	-206(%rbp), %eax
movl	%eax, -210(%rbp)

/* e12: skip */
e12:
/*  */
subq	$8, %rsp

/* t72 = 1 */
movl	$1, -255(%rbp)
/* t73 = 0 */
movl	$0, -259(%rbp)
/* t71[t73] = t72 */
movl	-255(%rbp), %ecx
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-259(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t74 = I */
movb	$73, -260(%rbp)
/* t75 = 4 */
movl	$4, -264(%rbp)
/* t71[t75] = t74 */
movb	-260(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-264(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t76 = n */
movb	$110, -265(%rbp)
/* t77 = 5 */
movl	$5, -269(%rbp)
/* t71[t77] = t76 */
movb	-265(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-269(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t78 = t */
movb	$116, -270(%rbp)
/* t79 = 6 */
movl	$6, -274(%rbp)
/* t71[t79] = t78 */
movb	-270(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-274(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t80 = r */
movb	$114, -275(%rbp)
/* t81 = 7 */
movl	$7, -279(%rbp)
/* t71[t81] = t80 */
movb	-275(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-279(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t82 = o */
movb	$111, -280(%rbp)
/* t83 = 8 */
movl	$8, -284(%rbp)
/* t71[t83] = t82 */
movb	-280(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-284(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t84 = d */
movb	$100, -285(%rbp)
/* t85 = 9 */
movl	$9, -289(%rbp)
/* t71[t85] = t84 */
movb	-285(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-289(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t86 = u */
movb	$117, -290(%rbp)
/* t87 = 10 */
movl	$10, -294(%rbp)
/* t71[t87] = t86 */
movb	-290(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-294(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t88 = e */
movb	$101, -295(%rbp)
/* t89 = 11 */
movl	$11, -299(%rbp)
/* t71[t89] = t88 */
movb	-295(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-299(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t90 = i */
movb	$105, -300(%rbp)
/* t91 = 12 */
movl	$12, -304(%rbp)
/* t71[t91] = t90 */
movb	-300(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-304(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t92 = x */
movb	$120, -305(%rbp)
/* t93 = 13 */
movl	$13, -309(%rbp)
/* t71[t93] = t92 */
movb	-305(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-309(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t94 =   */
movb	$32, -310(%rbp)
/* t95 = 14 */
movl	$14, -314(%rbp)
/* t71[t95] = t94 */
movb	-310(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-314(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t96 = e */
movb	$101, -315(%rbp)
/* t97 = 15 */
movl	$15, -319(%rbp)
/* t71[t97] = t96 */
movb	-315(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-319(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t98 = l */
movb	$108, -320(%rbp)
/* t99 = 16 */
movl	$16, -324(%rbp)
/* t71[t99] = t98 */
movb	-320(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-324(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t100 =   */
movb	$32, -325(%rbp)
/* t101 = 17 */
movl	$17, -329(%rbp)
/* t71[t101] = t100 */
movb	-325(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-329(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t102 = v */
movb	$118, -330(%rbp)
/* t103 = 18 */
movl	$18, -334(%rbp)
/* t71[t103] = t102 */
movb	-330(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-334(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t104 = a */
movb	$97, -335(%rbp)
/* t105 = 19 */
movl	$19, -339(%rbp)
/* t71[t105] = t104 */
movb	-335(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-339(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t106 = l */
movb	$108, -340(%rbp)
/* t107 = 20 */
movl	$20, -344(%rbp)
/* t71[t107] = t106 */
movb	-340(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-344(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t108 = o */
movb	$111, -345(%rbp)
/* t109 = 21 */
movl	$21, -349(%rbp)
/* t71[t109] = t108 */
movb	-345(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-349(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t110 = r */
movb	$114, -350(%rbp)
/* t111 = 22 */
movl	$22, -354(%rbp)
/* t71[t111] = t110 */
movb	-350(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-354(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t112 =   */
movb	$32, -355(%rbp)
/* t113 = 23 */
movl	$23, -359(%rbp)
/* t71[t113] = t112 */
movb	-355(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-359(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t114 = m */
movb	$109, -360(%rbp)
/* t115 = 24 */
movl	$24, -364(%rbp)
/* t71[t115] = t114 */
movb	-360(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-364(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t116 = � */
movb	$-61, -365(%rbp)
/* t117 = 25 */
movl	$25, -369(%rbp)
/* t71[t117] = t116 */
movb	-365(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-369(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t118 = � */
movb	$-96, -370(%rbp)
/* t119 = 26 */
movl	$26, -374(%rbp)
/* t71[t119] = t118 */
movb	-370(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-374(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t120 = x */
movb	$120, -375(%rbp)
/* t121 = 27 */
movl	$27, -379(%rbp)
/* t71[t121] = t120 */
movb	-375(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-379(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t122 = i */
movb	$105, -380(%rbp)
/* t123 = 28 */
movl	$28, -384(%rbp)
/* t71[t123] = t122 */
movb	-380(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-384(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t124 = m */
movb	$109, -385(%rbp)
/* t125 = 29 */
movl	$29, -389(%rbp)
/* t71[t125] = t124 */
movb	-385(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-389(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t126 = : */
movb	$58, -390(%rbp)
/* t127 = 30 */
movl	$30, -394(%rbp)
/* t71[t127] = t126 */
movb	-390(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-394(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t128 =   */
movb	$32, -395(%rbp)
/* t129 = 31 */
movl	$31, -399(%rbp)
/* t71[t129] = t128 */
movb	-395(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-399(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t130 =   */
movb	$0, -400(%rbp)
/* t131 = 32 */
movl	$32, -404(%rbp)
/* t71[t131] = t130 */
movb	-400(%rbp), %cl
movq	-218(%rbp), %rax
movq	$0, %rbx
movl	-404(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t71 */
movq	-218(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t71 */
movq	-218(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t71 */
movq	-218(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e13: skip */
e13:
/*  */
subq	$8, %rsp

/* t132 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -408(%rbp)
addq	$8, %rsp
/* maxim = t132 */
movl	-408(%rbp), %eax
movl	%eax, -412(%rbp)

/* e14: skip */
e14:
/*  */
subq	$8, %rsp

/* t135 = 1 */
movl	$1, -461(%rbp)
/* t136 = 0 */
movl	$0, -465(%rbp)
/* t134[t136] = t135 */
movl	-461(%rbp), %ecx
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-465(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t137 = U */
movb	$85, -466(%rbp)
/* t138 = 4 */
movl	$4, -470(%rbp)
/* t134[t138] = t137 */
movb	-466(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-470(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t139 = n */
movb	$110, -471(%rbp)
/* t140 = 5 */
movl	$5, -475(%rbp)
/* t134[t140] = t139 */
movb	-471(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-475(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t141 =   */
movb	$32, -476(%rbp)
/* t142 = 6 */
movl	$6, -480(%rbp)
/* t134[t142] = t141 */
movb	-476(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-480(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t143 = v */
movb	$118, -481(%rbp)
/* t144 = 7 */
movl	$7, -485(%rbp)
/* t134[t144] = t143 */
movb	-481(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-485(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t145 = a */
movb	$97, -486(%rbp)
/* t146 = 8 */
movl	$8, -490(%rbp)
/* t134[t146] = t145 */
movb	-486(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-490(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t147 = l */
movb	$108, -491(%rbp)
/* t148 = 9 */
movl	$9, -495(%rbp)
/* t134[t148] = t147 */
movb	-491(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-495(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t149 = o */
movb	$111, -496(%rbp)
/* t150 = 10 */
movl	$10, -500(%rbp)
/* t134[t150] = t149 */
movb	-496(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-500(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t151 = r */
movb	$114, -501(%rbp)
/* t152 = 11 */
movl	$11, -505(%rbp)
/* t134[t152] = t151 */
movb	-501(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-505(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t153 =   */
movb	$32, -506(%rbp)
/* t154 = 12 */
movl	$12, -510(%rbp)
/* t134[t154] = t153 */
movb	-506(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-510(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t155 = a */
movb	$97, -511(%rbp)
/* t156 = 13 */
movl	$13, -515(%rbp)
/* t134[t156] = t155 */
movb	-511(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-515(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t157 = l */
movb	$108, -516(%rbp)
/* t158 = 14 */
movl	$14, -520(%rbp)
/* t134[t158] = t157 */
movb	-516(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-520(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t159 = e */
movb	$101, -521(%rbp)
/* t160 = 15 */
movl	$15, -525(%rbp)
/* t134[t160] = t159 */
movb	-521(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-525(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t161 = a */
movb	$97, -526(%rbp)
/* t162 = 16 */
movl	$16, -530(%rbp)
/* t134[t162] = t161 */
movb	-526(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-530(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t163 = t */
movb	$116, -531(%rbp)
/* t164 = 17 */
movl	$17, -535(%rbp)
/* t134[t164] = t163 */
movb	-531(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-535(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t165 = o */
movb	$111, -536(%rbp)
/* t166 = 18 */
movl	$18, -540(%rbp)
/* t134[t166] = t165 */
movb	-536(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-540(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t167 = r */
movb	$114, -541(%rbp)
/* t168 = 19 */
movl	$19, -545(%rbp)
/* t134[t168] = t167 */
movb	-541(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-545(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t169 = i */
movb	$105, -546(%rbp)
/* t170 = 20 */
movl	$20, -550(%rbp)
/* t134[t170] = t169 */
movb	-546(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-550(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t171 =   */
movb	$32, -551(%rbp)
/* t172 = 21 */
movl	$21, -555(%rbp)
/* t134[t172] = t171 */
movb	-551(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-555(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t173 = a */
movb	$97, -556(%rbp)
/* t174 = 22 */
movl	$22, -560(%rbp)
/* t134[t174] = t173 */
movb	-556(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-560(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t175 =   */
movb	$32, -561(%rbp)
/* t176 = 23 */
movl	$23, -565(%rbp)
/* t134[t176] = t175 */
movb	-561(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-565(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t177 = l */
movb	$108, -566(%rbp)
/* t178 = 24 */
movl	$24, -570(%rbp)
/* t134[t178] = t177 */
movb	-566(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-570(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t179 = ' */
movb	$39, -571(%rbp)
/* t180 = 25 */
movl	$25, -575(%rbp)
/* t134[t180] = t179 */
movb	-571(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-575(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t181 = i */
movb	$105, -576(%rbp)
/* t182 = 26 */
movl	$26, -580(%rbp)
/* t134[t182] = t181 */
movb	-576(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-580(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t183 = n */
movb	$110, -581(%rbp)
/* t184 = 27 */
movl	$27, -585(%rbp)
/* t134[t184] = t183 */
movb	-581(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-585(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t185 = t */
movb	$116, -586(%rbp)
/* t186 = 28 */
movl	$28, -590(%rbp)
/* t134[t186] = t185 */
movb	-586(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-590(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t187 = e */
movb	$101, -591(%rbp)
/* t188 = 29 */
movl	$29, -595(%rbp)
/* t134[t188] = t187 */
movb	-591(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-595(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t189 = r */
movb	$114, -596(%rbp)
/* t190 = 30 */
movl	$30, -600(%rbp)
/* t134[t190] = t189 */
movb	-596(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-600(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t191 = v */
movb	$118, -601(%rbp)
/* t192 = 31 */
movl	$31, -605(%rbp)
/* t134[t192] = t191 */
movb	-601(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-605(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t193 = a */
movb	$97, -606(%rbp)
/* t194 = 32 */
movl	$32, -610(%rbp)
/* t134[t194] = t193 */
movb	-606(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-610(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t195 = l */
movb	$108, -611(%rbp)
/* t196 = 33 */
movl	$33, -615(%rbp)
/* t134[t196] = t195 */
movb	-611(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-615(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t197 =   */
movb	$32, -616(%rbp)
/* t198 = 34 */
movl	$34, -620(%rbp)
/* t134[t198] = t197 */
movb	-616(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-620(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t199 = [ */
movb	$91, -621(%rbp)
/* t200 = 35 */
movl	$35, -625(%rbp)
/* t134[t200] = t199 */
movb	-621(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-625(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t201 =   */
movb	$0, -626(%rbp)
/* t202 = 36 */
movl	$36, -630(%rbp)
/* t134[t202] = t201 */
movb	-626(%rbp), %cl
movq	-420(%rbp), %rax
movq	$0, %rbx
movl	-630(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t134 */
movq	-420(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t134 */
movq	-420(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t134 */
movq	-420(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e15: skip */
e15:
/*  */
subq	$8, %rsp

/* put param minim */
movl	-210(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e16: skip */
e16:
/*  */
subq	$8, %rsp

/* t203 = , */
movb	$44, -631(%rbp)
/* put param t203 */
movb	-631(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e17: skip */
e17:
/*  */
subq	$8, %rsp

/* t204 =   */
movb	$32, -632(%rbp)
/* put param t204 */
movb	-632(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e18: skip */
e18:
/*  */
subq	$8, %rsp

/* put param maxim */
movl	-412(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e19: skip */
e19:
/*  */
subq	$8, %rsp

/* t206 = 1 */
movl	$1, -655(%rbp)
/* t207 = 0 */
movl	$0, -659(%rbp)
/* t205[t207] = t206 */
movl	-655(%rbp), %ecx
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-659(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t208 = ] */
movb	$93, -660(%rbp)
/* t209 = 4 */
movl	$4, -664(%rbp)
/* t205[t209] = t208 */
movb	-660(%rbp), %cl
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-664(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t210 =   */
movb	$32, -665(%rbp)
/* t211 = 5 */
movl	$5, -669(%rbp)
/* t205[t211] = t210 */
movb	-665(%rbp), %cl
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-669(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t212 = � */
movb	$-61, -670(%rbp)
/* t213 = 6 */
movl	$6, -674(%rbp)
/* t205[t213] = t212 */
movb	-670(%rbp), %cl
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-674(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t214 = � */
movb	$-87, -675(%rbp)
/* t215 = 7 */
movl	$7, -679(%rbp)
/* t205[t215] = t214 */
movb	-675(%rbp), %cl
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-679(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t216 = s */
movb	$115, -680(%rbp)
/* t217 = 8 */
movl	$8, -684(%rbp)
/* t205[t217] = t216 */
movb	-680(%rbp), %cl
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-684(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t218 =   */
movb	$32, -685(%rbp)
/* t219 = 9 */
movl	$9, -689(%rbp)
/* t205[t219] = t218 */
movb	-685(%rbp), %cl
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-689(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t220 =   */
movb	$0, -690(%rbp)
/* t221 = 10 */
movl	$10, -694(%rbp)
/* t205[t221] = t220 */
movb	-690(%rbp), %cl
movq	-640(%rbp), %rax
movq	$0, %rbx
movl	-694(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t205 */
movq	-640(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t205 */
movq	-640(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t205 */
movq	-640(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param minim */
movl	-210(%rbp), %eax
movl	%eax, 0(%rsp)
/* put param maxim */
movl	-412(%rbp), %eax
movl	%eax, 4(%rsp)
/* t222 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -698(%rbp)
addq	$16, %rsp
/* put param t222 */
movl	-698(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* t223 = 
 */
movb	$10, -699(%rbp)
/* put param t223 */
movb	-699(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e22: skip */
e22:
/* return */
addq	$696, %rsp
pop	%rbp
ret
/* e23: skip */
e23:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

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
/* goto e30 */
jmp	e30
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$856, %rsp
lea	-51(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-265(%rbp), %rax
movq	%rax, -230(%rbp)

lea	-463(%rbp), %rax
movq	%rax, -456(%rbp)

lea	-513(%rbp), %rax
movq	%rax, -506(%rbp)

lea	-583(%rbp), %rax
movq	%rax, -544(%rbp)

lea	-782(%rbp), %rax
movq	%rax, -774(%rbp)

lea	-826(%rbp), %rax
movq	%rax, -818(%rbp)

/*  */
subq	$8, %rsp

/* t9 = 1 */
movl	$1, -55(%rbp)
/* t10 = 0 */
movl	$0, -59(%rbp)
/* t8[t10] = t9 */
movl	-55(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-59(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t11 = I */
movb	$73, -60(%rbp)
/* t12 = 4 */
movl	$4, -64(%rbp)
/* t8[t12] = t11 */
movb	-60(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t13 = n */
movb	$110, -65(%rbp)
/* t14 = 5 */
movl	$5, -69(%rbp)
/* t8[t14] = t13 */
movb	-65(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-69(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t15 = t */
movb	$116, -70(%rbp)
/* t16 = 6 */
movl	$6, -74(%rbp)
/* t8[t16] = t15 */
movb	-70(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-74(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t17 = r */
movb	$114, -75(%rbp)
/* t18 = 7 */
movl	$7, -79(%rbp)
/* t8[t18] = t17 */
movb	-75(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-79(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t19 = o */
movb	$111, -80(%rbp)
/* t20 = 8 */
movl	$8, -84(%rbp)
/* t8[t20] = t19 */
movb	-80(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-84(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t21 = d */
movb	$100, -85(%rbp)
/* t22 = 9 */
movl	$9, -89(%rbp)
/* t8[t22] = t21 */
movb	-85(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-89(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t23 = u */
movb	$117, -90(%rbp)
/* t24 = 10 */
movl	$10, -94(%rbp)
/* t8[t24] = t23 */
movb	-90(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-94(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t25 = e */
movb	$101, -95(%rbp)
/* t26 = 11 */
movl	$11, -99(%rbp)
/* t8[t26] = t25 */
movb	-95(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-99(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t27 = i */
movb	$105, -100(%rbp)
/* t28 = 12 */
movl	$12, -104(%rbp)
/* t8[t28] = t27 */
movb	-100(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-104(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t29 = x */
movb	$120, -105(%rbp)
/* t30 = 13 */
movl	$13, -109(%rbp)
/* t8[t30] = t29 */
movb	-105(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-109(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t31 =   */
movb	$32, -110(%rbp)
/* t32 = 14 */
movl	$14, -114(%rbp)
/* t8[t32] = t31 */
movb	-110(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-114(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t33 = u */
movb	$117, -115(%rbp)
/* t34 = 15 */
movl	$15, -119(%rbp)
/* t8[t34] = t33 */
movb	-115(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-119(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t35 = n */
movb	$110, -120(%rbp)
/* t36 = 16 */
movl	$16, -124(%rbp)
/* t8[t36] = t35 */
movb	-120(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-124(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t37 =   */
movb	$32, -125(%rbp)
/* t38 = 17 */
movl	$17, -129(%rbp)
/* t8[t38] = t37 */
movb	-125(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-129(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t39 = v */
movb	$118, -130(%rbp)
/* t40 = 18 */
movl	$18, -134(%rbp)
/* t8[t40] = t39 */
movb	-130(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-134(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t41 = a */
movb	$97, -135(%rbp)
/* t42 = 19 */
movl	$19, -139(%rbp)
/* t8[t42] = t41 */
movb	-135(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-139(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t43 = l */
movb	$108, -140(%rbp)
/* t44 = 20 */
movl	$20, -144(%rbp)
/* t8[t44] = t43 */
movb	-140(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-144(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t45 = o */
movb	$111, -145(%rbp)
/* t46 = 21 */
movl	$21, -149(%rbp)
/* t8[t46] = t45 */
movb	-145(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-149(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t47 = r */
movb	$114, -150(%rbp)
/* t48 = 22 */
movl	$22, -154(%rbp)
/* t8[t48] = t47 */
movb	-150(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-154(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t49 =   */
movb	$32, -155(%rbp)
/* t50 = 23 */
movl	$23, -159(%rbp)
/* t8[t50] = t49 */
movb	-155(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-159(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t51 = n */
movb	$110, -160(%rbp)
/* t52 = 24 */
movl	$24, -164(%rbp)
/* t8[t52] = t51 */
movb	-160(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-164(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t53 = u */
movb	$117, -165(%rbp)
/* t54 = 25 */
movl	$25, -169(%rbp)
/* t8[t54] = t53 */
movb	-165(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-169(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t55 = m */
movb	$109, -170(%rbp)
/* t56 = 26 */
movl	$26, -174(%rbp)
/* t8[t56] = t55 */
movb	-170(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-174(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 = � */
movb	$-61, -175(%rbp)
/* t58 = 27 */
movl	$27, -179(%rbp)
/* t8[t58] = t57 */
movb	-175(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-179(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t59 = � */
movb	$-88, -180(%rbp)
/* t60 = 28 */
movl	$28, -184(%rbp)
/* t8[t60] = t59 */
movb	-180(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-184(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t61 = r */
movb	$114, -185(%rbp)
/* t62 = 29 */
movl	$29, -189(%rbp)
/* t8[t62] = t61 */
movb	-185(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-189(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t63 = i */
movb	$105, -190(%rbp)
/* t64 = 30 */
movl	$30, -194(%rbp)
/* t8[t64] = t63 */
movb	-190(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-194(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t65 = c */
movb	$99, -195(%rbp)
/* t66 = 31 */
movl	$31, -199(%rbp)
/* t8[t66] = t65 */
movb	-195(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-199(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t67 = : */
movb	$58, -200(%rbp)
/* t68 = 32 */
movl	$32, -204(%rbp)
/* t8[t68] = t67 */
movb	-200(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-204(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t69 =   */
movb	$32, -205(%rbp)
/* t70 = 33 */
movl	$33, -209(%rbp)
/* t8[t70] = t69 */
movb	-205(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-209(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t71 =   */
movb	$0, -210(%rbp)
/* t72 = 34 */
movl	$34, -214(%rbp)
/* t8[t72] = t71 */
movb	-210(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-214(%rbp), %ebx
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

/* t73 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -218(%rbp)
addq	$8, %rsp
/* a = t73 */
movl	-218(%rbp), %eax
movl	%eax, -222(%rbp)

/* e12: skip */
e12:
/*  */
subq	$8, %rsp

/* t76 = 1 */
movl	$1, -269(%rbp)
/* t77 = 0 */
movl	$0, -273(%rbp)
/* t75[t77] = t76 */
movl	-269(%rbp), %ecx
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-273(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t78 = I */
movb	$73, -274(%rbp)
/* t79 = 4 */
movl	$4, -278(%rbp)
/* t75[t79] = t78 */
movb	-274(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-278(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t80 = n */
movb	$110, -279(%rbp)
/* t81 = 5 */
movl	$5, -283(%rbp)
/* t75[t81] = t80 */
movb	-279(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-283(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t82 = t */
movb	$116, -284(%rbp)
/* t83 = 6 */
movl	$6, -288(%rbp)
/* t75[t83] = t82 */
movb	-284(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-288(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t84 = r */
movb	$114, -289(%rbp)
/* t85 = 7 */
movl	$7, -293(%rbp)
/* t75[t85] = t84 */
movb	-289(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-293(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t86 = o */
movb	$111, -294(%rbp)
/* t87 = 8 */
movl	$8, -298(%rbp)
/* t75[t87] = t86 */
movb	-294(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-298(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t88 = d */
movb	$100, -299(%rbp)
/* t89 = 9 */
movl	$9, -303(%rbp)
/* t75[t89] = t88 */
movb	-299(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-303(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t90 = u */
movb	$117, -304(%rbp)
/* t91 = 10 */
movl	$10, -308(%rbp)
/* t75[t91] = t90 */
movb	-304(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-308(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t92 = e */
movb	$101, -309(%rbp)
/* t93 = 11 */
movl	$11, -313(%rbp)
/* t75[t93] = t92 */
movb	-309(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-313(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t94 = i */
movb	$105, -314(%rbp)
/* t95 = 12 */
movl	$12, -318(%rbp)
/* t75[t95] = t94 */
movb	-314(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-318(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t96 = x */
movb	$120, -319(%rbp)
/* t97 = 13 */
movl	$13, -323(%rbp)
/* t75[t97] = t96 */
movb	-319(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-323(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t98 =   */
movb	$32, -324(%rbp)
/* t99 = 14 */
movl	$14, -328(%rbp)
/* t75[t99] = t98 */
movb	-324(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-328(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t100 = u */
movb	$117, -329(%rbp)
/* t101 = 15 */
movl	$15, -333(%rbp)
/* t75[t101] = t100 */
movb	-329(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-333(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t102 = n */
movb	$110, -334(%rbp)
/* t103 = 16 */
movl	$16, -338(%rbp)
/* t75[t103] = t102 */
movb	-334(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-338(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t104 =   */
movb	$32, -339(%rbp)
/* t105 = 17 */
movl	$17, -343(%rbp)
/* t75[t105] = t104 */
movb	-339(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-343(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t106 = v */
movb	$118, -344(%rbp)
/* t107 = 18 */
movl	$18, -348(%rbp)
/* t75[t107] = t106 */
movb	-344(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-348(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t108 = a */
movb	$97, -349(%rbp)
/* t109 = 19 */
movl	$19, -353(%rbp)
/* t75[t109] = t108 */
movb	-349(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-353(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t110 = l */
movb	$108, -354(%rbp)
/* t111 = 20 */
movl	$20, -358(%rbp)
/* t75[t111] = t110 */
movb	-354(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-358(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t112 = o */
movb	$111, -359(%rbp)
/* t113 = 21 */
movl	$21, -363(%rbp)
/* t75[t113] = t112 */
movb	-359(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-363(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t114 = r */
movb	$114, -364(%rbp)
/* t115 = 22 */
movl	$22, -368(%rbp)
/* t75[t115] = t114 */
movb	-364(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-368(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t116 =   */
movb	$32, -369(%rbp)
/* t117 = 23 */
movl	$23, -373(%rbp)
/* t75[t117] = t116 */
movb	-369(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-373(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t118 = n */
movb	$110, -374(%rbp)
/* t119 = 24 */
movl	$24, -378(%rbp)
/* t75[t119] = t118 */
movb	-374(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-378(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t120 = u */
movb	$117, -379(%rbp)
/* t121 = 25 */
movl	$25, -383(%rbp)
/* t75[t121] = t120 */
movb	-379(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-383(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t122 = m */
movb	$109, -384(%rbp)
/* t123 = 26 */
movl	$26, -388(%rbp)
/* t75[t123] = t122 */
movb	-384(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-388(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t124 = � */
movb	$-61, -389(%rbp)
/* t125 = 27 */
movl	$27, -393(%rbp)
/* t75[t125] = t124 */
movb	-389(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-393(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t126 = � */
movb	$-88, -394(%rbp)
/* t127 = 28 */
movl	$28, -398(%rbp)
/* t75[t127] = t126 */
movb	-394(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-398(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t128 = r */
movb	$114, -399(%rbp)
/* t129 = 29 */
movl	$29, -403(%rbp)
/* t75[t129] = t128 */
movb	-399(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-403(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t130 = i */
movb	$105, -404(%rbp)
/* t131 = 30 */
movl	$30, -408(%rbp)
/* t75[t131] = t130 */
movb	-404(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-408(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t132 = c */
movb	$99, -409(%rbp)
/* t133 = 31 */
movl	$31, -413(%rbp)
/* t75[t133] = t132 */
movb	-409(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-413(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t134 = : */
movb	$58, -414(%rbp)
/* t135 = 32 */
movl	$32, -418(%rbp)
/* t75[t135] = t134 */
movb	-414(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-418(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t136 =   */
movb	$32, -419(%rbp)
/* t137 = 33 */
movl	$33, -423(%rbp)
/* t75[t137] = t136 */
movb	-419(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-423(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t138 =   */
movb	$0, -424(%rbp)
/* t139 = 34 */
movl	$34, -428(%rbp)
/* t75[t139] = t138 */
movb	-424(%rbp), %cl
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	-428(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t75 */
movq	-230(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t75 */
movq	-230(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t75 */
movq	-230(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e13: skip */
e13:
/*  */
subq	$8, %rsp

/* t140 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -432(%rbp)
addq	$8, %rsp
/* b = t140 */
movl	-432(%rbp), %eax
movl	%eax, -436(%rbp)

/* e14: skip */
e14:
/* t142 = 0 */
movl	$0, -440(%rbp)
/* if b != t142 then goto e15 */
movl	-436(%rbp), %eax
movl	-440(%rbp), %edx
cmpl	%eax, %edx
jne	e15
/* goto e18 */
jmp	e18
/* e15: skip */
e15:
/* t143 = a / b */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-436(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-222(%rbp), %eax
cdqe
idiv	%r8
movl	%eax, -444(%rbp)

/* t144 = 0 */
movl	$0, -448(%rbp)
/* if t143 > t144 then goto e16 */
movl	-444(%rbp), %eax
movl	-448(%rbp), %edx
cmpl	%eax, %edx
jl	e16
/* goto e18 */
jmp	e18
/* e16: skip */
e16:
/*  */
subq	$8, %rsp

/* t146 = 1 */
movl	$1, -467(%rbp)
/* t147 = 0 */
movl	$0, -471(%rbp)
/* t145[t147] = t146 */
movl	-467(%rbp), %ecx
movq	-456(%rbp), %rax
movq	$0, %rbx
movl	-471(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t148 = A */
movb	$65, -472(%rbp)
/* t149 = 4 */
movl	$4, -476(%rbp)
/* t145[t149] = t148 */
movb	-472(%rbp), %cl
movq	-456(%rbp), %rax
movq	$0, %rbx
movl	-476(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t150 = 
 */
movb	$10, -477(%rbp)
/* t151 = 5 */
movl	$5, -481(%rbp)
/* t145[t151] = t150 */
movb	-477(%rbp), %cl
movq	-456(%rbp), %rax
movq	$0, %rbx
movl	-481(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t152 =   */
movb	$0, -482(%rbp)
/* t153 = 6 */
movl	$6, -486(%rbp)
/* t145[t153] = t152 */
movb	-482(%rbp), %cl
movq	-456(%rbp), %rax
movq	$0, %rbx
movl	-486(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t145 */
movq	-456(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t145 */
movq	-456(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t145 */
movq	-456(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e17: skip */
e17:
/* goto e22 */
jmp	e22
/* e18: skip */
e18:
/* t154 = 0 */
movl	$0, -490(%rbp)
/* if b == t154 then goto e20 */
movl	-436(%rbp), %eax
movl	-490(%rbp), %edx
cmpl	%eax, %edx
je	e20
/* goto e19 */
jmp	e19
/* e19: skip */
e19:
/* t155 = a / b */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-436(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-222(%rbp), %eax
cdqe
idiv	%r8
movl	%eax, -494(%rbp)

/* t156 = 0 */
movl	$0, -498(%rbp)
/* if t155 < t156 then goto e20 */
movl	-494(%rbp), %eax
movl	-498(%rbp), %edx
cmpl	%eax, %edx
jg	e20
/* goto e22 */
jmp	e22
/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* t158 = 1 */
movl	$1, -517(%rbp)
/* t159 = 0 */
movl	$0, -521(%rbp)
/* t157[t159] = t158 */
movl	-517(%rbp), %ecx
movq	-506(%rbp), %rax
movq	$0, %rbx
movl	-521(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t160 = B */
movb	$66, -522(%rbp)
/* t161 = 4 */
movl	$4, -526(%rbp)
/* t157[t161] = t160 */
movb	-522(%rbp), %cl
movq	-506(%rbp), %rax
movq	$0, %rbx
movl	-526(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t162 = 
 */
movb	$10, -527(%rbp)
/* t163 = 5 */
movl	$5, -531(%rbp)
/* t157[t163] = t162 */
movb	-527(%rbp), %cl
movq	-506(%rbp), %rax
movq	$0, %rbx
movl	-531(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t164 =   */
movb	$0, -532(%rbp)
/* t165 = 6 */
movl	$6, -536(%rbp)
/* t157[t165] = t164 */
movb	-532(%rbp), %cl
movq	-506(%rbp), %rax
movq	$0, %rbx
movl	-536(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t157 */
movq	-506(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t157 */
movq	-506(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t157 */
movq	-506(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e21: skip */
e21:
/* goto e22 */
jmp	e22
/* e22: skip */
e22:
/*  */
subq	$8, %rsp

/* t167 = 1 */
movl	$1, -587(%rbp)
/* t168 = 0 */
movl	$0, -591(%rbp)
/* t166[t168] = t167 */
movl	-587(%rbp), %ecx
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-591(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t169 = P */
movb	$80, -592(%rbp)
/* t170 = 4 */
movl	$4, -596(%rbp)
/* t166[t170] = t169 */
movb	-592(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-596(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t171 = o */
movb	$111, -597(%rbp)
/* t172 = 5 */
movl	$5, -601(%rbp)
/* t166[t172] = t171 */
movb	-597(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-601(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t173 = t */
movb	$116, -602(%rbp)
/* t174 = 6 */
movl	$6, -606(%rbp)
/* t166[t174] = t173 */
movb	-602(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-606(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t175 = e */
movb	$101, -607(%rbp)
/* t176 = 7 */
movl	$7, -611(%rbp)
/* t166[t176] = t175 */
movb	-607(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-611(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t177 = n */
movb	$110, -612(%rbp)
/* t178 = 8 */
movl	$8, -616(%rbp)
/* t166[t178] = t177 */
movb	-612(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-616(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t179 = c */
movb	$99, -617(%rbp)
/* t180 = 9 */
movl	$9, -621(%rbp)
/* t166[t180] = t179 */
movb	-617(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-621(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t181 = i */
movb	$105, -622(%rbp)
/* t182 = 10 */
movl	$10, -626(%rbp)
/* t166[t182] = t181 */
movb	-622(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-626(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t183 = a */
movb	$97, -627(%rbp)
/* t184 = 11 */
movl	$11, -631(%rbp)
/* t166[t184] = t183 */
movb	-627(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-631(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t185 = l */
movb	$108, -632(%rbp)
/* t186 = 12 */
movl	$12, -636(%rbp)
/* t166[t186] = t185 */
movb	-632(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-636(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t187 =   */
movb	$32, -637(%rbp)
/* t188 = 13 */
movl	$13, -641(%rbp)
/* t166[t188] = t187 */
movb	-637(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-641(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t189 = e */
movb	$101, -642(%rbp)
/* t190 = 14 */
movl	$14, -646(%rbp)
/* t166[t190] = t189 */
movb	-642(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-646(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t191 = x */
movb	$120, -647(%rbp)
/* t192 = 15 */
movl	$15, -651(%rbp)
/* t166[t192] = t191 */
movb	-647(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-651(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t193 = c */
movb	$99, -652(%rbp)
/* t194 = 16 */
movl	$16, -656(%rbp)
/* t166[t194] = t193 */
movb	-652(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-656(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t195 = e */
movb	$101, -657(%rbp)
/* t196 = 17 */
movl	$17, -661(%rbp)
/* t166[t196] = t195 */
movb	-657(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-661(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t197 = p */
movb	$112, -662(%rbp)
/* t198 = 18 */
movl	$18, -666(%rbp)
/* t166[t198] = t197 */
movb	-662(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-666(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t199 = c */
movb	$99, -667(%rbp)
/* t200 = 19 */
movl	$19, -671(%rbp)
/* t166[t200] = t199 */
movb	-667(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-671(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t201 = i */
movb	$105, -672(%rbp)
/* t202 = 20 */
movl	$20, -676(%rbp)
/* t166[t202] = t201 */
movb	-672(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-676(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t203 = � */
movb	$-61, -677(%rbp)
/* t204 = 21 */
movl	$21, -681(%rbp)
/* t166[t204] = t203 */
movb	-677(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-681(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t205 = � */
movb	$-77, -682(%rbp)
/* t206 = 22 */
movl	$22, -686(%rbp)
/* t166[t206] = t205 */
movb	-682(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-686(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t207 =   */
movb	$32, -687(%rbp)
/* t208 = 23 */
movl	$23, -691(%rbp)
/* t166[t208] = t207 */
movb	-687(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-691(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t209 = n */
movb	$110, -692(%rbp)
/* t210 = 24 */
movl	$24, -696(%rbp)
/* t166[t210] = t209 */
movb	-692(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-696(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t211 = o */
movb	$111, -697(%rbp)
/* t212 = 25 */
movl	$25, -701(%rbp)
/* t166[t212] = t211 */
movb	-697(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-701(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t213 =   */
movb	$32, -702(%rbp)
/* t214 = 26 */
movl	$26, -706(%rbp)
/* t166[t214] = t213 */
movb	-702(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-706(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t215 = c */
movb	$99, -707(%rbp)
/* t216 = 27 */
movl	$27, -711(%rbp)
/* t166[t216] = t215 */
movb	-707(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-711(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t217 = o */
movb	$111, -712(%rbp)
/* t218 = 28 */
movl	$28, -716(%rbp)
/* t166[t218] = t217 */
movb	-712(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-716(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t219 = n */
movb	$110, -717(%rbp)
/* t220 = 29 */
movl	$29, -721(%rbp)
/* t166[t220] = t219 */
movb	-717(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-721(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t221 = t */
movb	$116, -722(%rbp)
/* t222 = 30 */
movl	$30, -726(%rbp)
/* t166[t222] = t221 */
movb	-722(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-726(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t223 = r */
movb	$114, -727(%rbp)
/* t224 = 31 */
movl	$31, -731(%rbp)
/* t166[t224] = t223 */
movb	-727(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-731(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t225 = o */
movb	$111, -732(%rbp)
/* t226 = 32 */
movl	$32, -736(%rbp)
/* t166[t226] = t225 */
movb	-732(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-736(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t227 = l */
movb	$108, -737(%rbp)
/* t228 = 33 */
movl	$33, -741(%rbp)
/* t166[t228] = t227 */
movb	-737(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-741(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t229 = a */
movb	$97, -742(%rbp)
/* t230 = 34 */
movl	$34, -746(%rbp)
/* t166[t230] = t229 */
movb	-742(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-746(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t231 = d */
movb	$100, -747(%rbp)
/* t232 = 35 */
movl	$35, -751(%rbp)
/* t166[t232] = t231 */
movb	-747(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-751(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t233 = a */
movb	$97, -752(%rbp)
/* t234 = 36 */
movl	$36, -756(%rbp)
/* t166[t234] = t233 */
movb	-752(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-756(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t235 = 
 */
movb	$10, -757(%rbp)
/* t236 = 37 */
movl	$37, -761(%rbp)
/* t166[t236] = t235 */
movb	-757(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-761(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t237 =   */
movb	$0, -762(%rbp)
/* t238 = 38 */
movl	$38, -766(%rbp)
/* t166[t238] = t237 */
movb	-762(%rbp), %cl
movq	-544(%rbp), %rax
movq	$0, %rbx
movl	-766(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t166 */
movq	-544(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t166 */
movq	-544(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t166 */
movq	-544(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e23: skip */
e23:
/*  */
subq	$8, %rsp

/* put param a */
movl	-222(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e24: skip */
e24:
/*  */
subq	$8, %rsp

/* t240 = 1 */
movl	$1, -786(%rbp)
/* t241 = 0 */
movl	$0, -790(%rbp)
/* t239[t241] = t240 */
movl	-786(%rbp), %ecx
movq	-774(%rbp), %rax
movq	$0, %rbx
movl	-790(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t242 =   */
movb	$32, -791(%rbp)
/* t243 = 4 */
movl	$4, -795(%rbp)
/* t239[t243] = t242 */
movb	-791(%rbp), %cl
movq	-774(%rbp), %rax
movq	$0, %rbx
movl	-795(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t244 = / */
movb	$47, -796(%rbp)
/* t245 = 5 */
movl	$5, -800(%rbp)
/* t239[t245] = t244 */
movb	-796(%rbp), %cl
movq	-774(%rbp), %rax
movq	$0, %rbx
movl	-800(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t246 =   */
movb	$32, -801(%rbp)
/* t247 = 6 */
movl	$6, -805(%rbp)
/* t239[t247] = t246 */
movb	-801(%rbp), %cl
movq	-774(%rbp), %rax
movq	$0, %rbx
movl	-805(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t248 =   */
movb	$0, -806(%rbp)
/* t249 = 7 */
movl	$7, -810(%rbp)
/* t239[t249] = t248 */
movb	-806(%rbp), %cl
movq	-774(%rbp), %rax
movq	$0, %rbx
movl	-810(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t239 */
movq	-774(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t239 */
movq	-774(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t239 */
movq	-774(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e25: skip */
e25:
/*  */
subq	$8, %rsp

/* put param b */
movl	-436(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e26: skip */
e26:
/*  */
subq	$8, %rsp

/* t251 = 1 */
movl	$1, -830(%rbp)
/* t252 = 0 */
movl	$0, -834(%rbp)
/* t250[t252] = t251 */
movl	-830(%rbp), %ecx
movq	-818(%rbp), %rax
movq	$0, %rbx
movl	-834(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t253 =   */
movb	$32, -835(%rbp)
/* t254 = 4 */
movl	$4, -839(%rbp)
/* t250[t254] = t253 */
movb	-835(%rbp), %cl
movq	-818(%rbp), %rax
movq	$0, %rbx
movl	-839(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t255 = = */
movb	$61, -840(%rbp)
/* t256 = 5 */
movl	$5, -844(%rbp)
/* t250[t256] = t255 */
movb	-840(%rbp), %cl
movq	-818(%rbp), %rax
movq	$0, %rbx
movl	-844(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t257 =   */
movb	$32, -845(%rbp)
/* t258 = 6 */
movl	$6, -849(%rbp)
/* t250[t258] = t257 */
movb	-845(%rbp), %cl
movq	-818(%rbp), %rax
movq	$0, %rbx
movl	-849(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t259 =   */
movb	$0, -850(%rbp)
/* t260 = 7 */
movl	$7, -854(%rbp)
/* t250[t260] = t259 */
movb	-850(%rbp), %cl
movq	-818(%rbp), %rax
movq	$0, %rbx
movl	-854(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t250 */
movq	-818(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t250 */
movq	-818(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t250 */
movq	-818(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e27: skip */
e27:
/*  */
subq	$8, %rsp

/* t261 = a / b */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-436(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-222(%rbp), %eax
cdqe
idiv	%r8
movl	%eax, -858(%rbp)

/* put param t261 */
movl	-858(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* t262 = 
 */
movb	$10, -859(%rbp)
/* put param t262 */
movb	-859(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e29: skip */
e29:
/* return */
addq	$856, %rsp
pop	%rbp
ret
/* e30: skip */
e30:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

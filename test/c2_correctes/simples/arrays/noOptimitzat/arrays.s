.global _start
.bss
	var1:	.fill	1, 1, 0
	var2:	.fill	1, 1, 0
	var8:	.fill	4, 1, 0
	var9:	.fill	4, 1, 0
	var10:	.fill	1, 1, 0
	var11:	.fill	1, 1, 0
	var12:	.fill	1, 1, 0
	var13:	.fill	1, 1, 0
	var14:	.fill	1, 1, 0
	var15_data:	.fill	5, 1, 0
	var16:	.fill	4, 1, 0
	var17:	.fill	4, 1, 0
	var18:	.fill	4, 1, 0
	var19:	.fill	4, 1, 0
	var20:	.fill	4, 1, 0
	var21_data:	.fill	0, 1, 0
	var22:	.fill	4, 1, 0
.data
	var15:	.quad	var15_data
	var21:	.quad	var21_data
.text
_start:
call	jada_init
/* trueConst = true */
movb	$1, var1
/* falseConst = false */
movb	$0, var2
/* t8 = 5 */
movl	$5, var8
/* LLETRES = t8 */
movl	var8, %eax
movl	%eax, var9

/* t10 = a */
movb	$97, var10
/* t11 = e */
movb	$101, var11
/* t12 = i */
movb	$105, var12
/* t13 = o */
movb	$111, var13
/* t14 = u */
movb	$117, var14
/* t16 = 0 */
movl	$0, var16
/* t15[t16] = t10 */
movb	var10, %cl
movq	var15, %rax
movq	$0, %rbx
movl	var16, %ebx
movb	%cl, (%rax, %rbx)
/* t17 = 1 */
movl	$1, var17
/* t15[t17] = t11 */
movb	var11, %cl
movq	var15, %rax
movq	$0, %rbx
movl	var17, %ebx
movb	%cl, (%rax, %rbx)
/* t18 = 2 */
movl	$2, var18
/* t15[t18] = t12 */
movb	var12, %cl
movq	var15, %rax
movq	$0, %rbx
movl	var18, %ebx
movb	%cl, (%rax, %rbx)
/* t19 = 3 */
movl	$3, var19
/* t15[t19] = t13 */
movb	var13, %cl
movq	var15, %rax
movq	$0, %rbx
movl	var19, %ebx
movb	%cl, (%rax, %rbx)
/* t20 = 4 */
movl	$4, var20
/* t15[t20] = t14 */
movb	var14, %cl
movq	var15, %rax
movq	$0, %rbx
movl	var20, %ebx
movb	%cl, (%rax, %rbx)
/* vocals = t15 */
movq	var15, %rax
movq	%rax, var21

/* vocals = t15 */
movq	var15, %rax
movq	%rax, var21

/* goto e22 */
jmp	e22
/* t22 = 2 */
movl	$2, var22
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$56, %rsp
/* t25 = 0 */
movl	$0, -12(%rbp)
/* i = t25 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e11: skip */
e11:
/* e12: skip */
e12:
/* if i < LLETRES then goto e13 */
movl	-16(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e13
/* goto e16 */
jmp	e16
/* e13: skip */
e13:
/* t27 = 0 */
movl	$0, -20(%rbp)
/* t28 = 1 */
movl	$1, -24(%rbp)
/* t29 = t27 * t28 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	-24(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -28(%rbp)

/* t30 = 2 */
movl	$2, -32(%rbp)
/* t31 = t30 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-32(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -36(%rbp)

/* t29 = t29 + t31 */
movl	-28(%rbp), %eax
movl	-36(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* t32 = array[t29] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-28(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -37(%rbp)

/* if t32 != valor then goto e14 */
movb	-37(%rbp), %al
movb	16(%rbp), %dl
cmpb	%al, %dl
jne	e14
/* goto e16 */
jmp	e16
/* e14: skip */
e14:
/* t33 = 1 */
movl	$1, -41(%rbp)
/* i = i + t33 */
movl	-16(%rbp), %eax
movl	-41(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* e15: skip */
e15:
/* goto e12 */
jmp	e12
/* e16: skip */
e16:
/* if i == LLETRES then goto e17 */
movl	-16(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
je	e17
/* goto e19 */
jmp	e19
/* e17: skip */
e17:
/* t34 =   */
movb	$0, -42(%rbp)
/* return t34 */
movb	-42(%rbp), %al
movb	%al, 17(%rbp)
addq	$56, %rsp
pop	%rbp
ret
/* e18: skip */
e18:
/* goto e21 */
jmp	e21
/* e19: skip */
e19:
/* t35 = 1 */
movl	$1, -46(%rbp)
/* t36 = 1 */
movl	$1, -50(%rbp)
/* t37 = t35 * t36 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-46(%rbp), %eax
movl	-50(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -54(%rbp)

/* t38 = 2 */
movl	$2, -58(%rbp)
/* t39 = t38 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-58(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -62(%rbp)

/* t37 = t37 + t39 */
movl	-54(%rbp), %eax
movl	-62(%rbp), %edx
addl	%edx, %eax
movl	%eax, -54(%rbp)

/* t40 = array[t37] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-54(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -63(%rbp)

/* return t40 */
movb	-63(%rbp), %al
movb	%al, 17(%rbp)
addq	$56, %rsp
pop	%rbp
ret
/* e20: skip */
e20:
/* e21: skip */
e21:
/* return */
addq	$56, %rsp
pop	%rbp
ret
/* e22: skip */
e22:
/* goto e45 */
jmp	e45
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$856, %rsp
lea	-40(%rbp), %rax
movq	%rax, -30(%rbp)

lea	-88(%rbp), %rax
movq	%rax, -88(%rbp)

lea	-352(%rbp), %rax
movq	%rax, -96(%rbp)

lea	-405(%rbp), %rax
movq	%rax, -360(%rbp)

lea	-738(%rbp), %rax
movq	%rax, -716(%rbp)

/* t41 = 2 */
movl	$2, -12(%rbp)
/* t42 = a */
movb	$97, -13(%rbp)
/* t43 = b */
movb	$98, -14(%rbp)
/* t44 = e */
movb	$101, -15(%rbp)
/* t45 = c */
movb	$99, -16(%rbp)
/* t46 = i */
movb	$105, -17(%rbp)
/* t47 = d */
movb	$100, -18(%rbp)
/* t48 = o */
movb	$111, -19(%rbp)
/* t49 = t */
movb	$116, -20(%rbp)
/* t50 = u */
movb	$117, -21(%rbp)
/* t51 = f */
movb	$102, -22(%rbp)
/* t53 = 0 */
movl	$0, -44(%rbp)
/* t52[t53] = t42 */
movb	-13(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-44(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t54 = 1 */
movl	$1, -48(%rbp)
/* t52[t54] = t43 */
movb	-14(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t55 = 2 */
movl	$2, -52(%rbp)
/* t52[t55] = t44 */
movb	-15(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t56 = 3 */
movl	$3, -56(%rbp)
/* t52[t56] = t45 */
movb	-16(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-56(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 = 4 */
movl	$4, -60(%rbp)
/* t52[t57] = t46 */
movb	-17(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-60(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t58 = 5 */
movl	$5, -64(%rbp)
/* t52[t58] = t47 */
movb	-18(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t59 = 6 */
movl	$6, -68(%rbp)
/* t52[t59] = t48 */
movb	-19(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-68(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t60 = 7 */
movl	$7, -72(%rbp)
/* t52[t60] = t49 */
movb	-20(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-72(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t61 = 8 */
movl	$8, -76(%rbp)
/* t52[t61] = t50 */
movb	-21(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-76(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t62 = 9 */
movl	$9, -80(%rbp)
/* t52[t62] = t51 */
movb	-22(%rbp), %cl
movq	-30(%rbp), %rax
movq	$0, %rbx
movl	-80(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* substituir = t52 */
movq	-30(%rbp), %rax
movq	%rax, -88(%rbp)

/* substituir = t52 */
movq	-30(%rbp), %rax
movq	%rax, -88(%rbp)

/* e24: skip */
e24:
/* e25: skip */
e25:
/* t66 = 1 */
movl	$1, -409(%rbp)
/* t67 = 0 */
movl	$0, -413(%rbp)
/* t65[t67] = t66 */
movl	-409(%rbp), %ecx
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-413(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t68 = L */
movb	$76, -414(%rbp)
/* t69 = 4 */
movl	$4, -418(%rbp)
/* t65[t69] = t68 */
movb	-414(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-418(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t70 = e */
movb	$101, -419(%rbp)
/* t71 = 5 */
movl	$5, -423(%rbp)
/* t65[t71] = t70 */
movb	-419(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-423(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t72 = s */
movb	$115, -424(%rbp)
/* t73 = 6 */
movl	$6, -428(%rbp)
/* t65[t73] = t72 */
movb	-424(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-428(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t74 =   */
movb	$32, -429(%rbp)
/* t75 = 7 */
movl	$7, -433(%rbp)
/* t65[t75] = t74 */
movb	-429(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-433(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t76 = v */
movb	$118, -434(%rbp)
/* t77 = 8 */
movl	$8, -438(%rbp)
/* t65[t77] = t76 */
movb	-434(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-438(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t78 = o */
movb	$111, -439(%rbp)
/* t79 = 9 */
movl	$9, -443(%rbp)
/* t65[t79] = t78 */
movb	-439(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-443(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t80 = c */
movb	$99, -444(%rbp)
/* t81 = 10 */
movl	$10, -448(%rbp)
/* t65[t81] = t80 */
movb	-444(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-448(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t82 = a */
movb	$97, -449(%rbp)
/* t83 = 11 */
movl	$11, -453(%rbp)
/* t65[t83] = t82 */
movb	-449(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-453(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t84 = l */
movb	$108, -454(%rbp)
/* t85 = 12 */
movl	$12, -458(%rbp)
/* t65[t85] = t84 */
movb	-454(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-458(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t86 = s */
movb	$115, -459(%rbp)
/* t87 = 13 */
movl	$13, -463(%rbp)
/* t65[t87] = t86 */
movb	-459(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-463(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t88 =   */
movb	$32, -464(%rbp)
/* t89 = 14 */
movl	$14, -468(%rbp)
/* t65[t89] = t88 */
movb	-464(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-468(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t90 = s */
movb	$115, -469(%rbp)
/* t91 = 15 */
movl	$15, -473(%rbp)
/* t65[t91] = t90 */
movb	-469(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-473(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t92 = o */
movb	$111, -474(%rbp)
/* t93 = 16 */
movl	$16, -478(%rbp)
/* t65[t93] = t92 */
movb	-474(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-478(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t94 = n */
movb	$110, -479(%rbp)
/* t95 = 17 */
movl	$17, -483(%rbp)
/* t65[t95] = t94 */
movb	-479(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-483(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t96 =   */
movb	$32, -484(%rbp)
/* t97 = 18 */
movl	$18, -488(%rbp)
/* t65[t97] = t96 */
movb	-484(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-488(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t98 = u */
movb	$117, -489(%rbp)
/* t99 = 19 */
movl	$19, -493(%rbp)
/* t65[t99] = t98 */
movb	-489(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-493(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t100 = n */
movb	$110, -494(%rbp)
/* t101 = 20 */
movl	$20, -498(%rbp)
/* t65[t101] = t100 */
movb	-494(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-498(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t102 = e */
movb	$101, -499(%rbp)
/* t103 = 21 */
movl	$21, -503(%rbp)
/* t65[t103] = t102 */
movb	-499(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-503(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t104 = s */
movb	$115, -504(%rbp)
/* t105 = 22 */
movl	$22, -508(%rbp)
/* t65[t105] = t104 */
movb	-504(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-508(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t106 =   */
movb	$32, -509(%rbp)
/* t107 = 23 */
movl	$23, -513(%rbp)
/* t65[t107] = t106 */
movb	-509(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-513(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t108 = l */
movb	$108, -514(%rbp)
/* t109 = 24 */
movl	$24, -518(%rbp)
/* t65[t109] = t108 */
movb	-514(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-518(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t110 = l */
movb	$108, -519(%rbp)
/* t111 = 25 */
movl	$25, -523(%rbp)
/* t65[t111] = t110 */
movb	-519(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-523(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t112 = e */
movb	$101, -524(%rbp)
/* t113 = 26 */
movl	$26, -528(%rbp)
/* t65[t113] = t112 */
movb	-524(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-528(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t114 = t */
movb	$116, -529(%rbp)
/* t115 = 27 */
movl	$27, -533(%rbp)
/* t65[t115] = t114 */
movb	-529(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-533(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t116 = r */
movb	$114, -534(%rbp)
/* t117 = 28 */
movl	$28, -538(%rbp)
/* t65[t117] = t116 */
movb	-534(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-538(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t118 = e */
movb	$101, -539(%rbp)
/* t119 = 29 */
movl	$29, -543(%rbp)
/* t65[t119] = t118 */
movb	-539(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-543(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t120 = s */
movb	$115, -544(%rbp)
/* t121 = 30 */
movl	$30, -548(%rbp)
/* t65[t121] = t120 */
movb	-544(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-548(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t122 =   */
movb	$32, -549(%rbp)
/* t123 = 31 */
movl	$31, -553(%rbp)
/* t65[t123] = t122 */
movb	-549(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-553(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t124 = n */
movb	$110, -554(%rbp)
/* t125 = 32 */
movl	$32, -558(%rbp)
/* t65[t125] = t124 */
movb	-554(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-558(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t126 = e */
movb	$101, -559(%rbp)
/* t127 = 33 */
movl	$33, -563(%rbp)
/* t65[t127] = t126 */
movb	-559(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-563(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t128 = c */
movb	$99, -564(%rbp)
/* t129 = 34 */
movl	$34, -568(%rbp)
/* t65[t129] = t128 */
movb	-564(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-568(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t130 = e */
movb	$101, -569(%rbp)
/* t131 = 35 */
movl	$35, -573(%rbp)
/* t65[t131] = t130 */
movb	-569(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-573(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t132 = s */
movb	$115, -574(%rbp)
/* t133 = 36 */
movl	$36, -578(%rbp)
/* t65[t133] = t132 */
movb	-574(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-578(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t134 = s */
movb	$115, -579(%rbp)
/* t135 = 37 */
movl	$37, -583(%rbp)
/* t65[t135] = t134 */
movb	-579(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-583(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t136 = a */
movb	$97, -584(%rbp)
/* t137 = 38 */
movl	$38, -588(%rbp)
/* t65[t137] = t136 */
movb	-584(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-588(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t138 = r */
movb	$114, -589(%rbp)
/* t139 = 39 */
movl	$39, -593(%rbp)
/* t65[t139] = t138 */
movb	-589(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-593(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t140 = i */
movb	$105, -594(%rbp)
/* t141 = 40 */
movl	$40, -598(%rbp)
/* t65[t141] = t140 */
movb	-594(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-598(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t142 = e */
movb	$101, -599(%rbp)
/* t143 = 41 */
movl	$41, -603(%rbp)
/* t65[t143] = t142 */
movb	-599(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-603(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t144 = s */
movb	$115, -604(%rbp)
/* t145 = 42 */
movl	$42, -608(%rbp)
/* t65[t145] = t144 */
movb	-604(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-608(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t146 = 
 */
movb	$10, -609(%rbp)
/* t147 = 43 */
movl	$43, -613(%rbp)
/* t65[t147] = t146 */
movb	-609(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-613(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t148 =   */
movb	$0, -614(%rbp)
/* t149 = 44 */
movl	$44, -618(%rbp)
/* t65[t149] = t148 */
movb	-614(%rbp), %cl
movq	-360(%rbp), %rax
movq	$0, %rbx
movl	-618(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* decrement str */
movq	-96(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* increment t65 */
movq	-360(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* str = t65 */
movq	-360(%rbp), %rax
movq	%rax, -96(%rbp)

/* e26: skip */
e26:
/*  */
subq	$8, %rsp

/* put param str */
movq	-96(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment str */
movq	-96(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement str */
movq	-96(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e27: skip */
e27:
/* t150 = 0 */
movl	$0, -622(%rbp)
/* i = t150 */
movl	-622(%rbp), %eax
movl	%eax, -626(%rbp)

/* e28: skip */
e28:
/* e29: skip */
e29:
/* t152 = 1 */
movl	$1, -630(%rbp)
/* t153 = i */
movl	-626(%rbp), %eax
movl	%eax, -634(%rbp)

/* t154 = 1 */
movl	$1, -638(%rbp)
/* t155 = 1 */
movl	$1, -642(%rbp)
/* t156 = t153 * t155 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-634(%rbp), %eax
movl	-642(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -646(%rbp)

/* t157 = 4 */
movl	$4, -650(%rbp)
/* t156 = t156 + t157 */
movl	-646(%rbp), %eax
movl	-650(%rbp), %edx
addl	%edx, %eax
movl	%eax, -646(%rbp)

/* t158 =   */
movb	$0, -651(%rbp)
/* t159 = str[t156] */
movq	-96(%rbp), %rax
movq	$0, %rbx
movl	-646(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -652(%rbp)

/* if t159 != t158 then goto e30 */
movb	-652(%rbp), %al
movb	-651(%rbp), %dl
cmpb	%al, %dl
jne	e30
/* goto e36 */
jmp	e36
/* e30: skip */
e30:
/*  */
subq	$16, %rsp

/* t160 = 1 */
movl	$1, -656(%rbp)
/* t161 = i */
movl	-626(%rbp), %eax
movl	%eax, -660(%rbp)

/* t162 = 1 */
movl	$1, -664(%rbp)
/* t163 = 1 */
movl	$1, -668(%rbp)
/* t164 = t161 * t163 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-660(%rbp), %eax
movl	-668(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -672(%rbp)

/* t165 = 4 */
movl	$4, -676(%rbp)
/* t164 = t164 + t165 */
movl	-672(%rbp), %eax
movl	-676(%rbp), %edx
addl	%edx, %eax
movl	%eax, -672(%rbp)

/* put param substituir */
movq	-88(%rbp), %rax
movq	%rax, 0(%rsp)
/* t166 = str[t164] */
movq	-96(%rbp), %rax
movq	$0, %rbx
movl	-672(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -677(%rbp)

/* put param t166 */
movb	-677(%rbp), %al
movb	%al, 8(%rsp)
/* t167 = call e10 */
call 	e10
movb	9(%rsp), %al
movb	%al, -678(%rbp)
addq	$16, %rsp
/* tmp = t167 */
movb	-678(%rbp), %al
movb	%al, -679(%rbp)

/* e31: skip */
e31:
/* t169 =   */
movb	$0, -680(%rbp)
/* if tmp != t169 then goto e32 */
movb	-679(%rbp), %al
movb	-680(%rbp), %dl
cmpb	%al, %dl
jne	e32
/* goto e34 */
jmp	e34
/* e32: skip */
e32:
/* t170 = 1 */
movl	$1, -684(%rbp)
/* t171 = i */
movl	-626(%rbp), %eax
movl	%eax, -688(%rbp)

/* t172 = 1 */
movl	$1, -692(%rbp)
/* t173 = 1 */
movl	$1, -696(%rbp)
/* t174 = t171 * t173 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-688(%rbp), %eax
movl	-696(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -700(%rbp)

/* t175 = 4 */
movl	$4, -704(%rbp)
/* t174 = t174 + t175 */
movl	-700(%rbp), %eax
movl	-704(%rbp), %edx
addl	%edx, %eax
movl	%eax, -700(%rbp)

/* str[t174] = tmp */
movb	-679(%rbp), %cl
movq	-96(%rbp), %rax
movq	$0, %rbx
movl	-700(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* e33: skip */
e33:
/* goto e34 */
jmp	e34
/* e34: skip */
e34:
/* t176 = 1 */
movl	$1, -708(%rbp)
/* i = i + t176 */
movl	-626(%rbp), %eax
movl	-708(%rbp), %edx
addl	%edx, %eax
movl	%eax, -626(%rbp)

/* e35: skip */
e35:
/* goto e29 */
jmp	e29
/* e36: skip */
e36:
/*  */
subq	$8, %rsp

/* put param str */
movq	-96(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment str */
movq	-96(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement str */
movq	-96(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e37: skip */
e37:
/*  */
subq	$8, %rsp

/* t178 = 1 */
movl	$1, -742(%rbp)
/* t179 = 0 */
movl	$0, -746(%rbp)
/* t177[t179] = t178 */
movl	-742(%rbp), %ecx
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-746(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t180 = L */
movb	$76, -747(%rbp)
/* t181 = 4 */
movl	$4, -751(%rbp)
/* t177[t181] = t180 */
movb	-747(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-751(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t182 = e */
movb	$101, -752(%rbp)
/* t183 = 5 */
movl	$5, -756(%rbp)
/* t177[t183] = t182 */
movb	-752(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-756(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t184 = s */
movb	$115, -757(%rbp)
/* t185 = 6 */
movl	$6, -761(%rbp)
/* t177[t185] = t184 */
movb	-757(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-761(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t186 =   */
movb	$32, -762(%rbp)
/* t187 = 7 */
movl	$7, -766(%rbp)
/* t177[t187] = t186 */
movb	-762(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-766(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t188 = v */
movb	$118, -767(%rbp)
/* t189 = 8 */
movl	$8, -771(%rbp)
/* t177[t189] = t188 */
movb	-767(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-771(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t190 = o */
movb	$111, -772(%rbp)
/* t191 = 9 */
movl	$9, -776(%rbp)
/* t177[t191] = t190 */
movb	-772(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-776(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t192 = c */
movb	$99, -777(%rbp)
/* t193 = 10 */
movl	$10, -781(%rbp)
/* t177[t193] = t192 */
movb	-777(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-781(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t194 = a */
movb	$97, -782(%rbp)
/* t195 = 11 */
movl	$11, -786(%rbp)
/* t177[t195] = t194 */
movb	-782(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-786(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t196 = l */
movb	$108, -787(%rbp)
/* t197 = 12 */
movl	$12, -791(%rbp)
/* t177[t197] = t196 */
movb	-787(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-791(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t198 = s */
movb	$115, -792(%rbp)
/* t199 = 13 */
movl	$13, -796(%rbp)
/* t177[t199] = t198 */
movb	-792(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-796(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t200 =   */
movb	$32, -797(%rbp)
/* t201 = 14 */
movl	$14, -801(%rbp)
/* t177[t201] = t200 */
movb	-797(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-801(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t202 = s */
movb	$115, -802(%rbp)
/* t203 = 15 */
movl	$15, -806(%rbp)
/* t177[t203] = t202 */
movb	-802(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-806(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t204 = � */
movb	$-61, -807(%rbp)
/* t205 = 16 */
movl	$16, -811(%rbp)
/* t177[t205] = t204 */
movb	-807(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-811(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t206 = � */
movb	$-77, -812(%rbp)
/* t207 = 17 */
movl	$17, -816(%rbp)
/* t177[t207] = t206 */
movb	-812(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-816(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t208 = n */
movb	$110, -817(%rbp)
/* t209 = 18 */
movl	$18, -821(%rbp)
/* t177[t209] = t208 */
movb	-817(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-821(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t210 = : */
movb	$58, -822(%rbp)
/* t211 = 19 */
movl	$19, -826(%rbp)
/* t177[t211] = t210 */
movb	-822(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-826(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t212 =   */
movb	$32, -827(%rbp)
/* t213 = 20 */
movl	$20, -831(%rbp)
/* t177[t213] = t212 */
movb	-827(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-831(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t214 =   */
movb	$0, -832(%rbp)
/* t215 = 21 */
movl	$21, -836(%rbp)
/* t177[t215] = t214 */
movb	-832(%rbp), %cl
movq	-716(%rbp), %rax
movq	$0, %rbx
movl	-836(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t177 */
movq	-716(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t177 */
movq	-716(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t177 */
movq	-716(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e38: skip */
e38:
/* t216 = 0 */
movl	$0, -840(%rbp)
/* i = t216 */
movl	-840(%rbp), %eax
movl	%eax, -844(%rbp)

/* e39: skip */
e39:
/* if i < LLETRES then goto e40 */
movl	-844(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e40
/* goto e43 */
jmp	e43
/* e40: skip */
e40:
/*  */
subq	$8, %rsp

/* t219 = 1 */
movl	$1, -852(%rbp)
/* t220 = i * t219 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-844(%rbp), %eax
movl	-852(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -856(%rbp)

/* t221 = vocals[t220] */
movq	var21, %rax
movq	$0, %rbx
movl	-856(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -857(%rbp)

/* put param t221 */
movb	-857(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e41: skip */
e41:
/*  */
subq	$8, %rsp

/* t222 =   */
movb	$32, -858(%rbp)
/* put param t222 */
movb	-858(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e42: skip */
e42:
/* t218 = 1 */
movl	$1, -848(%rbp)
/* i = i + t218 */
movl	-844(%rbp), %eax
movl	-848(%rbp), %edx
addl	%edx, %eax
movl	%eax, -844(%rbp)

/* goto e39 */
jmp	e39
/* e43: skip */
e43:
/*  */
subq	$8, %rsp

/* t223 = 
 */
movb	$10, -859(%rbp)
/* put param t223 */
movb	-859(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e44: skip */
e44:
/* decrement str */
movq	-96(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$856, %rsp
pop	%rbp
ret
/* e45: skip */
e45:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

.global _start
.bss
	var1:	.fill	1, 1, 0
	var2:	.fill	1, 1, 0
	var8:	.fill	4, 1, 0
	var9:	.fill	4, 1, 0
.data
.text
_start:
call	jada_init
/* trueConst = true */
movb	$1, var1
/* falseConst = false */
movb	$0, var2
/* t8 = 50000 */
movl	$50000, var8
/* num = t8 */
movl	var8, %eax
movl	%eax, var9

/* goto e50 */
jmp	e50
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$200392, %rsp
lea	-200020(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-200121(%rbp), %rax
movq	%rax, -200112(%rbp)

lea	-200199(%rbp), %rax
movq	%rax, -200162(%rbp)

/* e11: skip */
e11:
/* t11 = 1 */
movl	$1, -200024(%rbp)
/* n = t11 */
movl	-200024(%rbp), %eax
movl	%eax, -200028(%rbp)

/* e12: skip */
e12:
/* t13 = 0 */
movl	$0, -200032(%rbp)
/* t14 = 4 */
movl	$4, -200036(%rbp)
/* t15 = t13 * t14 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200032(%rbp), %eax
movl	-200036(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -200040(%rbp)

/* t16 = 1 */
movl	$1, -200044(%rbp)
/* primers[t15] = t16 */
movl	-200044(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200040(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e13: skip */
e13:
/* t17 = 2 */
movl	$2, -200048(%rbp)
/* i = t17 */
movl	-200048(%rbp), %eax
movl	%eax, -200052(%rbp)

/* e14: skip */
e14:
/* if n < num then goto e15 */
movl	-200028(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e15
/* goto e40 */
jmp	e40
/* e15: skip */
e15:
/* if trueConst == trueConst then goto e16 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e16
/* goto e17 */
jmp	e17
/* e16: skip */
e16:
/* t20 = trueConst */
movb	var1, %al
movb	%al, -200057(%rbp)

/* goto e18 */
jmp	e18
/* e17: skip */
e17:
/* t20 = falseConst */
movb	var2, %al
movb	%al, -200057(%rbp)

/* e18: skip */
e18:
/* primer = t20 */
movb	-200057(%rbp), %al
movb	%al, -200058(%rbp)

/* e19: skip */
e19:
/* t22 = 1 */
movl	$1, -200062(%rbp)
/* j = t22 */
movl	-200062(%rbp), %eax
movl	%eax, -200066(%rbp)

/* e20: skip */
e20:
/* if trueConst == primer then goto e21 */
movb	var1, %al
movb	-200058(%rbp), %dl
cmpb	%al, %dl
je	e21
/* goto e29 */
jmp	e29
/* e21: skip */
e21:
/* if j < n then goto e22 */
movl	-200066(%rbp), %eax
movl	-200028(%rbp), %edx
cmpl	%eax, %edx
jg	e22
/* goto e29 */
jmp	e29
/* e22: skip */
e22:
/* t25 = 4 */
movl	$4, -200074(%rbp)
/* t26 = j * t25 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200066(%rbp), %eax
movl	-200074(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -200078(%rbp)

/* t28 = primers[t26] */
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200078(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -200086(%rbp)

/* t27 = i % t28 */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-200086(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-200052(%rbp), %eax
cdqe
idiv	%r8
movl	%edx, -200082(%rbp)

/* t29 = 0 */
movl	$0, -200090(%rbp)
/* if t27 == t29 then goto e23 */
movl	-200082(%rbp), %eax
movl	-200090(%rbp), %edx
cmpl	%eax, %edx
je	e23
/* goto e28 */
jmp	e28
/* e23: skip */
e23:
/* if trueConst == falseConst then goto e24 */
movb	var1, %al
movb	var2, %dl
cmpb	%al, %dl
je	e24
/* goto e25 */
jmp	e25
/* e24: skip */
e24:
/* primer = trueConst */
movb	var1, %al
movb	%al, -200058(%rbp)

/* goto e26 */
jmp	e26
/* e25: skip */
e25:
/* primer = falseConst */
movb	var2, %al
movb	%al, -200058(%rbp)

/* e26: skip */
e26:
/* e27: skip */
e27:
/* goto e28 */
jmp	e28
/* e28: skip */
e28:
/* t24 = 1 */
movl	$1, -200070(%rbp)
/* j = j + t24 */
movl	-200066(%rbp), %eax
movl	-200070(%rbp), %edx
addl	%edx, %eax
movl	%eax, -200066(%rbp)

/* goto e20 */
jmp	e20
/* e29: skip */
e29:
/* if trueConst == primer then goto e30 */
movb	var1, %al
movb	-200058(%rbp), %dl
cmpb	%al, %dl
je	e30
/* goto e31 */
jmp	e31
/* e30: skip */
e30:
/* t30 = trueConst */
movb	var1, %al
movb	%al, -200091(%rbp)

/* goto e32 */
jmp	e32
/* e31: skip */
e31:
/* t30 = falseConst */
movb	var2, %al
movb	%al, -200091(%rbp)

/* e32: skip */
e32:
/* if trueConst == trueConst then goto e33 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e33
/* goto e34 */
jmp	e34
/* e33: skip */
e33:
/* t31 = trueConst */
movb	var1, %al
movb	%al, -200092(%rbp)

/* goto e35 */
jmp	e35
/* e34: skip */
e34:
/* t31 = falseConst */
movb	var2, %al
movb	%al, -200092(%rbp)

/* e35: skip */
e35:
/* if t30 == t31 then goto e36 */
movb	-200091(%rbp), %al
movb	-200092(%rbp), %dl
cmpb	%al, %dl
je	e36
/* goto e39 */
jmp	e39
/* e36: skip */
e36:
/* t32 = 4 */
movl	$4, -200096(%rbp)
/* t33 = n * t32 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200028(%rbp), %eax
movl	-200096(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -200100(%rbp)

/* primers[t33] = i */
movl	-200052(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200100(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e37: skip */
e37:
/* t34 = 1 */
movl	$1, -200104(%rbp)
/* n = n + t34 */
movl	-200028(%rbp), %eax
movl	-200104(%rbp), %edx
addl	%edx, %eax
movl	%eax, -200028(%rbp)

/* e38: skip */
e38:
/* goto e39 */
jmp	e39
/* e39: skip */
e39:
/* t19 = 1 */
movl	$1, -200056(%rbp)
/* i = i + t19 */
movl	-200052(%rbp), %eax
movl	-200056(%rbp), %edx
addl	%edx, %eax
movl	%eax, -200052(%rbp)

/* goto e14 */
jmp	e14
/* e40: skip */
e40:
/*  */
subq	$8, %rsp

/* t36 = 1 */
movl	$1, -200125(%rbp)
/* t37 = 0 */
movl	$0, -200129(%rbp)
/* t35[t37] = t36 */
movl	-200125(%rbp), %ecx
movq	-200112(%rbp), %rax
movq	$0, %rbx
movl	-200129(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t38 = E */
movb	$69, -200130(%rbp)
/* t39 = 4 */
movl	$4, -200134(%rbp)
/* t35[t39] = t38 */
movb	-200130(%rbp), %cl
movq	-200112(%rbp), %rax
movq	$0, %rbx
movl	-200134(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t40 = l */
movb	$108, -200135(%rbp)
/* t41 = 5 */
movl	$5, -200139(%rbp)
/* t35[t41] = t40 */
movb	-200135(%rbp), %cl
movq	-200112(%rbp), %rax
movq	$0, %rbx
movl	-200139(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t42 = s */
movb	$115, -200140(%rbp)
/* t43 = 6 */
movl	$6, -200144(%rbp)
/* t35[t43] = t42 */
movb	-200140(%rbp), %cl
movq	-200112(%rbp), %rax
movq	$0, %rbx
movl	-200144(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t44 =   */
movb	$32, -200145(%rbp)
/* t45 = 7 */
movl	$7, -200149(%rbp)
/* t35[t45] = t44 */
movb	-200145(%rbp), %cl
movq	-200112(%rbp), %rax
movq	$0, %rbx
movl	-200149(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t46 =   */
movb	$0, -200150(%rbp)
/* t47 = 8 */
movl	$8, -200154(%rbp)
/* t35[t47] = t46 */
movb	-200150(%rbp), %cl
movq	-200112(%rbp), %rax
movq	$0, %rbx
movl	-200154(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t35 */
movq	-200112(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t35 */
movq	-200112(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t35 */
movq	-200112(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e41: skip */
e41:
/*  */
subq	$8, %rsp

/* put param num */
movl	var9, %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e42: skip */
e42:
/*  */
subq	$8, %rsp

/* t49 = 1 */
movl	$1, -200203(%rbp)
/* t50 = 0 */
movl	$0, -200207(%rbp)
/* t48[t50] = t49 */
movl	-200203(%rbp), %ecx
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200207(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t51 =   */
movb	$32, -200208(%rbp)
/* t52 = 4 */
movl	$4, -200212(%rbp)
/* t48[t52] = t51 */
movb	-200208(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200212(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t53 = p */
movb	$112, -200213(%rbp)
/* t54 = 5 */
movl	$5, -200217(%rbp)
/* t48[t54] = t53 */
movb	-200213(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200217(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t55 = r */
movb	$114, -200218(%rbp)
/* t56 = 6 */
movl	$6, -200222(%rbp)
/* t48[t56] = t55 */
movb	-200218(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200222(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 = i */
movb	$105, -200223(%rbp)
/* t58 = 7 */
movl	$7, -200227(%rbp)
/* t48[t58] = t57 */
movb	-200223(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200227(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t59 = m */
movb	$109, -200228(%rbp)
/* t60 = 8 */
movl	$8, -200232(%rbp)
/* t48[t60] = t59 */
movb	-200228(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200232(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t61 = e */
movb	$101, -200233(%rbp)
/* t62 = 9 */
movl	$9, -200237(%rbp)
/* t48[t62] = t61 */
movb	-200233(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200237(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t63 = r */
movb	$114, -200238(%rbp)
/* t64 = 10 */
movl	$10, -200242(%rbp)
/* t48[t64] = t63 */
movb	-200238(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200242(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t65 = s */
movb	$115, -200243(%rbp)
/* t66 = 11 */
movl	$11, -200247(%rbp)
/* t48[t66] = t65 */
movb	-200243(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200247(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t67 =   */
movb	$32, -200248(%rbp)
/* t68 = 12 */
movl	$12, -200252(%rbp)
/* t48[t68] = t67 */
movb	-200248(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200252(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t69 = n */
movb	$110, -200253(%rbp)
/* t70 = 13 */
movl	$13, -200257(%rbp)
/* t48[t70] = t69 */
movb	-200253(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200257(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t71 = � */
movb	$-61, -200258(%rbp)
/* t72 = 14 */
movl	$14, -200262(%rbp)
/* t48[t72] = t71 */
movb	-200258(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200262(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t73 = � */
movb	$-70, -200263(%rbp)
/* t74 = 15 */
movl	$15, -200267(%rbp)
/* t48[t74] = t73 */
movb	-200263(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200267(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t75 = m */
movb	$109, -200268(%rbp)
/* t76 = 16 */
movl	$16, -200272(%rbp)
/* t48[t76] = t75 */
movb	-200268(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200272(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t77 = e */
movb	$101, -200273(%rbp)
/* t78 = 17 */
movl	$17, -200277(%rbp)
/* t48[t78] = t77 */
movb	-200273(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200277(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t79 = r */
movb	$114, -200278(%rbp)
/* t80 = 18 */
movl	$18, -200282(%rbp)
/* t48[t80] = t79 */
movb	-200278(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200282(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t81 = o */
movb	$111, -200283(%rbp)
/* t82 = 19 */
movl	$19, -200287(%rbp)
/* t48[t82] = t81 */
movb	-200283(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200287(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t83 = s */
movb	$115, -200288(%rbp)
/* t84 = 20 */
movl	$20, -200292(%rbp)
/* t48[t84] = t83 */
movb	-200288(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200292(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t85 =   */
movb	$32, -200293(%rbp)
/* t86 = 21 */
movl	$21, -200297(%rbp)
/* t48[t86] = t85 */
movb	-200293(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200297(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t87 = p */
movb	$112, -200298(%rbp)
/* t88 = 22 */
movl	$22, -200302(%rbp)
/* t48[t88] = t87 */
movb	-200298(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200302(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t89 = r */
movb	$114, -200303(%rbp)
/* t90 = 23 */
movl	$23, -200307(%rbp)
/* t48[t90] = t89 */
movb	-200303(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200307(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t91 = i */
movb	$105, -200308(%rbp)
/* t92 = 24 */
movl	$24, -200312(%rbp)
/* t48[t92] = t91 */
movb	-200308(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200312(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t93 = m */
movb	$109, -200313(%rbp)
/* t94 = 25 */
movl	$25, -200317(%rbp)
/* t48[t94] = t93 */
movb	-200313(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200317(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t95 = e */
movb	$101, -200318(%rbp)
/* t96 = 26 */
movl	$26, -200322(%rbp)
/* t48[t96] = t95 */
movb	-200318(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200322(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t97 = r */
movb	$114, -200323(%rbp)
/* t98 = 27 */
movl	$27, -200327(%rbp)
/* t48[t98] = t97 */
movb	-200323(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200327(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t99 = s */
movb	$115, -200328(%rbp)
/* t100 = 28 */
movl	$28, -200332(%rbp)
/* t48[t100] = t99 */
movb	-200328(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200332(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t101 =   */
movb	$32, -200333(%rbp)
/* t102 = 29 */
movl	$29, -200337(%rbp)
/* t48[t102] = t101 */
movb	-200333(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200337(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t103 = s */
movb	$115, -200338(%rbp)
/* t104 = 30 */
movl	$30, -200342(%rbp)
/* t48[t104] = t103 */
movb	-200338(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200342(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t105 = � */
movb	$-61, -200343(%rbp)
/* t106 = 31 */
movl	$31, -200347(%rbp)
/* t48[t106] = t105 */
movb	-200343(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200347(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t107 = � */
movb	$-77, -200348(%rbp)
/* t108 = 32 */
movl	$32, -200352(%rbp)
/* t48[t108] = t107 */
movb	-200348(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200352(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t109 = n */
movb	$110, -200353(%rbp)
/* t110 = 33 */
movl	$33, -200357(%rbp)
/* t48[t110] = t109 */
movb	-200353(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200357(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t111 = : */
movb	$58, -200358(%rbp)
/* t112 = 34 */
movl	$34, -200362(%rbp)
/* t48[t112] = t111 */
movb	-200358(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200362(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t113 =   */
movb	$32, -200363(%rbp)
/* t114 = 35 */
movl	$35, -200367(%rbp)
/* t48[t114] = t113 */
movb	-200363(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200367(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t115 =   */
movb	$0, -200368(%rbp)
/* t116 = 36 */
movl	$36, -200372(%rbp)
/* t48[t116] = t115 */
movb	-200368(%rbp), %cl
movq	-200162(%rbp), %rax
movq	$0, %rbx
movl	-200372(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t48 */
movq	-200162(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t48 */
movq	-200162(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t48 */
movq	-200162(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e43: skip */
e43:
/* t117 = 0 */
movl	$0, -200376(%rbp)
/* i = t117 */
movl	-200376(%rbp), %eax
movl	%eax, -200380(%rbp)

/* e44: skip */
e44:
/* if i < num then goto e45 */
movl	-200380(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e45
/* goto e48 */
jmp	e48
/* e45: skip */
e45:
/*  */
subq	$8, %rsp

/* t120 = 4 */
movl	$4, -200388(%rbp)
/* t121 = i * t120 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200380(%rbp), %eax
movl	-200388(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -200392(%rbp)

/* t122 = primers[t121] */
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200392(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -200396(%rbp)

/* put param t122 */
movl	-200396(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e46: skip */
e46:
/*  */
subq	$8, %rsp

/* t123 =   */
movb	$32, -200397(%rbp)
/* put param t123 */
movb	-200397(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e47: skip */
e47:
/* t119 = 1 */
movl	$1, -200384(%rbp)
/* i = i + t119 */
movl	-200380(%rbp), %eax
movl	-200384(%rbp), %edx
addl	%edx, %eax
movl	%eax, -200380(%rbp)

/* goto e44 */
jmp	e44
/* e48: skip */
e48:
/*  */
subq	$8, %rsp

/* t124 = 
 */
movb	$10, -200398(%rbp)
/* put param t124 */
movb	-200398(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e49: skip */
e49:
/* return */
addq	$200392, %rsp
pop	%rbp
ret
/* e50: skip */
e50:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

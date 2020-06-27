.global _start
.bss
	var1:	.fill	1, 1, 0
	var2:	.fill	1, 1, 0
	var8:	.fill	4, 1, 0
	var9:	.fill	4, 1, 0
	var10:	.fill	1, 1, 0
	var11:	.fill	1, 1, 0
	var12:	.fill	1, 1, 0
	var13_data:	.fill	3, 1, 0
	var14:	.fill	4, 1, 0
	var15:	.fill	4, 1, 0
	var16:	.fill	4, 1, 0
	var17_data:	.fill	0, 1, 0
	var18:	.fill	4, 1, 0
	var19_data:	.fill	0, 1, 0
	var206:	.fill	4, 1, 0
.data
	var13:	.quad	var13_data
	var17:	.quad	var17_data
	var19:	.quad	var19_data
.text
_start:
call	jada_init
/* trueConst = true */
movb	$1, var1
/* falseConst = false */
movb	$0, var2
/* t9 = 3 */
movl	$3, var9
/* t10 = - */
movb	$45, var10
/* t11 = X */
movb	$88, var11
/* t12 = O */
movb	$79, var12
/* t14 = 0 */
movl	$0, var14
/* t13[t14] = t10 */
movb	var10, %cl
movq	var13, %rax
movq	$0, %rbx
movl	var14, %ebx
movb	%cl, (%rax, %rbx)
/* t15 = 1 */
movl	$1, var15
/* t13[t15] = t11 */
movb	var11, %cl
movq	var13, %rax
movq	$0, %rbx
movl	var15, %ebx
movb	%cl, (%rax, %rbx)
/* t16 = 2 */
movl	$2, var16
/* t13[t16] = t12 */
movb	var12, %cl
movq	var13, %rax
movq	$0, %rbx
movl	var16, %ebx
movb	%cl, (%rax, %rbx)
/* jugadorsIcona = t13 */
movq	var13, %rax
movq	%rax, var17

/* jugadorsIcona = t13 */
movq	var13, %rax
movq	%rax, var17

/* goto e20 */
jmp	e20
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$120, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-64(%rbp), %rax
movq	%rax, -64(%rbp)

/* t23 = 4 */
movq	$4, -32(%rbp)
/* t24 = 1 */
movq	$1, -40(%rbp)
/* t24 = t24 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t24 = t24 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t22 = t24 * t23 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movq	-32(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t25 = 8 */
movl	$8, -44(%rbp)
/* t22 = t22 + t25 */
movq	-24(%rbp), %rax
movl	-44(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t21 = malloc t22 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t26 = 0 */
movl	$0, -48(%rbp)
/* t21[t26] = n */
movl	8(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t27 = 4 */
movl	$4, -52(%rbp)
/* t28 = 1 */
movl	$1, -56(%rbp)
/* t21[t27] = t28 */
movl	-56(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t21 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* tauler = t21 */
movq	-16(%rbp), %rax
movq	%rax, -64(%rbp)

/* e11: skip */
e11:
/* t30 = 0 */
movl	$0, -68(%rbp)
/* i = t30 */
movl	-68(%rbp), %eax
movl	%eax, -72(%rbp)

/* e12: skip */
e12:
/* if i < n then goto e13 */
movl	-72(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jg	e13
/* goto e18 */
jmp	e18
/* e13: skip */
e13:
/* t33 = 0 */
movl	$0, -80(%rbp)
/* j = t33 */
movl	-80(%rbp), %eax
movl	%eax, -84(%rbp)

/* e14: skip */
e14:
/* if j < n then goto e15 */
movl	-84(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jg	e15
/* goto e17 */
jmp	e17
/* e15: skip */
e15:
/* t36 = 4 */
movl	$4, -92(%rbp)
/* t37 = j */
movl	-84(%rbp), %eax
movl	%eax, -96(%rbp)

/* t38 = 1 */
movl	$1, -100(%rbp)
/* t39 = 0 */
movl	$0, -104(%rbp)
/* t40 = tauler[t39] */
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-104(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -108(%rbp)

/* t38 = t38 * t40 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-100(%rbp), %eax
movl	-108(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -100(%rbp)

/* t41 = t38 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-100(%rbp), %eax
movl	-72(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -112(%rbp)

/* t37 = t37 + t41 */
movl	-96(%rbp), %eax
movl	-112(%rbp), %edx
addl	%edx, %eax
movl	%eax, -96(%rbp)

/* t42 = 4 */
movl	$4, -116(%rbp)
/* t43 = t37 * t42 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-96(%rbp), %eax
movl	-116(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -120(%rbp)

/* t44 = 8 */
movl	$8, -124(%rbp)
/* t43 = t43 + t44 */
movl	-120(%rbp), %eax
movl	-124(%rbp), %edx
addl	%edx, %eax
movl	%eax, -120(%rbp)

/* t45 = 0 */
movl	$0, -128(%rbp)
/* tauler[t43] = t45 */
movl	-128(%rbp), %ecx
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-120(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e16: skip */
e16:
/* t35 = 1 */
movl	$1, -88(%rbp)
/* j = j + t35 */
movl	-84(%rbp), %eax
movl	-88(%rbp), %edx
addl	%edx, %eax
movl	%eax, -84(%rbp)

/* goto e14 */
jmp	e14
/* e17: skip */
e17:
/* t32 = 1 */
movl	$1, -76(%rbp)
/* i = i + t32 */
movl	-72(%rbp), %eax
movl	-76(%rbp), %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* goto e12 */
jmp	e12
/* e18: skip */
e18:
/* return tauler */
movq	-64(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$120, %rsp
pop	%rbp
ret
/* e19: skip */
e19:
/* decrement tauler */
movq	-64(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$120, %rsp
pop	%rbp
ret
/* e20: skip */
e20:
/* goto e31 */
jmp	e31
/* e21: skip */
e21:
/* preamble e21 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$80, %rsp
/* t48 = 0 */
movl	$0, -12(%rbp)
/* i = t48 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e22: skip */
e22:
/* if i < n then goto e23 */
movl	-16(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e23
/* goto e30 */
jmp	e30
/* e23: skip */
e23:
/* t51 = 0 */
movl	$0, -24(%rbp)
/* j = t51 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e24: skip */
e24:
/* if j < n then goto e25 */
movl	-28(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e25
/* goto e28 */
jmp	e28
/* e25: skip */
e25:
/*  */
subq	$8, %rsp

/* t54 = 4 */
movl	$4, -36(%rbp)
/* t55 = j */
movl	-28(%rbp), %eax
movl	%eax, -40(%rbp)

/* t56 = 1 */
movl	$1, -44(%rbp)
/* t57 = 0 */
movl	$0, -48(%rbp)
/* t58 = tauler[t57] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -52(%rbp)

/* t56 = t56 * t58 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-44(%rbp), %eax
movl	-52(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -44(%rbp)

/* t59 = t56 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-44(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -56(%rbp)

/* t55 = t55 + t59 */
movl	-40(%rbp), %eax
movl	-56(%rbp), %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/* t60 = 4 */
movl	$4, -60(%rbp)
/* t61 = t55 * t60 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-40(%rbp), %eax
movl	-60(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t62 = 8 */
movl	$8, -68(%rbp)
/* t61 = t61 + t62 */
movl	-64(%rbp), %eax
movl	-68(%rbp), %edx
addl	%edx, %eax
movl	%eax, -64(%rbp)

/* t63 = 1 */
movl	$1, -72(%rbp)
/* t65 = tauler[t61] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -80(%rbp)

/* t64 = t65 * t63 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-80(%rbp), %eax
movl	-72(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -76(%rbp)

/* t66 = jugadorsIcona[t64] */
movq	var17, %rax
movq	$0, %rbx
movl	-76(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -81(%rbp)

/* put param t66 */
movb	-81(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e26: skip */
e26:
/*  */
subq	$8, %rsp

/* t67 =   */
movb	$32, -82(%rbp)
/* put param t67 */
movb	-82(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e27: skip */
e27:
/* t53 = 1 */
movl	$1, -32(%rbp)
/* j = j + t53 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* goto e24 */
jmp	e24
/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* t68 = 
 */
movb	$10, -83(%rbp)
/* put param t68 */
movb	-83(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e29: skip */
e29:
/* t50 = 1 */
movl	$1, -20(%rbp)
/* i = i + t50 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e22 */
jmp	e22
/* e30: skip */
e30:
/* return */
addq	$80, %rsp
pop	%rbp
ret
/* e31: skip */
e31:
/* goto e53 */
jmp	e53
/* e32: skip */
e32:
/* preamble e32 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
/* if trueConst == trueConst then goto e33 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e33
/* goto e34 */
jmp	e34
/* e33: skip */
e33:
/* t71 = trueConst */
movb	var1, %al
movb	%al, -9(%rbp)

/* goto e35 */
jmp	e35
/* e34: skip */
e34:
/* t71 = falseConst */
movb	var2, %al
movb	%al, -9(%rbp)

/* e35: skip */
e35:
/* complet = t71 */
movb	-9(%rbp), %al
movb	%al, -10(%rbp)

/* e36: skip */
e36:
/* t73 = 0 */
movl	$0, -14(%rbp)
/* i = t73 */
movl	-14(%rbp), %eax
movl	%eax, -18(%rbp)

/* e37: skip */
e37:
/* if i < n then goto e38 */
movl	-18(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e38
/* goto e48 */
jmp	e48
/* e38: skip */
e38:
/* if trueConst == complet then goto e39 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e39
/* goto e48 */
jmp	e48
/* e39: skip */
e39:
/* t76 = 0 */
movl	$0, -26(%rbp)
/* j = t76 */
movl	-26(%rbp), %eax
movl	%eax, -30(%rbp)

/* e40: skip */
e40:
/* if j < n then goto e41 */
movl	-30(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e41
/* goto e47 */
jmp	e47
/* e41: skip */
e41:
/* if trueConst == complet then goto e42 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e42
/* goto e47 */
jmp	e47
/* e42: skip */
e42:
/* t79 = 4 */
movl	$4, -38(%rbp)
/* t80 = j */
movl	-30(%rbp), %eax
movl	%eax, -42(%rbp)

/* t81 = 1 */
movl	$1, -46(%rbp)
/* t82 = 0 */
movl	$0, -50(%rbp)
/* t83 = tauler[t82] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-50(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -54(%rbp)

/* t81 = t81 * t83 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-46(%rbp), %eax
movl	-54(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -46(%rbp)

/* t84 = t81 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-46(%rbp), %eax
movl	-18(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -58(%rbp)

/* t80 = t80 + t84 */
movl	-42(%rbp), %eax
movl	-58(%rbp), %edx
addl	%edx, %eax
movl	%eax, -42(%rbp)

/* t85 = 4 */
movl	$4, -62(%rbp)
/* t86 = t80 * t85 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-42(%rbp), %eax
movl	-62(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -66(%rbp)

/* t87 = 8 */
movl	$8, -70(%rbp)
/* t86 = t86 + t87 */
movl	-66(%rbp), %eax
movl	-70(%rbp), %edx
addl	%edx, %eax
movl	%eax, -66(%rbp)

/* t88 = 0 */
movl	$0, -74(%rbp)
/* t89 = tauler[t86] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-66(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -78(%rbp)

/* if t89 != t88 then goto e43 */
movl	-78(%rbp), %eax
movl	-74(%rbp), %edx
cmpl	%eax, %edx
jne	e43
/* goto e44 */
jmp	e44
/* e43: skip */
e43:
/* complet = trueConst */
movb	var1, %al
movb	%al, -10(%rbp)

/* goto e45 */
jmp	e45
/* e44: skip */
e44:
/* complet = falseConst */
movb	var2, %al
movb	%al, -10(%rbp)

/* e45: skip */
e45:
/* e46: skip */
e46:
/* t78 = 1 */
movl	$1, -34(%rbp)
/* j = j + t78 */
movl	-30(%rbp), %eax
movl	-34(%rbp), %edx
addl	%edx, %eax
movl	%eax, -30(%rbp)

/* goto e40 */
jmp	e40
/* e47: skip */
e47:
/* t75 = 1 */
movl	$1, -22(%rbp)
/* i = i + t75 */
movl	-18(%rbp), %eax
movl	-22(%rbp), %edx
addl	%edx, %eax
movl	%eax, -18(%rbp)

/* goto e37 */
jmp	e37
/* e48: skip */
e48:
/* if trueConst == complet then goto e49 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e49
/* goto e50 */
jmp	e50
/* e49: skip */
e49:
/* t90 = trueConst */
movb	var1, %al
movb	%al, -79(%rbp)

/* goto e51 */
jmp	e51
/* e50: skip */
e50:
/* t90 = falseConst */
movb	var2, %al
movb	%al, -79(%rbp)

/* e51: skip */
e51:
/* return t90 */
movb	-79(%rbp), %al
movb	%al, 20(%rbp)
addq	$72, %rsp
pop	%rbp
ret
/* e52: skip */
e52:
/* return */
addq	$72, %rsp
pop	%rbp
ret
/* e53: skip */
e53:
/* goto e129 */
jmp	e129
/* e54: skip */
e54:
/* preamble e54 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$256, %rsp
/* if trueConst == trueConst then goto e55 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e55
/* goto e56 */
jmp	e56
/* e55: skip */
e55:
/* t94 = trueConst */
movb	var1, %al
movb	%al, -9(%rbp)

/* goto e57 */
jmp	e57
/* e56: skip */
e56:
/* t94 = falseConst */
movb	var2, %al
movb	%al, -9(%rbp)

/* e57: skip */
e57:
/* victoria = t94 */
movb	-9(%rbp), %al
movb	%al, -10(%rbp)

/* e58: skip */
e58:
/* t96 = 0 */
movl	$0, -14(%rbp)
/* i = t96 */
movl	-14(%rbp), %eax
movl	%eax, -18(%rbp)

/* e59: skip */
e59:
/* if i < n then goto e60 */
movl	-18(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e60
/* goto e66 */
jmp	e66
/* e60: skip */
e60:
/* if trueConst == victoria then goto e61 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e61
/* goto e66 */
jmp	e66
/* e61: skip */
e61:
/* t99 = 4 */
movl	$4, -26(%rbp)
/* t100 = i */
movl	-18(%rbp), %eax
movl	%eax, -30(%rbp)

/* t101 = 1 */
movl	$1, -34(%rbp)
/* t102 = 0 */
movl	$0, -38(%rbp)
/* t103 = tauler[t102] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-38(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -42(%rbp)

/* t101 = t101 * t103 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-34(%rbp), %eax
movl	-42(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -34(%rbp)

/* t104 = t101 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-34(%rbp), %eax
movl	-18(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -46(%rbp)

/* t100 = t100 + t104 */
movl	-30(%rbp), %eax
movl	-46(%rbp), %edx
addl	%edx, %eax
movl	%eax, -30(%rbp)

/* t105 = 4 */
movl	$4, -50(%rbp)
/* t106 = t100 * t105 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-30(%rbp), %eax
movl	-50(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -54(%rbp)

/* t107 = 8 */
movl	$8, -58(%rbp)
/* t106 = t106 + t107 */
movl	-54(%rbp), %eax
movl	-58(%rbp), %edx
addl	%edx, %eax
movl	%eax, -54(%rbp)

/* t108 = tauler[t106] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-54(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -62(%rbp)

/* if t108 == jugador then goto e62 */
movl	-62(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
je	e62
/* goto e63 */
jmp	e63
/* e62: skip */
e62:
/* victoria = trueConst */
movb	var1, %al
movb	%al, -10(%rbp)

/* goto e64 */
jmp	e64
/* e63: skip */
e63:
/* victoria = falseConst */
movb	var2, %al
movb	%al, -10(%rbp)

/* e64: skip */
e64:
/* e65: skip */
e65:
/* t98 = 1 */
movl	$1, -22(%rbp)
/* i = i + t98 */
movl	-18(%rbp), %eax
movl	-22(%rbp), %edx
addl	%edx, %eax
movl	%eax, -18(%rbp)

/* goto e59 */
jmp	e59
/* e66: skip */
e66:
/* if trueConst == victoria then goto e80 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e80
/* goto e67 */
jmp	e67
/* e67: skip */
e67:
/* if trueConst == trueConst then goto e68 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e68
/* goto e69 */
jmp	e69
/* e68: skip */
e68:
/* victoria = trueConst */
movb	var1, %al
movb	%al, -10(%rbp)

/* goto e70 */
jmp	e70
/* e69: skip */
e69:
/* victoria = falseConst */
movb	var2, %al
movb	%al, -10(%rbp)

/* e70: skip */
e70:
/* e71: skip */
e71:
/* t109 = 0 */
movl	$0, -66(%rbp)
/* i = t109 */
movl	-66(%rbp), %eax
movl	%eax, -70(%rbp)

/* e72: skip */
e72:
/* if i < n then goto e73 */
movl	-70(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e73
/* goto e79 */
jmp	e79
/* e73: skip */
e73:
/* if trueConst == victoria then goto e74 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e74
/* goto e79 */
jmp	e79
/* e74: skip */
e74:
/* t112 = n - i */
movl	16(%rbp), %eax
movl	-70(%rbp), %edx
subl	%edx, %eax
movl	%eax, -78(%rbp)

/* t113 = 1 */
movl	$1, -82(%rbp)
/* t114 = t112 - t113 */
movl	-78(%rbp), %eax
movl	-82(%rbp), %edx
subl	%edx, %eax
movl	%eax, -86(%rbp)

/* t115 = 4 */
movl	$4, -90(%rbp)
/* t116 = t114 */
movl	-86(%rbp), %eax
movl	%eax, -94(%rbp)

/* t117 = 1 */
movl	$1, -98(%rbp)
/* t118 = 0 */
movl	$0, -102(%rbp)
/* t119 = tauler[t118] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-102(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -106(%rbp)

/* t117 = t117 * t119 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-98(%rbp), %eax
movl	-106(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -98(%rbp)

/* t120 = t117 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-98(%rbp), %eax
movl	-70(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -110(%rbp)

/* t116 = t116 + t120 */
movl	-94(%rbp), %eax
movl	-110(%rbp), %edx
addl	%edx, %eax
movl	%eax, -94(%rbp)

/* t121 = 4 */
movl	$4, -114(%rbp)
/* t122 = t116 * t121 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-94(%rbp), %eax
movl	-114(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -118(%rbp)

/* t123 = 8 */
movl	$8, -122(%rbp)
/* t122 = t122 + t123 */
movl	-118(%rbp), %eax
movl	-122(%rbp), %edx
addl	%edx, %eax
movl	%eax, -118(%rbp)

/* t124 = tauler[t122] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-118(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -126(%rbp)

/* if t124 == jugador then goto e75 */
movl	-126(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
je	e75
/* goto e76 */
jmp	e76
/* e75: skip */
e75:
/* victoria = trueConst */
movb	var1, %al
movb	%al, -10(%rbp)

/* goto e77 */
jmp	e77
/* e76: skip */
e76:
/* victoria = falseConst */
movb	var2, %al
movb	%al, -10(%rbp)

/* e77: skip */
e77:
/* e78: skip */
e78:
/* t111 = 1 */
movl	$1, -74(%rbp)
/* i = i + t111 */
movl	-70(%rbp), %eax
movl	-74(%rbp), %edx
addl	%edx, %eax
movl	%eax, -70(%rbp)

/* goto e72 */
jmp	e72
/* e79: skip */
e79:
/* goto e80 */
jmp	e80
/* e80: skip */
e80:
/* if trueConst == victoria then goto e102 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e102
/* goto e81 */
jmp	e81
/* e81: skip */
e81:
/* t125 = 0 */
movl	$0, -130(%rbp)
/* i = t125 */
movl	-130(%rbp), %eax
movl	%eax, -134(%rbp)

/* e82: skip */
e82:
/* if i < n then goto e83 */
movl	-134(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e83
/* goto e101 */
jmp	e101
/* e83: skip */
e83:
/* if trueConst == victoria then goto e101 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e101
/* goto e84 */
jmp	e84
/* e84: skip */
e84:
/* if trueConst == trueConst then goto e85 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e85
/* goto e86 */
jmp	e86
/* e85: skip */
e85:
/* t128 = trueConst */
movb	var1, %al
movb	%al, -139(%rbp)

/* goto e87 */
jmp	e87
/* e86: skip */
e86:
/* t128 = falseConst */
movb	var2, %al
movb	%al, -139(%rbp)

/* e87: skip */
e87:
/* tmpFila = t128 */
movb	-139(%rbp), %al
movb	%al, -140(%rbp)

/* e88: skip */
e88:
/* t130 = 0 */
movl	$0, -144(%rbp)
/* j = t130 */
movl	-144(%rbp), %eax
movl	%eax, -148(%rbp)

/* e89: skip */
e89:
/* if j < n then goto e90 */
movl	-148(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e90
/* goto e96 */
jmp	e96
/* e90: skip */
e90:
/* if trueConst == tmpFila then goto e91 */
movb	var1, %al
movb	-140(%rbp), %dl
cmpb	%al, %dl
je	e91
/* goto e96 */
jmp	e96
/* e91: skip */
e91:
/* t133 = 4 */
movl	$4, -156(%rbp)
/* t134 = j */
movl	-148(%rbp), %eax
movl	%eax, -160(%rbp)

/* t135 = 1 */
movl	$1, -164(%rbp)
/* t136 = 0 */
movl	$0, -168(%rbp)
/* t137 = tauler[t136] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-168(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -172(%rbp)

/* t135 = t135 * t137 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-164(%rbp), %eax
movl	-172(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -164(%rbp)

/* t138 = t135 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-164(%rbp), %eax
movl	-134(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -176(%rbp)

/* t134 = t134 + t138 */
movl	-160(%rbp), %eax
movl	-176(%rbp), %edx
addl	%edx, %eax
movl	%eax, -160(%rbp)

/* t139 = 4 */
movl	$4, -180(%rbp)
/* t140 = t134 * t139 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-160(%rbp), %eax
movl	-180(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -184(%rbp)

/* t141 = 8 */
movl	$8, -188(%rbp)
/* t140 = t140 + t141 */
movl	-184(%rbp), %eax
movl	-188(%rbp), %edx
addl	%edx, %eax
movl	%eax, -184(%rbp)

/* t142 = tauler[t140] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-184(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -192(%rbp)

/* if t142 == jugador then goto e92 */
movl	-192(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
je	e92
/* goto e93 */
jmp	e93
/* e92: skip */
e92:
/* tmpFila = trueConst */
movb	var1, %al
movb	%al, -140(%rbp)

/* goto e94 */
jmp	e94
/* e93: skip */
e93:
/* tmpFila = falseConst */
movb	var2, %al
movb	%al, -140(%rbp)

/* e94: skip */
e94:
/* e95: skip */
e95:
/* t132 = 1 */
movl	$1, -152(%rbp)
/* j = j + t132 */
movl	-148(%rbp), %eax
movl	-152(%rbp), %edx
addl	%edx, %eax
movl	%eax, -148(%rbp)

/* goto e89 */
jmp	e89
/* e96: skip */
e96:
/* if trueConst == tmpFila then goto e97 */
movb	var1, %al
movb	-140(%rbp), %dl
cmpb	%al, %dl
je	e97
/* goto e98 */
jmp	e98
/* e97: skip */
e97:
/* victoria = trueConst */
movb	var1, %al
movb	%al, -10(%rbp)

/* goto e99 */
jmp	e99
/* e98: skip */
e98:
/* victoria = falseConst */
movb	var2, %al
movb	%al, -10(%rbp)

/* e99: skip */
e99:
/* e100: skip */
e100:
/* t127 = 1 */
movl	$1, -138(%rbp)
/* i = i + t127 */
movl	-134(%rbp), %eax
movl	-138(%rbp), %edx
addl	%edx, %eax
movl	%eax, -134(%rbp)

/* goto e82 */
jmp	e82
/* e101: skip */
e101:
/* goto e102 */
jmp	e102
/* e102: skip */
e102:
/* if trueConst == victoria then goto e124 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e124
/* goto e103 */
jmp	e103
/* e103: skip */
e103:
/* t143 = 0 */
movl	$0, -196(%rbp)
/* i = t143 */
movl	-196(%rbp), %eax
movl	%eax, -200(%rbp)

/* e104: skip */
e104:
/* if i < n then goto e105 */
movl	-200(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e105
/* goto e123 */
jmp	e123
/* e105: skip */
e105:
/* if trueConst == victoria then goto e123 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e123
/* goto e106 */
jmp	e106
/* e106: skip */
e106:
/* if trueConst == trueConst then goto e107 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e107
/* goto e108 */
jmp	e108
/* e107: skip */
e107:
/* t146 = trueConst */
movb	var1, %al
movb	%al, -205(%rbp)

/* goto e109 */
jmp	e109
/* e108: skip */
e108:
/* t146 = falseConst */
movb	var2, %al
movb	%al, -205(%rbp)

/* e109: skip */
e109:
/* tmpColumna = t146 */
movb	-205(%rbp), %al
movb	%al, -206(%rbp)

/* e110: skip */
e110:
/* t148 = 0 */
movl	$0, -210(%rbp)
/* j = t148 */
movl	-210(%rbp), %eax
movl	%eax, -214(%rbp)

/* e111: skip */
e111:
/* if j < n then goto e112 */
movl	-214(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e112
/* goto e118 */
jmp	e118
/* e112: skip */
e112:
/* if trueConst == tmpColumna then goto e113 */
movb	var1, %al
movb	-206(%rbp), %dl
cmpb	%al, %dl
je	e113
/* goto e118 */
jmp	e118
/* e113: skip */
e113:
/* t151 = 4 */
movl	$4, -222(%rbp)
/* t152 = i */
movl	-200(%rbp), %eax
movl	%eax, -226(%rbp)

/* t153 = 1 */
movl	$1, -230(%rbp)
/* t154 = 0 */
movl	$0, -234(%rbp)
/* t155 = tauler[t154] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-234(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -238(%rbp)

/* t153 = t153 * t155 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-230(%rbp), %eax
movl	-238(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -230(%rbp)

/* t156 = t153 * j */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-230(%rbp), %eax
movl	-214(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -242(%rbp)

/* t152 = t152 + t156 */
movl	-226(%rbp), %eax
movl	-242(%rbp), %edx
addl	%edx, %eax
movl	%eax, -226(%rbp)

/* t157 = 4 */
movl	$4, -246(%rbp)
/* t158 = t152 * t157 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-226(%rbp), %eax
movl	-246(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -250(%rbp)

/* t159 = 8 */
movl	$8, -254(%rbp)
/* t158 = t158 + t159 */
movl	-250(%rbp), %eax
movl	-254(%rbp), %edx
addl	%edx, %eax
movl	%eax, -250(%rbp)

/* t160 = tauler[t158] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-250(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -258(%rbp)

/* if t160 == jugador then goto e114 */
movl	-258(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
je	e114
/* goto e115 */
jmp	e115
/* e114: skip */
e114:
/* tmpColumna = trueConst */
movb	var1, %al
movb	%al, -206(%rbp)

/* goto e116 */
jmp	e116
/* e115: skip */
e115:
/* tmpColumna = falseConst */
movb	var2, %al
movb	%al, -206(%rbp)

/* e116: skip */
e116:
/* e117: skip */
e117:
/* t150 = 1 */
movl	$1, -218(%rbp)
/* j = j + t150 */
movl	-214(%rbp), %eax
movl	-218(%rbp), %edx
addl	%edx, %eax
movl	%eax, -214(%rbp)

/* goto e111 */
jmp	e111
/* e118: skip */
e118:
/* if trueConst == tmpColumna then goto e119 */
movb	var1, %al
movb	-206(%rbp), %dl
cmpb	%al, %dl
je	e119
/* goto e120 */
jmp	e120
/* e119: skip */
e119:
/* victoria = trueConst */
movb	var1, %al
movb	%al, -10(%rbp)

/* goto e121 */
jmp	e121
/* e120: skip */
e120:
/* victoria = falseConst */
movb	var2, %al
movb	%al, -10(%rbp)

/* e121: skip */
e121:
/* e122: skip */
e122:
/* t145 = 1 */
movl	$1, -204(%rbp)
/* i = i + t145 */
movl	-200(%rbp), %eax
movl	-204(%rbp), %edx
addl	%edx, %eax
movl	%eax, -200(%rbp)

/* goto e104 */
jmp	e104
/* e123: skip */
e123:
/* goto e124 */
jmp	e124
/* e124: skip */
e124:
/* if trueConst == victoria then goto e125 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e125
/* goto e126 */
jmp	e126
/* e125: skip */
e125:
/* t161 = trueConst */
movb	var1, %al
movb	%al, -259(%rbp)

/* goto e127 */
jmp	e127
/* e126: skip */
e126:
/* t161 = falseConst */
movb	var2, %al
movb	%al, -259(%rbp)

/* e127: skip */
e127:
/* return t161 */
movb	-259(%rbp), %al
movb	%al, 24(%rbp)
addq	$256, %rsp
pop	%rbp
ret
/* e128: skip */
e128:
/* return */
addq	$256, %rsp
pop	%rbp
ret
/* e129: skip */
e129:
/* goto e137 */
jmp	e137
/* e130: skip */
e130:
/* preamble e130 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$16, %rsp
/*  */
subq	$16, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* t164 = call e32 */
call 	e32
movb	12(%rsp), %al
movb	%al, -9(%rbp)
addq	$16, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if trueConst == t164 then goto e133 */
movb	var1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e133
/* goto e131 */
jmp	e131
/* e131: skip */
e131:
/*  */
subq	$24, %rsp

/* t165 = 1 */
movl	$1, -13(%rbp)
/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param t165 */
movl	-13(%rbp), %eax
movl	%eax, 12(%rsp)
/* t166 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -14(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if trueConst == t166 then goto e133 */
movb	var1, %al
movb	-14(%rbp), %dl
cmpb	%al, %dl
je	e133
/* goto e132 */
jmp	e132
/* e132: skip */
e132:
/*  */
subq	$24, %rsp

/* t167 = 2 */
movl	$2, -18(%rbp)
/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param t167 */
movl	-18(%rbp), %eax
movl	%eax, 12(%rsp)
/* t168 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -19(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if trueConst == t168 then goto e133 */
movb	var1, %al
movb	-19(%rbp), %dl
cmpb	%al, %dl
je	e133
/* goto e134 */
jmp	e134
/* e133: skip */
e133:
/* t169 = trueConst */
movb	var1, %al
movb	%al, -20(%rbp)

/* goto e135 */
jmp	e135
/* e134: skip */
e134:
/* t169 = falseConst */
movb	var2, %al
movb	%al, -20(%rbp)

/* e135: skip */
e135:
/* return t169 */
movb	-20(%rbp), %al
movb	%al, 20(%rbp)
addq	$16, %rsp
pop	%rbp
ret
/* e136: skip */
e136:
/* return */
addq	$16, %rsp
pop	%rbp
ret
/* e137: skip */
e137:
/* goto e148 */
jmp	e148
/* e138: skip */
e138:
/* preamble e138 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$160, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-64(%rbp), %rax
movq	%rax, -64(%rbp)

/* t174 = 4 */
movq	$4, -32(%rbp)
/* t175 = 1 */
movq	$1, -40(%rbp)
/* t175 = t175 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t175 = t175 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t173 = t175 * t174 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movq	-32(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t176 = 8 */
movl	$8, -44(%rbp)
/* t173 = t173 + t176 */
movq	-24(%rbp), %rax
movl	-44(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t172 = malloc t173 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t177 = 0 */
movl	$0, -48(%rbp)
/* t172[t177] = n */
movl	16(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t178 = 4 */
movl	$4, -52(%rbp)
/* t179 = 1 */
movl	$1, -56(%rbp)
/* t172[t178] = t179 */
movl	-56(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t172 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* nouTauler = t172 */
movq	-16(%rbp), %rax
movq	%rax, -64(%rbp)

/* e139: skip */
e139:
/* t181 = 0 */
movl	$0, -68(%rbp)
/* i = t181 */
movl	-68(%rbp), %eax
movl	%eax, -72(%rbp)

/* e140: skip */
e140:
/* if i < n then goto e141 */
movl	-72(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e141
/* goto e146 */
jmp	e146
/* e141: skip */
e141:
/* t184 = 0 */
movl	$0, -80(%rbp)
/* j = t184 */
movl	-80(%rbp), %eax
movl	%eax, -84(%rbp)

/* e142: skip */
e142:
/* if j < n then goto e143 */
movl	-84(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e143
/* goto e145 */
jmp	e145
/* e143: skip */
e143:
/* t187 = 4 */
movl	$4, -92(%rbp)
/* t188 = j */
movl	-84(%rbp), %eax
movl	%eax, -96(%rbp)

/* t189 = 1 */
movl	$1, -100(%rbp)
/* t190 = 0 */
movl	$0, -104(%rbp)
/* t191 = nouTauler[t190] */
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-104(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -108(%rbp)

/* t189 = t189 * t191 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-100(%rbp), %eax
movl	-108(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -100(%rbp)

/* t192 = t189 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-100(%rbp), %eax
movl	-72(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -112(%rbp)

/* t188 = t188 + t192 */
movl	-96(%rbp), %eax
movl	-112(%rbp), %edx
addl	%edx, %eax
movl	%eax, -96(%rbp)

/* t193 = 4 */
movl	$4, -116(%rbp)
/* t194 = t188 * t193 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-96(%rbp), %eax
movl	-116(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -120(%rbp)

/* t195 = 8 */
movl	$8, -124(%rbp)
/* t194 = t194 + t195 */
movl	-120(%rbp), %eax
movl	-124(%rbp), %edx
addl	%edx, %eax
movl	%eax, -120(%rbp)

/* t196 = 4 */
movl	$4, -128(%rbp)
/* t197 = j */
movl	-84(%rbp), %eax
movl	%eax, -132(%rbp)

/* t198 = 1 */
movl	$1, -136(%rbp)
/* t199 = 0 */
movl	$0, -140(%rbp)
/* t200 = tauler[t199] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-140(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -144(%rbp)

/* t198 = t198 * t200 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-136(%rbp), %eax
movl	-144(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -136(%rbp)

/* t201 = t198 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-136(%rbp), %eax
movl	-72(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -148(%rbp)

/* t197 = t197 + t201 */
movl	-132(%rbp), %eax
movl	-148(%rbp), %edx
addl	%edx, %eax
movl	%eax, -132(%rbp)

/* t202 = 4 */
movl	$4, -152(%rbp)
/* t203 = t197 * t202 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-132(%rbp), %eax
movl	-152(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -156(%rbp)

/* t204 = 8 */
movl	$8, -160(%rbp)
/* t203 = t203 + t204 */
movl	-156(%rbp), %eax
movl	-160(%rbp), %edx
addl	%edx, %eax
movl	%eax, -156(%rbp)

/* t205 = tauler[t203] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-156(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -164(%rbp)

/* nouTauler[t194] = t205 */
movl	-164(%rbp), %ecx
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-120(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e144: skip */
e144:
/* t186 = 1 */
movl	$1, -88(%rbp)
/* j = j + t186 */
movl	-84(%rbp), %eax
movl	-88(%rbp), %edx
addl	%edx, %eax
movl	%eax, -84(%rbp)

/* goto e142 */
jmp	e142
/* e145: skip */
e145:
/* t183 = 1 */
movl	$1, -76(%rbp)
/* i = i + t183 */
movl	-72(%rbp), %eax
movl	-76(%rbp), %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* goto e140 */
jmp	e140
/* e146: skip */
e146:
/* return nouTauler */
movq	-64(%rbp), %rax
movq	%rax, 20(%rbp)
addq	$160, %rsp
pop	%rbp
ret
/* e147: skip */
e147:
/* decrement nouTauler */
movq	-64(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$160, %rsp
pop	%rbp
ret
/* e148: skip */
e148:
/* goto e183 */
jmp	e183
/* e149: skip */
e149:
/* t206 = 2 */
movl	$2, var206
/* preamble e149 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$272, %rsp
lea	-143(%rbp), %rax
movq	%rax, -143(%rbp)

lea	-151(%rbp), %rax
movq	%rax, -151(%rbp)

lea	-215(%rbp), %rax
movq	%rax, -207(%rbp)

lea	-231(%rbp), %rax
movq	%rax, -231(%rbp)

/* t212 = 1 */
movl	$1, -12(%rbp)
/* if torn == t212 then goto e150 */
movl	20(%rbp), %eax
movl	-12(%rbp), %edx
cmpl	%eax, %edx
je	e150
/* goto e151 */
jmp	e151
/* e150: skip */
e150:
/* t213 = 2 */
movl	$2, -16(%rbp)
/* t215 = t213 */
movl	-16(%rbp), %eax
movl	%eax, -24(%rbp)

/* goto e152 */
jmp	e152
/* e151: skip */
e151:
/* t214 = 1 */
movl	$1, -20(%rbp)
/* t215 = t214 */
movl	-20(%rbp), %eax
movl	%eax, -24(%rbp)

/* e152: skip */
e152:
/* contrari = t215 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e153: skip */
e153:
/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param torn */
movl	20(%rbp), %eax
movl	%eax, 12(%rsp)
/* t217 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -29(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if trueConst == t217 then goto e154 */
movb	var1, %al
movb	-29(%rbp), %dl
cmpb	%al, %dl
je	e154
/* goto e156 */
jmp	e156
/* e154: skip */
e154:
/* t218 = 10 */
movl	$10, -33(%rbp)
/* return t218 */
movl	-33(%rbp), %eax
movl	%eax, 36(%rbp)
addq	$272, %rsp
pop	%rbp
ret
/* e155: skip */
e155:
/* goto e182 */
jmp	e182
/* e156: skip */
e156:
/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param contrari */
movl	-28(%rbp), %eax
movl	%eax, 12(%rsp)
/* t219 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -34(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if trueConst == t219 then goto e157 */
movb	var1, %al
movb	-34(%rbp), %dl
cmpb	%al, %dl
je	e157
/* goto e159 */
jmp	e159
/* e157: skip */
e157:
/* t220 = 10 */
movl	$10, -38(%rbp)
/* t222 = 0 */
movl	$0, -46(%rbp)
/* t221 = t222 - t220 */
movl	-46(%rbp), %eax
movl	-38(%rbp), %edx
subl	%edx, %eax
movl	%eax, -42(%rbp)

/* return t221 */
movl	-42(%rbp), %eax
movl	%eax, 36(%rbp)
addq	$272, %rsp
pop	%rbp
ret
/* e158: skip */
e158:
/* goto e182 */
jmp	e182
/* e159: skip */
e159:
/*  */
subq	$16, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* t223 = call e32 */
call 	e32
movb	12(%rsp), %al
movb	%al, -47(%rbp)
addq	$16, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if trueConst == t223 then goto e160 */
movb	var1, %al
movb	-47(%rbp), %dl
cmpb	%al, %dl
je	e160
/* goto e162 */
jmp	e162
/* e160: skip */
e160:
/* t224 = 0 */
movl	$0, -51(%rbp)
/* return t224 */
movl	-51(%rbp), %eax
movl	%eax, 36(%rbp)
addq	$272, %rsp
pop	%rbp
ret
/* e161: skip */
e161:
/* goto e182 */
jmp	e182
/* e162: skip */
e162:
/* t225 = 100000 */
movl	$100000, -55(%rbp)
/* t227 = 0 */
movl	$0, -63(%rbp)
/* t226 = t227 - t225 */
movl	-63(%rbp), %eax
movl	-55(%rbp), %edx
subl	%edx, %eax
movl	%eax, -59(%rbp)

/* bestMovement = t226 */
movl	-59(%rbp), %eax
movl	%eax, -67(%rbp)

/* e163: skip */
e163:
/* t229 = 0 */
movl	$0, -71(%rbp)
/* i = t229 */
movl	-71(%rbp), %eax
movl	%eax, -75(%rbp)

/* e164: skip */
e164:
/* if i < n then goto e165 */
movl	-75(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e165
/* goto e180 */
jmp	e180
/* e165: skip */
e165:
/* t232 = 0 */
movl	$0, -83(%rbp)
/* j = t232 */
movl	-83(%rbp), %eax
movl	%eax, -87(%rbp)

/* e166: skip */
e166:
/* if j < n then goto e167 */
movl	-87(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e167
/* goto e179 */
jmp	e179
/* e167: skip */
e167:
/* t235 = 4 */
movl	$4, -95(%rbp)
/* t236 = j */
movl	-87(%rbp), %eax
movl	%eax, -99(%rbp)

/* t237 = 1 */
movl	$1, -103(%rbp)
/* t238 = 0 */
movl	$0, -107(%rbp)
/* t239 = tauler[t238] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-107(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -111(%rbp)

/* t237 = t237 * t239 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-103(%rbp), %eax
movl	-111(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -103(%rbp)

/* t240 = t237 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-103(%rbp), %eax
movl	-75(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -115(%rbp)

/* t236 = t236 + t240 */
movl	-99(%rbp), %eax
movl	-115(%rbp), %edx
addl	%edx, %eax
movl	%eax, -99(%rbp)

/* t241 = 4 */
movl	$4, -119(%rbp)
/* t242 = t236 * t241 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-99(%rbp), %eax
movl	-119(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -123(%rbp)

/* t243 = 8 */
movl	$8, -127(%rbp)
/* t242 = t242 + t243 */
movl	-123(%rbp), %eax
movl	-127(%rbp), %edx
addl	%edx, %eax
movl	%eax, -123(%rbp)

/* t244 = 0 */
movl	$0, -131(%rbp)
/* t245 = tauler[t242] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-123(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -135(%rbp)

/* if t245 == t244 then goto e168 */
movl	-135(%rbp), %eax
movl	-131(%rbp), %edx
cmpl	%eax, %edx
je	e168
/* goto e178 */
jmp	e178
/* e168: skip */
e168:
/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* t246 = call e138 */
call 	e138
movq	12(%rsp), %rax
movq	%rax, -143(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* taulerCopia = t246 */
movq	-143(%rbp), %rax
movq	%rax, -151(%rbp)

/* e169: skip */
e169:
/* t248 = 4 */
movl	$4, -155(%rbp)
/* t249 = j */
movl	-87(%rbp), %eax
movl	%eax, -159(%rbp)

/* t250 = 1 */
movl	$1, -163(%rbp)
/* t251 = 0 */
movl	$0, -167(%rbp)
/* t252 = taulerCopia[t251] */
movq	-151(%rbp), %rax
movq	$0, %rbx
movl	-167(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -171(%rbp)

/* t250 = t250 * t252 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-163(%rbp), %eax
movl	-171(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -163(%rbp)

/* t253 = t250 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-163(%rbp), %eax
movl	-75(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -175(%rbp)

/* t249 = t249 + t253 */
movl	-159(%rbp), %eax
movl	-175(%rbp), %edx
addl	%edx, %eax
movl	%eax, -159(%rbp)

/* t254 = 4 */
movl	$4, -179(%rbp)
/* t255 = t249 * t254 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-159(%rbp), %eax
movl	-179(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -183(%rbp)

/* t256 = 8 */
movl	$8, -187(%rbp)
/* t255 = t255 + t256 */
movl	-183(%rbp), %eax
movl	-187(%rbp), %edx
addl	%edx, %eax
movl	%eax, -183(%rbp)

/* taulerCopia[t255] = torn */
movl	20(%rbp), %ecx
movq	-151(%rbp), %rax
movq	$0, %rbx
movl	-183(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e170: skip */
e170:
/* t257 = 2 */
movl	$2, -191(%rbp)
/* t258 = 0 */
movl	$0, -195(%rbp)
/* t259 = 0 */
movl	$0, -199(%rbp)
/* t261 = 0 */
movl	$0, -219(%rbp)
/* t260[t261] = t258 */
movl	-195(%rbp), %ecx
movq	-207(%rbp), %rax
movq	$0, %rbx
movl	-219(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t262 = 4 */
movl	$4, -223(%rbp)
/* t260[t262] = t259 */
movl	-199(%rbp), %ecx
movq	-207(%rbp), %rax
movq	$0, %rbx
movl	-223(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* aux = t260 */
movq	-207(%rbp), %rax
movq	%rax, -231(%rbp)

/* aux = t260 */
movq	-207(%rbp), %rax
movq	%rax, -231(%rbp)

/* e171: skip */
e171:
/*  */
subq	$32, %rsp

/* t264 = 1 */
movl	$1, -235(%rbp)
/* t265 = moviments + t264 */
movl	32(%rbp), %eax
movl	-235(%rbp), %edx
addl	%edx, %eax
movl	%eax, -239(%rbp)

/* put param taulerCopia */
movq	-151(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment taulerCopia */
movq	-151(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param contrari */
movl	-28(%rbp), %eax
movl	%eax, 12(%rsp)
/* put param aux */
movq	-231(%rbp), %rax
movq	%rax, 16(%rsp)
/* put param t265 */
movl	-239(%rbp), %eax
movl	%eax, 24(%rsp)
/* t266 = call e149 */
call 	e149
movl	28(%rsp), %eax
movl	%eax, -243(%rbp)
addq	$32, %rsp
/* decrement taulerCopia */
movq	-151(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* t268 = 0 */
movl	$0, -251(%rbp)
/* t267 = t268 - t266 */
movl	-251(%rbp), %eax
movl	-243(%rbp), %edx
subl	%edx, %eax
movl	%eax, -247(%rbp)

/* tmp = t267 */
movl	-247(%rbp), %eax
movl	%eax, -255(%rbp)

/* e172: skip */
e172:
/* if tmp > bestMovement then goto e173 */
movl	-255(%rbp), %eax
movl	-67(%rbp), %edx
cmpl	%eax, %edx
jl	e173
/* goto e177 */
jmp	e177
/* e173: skip */
e173:
/* bestMovement = tmp */
movl	-255(%rbp), %eax
movl	%eax, -67(%rbp)

/* e174: skip */
e174:
/* t270 = 0 */
movl	$0, -259(%rbp)
/* t271 = 4 */
movl	$4, -263(%rbp)
/* t272 = t270 * t271 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-259(%rbp), %eax
movl	-263(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -267(%rbp)

/* solucio[t272] = i */
movl	-75(%rbp), %ecx
movq	24(%rbp), %rax
movq	$0, %rbx
movl	-267(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e175: skip */
e175:
/* t273 = 1 */
movl	$1, -271(%rbp)
/* t274 = 4 */
movl	$4, -275(%rbp)
/* t275 = t273 * t274 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-271(%rbp), %eax
movl	-275(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -279(%rbp)

/* solucio[t275] = j */
movl	-87(%rbp), %ecx
movq	24(%rbp), %rax
movq	$0, %rbx
movl	-279(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e176: skip */
e176:
/* goto e177 */
jmp	e177
/* e177: skip */
e177:
/* decrement taulerCopia */
movq	-151(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e178 */
jmp	e178
/* e178: skip */
e178:
/* t234 = 1 */
movl	$1, -91(%rbp)
/* j = j + t234 */
movl	-87(%rbp), %eax
movl	-91(%rbp), %edx
addl	%edx, %eax
movl	%eax, -87(%rbp)

/* goto e166 */
jmp	e166
/* e179: skip */
e179:
/* t231 = 1 */
movl	$1, -79(%rbp)
/* i = i + t231 */
movl	-75(%rbp), %eax
movl	-79(%rbp), %edx
addl	%edx, %eax
movl	%eax, -75(%rbp)

/* goto e164 */
jmp	e164
/* e180: skip */
e180:
/* return bestMovement */
movl	-67(%rbp), %eax
movl	%eax, 36(%rbp)
addq	$272, %rsp
pop	%rbp
ret
/* e181: skip */
e181:
/* e182: skip */
e182:
/* return */
addq	$272, %rsp
pop	%rbp
ret
/* e183: skip */
e183:
/* goto e237 */
jmp	e237
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$1704, %rsp
lea	-58(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-335(%rbp), %rax
movq	%rax, -270(%rbp)

lea	-656(%rbp), %rax
movq	%rax, -656(%rbp)

lea	-664(%rbp), %rax
movq	%rax, -664(%rbp)

lea	-771(%rbp), %rax
movq	%rax, -748(%rbp)

lea	-897(%rbp), %rax
movq	%rax, -891(%rbp)

lea	-923(%rbp), %rax
movq	%rax, -923(%rbp)

lea	-962(%rbp), %rax
movq	%rax, -952(%rbp)

lea	-1022(%rbp), %rax
movq	%rax, -1008(%rbp)

lea	-1104(%rbp), %rax
movq	%rax, -1097(%rbp)

lea	-1155(%rbp), %rax
movq	%rax, -1147(%rbp)

lea	-1171(%rbp), %rax
movq	%rax, -1171(%rbp)

lea	-1179(%rbp), %rax
movq	%rax, -1179(%rbp)

lea	-1187(%rbp), %rax
movq	%rax, -1187(%rbp)

lea	-1300(%rbp), %rax
movq	%rax, -1275(%rbp)

lea	-1457(%rbp), %rax
movq	%rax, -1429(%rbp)

lea	-1684(%rbp), %rax
movq	%rax, -1677(%rbp)

/*  */
subq	$8, %rsp

/* t277 = 1 */
movl	$1, -62(%rbp)
/* t278 = 0 */
movl	$0, -66(%rbp)
/* t276[t278] = t277 */
movl	-62(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-66(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t279 = I */
movb	$73, -67(%rbp)
/* t280 = 4 */
movl	$4, -71(%rbp)
/* t276[t280] = t279 */
movb	-67(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-71(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t281 = n */
movb	$110, -72(%rbp)
/* t282 = 5 */
movl	$5, -76(%rbp)
/* t276[t282] = t281 */
movb	-72(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-76(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t283 = t */
movb	$116, -77(%rbp)
/* t284 = 6 */
movl	$6, -81(%rbp)
/* t276[t284] = t283 */
movb	-77(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-81(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t285 = r */
movb	$114, -82(%rbp)
/* t286 = 7 */
movl	$7, -86(%rbp)
/* t276[t286] = t285 */
movb	-82(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-86(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t287 = o */
movb	$111, -87(%rbp)
/* t288 = 8 */
movl	$8, -91(%rbp)
/* t276[t288] = t287 */
movb	-87(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-91(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t289 = d */
movb	$100, -92(%rbp)
/* t290 = 9 */
movl	$9, -96(%rbp)
/* t276[t290] = t289 */
movb	-92(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-96(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t291 = u */
movb	$117, -97(%rbp)
/* t292 = 10 */
movl	$10, -101(%rbp)
/* t276[t292] = t291 */
movb	-97(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-101(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t293 = e */
movb	$101, -102(%rbp)
/* t294 = 11 */
movl	$11, -106(%rbp)
/* t276[t294] = t293 */
movb	-102(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-106(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t295 = i */
movb	$105, -107(%rbp)
/* t296 = 12 */
movl	$12, -111(%rbp)
/* t276[t296] = t295 */
movb	-107(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-111(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t297 = x */
movb	$120, -112(%rbp)
/* t298 = 13 */
movl	$13, -116(%rbp)
/* t276[t298] = t297 */
movb	-112(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-116(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t299 =   */
movb	$32, -117(%rbp)
/* t300 = 14 */
movl	$14, -121(%rbp)
/* t276[t300] = t299 */
movb	-117(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-121(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t301 = u */
movb	$117, -122(%rbp)
/* t302 = 15 */
movl	$15, -126(%rbp)
/* t276[t302] = t301 */
movb	-122(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-126(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t303 = n */
movb	$110, -127(%rbp)
/* t304 = 16 */
movl	$16, -131(%rbp)
/* t276[t304] = t303 */
movb	-127(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-131(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t305 = a */
movb	$97, -132(%rbp)
/* t306 = 17 */
movl	$17, -136(%rbp)
/* t276[t306] = t305 */
movb	-132(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-136(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t307 =   */
movb	$32, -137(%rbp)
/* t308 = 18 */
movl	$18, -141(%rbp)
/* t276[t308] = t307 */
movb	-137(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-141(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t309 = d */
movb	$100, -142(%rbp)
/* t310 = 19 */
movl	$19, -146(%rbp)
/* t276[t310] = t309 */
movb	-142(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-146(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t311 = i */
movb	$105, -147(%rbp)
/* t312 = 20 */
movl	$20, -151(%rbp)
/* t276[t312] = t311 */
movb	-147(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-151(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t313 = m */
movb	$109, -152(%rbp)
/* t314 = 21 */
movl	$21, -156(%rbp)
/* t276[t314] = t313 */
movb	-152(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-156(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t315 = e */
movb	$101, -157(%rbp)
/* t316 = 22 */
movl	$22, -161(%rbp)
/* t276[t316] = t315 */
movb	-157(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-161(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t317 = n */
movb	$110, -162(%rbp)
/* t318 = 23 */
movl	$23, -166(%rbp)
/* t276[t318] = t317 */
movb	-162(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-166(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t319 = s */
movb	$115, -167(%rbp)
/* t320 = 24 */
movl	$24, -171(%rbp)
/* t276[t320] = t319 */
movb	-167(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-171(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t321 = i */
movb	$105, -172(%rbp)
/* t322 = 25 */
movl	$25, -176(%rbp)
/* t276[t322] = t321 */
movb	-172(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-176(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t323 = Ã */
movb	$-61, -177(%rbp)
/* t324 = 26 */
movl	$26, -181(%rbp)
/* t276[t324] = t323 */
movb	-177(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-181(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t325 = ³ */
movb	$-77, -182(%rbp)
/* t326 = 27 */
movl	$27, -186(%rbp)
/* t276[t326] = t325 */
movb	-182(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-186(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t327 =   */
movb	$32, -187(%rbp)
/* t328 = 28 */
movl	$28, -191(%rbp)
/* t276[t328] = t327 */
movb	-187(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-191(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t329 = d */
movb	$100, -192(%rbp)
/* t330 = 29 */
movl	$29, -196(%rbp)
/* t276[t330] = t329 */
movb	-192(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-196(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t331 = e */
movb	$101, -197(%rbp)
/* t332 = 30 */
movl	$30, -201(%rbp)
/* t276[t332] = t331 */
movb	-197(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-201(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t333 = l */
movb	$108, -202(%rbp)
/* t334 = 31 */
movl	$31, -206(%rbp)
/* t276[t334] = t333 */
movb	-202(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-206(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t335 =   */
movb	$32, -207(%rbp)
/* t336 = 32 */
movl	$32, -211(%rbp)
/* t276[t336] = t335 */
movb	-207(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-211(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t337 = t */
movb	$116, -212(%rbp)
/* t338 = 33 */
movl	$33, -216(%rbp)
/* t276[t338] = t337 */
movb	-212(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-216(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t339 = a */
movb	$97, -217(%rbp)
/* t340 = 34 */
movl	$34, -221(%rbp)
/* t276[t340] = t339 */
movb	-217(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-221(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t341 = u */
movb	$117, -222(%rbp)
/* t342 = 35 */
movl	$35, -226(%rbp)
/* t276[t342] = t341 */
movb	-222(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-226(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t343 = l */
movb	$108, -227(%rbp)
/* t344 = 36 */
movl	$36, -231(%rbp)
/* t276[t344] = t343 */
movb	-227(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-231(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t345 = e */
movb	$101, -232(%rbp)
/* t346 = 37 */
movl	$37, -236(%rbp)
/* t276[t346] = t345 */
movb	-232(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-236(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t347 = r */
movb	$114, -237(%rbp)
/* t348 = 38 */
movl	$38, -241(%rbp)
/* t276[t348] = t347 */
movb	-237(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-241(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t349 = : */
movb	$58, -242(%rbp)
/* t350 = 39 */
movl	$39, -246(%rbp)
/* t276[t350] = t349 */
movb	-242(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-246(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t351 =   */
movb	$32, -247(%rbp)
/* t352 = 40 */
movl	$40, -251(%rbp)
/* t276[t352] = t351 */
movb	-247(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-251(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t353 =   */
movb	$0, -252(%rbp)
/* t354 = 41 */
movl	$41, -256(%rbp)
/* t276[t354] = t353 */
movb	-252(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-256(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t276 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t276 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t276 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e185: skip */
e185:
/*  */
subq	$8, %rsp

/* t355 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -260(%rbp)
addq	$8, %rsp
/* dimensions = t355 */
movl	-260(%rbp), %eax
movl	%eax, var8

/* e186: skip */
e186:
/* if trueConst == falseConst then goto e187 */
movb	var1, %al
movb	var2, %dl
cmpb	%al, %dl
je	e187
/* goto e188 */
jmp	e188
/* e187: skip */
e187:
/* t356 = trueConst */
movb	var1, %al
movb	%al, -261(%rbp)

/* goto e189 */
jmp	e189
/* e188: skip */
e188:
/* t356 = falseConst */
movb	var2, %al
movb	%al, -261(%rbp)

/* e189: skip */
e189:
/* ia = t356 */
movb	-261(%rbp), %al
movb	%al, -262(%rbp)

/* e190: skip */
e190:
/*  */
subq	$8, %rsp

/* t359 = 1 */
movl	$1, -339(%rbp)
/* t360 = 0 */
movl	$0, -343(%rbp)
/* t358[t360] = t359 */
movl	-339(%rbp), %ecx
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-343(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t361 = V */
movb	$86, -344(%rbp)
/* t362 = 4 */
movl	$4, -348(%rbp)
/* t358[t362] = t361 */
movb	-344(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-348(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t363 = o */
movb	$111, -349(%rbp)
/* t364 = 5 */
movl	$5, -353(%rbp)
/* t358[t364] = t363 */
movb	-349(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-353(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t365 = l */
movb	$108, -354(%rbp)
/* t366 = 6 */
movl	$6, -358(%rbp)
/* t358[t366] = t365 */
movb	-354(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-358(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t367 = s */
movb	$115, -359(%rbp)
/* t368 = 7 */
movl	$7, -363(%rbp)
/* t358[t368] = t367 */
movb	-359(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-363(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t369 =   */
movb	$32, -364(%rbp)
/* t370 = 8 */
movl	$8, -368(%rbp)
/* t358[t370] = t369 */
movb	-364(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-368(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t371 = j */
movb	$106, -369(%rbp)
/* t372 = 9 */
movl	$9, -373(%rbp)
/* t358[t372] = t371 */
movb	-369(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-373(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t373 = u */
movb	$117, -374(%rbp)
/* t374 = 10 */
movl	$10, -378(%rbp)
/* t358[t374] = t373 */
movb	-374(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-378(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t375 = g */
movb	$103, -379(%rbp)
/* t376 = 11 */
movl	$11, -383(%rbp)
/* t358[t376] = t375 */
movb	-379(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-383(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t377 = a */
movb	$97, -384(%rbp)
/* t378 = 12 */
movl	$12, -388(%rbp)
/* t358[t378] = t377 */
movb	-384(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-388(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t379 = r */
movb	$114, -389(%rbp)
/* t380 = 13 */
movl	$13, -393(%rbp)
/* t358[t380] = t379 */
movb	-389(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-393(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t381 =   */
movb	$32, -394(%rbp)
/* t382 = 14 */
movl	$14, -398(%rbp)
/* t358[t382] = t381 */
movb	-394(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-398(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t383 = c */
movb	$99, -399(%rbp)
/* t384 = 15 */
movl	$15, -403(%rbp)
/* t358[t384] = t383 */
movb	-399(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-403(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t385 = o */
movb	$111, -404(%rbp)
/* t386 = 16 */
movl	$16, -408(%rbp)
/* t358[t386] = t385 */
movb	-404(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-408(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t387 = n */
movb	$110, -409(%rbp)
/* t388 = 17 */
movl	$17, -413(%rbp)
/* t358[t388] = t387 */
movb	-409(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-413(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t389 = t */
movb	$116, -414(%rbp)
/* t390 = 18 */
movl	$18, -418(%rbp)
/* t358[t390] = t389 */
movb	-414(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-418(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t391 = r */
movb	$114, -419(%rbp)
/* t392 = 19 */
movl	$19, -423(%rbp)
/* t358[t392] = t391 */
movb	-419(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-423(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t393 = a */
movb	$97, -424(%rbp)
/* t394 = 20 */
movl	$20, -428(%rbp)
/* t358[t394] = t393 */
movb	-424(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-428(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t395 =   */
movb	$32, -429(%rbp)
/* t396 = 21 */
movl	$21, -433(%rbp)
/* t358[t396] = t395 */
movb	-429(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-433(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t397 = l */
movb	$108, -434(%rbp)
/* t398 = 22 */
movl	$22, -438(%rbp)
/* t358[t398] = t397 */
movb	-434(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-438(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t399 = a */
movb	$97, -439(%rbp)
/* t400 = 23 */
movl	$23, -443(%rbp)
/* t358[t400] = t399 */
movb	-439(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-443(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t401 =   */
movb	$32, -444(%rbp)
/* t402 = 24 */
movl	$24, -448(%rbp)
/* t358[t402] = t401 */
movb	-444(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-448(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t403 = m */
movb	$109, -449(%rbp)
/* t404 = 25 */
movl	$25, -453(%rbp)
/* t358[t404] = t403 */
movb	-449(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-453(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t405 = Ã */
movb	$-61, -454(%rbp)
/* t406 = 26 */
movl	$26, -458(%rbp)
/* t358[t406] = t405 */
movb	-454(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-458(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t407 =   */
movb	$-96, -459(%rbp)
/* t408 = 27 */
movl	$27, -463(%rbp)
/* t358[t408] = t407 */
movb	-459(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-463(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t409 = q */
movb	$113, -464(%rbp)
/* t410 = 28 */
movl	$28, -468(%rbp)
/* t358[t410] = t409 */
movb	-464(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-468(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t411 = u */
movb	$117, -469(%rbp)
/* t412 = 29 */
movl	$29, -473(%rbp)
/* t358[t412] = t411 */
movb	-469(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-473(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t413 = i */
movb	$105, -474(%rbp)
/* t414 = 30 */
movl	$30, -478(%rbp)
/* t358[t414] = t413 */
movb	-474(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-478(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t415 = n */
movb	$110, -479(%rbp)
/* t416 = 31 */
movl	$31, -483(%rbp)
/* t358[t416] = t415 */
movb	-479(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-483(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t417 = a */
movb	$97, -484(%rbp)
/* t418 = 32 */
movl	$32, -488(%rbp)
/* t358[t418] = t417 */
movb	-484(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-488(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t419 = ? */
movb	$63, -489(%rbp)
/* t420 = 33 */
movl	$33, -493(%rbp)
/* t358[t420] = t419 */
movb	-489(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-493(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t421 =   */
movb	$32, -494(%rbp)
/* t422 = 34 */
movl	$34, -498(%rbp)
/* t358[t422] = t421 */
movb	-494(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-498(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t423 = I */
movb	$73, -499(%rbp)
/* t424 = 35 */
movl	$35, -503(%rbp)
/* t358[t424] = t423 */
movb	-499(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-503(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t425 = n */
movb	$110, -504(%rbp)
/* t426 = 36 */
movl	$36, -508(%rbp)
/* t358[t426] = t425 */
movb	-504(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-508(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t427 = t */
movb	$116, -509(%rbp)
/* t428 = 37 */
movl	$37, -513(%rbp)
/* t358[t428] = t427 */
movb	-509(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-513(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t429 = r */
movb	$114, -514(%rbp)
/* t430 = 38 */
movl	$38, -518(%rbp)
/* t358[t430] = t429 */
movb	-514(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-518(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t431 = o */
movb	$111, -519(%rbp)
/* t432 = 39 */
movl	$39, -523(%rbp)
/* t358[t432] = t431 */
movb	-519(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-523(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t433 = d */
movb	$100, -524(%rbp)
/* t434 = 40 */
movl	$40, -528(%rbp)
/* t358[t434] = t433 */
movb	-524(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-528(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t435 = u */
movb	$117, -529(%rbp)
/* t436 = 41 */
movl	$41, -533(%rbp)
/* t358[t436] = t435 */
movb	-529(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-533(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t437 = e */
movb	$101, -534(%rbp)
/* t438 = 42 */
movl	$42, -538(%rbp)
/* t358[t438] = t437 */
movb	-534(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-538(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t439 = i */
movb	$105, -539(%rbp)
/* t440 = 43 */
movl	$43, -543(%rbp)
/* t358[t440] = t439 */
movb	-539(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-543(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t441 = x */
movb	$120, -544(%rbp)
/* t442 = 44 */
movl	$44, -548(%rbp)
/* t358[t442] = t441 */
movb	-544(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-548(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t443 =   */
movb	$32, -549(%rbp)
/* t444 = 45 */
movl	$45, -553(%rbp)
/* t358[t444] = t443 */
movb	-549(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-553(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t445 = ' */
movb	$39, -554(%rbp)
/* t446 = 46 */
movl	$46, -558(%rbp)
/* t358[t446] = t445 */
movb	-554(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-558(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t447 = S */
movb	$83, -559(%rbp)
/* t448 = 47 */
movl	$47, -563(%rbp)
/* t358[t448] = t447 */
movb	-559(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-563(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t449 = ' */
movb	$39, -564(%rbp)
/* t450 = 48 */
movl	$48, -568(%rbp)
/* t358[t450] = t449 */
movb	-564(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-568(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t451 =   */
movb	$32, -569(%rbp)
/* t452 = 49 */
movl	$49, -573(%rbp)
/* t358[t452] = t451 */
movb	-569(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-573(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t453 = p */
movb	$112, -574(%rbp)
/* t454 = 50 */
movl	$50, -578(%rbp)
/* t358[t454] = t453 */
movb	-574(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-578(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t455 = e */
movb	$101, -579(%rbp)
/* t456 = 51 */
movl	$51, -583(%rbp)
/* t358[t456] = t455 */
movb	-579(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-583(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t457 = r */
movb	$114, -584(%rbp)
/* t458 = 52 */
movl	$52, -588(%rbp)
/* t358[t458] = t457 */
movb	-584(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-588(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t459 =   */
movb	$32, -589(%rbp)
/* t460 = 53 */
movl	$53, -593(%rbp)
/* t358[t460] = t459 */
movb	-589(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-593(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t461 = j */
movb	$106, -594(%rbp)
/* t462 = 54 */
movl	$54, -598(%rbp)
/* t358[t462] = t461 */
movb	-594(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-598(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t463 = u */
movb	$117, -599(%rbp)
/* t464 = 55 */
movl	$55, -603(%rbp)
/* t358[t464] = t463 */
movb	-599(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-603(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t465 = g */
movb	$103, -604(%rbp)
/* t466 = 56 */
movl	$56, -608(%rbp)
/* t358[t466] = t465 */
movb	-604(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-608(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t467 = a */
movb	$97, -609(%rbp)
/* t468 = 57 */
movl	$57, -613(%rbp)
/* t358[t468] = t467 */
movb	-609(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-613(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t469 = r */
movb	$114, -614(%rbp)
/* t470 = 58 */
movl	$58, -618(%rbp)
/* t358[t470] = t469 */
movb	-614(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-618(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t471 = - */
movb	$45, -619(%rbp)
/* t472 = 59 */
movl	$59, -623(%rbp)
/* t358[t472] = t471 */
movb	-619(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-623(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t473 = h */
movb	$104, -624(%rbp)
/* t474 = 60 */
movl	$60, -628(%rbp)
/* t358[t474] = t473 */
movb	-624(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-628(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t475 = i */
movb	$105, -629(%rbp)
/* t476 = 61 */
movl	$61, -633(%rbp)
/* t358[t476] = t475 */
movb	-629(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-633(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t477 = : */
movb	$58, -634(%rbp)
/* t478 = 62 */
movl	$62, -638(%rbp)
/* t358[t478] = t477 */
movb	-634(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-638(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t479 =   */
movb	$32, -639(%rbp)
/* t480 = 63 */
movl	$63, -643(%rbp)
/* t358[t480] = t479 */
movb	-639(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-643(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t481 =   */
movb	$0, -644(%rbp)
/* t482 = 64 */
movl	$64, -648(%rbp)
/* t358[t482] = t481 */
movb	-644(%rbp), %cl
movq	-270(%rbp), %rax
movq	$0, %rbx
movl	-648(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t358 */
movq	-270(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t358 */
movq	-270(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t358 */
movq	-270(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e191: skip */
e191:
/*  */
subq	$8, %rsp

/* t483 = call read */
call 	read
movq	0(%rsp), %rax
movq	%rax, -656(%rbp)
addq	$8, %rsp
/* iaInput = t483 */
movq	-656(%rbp), %rax
movq	%rax, -664(%rbp)

/* e192: skip */
e192:
/* e193: skip */
e193:
/* t486 = 0 */
movl	$0, -672(%rbp)
/* t487 = 1 */
movl	$1, -676(%rbp)
/* t488 = t486 */
movl	-672(%rbp), %eax
movl	%eax, -680(%rbp)

/* t489 = 1 */
movl	$1, -684(%rbp)
/* t490 = 1 */
movl	$1, -688(%rbp)
/* t491 = t488 * t490 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-680(%rbp), %eax
movl	-688(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -692(%rbp)

/* t492 = 4 */
movl	$4, -696(%rbp)
/* t491 = t491 + t492 */
movl	-692(%rbp), %eax
movl	-696(%rbp), %edx
addl	%edx, %eax
movl	%eax, -692(%rbp)

/* t493 = S */
movb	$83, -697(%rbp)
/* t494 = iaInput[t491] */
movq	-664(%rbp), %rax
movq	$0, %rbx
movl	-692(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -698(%rbp)

/* if t494 == t493 then goto e195 */
movb	-698(%rbp), %al
movb	-697(%rbp), %dl
cmpb	%al, %dl
je	e195
/* goto e194 */
jmp	e194
/* e194: skip */
e194:
/* t495 = 0 */
movl	$0, -702(%rbp)
/* t496 = 1 */
movl	$1, -706(%rbp)
/* t497 = t495 */
movl	-702(%rbp), %eax
movl	%eax, -710(%rbp)

/* t498 = 1 */
movl	$1, -714(%rbp)
/* t499 = 1 */
movl	$1, -718(%rbp)
/* t500 = t497 * t499 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-710(%rbp), %eax
movl	-718(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -722(%rbp)

/* t501 = 4 */
movl	$4, -726(%rbp)
/* t500 = t500 + t501 */
movl	-722(%rbp), %eax
movl	-726(%rbp), %edx
addl	%edx, %eax
movl	%eax, -722(%rbp)

/* t502 = s */
movb	$115, -727(%rbp)
/* t503 = iaInput[t500] */
movq	-664(%rbp), %rax
movq	$0, %rbx
movl	-722(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -728(%rbp)

/* if t503 == t502 then goto e195 */
movb	-728(%rbp), %al
movb	-727(%rbp), %dl
cmpb	%al, %dl
je	e195
/* goto e204 */
jmp	e204
/* e195: skip */
e195:
/* if trueConst == trueConst then goto e196 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e196
/* goto e197 */
jmp	e197
/* e196: skip */
e196:
/* ia = trueConst */
movb	var1, %al
movb	%al, -262(%rbp)

/* goto e198 */
jmp	e198
/* e197: skip */
e197:
/* ia = falseConst */
movb	var2, %al
movb	%al, -262(%rbp)

/* e198: skip */
e198:
/* e199: skip */
e199:
/*  */
subq	$16, %rsp

/* t504 = 1 */
movl	$1, -732(%rbp)
/* t505 = 2 */
movl	$2, -736(%rbp)
/* put param t504 */
movl	-732(%rbp), %eax
movl	%eax, 0(%rsp)
/* put param t505 */
movl	-736(%rbp), %eax
movl	%eax, 4(%rsp)
/* t506 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -740(%rbp)
addq	$16, %rsp
/* jugadorLocal = t506 */
movl	-740(%rbp), %eax
movl	%eax, -668(%rbp)

/* e200: skip */
e200:
/*  */
subq	$8, %rsp

/* t508 = 1 */
movl	$1, -775(%rbp)
/* t509 = 0 */
movl	$0, -779(%rbp)
/* t507[t509] = t508 */
movl	-775(%rbp), %ecx
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-779(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t510 = T */
movb	$84, -780(%rbp)
/* t511 = 4 */
movl	$4, -784(%rbp)
/* t507[t511] = t510 */
movb	-780(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-784(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t512 = u */
movb	$117, -785(%rbp)
/* t513 = 5 */
movl	$5, -789(%rbp)
/* t507[t513] = t512 */
movb	-785(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-789(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t514 =   */
movb	$32, -790(%rbp)
/* t515 = 6 */
movl	$6, -794(%rbp)
/* t507[t515] = t514 */
movb	-790(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-794(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t516 = e */
movb	$101, -795(%rbp)
/* t517 = 7 */
movl	$7, -799(%rbp)
/* t507[t517] = t516 */
movb	-795(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-799(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t518 = t */
movb	$116, -800(%rbp)
/* t519 = 8 */
movl	$8, -804(%rbp)
/* t507[t519] = t518 */
movb	-800(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-804(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t520 = s */
movb	$115, -805(%rbp)
/* t521 = 9 */
movl	$9, -809(%rbp)
/* t507[t521] = t520 */
movb	-805(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-809(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t522 =   */
movb	$32, -810(%rbp)
/* t523 = 10 */
movl	$10, -814(%rbp)
/* t507[t523] = t522 */
movb	-810(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-814(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t524 = e */
movb	$101, -815(%rbp)
/* t525 = 11 */
movl	$11, -819(%rbp)
/* t507[t525] = t524 */
movb	-815(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-819(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t526 = l */
movb	$108, -820(%rbp)
/* t527 = 12 */
movl	$12, -824(%rbp)
/* t507[t527] = t526 */
movb	-820(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-824(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t528 =   */
movb	$32, -825(%rbp)
/* t529 = 13 */
movl	$13, -829(%rbp)
/* t507[t529] = t528 */
movb	-825(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-829(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t530 = j */
movb	$106, -830(%rbp)
/* t531 = 14 */
movl	$14, -834(%rbp)
/* t507[t531] = t530 */
movb	-830(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-834(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t532 = u */
movb	$117, -835(%rbp)
/* t533 = 15 */
movl	$15, -839(%rbp)
/* t507[t533] = t532 */
movb	-835(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-839(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t534 = g */
movb	$103, -840(%rbp)
/* t535 = 16 */
movl	$16, -844(%rbp)
/* t507[t535] = t534 */
movb	-840(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-844(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t536 = a */
movb	$97, -845(%rbp)
/* t537 = 17 */
movl	$17, -849(%rbp)
/* t507[t537] = t536 */
movb	-845(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-849(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t538 = d */
movb	$100, -850(%rbp)
/* t539 = 18 */
movl	$18, -854(%rbp)
/* t507[t539] = t538 */
movb	-850(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-854(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t540 = o */
movb	$111, -855(%rbp)
/* t541 = 19 */
movl	$19, -859(%rbp)
/* t507[t541] = t540 */
movb	-855(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-859(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t542 = r */
movb	$114, -860(%rbp)
/* t543 = 20 */
movl	$20, -864(%rbp)
/* t507[t543] = t542 */
movb	-860(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-864(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t544 =   */
movb	$32, -865(%rbp)
/* t545 = 21 */
movl	$21, -869(%rbp)
/* t507[t545] = t544 */
movb	-865(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-869(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t546 =   */
movb	$0, -870(%rbp)
/* t547 = 22 */
movl	$22, -874(%rbp)
/* t507[t547] = t546 */
movb	-870(%rbp), %cl
movq	-748(%rbp), %rax
movq	$0, %rbx
movl	-874(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t507 */
movq	-748(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t507 */
movq	-748(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t507 */
movq	-748(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e201: skip */
e201:
/*  */
subq	$8, %rsp

/* t548 = 1 */
movl	$1, -878(%rbp)
/* t549 = jugadorLocal * t548 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-668(%rbp), %eax
movl	-878(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -882(%rbp)

/* t550 = jugadorsIcona[t549] */
movq	var17, %rax
movq	$0, %rbx
movl	-882(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -883(%rbp)

/* put param t550 */
movb	-883(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e202: skip */
e202:
/*  */
subq	$8, %rsp

/* t552 = 1 */
movl	$1, -901(%rbp)
/* t553 = 0 */
movl	$0, -905(%rbp)
/* t551[t553] = t552 */
movl	-901(%rbp), %ecx
movq	-891(%rbp), %rax
movq	$0, %rbx
movl	-905(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t554 = 
 */
movb	$10, -906(%rbp)
/* t555 = 4 */
movl	$4, -910(%rbp)
/* t551[t555] = t554 */
movb	-906(%rbp), %cl
movq	-891(%rbp), %rax
movq	$0, %rbx
movl	-910(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t556 =   */
movb	$0, -911(%rbp)
/* t557 = 5 */
movl	$5, -915(%rbp)
/* t551[t557] = t556 */
movb	-911(%rbp), %cl
movq	-891(%rbp), %rax
movq	$0, %rbx
movl	-915(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t551 */
movq	-891(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t551 */
movq	-891(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t551 */
movq	-891(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e203: skip */
e203:
/* goto e204 */
jmp	e204
/* e204: skip */
e204:
/*  */
subq	$16, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 0(%rsp)
/* t558 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -923(%rbp)
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* taulerActual = t558 */
movq	-923(%rbp), %rax
movq	%rax, var19

/* e205: skip */
e205:
/*  */
subq	$16, %rsp

/* t559 = 1 */
movl	$1, -927(%rbp)
/* t560 = 2 */
movl	$2, -931(%rbp)
/* put param t559 */
movl	-927(%rbp), %eax
movl	%eax, 0(%rsp)
/* put param t560 */
movl	-931(%rbp), %eax
movl	%eax, 4(%rsp)
/* t561 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -935(%rbp)
addq	$16, %rsp
/* torn = t561 */
movl	-935(%rbp), %eax
movl	%eax, var18

/* e206: skip */
e206:
/* t562 = 1 */
movl	$1, -939(%rbp)
/* numTorns = t562 */
movl	-939(%rbp), %eax
movl	%eax, -943(%rbp)

/* e207: skip */
e207:
/* e208: skip */
e208:
/*  */
subq	$16, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* t564 = call e130 */
call 	e130
movb	12(%rsp), %al
movb	%al, -944(%rbp)
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if trueConst == t564 then goto e235 */
movb	var1, %al
movb	-944(%rbp), %dl
cmpb	%al, %dl
je	e235
/* goto e209 */
jmp	e209
/* e209: skip */
e209:
/*  */
subq	$8, %rsp

/* t566 = 1 */
movl	$1, -966(%rbp)
/* t567 = 0 */
movl	$0, -970(%rbp)
/* t565[t567] = t566 */
movl	-966(%rbp), %ecx
movq	-952(%rbp), %rax
movq	$0, %rbx
movl	-970(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t568 = T */
movb	$84, -971(%rbp)
/* t569 = 4 */
movl	$4, -975(%rbp)
/* t565[t569] = t568 */
movb	-971(%rbp), %cl
movq	-952(%rbp), %rax
movq	$0, %rbx
movl	-975(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t570 = o */
movb	$111, -976(%rbp)
/* t571 = 5 */
movl	$5, -980(%rbp)
/* t565[t571] = t570 */
movb	-976(%rbp), %cl
movq	-952(%rbp), %rax
movq	$0, %rbx
movl	-980(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t572 = r */
movb	$114, -981(%rbp)
/* t573 = 6 */
movl	$6, -985(%rbp)
/* t565[t573] = t572 */
movb	-981(%rbp), %cl
movq	-952(%rbp), %rax
movq	$0, %rbx
movl	-985(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t574 = n */
movb	$110, -986(%rbp)
/* t575 = 7 */
movl	$7, -990(%rbp)
/* t565[t575] = t574 */
movb	-986(%rbp), %cl
movq	-952(%rbp), %rax
movq	$0, %rbx
movl	-990(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t576 =   */
movb	$32, -991(%rbp)
/* t577 = 8 */
movl	$8, -995(%rbp)
/* t565[t577] = t576 */
movb	-991(%rbp), %cl
movq	-952(%rbp), %rax
movq	$0, %rbx
movl	-995(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t578 =   */
movb	$0, -996(%rbp)
/* t579 = 9 */
movl	$9, -1000(%rbp)
/* t565[t579] = t578 */
movb	-996(%rbp), %cl
movq	-952(%rbp), %rax
movq	$0, %rbx
movl	-1000(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t565 */
movq	-952(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t565 */
movq	-952(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t565 */
movq	-952(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e210: skip */
e210:
/*  */
subq	$8, %rsp

/* put param numTorns */
movl	-943(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e211: skip */
e211:
/*  */
subq	$8, %rsp

/* t581 = 1 */
movl	$1, -1026(%rbp)
/* t582 = 0 */
movl	$0, -1030(%rbp)
/* t580[t582] = t581 */
movl	-1026(%rbp), %ecx
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1030(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t583 = . */
movb	$46, -1031(%rbp)
/* t584 = 4 */
movl	$4, -1035(%rbp)
/* t580[t584] = t583 */
movb	-1031(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1035(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t585 =   */
movb	$32, -1036(%rbp)
/* t586 = 5 */
movl	$5, -1040(%rbp)
/* t580[t586] = t585 */
movb	-1036(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1040(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t587 = T */
movb	$84, -1041(%rbp)
/* t588 = 6 */
movl	$6, -1045(%rbp)
/* t580[t588] = t587 */
movb	-1041(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1045(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t589 = o */
movb	$111, -1046(%rbp)
/* t590 = 7 */
movl	$7, -1050(%rbp)
/* t580[t590] = t589 */
movb	-1046(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1050(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t591 = c */
movb	$99, -1051(%rbp)
/* t592 = 8 */
movl	$8, -1055(%rbp)
/* t580[t592] = t591 */
movb	-1051(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1055(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t593 = a */
movb	$97, -1056(%rbp)
/* t594 = 9 */
movl	$9, -1060(%rbp)
/* t580[t594] = t593 */
movb	-1056(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1060(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t595 =   */
movb	$32, -1061(%rbp)
/* t596 = 10 */
movl	$10, -1065(%rbp)
/* t580[t596] = t595 */
movb	-1061(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1065(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t597 = a */
movb	$97, -1066(%rbp)
/* t598 = 11 */
movl	$11, -1070(%rbp)
/* t580[t598] = t597 */
movb	-1066(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1070(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t599 =   */
movb	$32, -1071(%rbp)
/* t600 = 12 */
movl	$12, -1075(%rbp)
/* t580[t600] = t599 */
movb	-1071(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1075(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t601 =   */
movb	$0, -1076(%rbp)
/* t602 = 13 */
movl	$13, -1080(%rbp)
/* t580[t602] = t601 */
movb	-1076(%rbp), %cl
movq	-1008(%rbp), %rax
movq	$0, %rbx
movl	-1080(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t580 */
movq	-1008(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t580 */
movq	-1008(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t580 */
movq	-1008(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e212: skip */
e212:
/*  */
subq	$8, %rsp

/* t603 = 1 */
movl	$1, -1084(%rbp)
/* t604 = torn * t603 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	var18, %eax
movl	-1084(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1088(%rbp)

/* t605 = jugadorsIcona[t604] */
movq	var17, %rax
movq	$0, %rbx
movl	-1088(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -1089(%rbp)

/* put param t605 */
movb	-1089(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e213: skip */
e213:
/*  */
subq	$8, %rsp

/* t607 = 1 */
movl	$1, -1108(%rbp)
/* t608 = 0 */
movl	$0, -1112(%rbp)
/* t606[t608] = t607 */
movl	-1108(%rbp), %ecx
movq	-1097(%rbp), %rax
movq	$0, %rbx
movl	-1112(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t609 = . */
movb	$46, -1113(%rbp)
/* t610 = 4 */
movl	$4, -1117(%rbp)
/* t606[t610] = t609 */
movb	-1113(%rbp), %cl
movq	-1097(%rbp), %rax
movq	$0, %rbx
movl	-1117(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t611 = 
 */
movb	$10, -1118(%rbp)
/* t612 = 5 */
movl	$5, -1122(%rbp)
/* t606[t612] = t611 */
movb	-1118(%rbp), %cl
movq	-1097(%rbp), %rax
movq	$0, %rbx
movl	-1122(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t613 =   */
movb	$0, -1123(%rbp)
/* t614 = 6 */
movl	$6, -1127(%rbp)
/* t606[t614] = t613 */
movb	-1123(%rbp), %cl
movq	-1097(%rbp), %rax
movq	$0, %rbx
movl	-1127(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t606 */
movq	-1097(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t606 */
movq	-1097(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t606 */
movq	-1097(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e214: skip */
e214:
/*  */
subq	$16, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* call e21 */
call 	e21
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e215: skip */
e215:
/* if trueConst == ia then goto e216 */
movb	var1, %al
movb	-262(%rbp), %dl
cmpb	%al, %dl
je	e216
/* goto e222 */
jmp	e222
/* e216: skip */
e216:
/* if torn != jugadorLocal then goto e217 */
movl	var18, %eax
movl	-668(%rbp), %edx
cmpl	%eax, %edx
jne	e217
/* goto e222 */
jmp	e222
/* e217: skip */
e217:
/* t615 = 2 */
movl	$2, -1131(%rbp)
/* t616 = 0 */
movl	$0, -1135(%rbp)
/* t617 = 0 */
movl	$0, -1139(%rbp)
/* t619 = 0 */
movl	$0, -1159(%rbp)
/* t618[t619] = t616 */
movl	-1135(%rbp), %ecx
movq	-1147(%rbp), %rax
movq	$0, %rbx
movl	-1159(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t620 = 4 */
movl	$4, -1163(%rbp)
/* t618[t620] = t617 */
movl	-1139(%rbp), %ecx
movq	-1147(%rbp), %rax
movq	$0, %rbx
movl	-1163(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* best = t618 */
movq	-1147(%rbp), %rax
movq	%rax, -1171(%rbp)

/* best = t618 */
movq	-1147(%rbp), %rax
movq	%rax, -1171(%rbp)

/* e218: skip */
e218:
/*  */
subq	$24, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* t622 = call e138 */
call 	e138
movq	12(%rsp), %rax
movq	%rax, -1179(%rbp)
addq	$24, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* copia = t622 */
movq	-1179(%rbp), %rax
movq	%rax, -1187(%rbp)

/* e219: skip */
e219:
/*  */
subq	$32, %rsp

/* t624 = 0 */
movl	$0, -1191(%rbp)
/* put param copia */
movq	-1187(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment copia */
movq	-1187(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* put param torn */
movl	var18, %eax
movl	%eax, 12(%rsp)
/* put param best */
movq	-1171(%rbp), %rax
movq	%rax, 16(%rsp)
/* put param t624 */
movl	-1191(%rbp), %eax
movl	%eax, 24(%rsp)
/* t625 = call e149 */
call 	e149
movl	28(%rsp), %eax
movl	%eax, -1195(%rbp)
addq	$32, %rsp
/* decrement copia */
movq	-1187(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* score = t625 */
movl	-1195(%rbp), %eax
movl	%eax, -1199(%rbp)

/* e220: skip */
e220:
/* t627 = 0 */
movl	$0, -1203(%rbp)
/* t628 = 4 */
movl	$4, -1207(%rbp)
/* t629 = t627 * t628 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1203(%rbp), %eax
movl	-1207(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1211(%rbp)

/* t630 = 1 */
movl	$1, -1215(%rbp)
/* t631 = 4 */
movl	$4, -1219(%rbp)
/* t632 = t630 * t631 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1215(%rbp), %eax
movl	-1219(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1223(%rbp)

/* t633 = 4 */
movl	$4, -1227(%rbp)
/* t635 = best[t632] */
movq	-1171(%rbp), %rax
movq	$0, %rbx
movl	-1223(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -1235(%rbp)

/* t634 = t635 */
movl	-1235(%rbp), %eax
movl	%eax, -1231(%rbp)

/* t636 = 1 */
movl	$1, -1239(%rbp)
/* t637 = 0 */
movl	$0, -1243(%rbp)
/* t638 = taulerActual[t637] */
movq	var19, %rax
movq	$0, %rbx
movl	-1243(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -1247(%rbp)

/* t636 = t636 * t638 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1239(%rbp), %eax
movl	-1247(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1239(%rbp)

/* t640 = best[t629] */
movq	-1171(%rbp), %rax
movq	$0, %rbx
movl	-1211(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -1255(%rbp)

/* t639 = t636 * t640 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1239(%rbp), %eax
movl	-1255(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1251(%rbp)

/* t634 = t634 + t639 */
movl	-1231(%rbp), %eax
movl	-1251(%rbp), %edx
addl	%edx, %eax
movl	%eax, -1231(%rbp)

/* t641 = 4 */
movl	$4, -1259(%rbp)
/* t642 = t634 * t641 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1231(%rbp), %eax
movl	-1259(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1263(%rbp)

/* t643 = 8 */
movl	$8, -1267(%rbp)
/* t642 = t642 + t643 */
movl	-1263(%rbp), %eax
movl	-1267(%rbp), %edx
addl	%edx, %eax
movl	%eax, -1263(%rbp)

/* taulerActual[t642] = torn */
movl	var18, %ecx
movq	var19, %rax
movq	$0, %rbx
movl	-1263(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e221: skip */
e221:
/* decrement copia */
movq	-1187(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e228 */
jmp	e228
/* e222: skip */
e222:
/*  */
subq	$8, %rsp

/* t645 = 1 */
movl	$1, -1304(%rbp)
/* t646 = 0 */
movl	$0, -1308(%rbp)
/* t644[t646] = t645 */
movl	-1304(%rbp), %ecx
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1308(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t647 = I */
movb	$73, -1309(%rbp)
/* t648 = 4 */
movl	$4, -1313(%rbp)
/* t644[t648] = t647 */
movb	-1309(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1313(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t649 = n */
movb	$110, -1314(%rbp)
/* t650 = 5 */
movl	$5, -1318(%rbp)
/* t644[t650] = t649 */
movb	-1314(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1318(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t651 = t */
movb	$116, -1319(%rbp)
/* t652 = 6 */
movl	$6, -1323(%rbp)
/* t644[t652] = t651 */
movb	-1319(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1323(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t653 = r */
movb	$114, -1324(%rbp)
/* t654 = 7 */
movl	$7, -1328(%rbp)
/* t644[t654] = t653 */
movb	-1324(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1328(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t655 = o */
movb	$111, -1329(%rbp)
/* t656 = 8 */
movl	$8, -1333(%rbp)
/* t644[t656] = t655 */
movb	-1329(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1333(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t657 = d */
movb	$100, -1334(%rbp)
/* t658 = 9 */
movl	$9, -1338(%rbp)
/* t644[t658] = t657 */
movb	-1334(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1338(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t659 = u */
movb	$117, -1339(%rbp)
/* t660 = 10 */
movl	$10, -1343(%rbp)
/* t644[t660] = t659 */
movb	-1339(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1343(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t661 = e */
movb	$101, -1344(%rbp)
/* t662 = 11 */
movl	$11, -1348(%rbp)
/* t644[t662] = t661 */
movb	-1344(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1348(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t663 = i */
movb	$105, -1349(%rbp)
/* t664 = 12 */
movl	$12, -1353(%rbp)
/* t644[t664] = t663 */
movb	-1349(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1353(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t665 = x */
movb	$120, -1354(%rbp)
/* t666 = 13 */
movl	$13, -1358(%rbp)
/* t644[t666] = t665 */
movb	-1354(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1358(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t667 =   */
movb	$32, -1359(%rbp)
/* t668 = 14 */
movl	$14, -1363(%rbp)
/* t644[t668] = t667 */
movb	-1359(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1363(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t669 = l */
movb	$108, -1364(%rbp)
/* t670 = 15 */
movl	$15, -1368(%rbp)
/* t644[t670] = t669 */
movb	-1364(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1368(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t671 = a */
movb	$97, -1369(%rbp)
/* t672 = 16 */
movl	$16, -1373(%rbp)
/* t644[t672] = t671 */
movb	-1369(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1373(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t673 =   */
movb	$32, -1374(%rbp)
/* t674 = 17 */
movl	$17, -1378(%rbp)
/* t644[t674] = t673 */
movb	-1374(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1378(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t675 = f */
movb	$102, -1379(%rbp)
/* t676 = 18 */
movl	$18, -1383(%rbp)
/* t644[t676] = t675 */
movb	-1379(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1383(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t677 = i */
movb	$105, -1384(%rbp)
/* t678 = 19 */
movl	$19, -1388(%rbp)
/* t644[t678] = t677 */
movb	-1384(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1388(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t679 = l */
movb	$108, -1389(%rbp)
/* t680 = 20 */
movl	$20, -1393(%rbp)
/* t644[t680] = t679 */
movb	-1389(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1393(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t681 = a */
movb	$97, -1394(%rbp)
/* t682 = 21 */
movl	$21, -1398(%rbp)
/* t644[t682] = t681 */
movb	-1394(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1398(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t683 = : */
movb	$58, -1399(%rbp)
/* t684 = 22 */
movl	$22, -1403(%rbp)
/* t644[t684] = t683 */
movb	-1399(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1403(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t685 =   */
movb	$32, -1404(%rbp)
/* t686 = 23 */
movl	$23, -1408(%rbp)
/* t644[t686] = t685 */
movb	-1404(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1408(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t687 =   */
movb	$0, -1409(%rbp)
/* t688 = 24 */
movl	$24, -1413(%rbp)
/* t644[t688] = t687 */
movb	-1409(%rbp), %cl
movq	-1275(%rbp), %rax
movq	$0, %rbx
movl	-1413(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t644 */
movq	-1275(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t644 */
movq	-1275(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t644 */
movq	-1275(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e223: skip */
e223:
/*  */
subq	$8, %rsp

/* t689 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -1417(%rbp)
addq	$8, %rsp
/* fila = t689 */
movl	-1417(%rbp), %eax
movl	%eax, -1421(%rbp)

/* e224: skip */
e224:
/*  */
subq	$8, %rsp

/* t692 = 1 */
movl	$1, -1461(%rbp)
/* t693 = 0 */
movl	$0, -1465(%rbp)
/* t691[t693] = t692 */
movl	-1461(%rbp), %ecx
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1465(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t694 = I */
movb	$73, -1466(%rbp)
/* t695 = 4 */
movl	$4, -1470(%rbp)
/* t691[t695] = t694 */
movb	-1466(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1470(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t696 = n */
movb	$110, -1471(%rbp)
/* t697 = 5 */
movl	$5, -1475(%rbp)
/* t691[t697] = t696 */
movb	-1471(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1475(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t698 = t */
movb	$116, -1476(%rbp)
/* t699 = 6 */
movl	$6, -1480(%rbp)
/* t691[t699] = t698 */
movb	-1476(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1480(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t700 = r */
movb	$114, -1481(%rbp)
/* t701 = 7 */
movl	$7, -1485(%rbp)
/* t691[t701] = t700 */
movb	-1481(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1485(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t702 = o */
movb	$111, -1486(%rbp)
/* t703 = 8 */
movl	$8, -1490(%rbp)
/* t691[t703] = t702 */
movb	-1486(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1490(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t704 = d */
movb	$100, -1491(%rbp)
/* t705 = 9 */
movl	$9, -1495(%rbp)
/* t691[t705] = t704 */
movb	-1491(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1495(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t706 = u */
movb	$117, -1496(%rbp)
/* t707 = 10 */
movl	$10, -1500(%rbp)
/* t691[t707] = t706 */
movb	-1496(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1500(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t708 = e */
movb	$101, -1501(%rbp)
/* t709 = 11 */
movl	$11, -1505(%rbp)
/* t691[t709] = t708 */
movb	-1501(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1505(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t710 = i */
movb	$105, -1506(%rbp)
/* t711 = 12 */
movl	$12, -1510(%rbp)
/* t691[t711] = t710 */
movb	-1506(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1510(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t712 = x */
movb	$120, -1511(%rbp)
/* t713 = 13 */
movl	$13, -1515(%rbp)
/* t691[t713] = t712 */
movb	-1511(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1515(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t714 =   */
movb	$32, -1516(%rbp)
/* t715 = 14 */
movl	$14, -1520(%rbp)
/* t691[t715] = t714 */
movb	-1516(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1520(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t716 = l */
movb	$108, -1521(%rbp)
/* t717 = 15 */
movl	$15, -1525(%rbp)
/* t691[t717] = t716 */
movb	-1521(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1525(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t718 = a */
movb	$97, -1526(%rbp)
/* t719 = 16 */
movl	$16, -1530(%rbp)
/* t691[t719] = t718 */
movb	-1526(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1530(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t720 =   */
movb	$32, -1531(%rbp)
/* t721 = 17 */
movl	$17, -1535(%rbp)
/* t691[t721] = t720 */
movb	-1531(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1535(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t722 = c */
movb	$99, -1536(%rbp)
/* t723 = 18 */
movl	$18, -1540(%rbp)
/* t691[t723] = t722 */
movb	-1536(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1540(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t724 = o */
movb	$111, -1541(%rbp)
/* t725 = 19 */
movl	$19, -1545(%rbp)
/* t691[t725] = t724 */
movb	-1541(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1545(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t726 = l */
movb	$108, -1546(%rbp)
/* t727 = 20 */
movl	$20, -1550(%rbp)
/* t691[t727] = t726 */
movb	-1546(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1550(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t728 = u */
movb	$117, -1551(%rbp)
/* t729 = 21 */
movl	$21, -1555(%rbp)
/* t691[t729] = t728 */
movb	-1551(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1555(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t730 = m */
movb	$109, -1556(%rbp)
/* t731 = 22 */
movl	$22, -1560(%rbp)
/* t691[t731] = t730 */
movb	-1556(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1560(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t732 = n */
movb	$110, -1561(%rbp)
/* t733 = 23 */
movl	$23, -1565(%rbp)
/* t691[t733] = t732 */
movb	-1561(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1565(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t734 = a */
movb	$97, -1566(%rbp)
/* t735 = 24 */
movl	$24, -1570(%rbp)
/* t691[t735] = t734 */
movb	-1566(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1570(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t736 = : */
movb	$58, -1571(%rbp)
/* t737 = 25 */
movl	$25, -1575(%rbp)
/* t691[t737] = t736 */
movb	-1571(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1575(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t738 =   */
movb	$32, -1576(%rbp)
/* t739 = 26 */
movl	$26, -1580(%rbp)
/* t691[t739] = t738 */
movb	-1576(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1580(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t740 =   */
movb	$0, -1581(%rbp)
/* t741 = 27 */
movl	$27, -1585(%rbp)
/* t691[t741] = t740 */
movb	-1581(%rbp), %cl
movq	-1429(%rbp), %rax
movq	$0, %rbx
movl	-1585(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t691 */
movq	-1429(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t691 */
movq	-1429(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t691 */
movq	-1429(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e225: skip */
e225:
/*  */
subq	$8, %rsp

/* t742 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -1589(%rbp)
addq	$8, %rsp
/* columna = t742 */
movl	-1589(%rbp), %eax
movl	%eax, -1593(%rbp)

/* e226: skip */
e226:
/* t744 = 1 */
movl	$1, -1597(%rbp)
/* t745 = fila - t744 */
movl	-1421(%rbp), %eax
movl	-1597(%rbp), %edx
subl	%edx, %eax
movl	%eax, -1601(%rbp)

/* t746 = 1 */
movl	$1, -1605(%rbp)
/* t747 = columna - t746 */
movl	-1593(%rbp), %eax
movl	-1605(%rbp), %edx
subl	%edx, %eax
movl	%eax, -1609(%rbp)

/* t748 = 4 */
movl	$4, -1613(%rbp)
/* t749 = t747 */
movl	-1609(%rbp), %eax
movl	%eax, -1617(%rbp)

/* t750 = 1 */
movl	$1, -1621(%rbp)
/* t751 = 0 */
movl	$0, -1625(%rbp)
/* t752 = taulerActual[t751] */
movq	var19, %rax
movq	$0, %rbx
movl	-1625(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -1629(%rbp)

/* t750 = t750 * t752 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1621(%rbp), %eax
movl	-1629(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1621(%rbp)

/* t753 = t750 * t745 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1621(%rbp), %eax
movl	-1601(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1633(%rbp)

/* t749 = t749 + t753 */
movl	-1617(%rbp), %eax
movl	-1633(%rbp), %edx
addl	%edx, %eax
movl	%eax, -1617(%rbp)

/* t754 = 4 */
movl	$4, -1637(%rbp)
/* t755 = t749 * t754 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-1617(%rbp), %eax
movl	-1637(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -1641(%rbp)

/* t756 = 8 */
movl	$8, -1645(%rbp)
/* t755 = t755 + t756 */
movl	-1641(%rbp), %eax
movl	-1645(%rbp), %edx
addl	%edx, %eax
movl	%eax, -1641(%rbp)

/* taulerActual[t755] = torn */
movl	var18, %ecx
movq	var19, %rax
movq	$0, %rbx
movl	-1641(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e227: skip */
e227:
/* e228: skip */
e228:
/* t757 = 1 */
movl	$1, -1649(%rbp)
/* t758 = numTorns + t757 */
movl	-943(%rbp), %eax
movl	-1649(%rbp), %edx
addl	%edx, %eax
movl	%eax, -1653(%rbp)

/* numTorns = t758 */
movl	-1653(%rbp), %eax
movl	%eax, -943(%rbp)

/* e229: skip */
e229:
/* t759 = 1 */
movl	$1, -1657(%rbp)
/* if torn == t759 then goto e230 */
movl	var18, %eax
movl	-1657(%rbp), %edx
cmpl	%eax, %edx
je	e230
/* goto e231 */
jmp	e231
/* e230: skip */
e230:
/* t760 = 2 */
movl	$2, -1661(%rbp)
/* t762 = t760 */
movl	-1661(%rbp), %eax
movl	%eax, -1669(%rbp)

/* goto e232 */
jmp	e232
/* e231: skip */
e231:
/* t761 = 1 */
movl	$1, -1665(%rbp)
/* t762 = t761 */
movl	-1665(%rbp), %eax
movl	%eax, -1669(%rbp)

/* e232: skip */
e232:
/* torn = t762 */
movl	-1669(%rbp), %eax
movl	%eax, var18

/* e233: skip */
e233:
/*  */
subq	$8, %rsp

/* t764 = 1 */
movl	$1, -1688(%rbp)
/* t765 = 0 */
movl	$0, -1692(%rbp)
/* t763[t765] = t764 */
movl	-1688(%rbp), %ecx
movq	-1677(%rbp), %rax
movq	$0, %rbx
movl	-1692(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t766 = 
 */
movb	$10, -1693(%rbp)
/* t767 = 4 */
movl	$4, -1697(%rbp)
/* t763[t767] = t766 */
movb	-1693(%rbp), %cl
movq	-1677(%rbp), %rax
movq	$0, %rbx
movl	-1697(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t768 = 
 */
movb	$10, -1698(%rbp)
/* t769 = 5 */
movl	$5, -1702(%rbp)
/* t763[t769] = t768 */
movb	-1698(%rbp), %cl
movq	-1677(%rbp), %rax
movq	$0, %rbx
movl	-1702(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t770 =   */
movb	$0, -1703(%rbp)
/* t771 = 6 */
movl	$6, -1707(%rbp)
/* t763[t771] = t770 */
movb	-1703(%rbp), %cl
movq	-1677(%rbp), %rax
movq	$0, %rbx
movl	-1707(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t763 */
movq	-1677(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t763 */
movq	-1677(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t763 */
movq	-1677(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e234: skip */
e234:
/* goto e208 */
jmp	e208
/* e235: skip */
e235:
/*  */
subq	$16, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* call e21 */
call 	e21
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e236: skip */
e236:
/* decrement iaInput */
movq	-664(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$1704, %rsp
pop	%rbp
ret
/* e237: skip */
e237:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

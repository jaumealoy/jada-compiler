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
/* t8 = 500 */
movl	$500, var8
/* N = t8 */
movl	var8, %eax
movl	%eax, var9

/* goto e22 */
jmp	e22
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$64, %rsp
/* t11 = 0 */
movl	$0, -12(%rbp)
/* i = t11 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e11: skip */
e11:
/* if i < N then goto e12 */
movl	-16(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e12
/* goto e21 */
jmp	e21
/* e12: skip */
e12:
/* t14 = 0 */
movl	$0, -24(%rbp)
/* j = t14 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e13: skip */
e13:
/* if j < N then goto e14 */
movl	-28(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e14
/* goto e20 */
jmp	e20
/* e14: skip */
e14:
/* if i == j then goto e15 */
movl	-16(%rbp), %eax
movl	-28(%rbp), %edx
cmpl	%eax, %edx
je	e15
/* goto e17 */
jmp	e17
/* e15: skip */
e15:
/* t17 = 4 */
movl	$4, -36(%rbp)
/* t18 = j * t17 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-28(%rbp), %eax
movl	-36(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* t19 = 2000 */
movl	$2000, -44(%rbp)
/* t20 = t19 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-44(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -48(%rbp)

/* t18 = t18 + t20 */
movl	-40(%rbp), %eax
movl	-48(%rbp), %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/* t21 = 1 */
movl	$1, -52(%rbp)
/* matriu[t18] = t21 */
movl	-52(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-40(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e16: skip */
e16:
/* goto e19 */
jmp	e19
/* e17: skip */
e17:
/* t22 = 4 */
movl	$4, -56(%rbp)
/* t23 = j * t22 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-28(%rbp), %eax
movl	-56(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -60(%rbp)

/* t24 = 2000 */
movl	$2000, -64(%rbp)
/* t25 = t24 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-64(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t23 = t23 + t25 */
movl	-60(%rbp), %eax
movl	-68(%rbp), %edx
addl	%edx, %eax
movl	%eax, -60(%rbp)

/* t26 = 0 */
movl	$0, -72(%rbp)
/* matriu[t23] = t26 */
movl	-72(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-60(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e18: skip */
e18:
/* e19: skip */
e19:
/* t16 = 1 */
movl	$1, -32(%rbp)
/* j = j + t16 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* goto e13 */
jmp	e13
/* e20: skip */
e20:
/* t13 = 1 */
movl	$1, -20(%rbp)
/* i = i + t13 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e11 */
jmp	e11
/* e21: skip */
e21:
/* return */
addq	$64, %rsp
pop	%rbp
ret
/* e22: skip */
e22:
/* goto e34 */
jmp	e34
/* e23: skip */
e23:
/* preamble e23 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$168, %rsp
lea	-36(%rbp), %rax
movq	%rax, -16(%rbp)

/*  */
subq	$8, %rsp

/* t29 = 1 */
movl	$1, -40(%rbp)
/* t30 = 0 */
movl	$0, -44(%rbp)
/* t28[t30] = t29 */
movl	-40(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-44(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t31 = P */
movb	$80, -45(%rbp)
/* t32 = 4 */
movl	$4, -49(%rbp)
/* t28[t32] = t31 */
movb	-45(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-49(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t33 = i */
movb	$105, -50(%rbp)
/* t34 = 5 */
movl	$5, -54(%rbp)
/* t28[t34] = t33 */
movb	-50(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-54(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t35 = n */
movb	$110, -55(%rbp)
/* t36 = 6 */
movl	$6, -59(%rbp)
/* t28[t36] = t35 */
movb	-55(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-59(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t37 = t */
movb	$116, -60(%rbp)
/* t38 = 7 */
movl	$7, -64(%rbp)
/* t28[t38] = t37 */
movb	-60(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t39 = a */
movb	$97, -65(%rbp)
/* t40 = 8 */
movl	$8, -69(%rbp)
/* t28[t40] = t39 */
movb	-65(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-69(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t41 = n */
movb	$110, -70(%rbp)
/* t42 = 9 */
movl	$9, -74(%rbp)
/* t28[t42] = t41 */
movb	-70(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-74(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t43 = t */
movb	$116, -75(%rbp)
/* t44 = 10 */
movl	$10, -79(%rbp)
/* t28[t44] = t43 */
movb	-75(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-79(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t45 =   */
movb	$32, -80(%rbp)
/* t46 = 11 */
movl	$11, -84(%rbp)
/* t28[t46] = t45 */
movb	-80(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-84(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t47 = m */
movb	$109, -85(%rbp)
/* t48 = 12 */
movl	$12, -89(%rbp)
/* t28[t48] = t47 */
movb	-85(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-89(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t49 = a */
movb	$97, -90(%rbp)
/* t50 = 13 */
movl	$13, -94(%rbp)
/* t28[t50] = t49 */
movb	-90(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-94(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t51 = t */
movb	$116, -95(%rbp)
/* t52 = 14 */
movl	$14, -99(%rbp)
/* t28[t52] = t51 */
movb	-95(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-99(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t53 = r */
movb	$114, -100(%rbp)
/* t54 = 15 */
movl	$15, -104(%rbp)
/* t28[t54] = t53 */
movb	-100(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-104(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t55 = i */
movb	$105, -105(%rbp)
/* t56 = 16 */
movl	$16, -109(%rbp)
/* t28[t56] = t55 */
movb	-105(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-109(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 = u */
movb	$117, -110(%rbp)
/* t58 = 17 */
movl	$17, -114(%rbp)
/* t28[t58] = t57 */
movb	-110(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-114(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t59 = 
 */
movb	$10, -115(%rbp)
/* t60 = 18 */
movl	$18, -119(%rbp)
/* t28[t60] = t59 */
movb	-115(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-119(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t61 =   */
movb	$0, -120(%rbp)
/* t62 = 19 */
movl	$19, -124(%rbp)
/* t28[t62] = t61 */
movb	-120(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-124(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t28 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t28 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t28 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e24: skip */
e24:
/* t63 = 0 */
movl	$0, -128(%rbp)
/* i = t63 */
movl	-128(%rbp), %eax
movl	%eax, -132(%rbp)

/* e25: skip */
e25:
/* if i < N then goto e26 */
movl	-132(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e26
/* goto e33 */
jmp	e33
/* e26: skip */
e26:
/* t66 = 0 */
movl	$0, -140(%rbp)
/* j = t66 */
movl	-140(%rbp), %eax
movl	%eax, -144(%rbp)

/* e27: skip */
e27:
/* if j < N then goto e28 */
movl	-144(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e28
/* goto e31 */
jmp	e31
/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* t69 = 4 */
movl	$4, -152(%rbp)
/* t70 = j * t69 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-144(%rbp), %eax
movl	-152(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -156(%rbp)

/* t71 = 2000 */
movl	$2000, -160(%rbp)
/* t72 = t71 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-160(%rbp), %eax
movl	-132(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -164(%rbp)

/* t70 = t70 + t72 */
movl	-156(%rbp), %eax
movl	-164(%rbp), %edx
addl	%edx, %eax
movl	%eax, -156(%rbp)

/* t73 = matriu[t70] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-156(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -168(%rbp)

/* put param t73 */
movl	-168(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e29: skip */
e29:
/*  */
subq	$8, %rsp

/* t74 =   */
movb	$32, -169(%rbp)
/* put param t74 */
movb	-169(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e30: skip */
e30:
/* t68 = 1 */
movl	$1, -148(%rbp)
/* j = j + t68 */
movl	-144(%rbp), %eax
movl	-148(%rbp), %edx
addl	%edx, %eax
movl	%eax, -144(%rbp)

/* goto e27 */
jmp	e27
/* e31: skip */
e31:
/*  */
subq	$8, %rsp

/* t75 = 
 */
movb	$10, -170(%rbp)
/* put param t75 */
movb	-170(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e32: skip */
e32:
/* t65 = 1 */
movl	$1, -136(%rbp)
/* i = i + t65 */
movl	-132(%rbp), %eax
movl	-136(%rbp), %edx
addl	%edx, %eax
movl	%eax, -132(%rbp)

/* goto e25 */
jmp	e25
/* e33: skip */
e33:
/* return */
addq	$168, %rsp
pop	%rbp
ret
/* e34: skip */
e34:
/* goto e48 */
jmp	e48
/* e35: skip */
e35:
/* preamble e35 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$104, %rsp
/* t79 = 0 */
movl	$0, -12(%rbp)
/* i = t79 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e36: skip */
e36:
/* if i < N then goto e37 */
movl	-16(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e37
/* goto e47 */
jmp	e47
/* e37: skip */
e37:
/* t82 = 0 */
movl	$0, -24(%rbp)
/* j = t82 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e38: skip */
e38:
/* if j < N then goto e39 */
movl	-28(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e39
/* goto e46 */
jmp	e46
/* e39: skip */
e39:
/* t85 = 0 */
movl	$0, -36(%rbp)
/* suma = t85 */
movl	-36(%rbp), %eax
movl	%eax, -40(%rbp)

/* e40: skip */
e40:
/* t87 = 0 */
movl	$0, -44(%rbp)
/* k = t87 */
movl	-44(%rbp), %eax
movl	%eax, -48(%rbp)

/* e41: skip */
e41:
/* if k < N then goto e42 */
movl	-48(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e42
/* goto e44 */
jmp	e44
/* e42: skip */
e42:
/* t90 = 4 */
movl	$4, -56(%rbp)
/* t91 = k * t90 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-48(%rbp), %eax
movl	-56(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -60(%rbp)

/* t92 = 2000 */
movl	$2000, -64(%rbp)
/* t93 = t92 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-64(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t91 = t91 + t93 */
movl	-60(%rbp), %eax
movl	-68(%rbp), %edx
addl	%edx, %eax
movl	%eax, -60(%rbp)

/* t94 = 4 */
movl	$4, -72(%rbp)
/* t95 = j * t94 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-28(%rbp), %eax
movl	-72(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -76(%rbp)

/* t96 = 2000 */
movl	$2000, -80(%rbp)
/* t97 = t96 * k */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-80(%rbp), %eax
movl	-48(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -84(%rbp)

/* t95 = t95 + t97 */
movl	-76(%rbp), %eax
movl	-84(%rbp), %edx
addl	%edx, %eax
movl	%eax, -76(%rbp)

/* t99 = a[t91] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-60(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -92(%rbp)

/* t100 = b[t95] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-76(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -96(%rbp)

/* t98 = t99 * t100 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-92(%rbp), %eax
movl	-96(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -88(%rbp)

/* suma = suma + t98 */
movl	-40(%rbp), %eax
movl	-88(%rbp), %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/* e43: skip */
e43:
/* t89 = 1 */
movl	$1, -52(%rbp)
/* k = k + t89 */
movl	-48(%rbp), %eax
movl	-52(%rbp), %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* goto e41 */
jmp	e41
/* e44: skip */
e44:
/* t101 = 4 */
movl	$4, -100(%rbp)
/* t102 = j * t101 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-28(%rbp), %eax
movl	-100(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -104(%rbp)

/* t103 = 2000 */
movl	$2000, -108(%rbp)
/* t104 = t103 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-108(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -112(%rbp)

/* t102 = t102 + t104 */
movl	-104(%rbp), %eax
movl	-112(%rbp), %edx
addl	%edx, %eax
movl	%eax, -104(%rbp)

/* resultat[t102] = suma */
movl	-40(%rbp), %ecx
movq	24(%rbp), %rax
movq	$0, %rbx
movl	-104(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e45: skip */
e45:
/* t84 = 1 */
movl	$1, -32(%rbp)
/* j = j + t84 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* goto e38 */
jmp	e38
/* e46: skip */
e46:
/* t81 = 1 */
movl	$1, -20(%rbp)
/* i = i + t81 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e36 */
jmp	e36
/* e47: skip */
e47:
/* return */
addq	$104, %rsp
pop	%rbp
ret
/* e48: skip */
e48:
/* goto e57 */
jmp	e57
/* e49: skip */
e49:
/* preamble e49 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$56, %rsp
/* t106 = 0 */
movl	$0, -12(%rbp)
/* i = t106 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e50: skip */
e50:
/* if i < N then goto e51 */
movl	-16(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e51
/* goto e56 */
jmp	e56
/* e51: skip */
e51:
/* t109 = 0 */
movl	$0, -24(%rbp)
/* j = t109 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e52: skip */
e52:
/* if j < N then goto e53 */
movl	-28(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e53
/* goto e55 */
jmp	e55
/* e53: skip */
e53:
/* t112 = 4 */
movl	$4, -36(%rbp)
/* t113 = j * t112 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-28(%rbp), %eax
movl	-36(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* t114 = 2000 */
movl	$2000, -44(%rbp)
/* t115 = t114 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-44(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -48(%rbp)

/* t113 = t113 + t115 */
movl	-40(%rbp), %eax
movl	-48(%rbp), %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/*  */
subq	$16, %rsp

/* t116 = 0 */
movl	$0, -52(%rbp)
/* t117 = 9 */
movl	$9, -56(%rbp)
/* put param t116 */
movl	-52(%rbp), %eax
movl	%eax, 0(%rsp)
/* put param t117 */
movl	-56(%rbp), %eax
movl	%eax, 4(%rsp)
/* t118 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -60(%rbp)
addq	$16, %rsp
/* a[t113] = t118 */
movl	-60(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-40(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e54: skip */
e54:
/* t111 = 1 */
movl	$1, -32(%rbp)
/* j = j + t111 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* goto e52 */
jmp	e52
/* e55: skip */
e55:
/* t108 = 1 */
movl	$1, -20(%rbp)
/* i = i + t108 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e50 */
jmp	e50
/* e56: skip */
e56:
/* return */
addq	$56, %rsp
pop	%rbp
ret
/* e57: skip */
e57:
/* goto e68 */
jmp	e68
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$3000048, %rsp
lea	-1000024(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-2000040(%rbp), %rax
movq	%rax, -1000032(%rbp)

lea	-3000056(%rbp), %rax
movq	%rax, -2000048(%rbp)

/* e59: skip */
e59:
/*  */
subq	$8, %rsp

/* put param i */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e10 */
call 	e10
addq	$8, %rsp
/* e60: skip */
e60:
/*  */
subq	$8, %rsp

/* put param i */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/* e61: skip */
e61:
/* e62: skip */
e62:
/*  */
subq	$8, %rsp

/* put param i2 */
movq	-1000032(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e49 */
call 	e49
addq	$8, %rsp
/* e63: skip */
e63:
/*  */
subq	$8, %rsp

/* put param i2 */
movq	-1000032(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/* e64: skip */
e64:
/* e65: skip */
e65:
/*  */
subq	$24, %rsp

/* put param i */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* put param i2 */
movq	-1000032(%rbp), %rax
movq	%rax, 8(%rsp)
/* put param resultat */
movq	-2000048(%rbp), %rax
movq	%rax, 16(%rsp)
/* call e35 */
call 	e35
addq	$24, %rsp
/* e66: skip */
e66:
/*  */
subq	$8, %rsp

/* put param resultat */
movq	-2000048(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/* e67: skip */
e67:
/* return */
addq	$3000048, %rsp
pop	%rbp
ret
/* e68: skip */
e68:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

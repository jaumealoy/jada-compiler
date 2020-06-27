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
/* goto e26 */
jmp	e26
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$176, %rsp
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

/* t11 = 4 */
movq	$4, -32(%rbp)
/* t12 = 1 */
movq	$1, -40(%rbp)
/* t12 = t12 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t12 = t12 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t10 = t12 * t11 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movq	-32(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t13 = 8 */
movl	$8, -44(%rbp)
/* t10 = t10 + t13 */
movq	-24(%rbp), %rax
movl	-44(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t9 = malloc t10 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t14 = 0 */
movl	$0, -48(%rbp)
/* t9[t14] = n */
movl	8(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t15 = 4 */
movl	$4, -52(%rbp)
/* t16 = 1 */
movl	$1, -56(%rbp)
/* t9[t15] = t16 */
movl	-56(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t9 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* matriu = t9 */
movq	-16(%rbp), %rax
movq	%rax, -64(%rbp)

/* e11: skip */
e11:
/* k = n */
movl	8(%rbp), %eax
movl	%eax, -68(%rbp)

/* e12: skip */
e12:
/* t19 = 0 */
movl	$0, -72(%rbp)
/* i = t19 */
movl	-72(%rbp), %eax
movl	%eax, -76(%rbp)

/* e13: skip */
e13:
/* if i < n then goto e14 */
movl	-76(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jg	e14
/* goto e24 */
jmp	e24
/* e14: skip */
e14:
/* t22 = 0 */
movl	$0, -84(%rbp)
/* j = t22 */
movl	-84(%rbp), %eax
movl	%eax, -88(%rbp)

/* e15: skip */
e15:
/* if j < n then goto e16 */
movl	-88(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jg	e16
/* goto e23 */
jmp	e23
/* e16: skip */
e16:
/* if i == j then goto e17 */
movl	-76(%rbp), %eax
movl	-88(%rbp), %edx
cmpl	%eax, %edx
je	e17
/* goto e19 */
jmp	e19
/* e17: skip */
e17:
/* t25 = 4 */
movl	$4, -96(%rbp)
/* t26 = j */
movl	-88(%rbp), %eax
movl	%eax, -100(%rbp)

/* t27 = 1 */
movl	$1, -104(%rbp)
/* t28 = 0 */
movl	$0, -108(%rbp)
/* t29 = matriu[t28] */
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-108(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -112(%rbp)

/* t27 = t27 * t29 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-104(%rbp), %eax
movl	-112(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -104(%rbp)

/* t30 = t27 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-104(%rbp), %eax
movl	-76(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -116(%rbp)

/* t26 = t26 + t30 */
movl	-100(%rbp), %eax
movl	-116(%rbp), %edx
addl	%edx, %eax
movl	%eax, -100(%rbp)

/* t31 = 4 */
movl	$4, -120(%rbp)
/* t32 = t26 * t31 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-100(%rbp), %eax
movl	-120(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -124(%rbp)

/* t33 = 8 */
movl	$8, -128(%rbp)
/* t32 = t32 + t33 */
movl	-124(%rbp), %eax
movl	-128(%rbp), %edx
addl	%edx, %eax
movl	%eax, -124(%rbp)

/* t34 = 1 */
movl	$1, -132(%rbp)
/* matriu[t32] = t34 */
movl	-132(%rbp), %ecx
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-124(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e18: skip */
e18:
/* goto e21 */
jmp	e21
/* e19: skip */
e19:
/* t35 = 4 */
movl	$4, -136(%rbp)
/* t36 = j */
movl	-88(%rbp), %eax
movl	%eax, -140(%rbp)

/* t37 = 1 */
movl	$1, -144(%rbp)
/* t38 = 0 */
movl	$0, -148(%rbp)
/* t39 = matriu[t38] */
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-148(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -152(%rbp)

/* t37 = t37 * t39 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-144(%rbp), %eax
movl	-152(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -144(%rbp)

/* t40 = t37 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-144(%rbp), %eax
movl	-76(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -156(%rbp)

/* t36 = t36 + t40 */
movl	-140(%rbp), %eax
movl	-156(%rbp), %edx
addl	%edx, %eax
movl	%eax, -140(%rbp)

/* t41 = 4 */
movl	$4, -160(%rbp)
/* t42 = t36 * t41 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-140(%rbp), %eax
movl	-160(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -164(%rbp)

/* t43 = 8 */
movl	$8, -168(%rbp)
/* t42 = t42 + t43 */
movl	-164(%rbp), %eax
movl	-168(%rbp), %edx
addl	%edx, %eax
movl	%eax, -164(%rbp)

/* t44 = 0 */
movl	$0, -172(%rbp)
/* matriu[t42] = t44 */
movl	-172(%rbp), %ecx
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-164(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e20: skip */
e20:
/* e21: skip */
e21:
/* t45 = 1 */
movl	$1, -176(%rbp)
/* t46 = n + t45 */
movl	8(%rbp), %eax
movl	-176(%rbp), %edx
addl	%edx, %eax
movl	%eax, -180(%rbp)

/* k = t46 */
movl	-180(%rbp), %eax
movl	%eax, -68(%rbp)

/* e22: skip */
e22:
/* t24 = 1 */
movl	$1, -92(%rbp)
/* j = j + t24 */
movl	-88(%rbp), %eax
movl	-92(%rbp), %edx
addl	%edx, %eax
movl	%eax, -88(%rbp)

/* goto e15 */
jmp	e15
/* e23: skip */
e23:
/* t21 = 1 */
movl	$1, -80(%rbp)
/* i = i + t21 */
movl	-76(%rbp), %eax
movl	-80(%rbp), %edx
addl	%edx, %eax
movl	%eax, -76(%rbp)

/* goto e13 */
jmp	e13
/* e24: skip */
e24:
/* return matriu */
movq	-64(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$176, %rsp
pop	%rbp
ret
/* e25: skip */
e25:
/* decrement matriu */
movq	-64(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$176, %rsp
pop	%rbp
ret
/* e26: skip */
e26:
/* goto e38 */
jmp	e38
/* e27: skip */
e27:
/* preamble e27 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$184, %rsp
lea	-36(%rbp), %rax
movq	%rax, -16(%rbp)

/*  */
subq	$8, %rsp

/* t50 = 1 */
movl	$1, -40(%rbp)
/* t51 = 0 */
movl	$0, -44(%rbp)
/* t49[t51] = t50 */
movl	-40(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-44(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t52 = P */
movb	$80, -45(%rbp)
/* t53 = 4 */
movl	$4, -49(%rbp)
/* t49[t53] = t52 */
movb	-45(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-49(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t54 = i */
movb	$105, -50(%rbp)
/* t55 = 5 */
movl	$5, -54(%rbp)
/* t49[t55] = t54 */
movb	-50(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-54(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t56 = n */
movb	$110, -55(%rbp)
/* t57 = 6 */
movl	$6, -59(%rbp)
/* t49[t57] = t56 */
movb	-55(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-59(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t58 = t */
movb	$116, -60(%rbp)
/* t59 = 7 */
movl	$7, -64(%rbp)
/* t49[t59] = t58 */
movb	-60(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t60 = a */
movb	$97, -65(%rbp)
/* t61 = 8 */
movl	$8, -69(%rbp)
/* t49[t61] = t60 */
movb	-65(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-69(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t62 = n */
movb	$110, -70(%rbp)
/* t63 = 9 */
movl	$9, -74(%rbp)
/* t49[t63] = t62 */
movb	-70(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-74(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t64 = t */
movb	$116, -75(%rbp)
/* t65 = 10 */
movl	$10, -79(%rbp)
/* t49[t65] = t64 */
movb	-75(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-79(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t66 =   */
movb	$32, -80(%rbp)
/* t67 = 11 */
movl	$11, -84(%rbp)
/* t49[t67] = t66 */
movb	-80(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-84(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t68 = m */
movb	$109, -85(%rbp)
/* t69 = 12 */
movl	$12, -89(%rbp)
/* t49[t69] = t68 */
movb	-85(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-89(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t70 = a */
movb	$97, -90(%rbp)
/* t71 = 13 */
movl	$13, -94(%rbp)
/* t49[t71] = t70 */
movb	-90(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-94(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t72 = t */
movb	$116, -95(%rbp)
/* t73 = 14 */
movl	$14, -99(%rbp)
/* t49[t73] = t72 */
movb	-95(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-99(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t74 = r */
movb	$114, -100(%rbp)
/* t75 = 15 */
movl	$15, -104(%rbp)
/* t49[t75] = t74 */
movb	-100(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-104(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t76 = i */
movb	$105, -105(%rbp)
/* t77 = 16 */
movl	$16, -109(%rbp)
/* t49[t77] = t76 */
movb	-105(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-109(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t78 = u */
movb	$117, -110(%rbp)
/* t79 = 17 */
movl	$17, -114(%rbp)
/* t49[t79] = t78 */
movb	-110(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-114(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t80 = 
 */
movb	$10, -115(%rbp)
/* t81 = 18 */
movl	$18, -119(%rbp)
/* t49[t81] = t80 */
movb	-115(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-119(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t82 =   */
movb	$0, -120(%rbp)
/* t83 = 19 */
movl	$19, -124(%rbp)
/* t49[t83] = t82 */
movb	-120(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-124(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t49 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t49 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t49 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e28: skip */
e28:
/* t84 = 0 */
movl	$0, -128(%rbp)
/* i = t84 */
movl	-128(%rbp), %eax
movl	%eax, -132(%rbp)

/* e29: skip */
e29:
/* if i < n then goto e30 */
movl	-132(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e30
/* goto e37 */
jmp	e37
/* e30: skip */
e30:
/* t87 = 0 */
movl	$0, -140(%rbp)
/* j = t87 */
movl	-140(%rbp), %eax
movl	%eax, -144(%rbp)

/* e31: skip */
e31:
/* if j < n then goto e32 */
movl	-144(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e32
/* goto e35 */
jmp	e35
/* e32: skip */
e32:
/*  */
subq	$8, %rsp

/* t90 = 4 */
movl	$4, -152(%rbp)
/* t91 = j */
movl	-144(%rbp), %eax
movl	%eax, -156(%rbp)

/* t92 = 1 */
movl	$1, -160(%rbp)
/* t93 = 0 */
movl	$0, -164(%rbp)
/* t94 = matriu[t93] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-164(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -168(%rbp)

/* t92 = t92 * t94 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-160(%rbp), %eax
movl	-168(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -160(%rbp)

/* t95 = t92 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-160(%rbp), %eax
movl	-132(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -172(%rbp)

/* t91 = t91 + t95 */
movl	-156(%rbp), %eax
movl	-172(%rbp), %edx
addl	%edx, %eax
movl	%eax, -156(%rbp)

/* t96 = 4 */
movl	$4, -176(%rbp)
/* t97 = t91 * t96 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-156(%rbp), %eax
movl	-176(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -180(%rbp)

/* t98 = 8 */
movl	$8, -184(%rbp)
/* t97 = t97 + t98 */
movl	-180(%rbp), %eax
movl	-184(%rbp), %edx
addl	%edx, %eax
movl	%eax, -180(%rbp)

/* t99 = matriu[t97] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-180(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -188(%rbp)

/* put param t99 */
movl	-188(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e33: skip */
e33:
/*  */
subq	$8, %rsp

/* t100 =   */
movb	$32, -189(%rbp)
/* put param t100 */
movb	-189(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e34: skip */
e34:
/* t89 = 1 */
movl	$1, -148(%rbp)
/* j = j + t89 */
movl	-144(%rbp), %eax
movl	-148(%rbp), %edx
addl	%edx, %eax
movl	%eax, -144(%rbp)

/* goto e31 */
jmp	e31
/* e35: skip */
e35:
/*  */
subq	$8, %rsp

/* t101 = 
 */
movb	$10, -190(%rbp)
/* put param t101 */
movb	-190(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e36: skip */
e36:
/* t86 = 1 */
movl	$1, -136(%rbp)
/* i = i + t86 */
movl	-132(%rbp), %eax
movl	-136(%rbp), %edx
addl	%edx, %eax
movl	%eax, -132(%rbp)

/* goto e29 */
jmp	e29
/* e37: skip */
e37:
/* return */
addq	$184, %rsp
pop	%rbp
ret
/* e38: skip */
e38:
/* goto e54 */
jmp	e54
/* e39: skip */
e39:
/* preamble e39 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$224, %rsp
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

/* t107 = 4 */
movq	$4, -32(%rbp)
/* t108 = 1 */
movq	$1, -40(%rbp)
/* t108 = t108 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	24(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t108 = t108 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	24(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t106 = t108 * t107 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movq	-32(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t109 = 8 */
movl	$8, -44(%rbp)
/* t106 = t106 + t109 */
movq	-24(%rbp), %rax
movl	-44(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t105 = malloc t106 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t110 = 0 */
movl	$0, -48(%rbp)
/* t105[t110] = n */
movl	24(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t111 = 4 */
movl	$4, -52(%rbp)
/* t112 = 1 */
movl	$1, -56(%rbp)
/* t105[t111] = t112 */
movl	-56(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t105 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* resultat = t105 */
movq	-16(%rbp), %rax
movq	%rax, -64(%rbp)

/* e40: skip */
e40:
/* t114 = 0 */
movl	$0, -68(%rbp)
/* i = t114 */
movl	-68(%rbp), %eax
movl	%eax, -72(%rbp)

/* e41: skip */
e41:
/* if i < n then goto e42 */
movl	-72(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jg	e42
/* goto e52 */
jmp	e52
/* e42: skip */
e42:
/* t117 = 0 */
movl	$0, -80(%rbp)
/* j = t117 */
movl	-80(%rbp), %eax
movl	%eax, -84(%rbp)

/* e43: skip */
e43:
/* if j < n then goto e44 */
movl	-84(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jg	e44
/* goto e51 */
jmp	e51
/* e44: skip */
e44:
/* t120 = 0 */
movl	$0, -92(%rbp)
/* suma = t120 */
movl	-92(%rbp), %eax
movl	%eax, -96(%rbp)

/* e45: skip */
e45:
/* t122 = 0 */
movl	$0, -100(%rbp)
/* k = t122 */
movl	-100(%rbp), %eax
movl	%eax, -104(%rbp)

/* e46: skip */
e46:
/* if k < n then goto e47 */
movl	-104(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jg	e47
/* goto e49 */
jmp	e49
/* e47: skip */
e47:
/* t125 = 4 */
movl	$4, -112(%rbp)
/* t126 = k */
movl	-104(%rbp), %eax
movl	%eax, -116(%rbp)

/* t127 = 1 */
movl	$1, -120(%rbp)
/* t128 = 0 */
movl	$0, -124(%rbp)
/* t129 = a[t128] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-124(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -128(%rbp)

/* t127 = t127 * t129 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-120(%rbp), %eax
movl	-128(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -120(%rbp)

/* t130 = t127 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-120(%rbp), %eax
movl	-72(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -132(%rbp)

/* t126 = t126 + t130 */
movl	-116(%rbp), %eax
movl	-132(%rbp), %edx
addl	%edx, %eax
movl	%eax, -116(%rbp)

/* t131 = 4 */
movl	$4, -136(%rbp)
/* t132 = t126 * t131 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-116(%rbp), %eax
movl	-136(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -140(%rbp)

/* t133 = 8 */
movl	$8, -144(%rbp)
/* t132 = t132 + t133 */
movl	-140(%rbp), %eax
movl	-144(%rbp), %edx
addl	%edx, %eax
movl	%eax, -140(%rbp)

/* t134 = 4 */
movl	$4, -148(%rbp)
/* t135 = j */
movl	-84(%rbp), %eax
movl	%eax, -152(%rbp)

/* t136 = 1 */
movl	$1, -156(%rbp)
/* t137 = 0 */
movl	$0, -160(%rbp)
/* t138 = b[t137] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-160(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -164(%rbp)

/* t136 = t136 * t138 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-156(%rbp), %eax
movl	-164(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -156(%rbp)

/* t139 = t136 * k */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-156(%rbp), %eax
movl	-104(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -168(%rbp)

/* t135 = t135 + t139 */
movl	-152(%rbp), %eax
movl	-168(%rbp), %edx
addl	%edx, %eax
movl	%eax, -152(%rbp)

/* t140 = 4 */
movl	$4, -172(%rbp)
/* t141 = t135 * t140 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-152(%rbp), %eax
movl	-172(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -176(%rbp)

/* t142 = 8 */
movl	$8, -180(%rbp)
/* t141 = t141 + t142 */
movl	-176(%rbp), %eax
movl	-180(%rbp), %edx
addl	%edx, %eax
movl	%eax, -176(%rbp)

/* t144 = a[t132] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-140(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -188(%rbp)

/* t145 = b[t141] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-176(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -192(%rbp)

/* t143 = t144 * t145 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-188(%rbp), %eax
movl	-192(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -184(%rbp)

/* suma = suma + t143 */
movl	-96(%rbp), %eax
movl	-184(%rbp), %edx
addl	%edx, %eax
movl	%eax, -96(%rbp)

/* e48: skip */
e48:
/* t124 = 1 */
movl	$1, -108(%rbp)
/* k = k + t124 */
movl	-104(%rbp), %eax
movl	-108(%rbp), %edx
addl	%edx, %eax
movl	%eax, -104(%rbp)

/* goto e46 */
jmp	e46
/* e49: skip */
e49:
/* t146 = 4 */
movl	$4, -196(%rbp)
/* t147 = j */
movl	-84(%rbp), %eax
movl	%eax, -200(%rbp)

/* t148 = 1 */
movl	$1, -204(%rbp)
/* t149 = 0 */
movl	$0, -208(%rbp)
/* t150 = resultat[t149] */
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-208(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -212(%rbp)

/* t148 = t148 * t150 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-204(%rbp), %eax
movl	-212(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -204(%rbp)

/* t151 = t148 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-204(%rbp), %eax
movl	-72(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -216(%rbp)

/* t147 = t147 + t151 */
movl	-200(%rbp), %eax
movl	-216(%rbp), %edx
addl	%edx, %eax
movl	%eax, -200(%rbp)

/* t152 = 4 */
movl	$4, -220(%rbp)
/* t153 = t147 * t152 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200(%rbp), %eax
movl	-220(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -224(%rbp)

/* t154 = 8 */
movl	$8, -228(%rbp)
/* t153 = t153 + t154 */
movl	-224(%rbp), %eax
movl	-228(%rbp), %edx
addl	%edx, %eax
movl	%eax, -224(%rbp)

/* resultat[t153] = suma */
movl	-96(%rbp), %ecx
movq	-64(%rbp), %rax
movq	$0, %rbx
movl	-224(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e50: skip */
e50:
/* t119 = 1 */
movl	$1, -88(%rbp)
/* j = j + t119 */
movl	-84(%rbp), %eax
movl	-88(%rbp), %edx
addl	%edx, %eax
movl	%eax, -84(%rbp)

/* goto e43 */
jmp	e43
/* e51: skip */
e51:
/* t116 = 1 */
movl	$1, -76(%rbp)
/* i = i + t116 */
movl	-72(%rbp), %eax
movl	-76(%rbp), %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* goto e41 */
jmp	e41
/* e52: skip */
e52:
/* return resultat */
movq	-64(%rbp), %rax
movq	%rax, 28(%rbp)
addq	$224, %rsp
pop	%rbp
ret
/* e53: skip */
e53:
/* decrement resultat */
movq	-64(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$224, %rsp
pop	%rbp
ret
/* e54: skip */
e54:
/* goto e63 */
jmp	e63
/* e55: skip */
e55:
/* preamble e55 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
/* t157 = 0 */
movl	$0, -12(%rbp)
/* i = t157 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e56: skip */
e56:
/* if i < n then goto e57 */
movl	-16(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e57
/* goto e62 */
jmp	e62
/* e57: skip */
e57:
/* t160 = 0 */
movl	$0, -24(%rbp)
/* j = t160 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e58: skip */
e58:
/* if j < n then goto e59 */
movl	-28(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e59
/* goto e61 */
jmp	e61
/* e59: skip */
e59:
/* t163 = 4 */
movl	$4, -36(%rbp)
/* t164 = j */
movl	-28(%rbp), %eax
movl	%eax, -40(%rbp)

/* t165 = 1 */
movl	$1, -44(%rbp)
/* t166 = 0 */
movl	$0, -48(%rbp)
/* t167 = a[t166] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -52(%rbp)

/* t165 = t165 * t167 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-44(%rbp), %eax
movl	-52(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -44(%rbp)

/* t168 = t165 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-44(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -56(%rbp)

/* t164 = t164 + t168 */
movl	-40(%rbp), %eax
movl	-56(%rbp), %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/* t169 = 4 */
movl	$4, -60(%rbp)
/* t170 = t164 * t169 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-40(%rbp), %eax
movl	-60(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t171 = 8 */
movl	$8, -68(%rbp)
/* t170 = t170 + t171 */
movl	-64(%rbp), %eax
movl	-68(%rbp), %edx
addl	%edx, %eax
movl	%eax, -64(%rbp)

/*  */
subq	$16, %rsp

/* t172 = 0 */
movl	$0, -72(%rbp)
/* t173 = 9 */
movl	$9, -76(%rbp)
/* put param t172 */
movl	-72(%rbp), %eax
movl	%eax, 0(%rsp)
/* put param t173 */
movl	-76(%rbp), %eax
movl	%eax, 4(%rsp)
/* t174 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -80(%rbp)
addq	$16, %rsp
/* a[t170] = t174 */
movl	-80(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e60: skip */
e60:
/* t162 = 1 */
movl	$1, -32(%rbp)
/* j = j + t162 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* goto e58 */
jmp	e58
/* e61: skip */
e61:
/* t159 = 1 */
movl	$1, -20(%rbp)
/* i = i + t159 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e56 */
jmp	e56
/* e62: skip */
e62:
/* return */
addq	$72, %rsp
pop	%rbp
ret
/* e63: skip */
e63:
/* goto e74 */
jmp	e74
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$360, %rsp
lea	-67(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-326(%rbp), %rax
movq	%rax, -326(%rbp)

lea	-334(%rbp), %rax
movq	%rax, -334(%rbp)

lea	-342(%rbp), %rax
movq	%rax, -342(%rbp)

lea	-350(%rbp), %rax
movq	%rax, -350(%rbp)

lea	-358(%rbp), %rax
movq	%rax, -358(%rbp)

lea	-366(%rbp), %rax
movq	%rax, -366(%rbp)

/*  */
subq	$8, %rsp

/* t176 = 1 */
movl	$1, -71(%rbp)
/* t177 = 0 */
movl	$0, -75(%rbp)
/* t175[t177] = t176 */
movl	-71(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-75(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t178 = I */
movb	$73, -76(%rbp)
/* t179 = 4 */
movl	$4, -80(%rbp)
/* t175[t179] = t178 */
movb	-76(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-80(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t180 = n */
movb	$110, -81(%rbp)
/* t181 = 5 */
movl	$5, -85(%rbp)
/* t175[t181] = t180 */
movb	-81(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-85(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t182 = t */
movb	$116, -86(%rbp)
/* t183 = 6 */
movl	$6, -90(%rbp)
/* t175[t183] = t182 */
movb	-86(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-90(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t184 = r */
movb	$114, -91(%rbp)
/* t185 = 7 */
movl	$7, -95(%rbp)
/* t175[t185] = t184 */
movb	-91(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-95(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t186 = o */
movb	$111, -96(%rbp)
/* t187 = 8 */
movl	$8, -100(%rbp)
/* t175[t187] = t186 */
movb	-96(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-100(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t188 = d */
movb	$100, -101(%rbp)
/* t189 = 9 */
movl	$9, -105(%rbp)
/* t175[t189] = t188 */
movb	-101(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-105(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t190 = u */
movb	$117, -106(%rbp)
/* t191 = 10 */
movl	$10, -110(%rbp)
/* t175[t191] = t190 */
movb	-106(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-110(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t192 = e */
movb	$101, -111(%rbp)
/* t193 = 11 */
movl	$11, -115(%rbp)
/* t175[t193] = t192 */
movb	-111(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-115(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t194 = i */
movb	$105, -116(%rbp)
/* t195 = 12 */
movl	$12, -120(%rbp)
/* t175[t195] = t194 */
movb	-116(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-120(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t196 = x */
movb	$120, -121(%rbp)
/* t197 = 13 */
movl	$13, -125(%rbp)
/* t175[t197] = t196 */
movb	-121(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-125(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t198 =   */
movb	$32, -126(%rbp)
/* t199 = 14 */
movl	$14, -130(%rbp)
/* t175[t199] = t198 */
movb	-126(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-130(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t200 = l */
movb	$108, -131(%rbp)
/* t201 = 15 */
movl	$15, -135(%rbp)
/* t175[t201] = t200 */
movb	-131(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-135(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t202 = e */
movb	$101, -136(%rbp)
/* t203 = 16 */
movl	$16, -140(%rbp)
/* t175[t203] = t202 */
movb	-136(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-140(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t204 = s */
movb	$115, -141(%rbp)
/* t205 = 17 */
movl	$17, -145(%rbp)
/* t175[t205] = t204 */
movb	-141(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-145(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t206 =   */
movb	$32, -146(%rbp)
/* t207 = 18 */
movl	$18, -150(%rbp)
/* t175[t207] = t206 */
movb	-146(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-150(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t208 = d */
movb	$100, -151(%rbp)
/* t209 = 19 */
movl	$19, -155(%rbp)
/* t175[t209] = t208 */
movb	-151(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-155(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t210 = i */
movb	$105, -156(%rbp)
/* t211 = 20 */
movl	$20, -160(%rbp)
/* t175[t211] = t210 */
movb	-156(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-160(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t212 = m */
movb	$109, -161(%rbp)
/* t213 = 21 */
movl	$21, -165(%rbp)
/* t175[t213] = t212 */
movb	-161(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-165(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t214 = e */
movb	$101, -166(%rbp)
/* t215 = 22 */
movl	$22, -170(%rbp)
/* t175[t215] = t214 */
movb	-166(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-170(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t216 = n */
movb	$110, -171(%rbp)
/* t217 = 23 */
movl	$23, -175(%rbp)
/* t175[t217] = t216 */
movb	-171(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-175(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t218 = s */
movb	$115, -176(%rbp)
/* t219 = 24 */
movl	$24, -180(%rbp)
/* t175[t219] = t218 */
movb	-176(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-180(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t220 = i */
movb	$105, -181(%rbp)
/* t221 = 25 */
movl	$25, -185(%rbp)
/* t175[t221] = t220 */
movb	-181(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-185(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t222 = o */
movb	$111, -186(%rbp)
/* t223 = 26 */
movl	$26, -190(%rbp)
/* t175[t223] = t222 */
movb	-186(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-190(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t224 = n */
movb	$110, -191(%rbp)
/* t225 = 27 */
movl	$27, -195(%rbp)
/* t175[t225] = t224 */
movb	-191(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-195(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t226 = s */
movb	$115, -196(%rbp)
/* t227 = 28 */
movl	$28, -200(%rbp)
/* t175[t227] = t226 */
movb	-196(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t228 =   */
movb	$32, -201(%rbp)
/* t229 = 29 */
movl	$29, -205(%rbp)
/* t175[t229] = t228 */
movb	-201(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-205(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t230 = d */
movb	$100, -206(%rbp)
/* t231 = 30 */
movl	$30, -210(%rbp)
/* t175[t231] = t230 */
movb	-206(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-210(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t232 = e */
movb	$101, -211(%rbp)
/* t233 = 31 */
movl	$31, -215(%rbp)
/* t175[t233] = t232 */
movb	-211(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-215(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t234 =   */
movb	$32, -216(%rbp)
/* t235 = 32 */
movl	$32, -220(%rbp)
/* t175[t235] = t234 */
movb	-216(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-220(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t236 = l */
movb	$108, -221(%rbp)
/* t237 = 33 */
movl	$33, -225(%rbp)
/* t175[t237] = t236 */
movb	-221(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-225(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t238 = a */
movb	$97, -226(%rbp)
/* t239 = 34 */
movl	$34, -230(%rbp)
/* t175[t239] = t238 */
movb	-226(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-230(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t240 =   */
movb	$32, -231(%rbp)
/* t241 = 35 */
movl	$35, -235(%rbp)
/* t175[t241] = t240 */
movb	-231(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-235(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t242 = m */
movb	$109, -236(%rbp)
/* t243 = 36 */
movl	$36, -240(%rbp)
/* t175[t243] = t242 */
movb	-236(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-240(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t244 = a */
movb	$97, -241(%rbp)
/* t245 = 37 */
movl	$37, -245(%rbp)
/* t175[t245] = t244 */
movb	-241(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-245(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t246 = t */
movb	$116, -246(%rbp)
/* t247 = 38 */
movl	$38, -250(%rbp)
/* t175[t247] = t246 */
movb	-246(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-250(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t248 = r */
movb	$114, -251(%rbp)
/* t249 = 39 */
movl	$39, -255(%rbp)
/* t175[t249] = t248 */
movb	-251(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-255(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t250 = i */
movb	$105, -256(%rbp)
/* t251 = 40 */
movl	$40, -260(%rbp)
/* t175[t251] = t250 */
movb	-256(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-260(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t252 = u */
movb	$117, -261(%rbp)
/* t253 = 41 */
movl	$41, -265(%rbp)
/* t175[t253] = t252 */
movb	-261(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-265(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t254 =   */
movb	$32, -266(%rbp)
/* t255 = 42 */
movl	$42, -270(%rbp)
/* t175[t255] = t254 */
movb	-266(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-270(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t256 = ( */
movb	$40, -271(%rbp)
/* t257 = 43 */
movl	$43, -275(%rbp)
/* t175[t257] = t256 */
movb	-271(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-275(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t258 = N */
movb	$78, -276(%rbp)
/* t259 = 44 */
movl	$44, -280(%rbp)
/* t175[t259] = t258 */
movb	-276(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-280(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t260 = x */
movb	$120, -281(%rbp)
/* t261 = 45 */
movl	$45, -285(%rbp)
/* t175[t261] = t260 */
movb	-281(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-285(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t262 = N */
movb	$78, -286(%rbp)
/* t263 = 46 */
movl	$46, -290(%rbp)
/* t175[t263] = t262 */
movb	-286(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-290(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t264 = ) */
movb	$41, -291(%rbp)
/* t265 = 47 */
movl	$47, -295(%rbp)
/* t175[t265] = t264 */
movb	-291(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-295(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t266 = : */
movb	$58, -296(%rbp)
/* t267 = 48 */
movl	$48, -300(%rbp)
/* t175[t267] = t266 */
movb	-296(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-300(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t268 =   */
movb	$32, -301(%rbp)
/* t269 = 49 */
movl	$49, -305(%rbp)
/* t175[t269] = t268 */
movb	-301(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-305(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t270 =   */
movb	$0, -306(%rbp)
/* t271 = 50 */
movl	$50, -310(%rbp)
/* t175[t271] = t270 */
movb	-306(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-310(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t175 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t175 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t175 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e65: skip */
e65:
/* t272 = 500 */
movl	$500, -314(%rbp)
/* n = t272 */
movl	-314(%rbp), %eax
movl	%eax, -318(%rbp)

/* e66: skip */
e66:
/*  */
subq	$16, %rsp

/* put param n */
movl	-318(%rbp), %eax
movl	%eax, 0(%rsp)
/* t274 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -326(%rbp)
addq	$16, %rsp
/* i = t274 */
movq	-326(%rbp), %rax
movq	%rax, -334(%rbp)

/* e67: skip */
e67:
/*  */
subq	$16, %rsp

/* put param i */
movq	-334(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i */
movq	-334(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-318(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e27 */
call 	e27
addq	$16, %rsp
/* decrement i */
movq	-334(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e68: skip */
e68:
/*  */
subq	$16, %rsp

/* put param n */
movl	-318(%rbp), %eax
movl	%eax, 0(%rsp)
/* t276 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -342(%rbp)
addq	$16, %rsp
/* i2 = t276 */
movq	-342(%rbp), %rax
movq	%rax, -350(%rbp)

/* e69: skip */
e69:
/*  */
subq	$16, %rsp

/* put param i2 */
movq	-350(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i2 */
movq	-350(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-318(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e55 */
call 	e55
addq	$16, %rsp
/* decrement i2 */
movq	-350(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e70: skip */
e70:
/*  */
subq	$16, %rsp

/* put param i2 */
movq	-350(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i2 */
movq	-350(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-318(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e27 */
call 	e27
addq	$16, %rsp
/* decrement i2 */
movq	-350(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e71: skip */
e71:
/*  */
subq	$32, %rsp

/* put param i */
movq	-334(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i */
movq	-334(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param i2 */
movq	-350(%rbp), %rax
movq	%rax, 8(%rsp)
/* increment i2 */
movq	-350(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-318(%rbp), %eax
movl	%eax, 16(%rsp)
/* t278 = call e39 */
call 	e39
movq	20(%rsp), %rax
movq	%rax, -358(%rbp)
addq	$32, %rsp
/* decrement i */
movq	-334(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement i2 */
movq	-350(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* resultat = t278 */
movq	-358(%rbp), %rax
movq	%rax, -366(%rbp)

/* e72: skip */
e72:
/*  */
subq	$16, %rsp

/* put param resultat */
movq	-366(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment resultat */
movq	-366(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-318(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e27 */
call 	e27
addq	$16, %rsp
/* decrement resultat */
movq	-366(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e73: skip */
e73:
/* decrement i */
movq	-334(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement i2 */
movq	-350(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement resultat */
movq	-366(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$360, %rsp
pop	%rbp
ret
/* e74: skip */
e74:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

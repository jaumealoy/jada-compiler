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
/* goto e12 */
jmp	e12
/* malUs: skip */
malUs:
/* preamble malUs */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$88, %rsp
lea	-31(%rbp), %rax
movq	%rax, -16(%rbp)

/* t9 = 1 */
movl	$1, -35(%rbp)
/* t10 = 0 */
movl	$0, -39(%rbp)
/* t8[t10] = t9 */
movl	-35(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-39(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t11 = C */
movb	$67, -40(%rbp)
/* t12 = 4 */
movl	$4, -44(%rbp)
/* t8[t12] = t11 */
movb	-40(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-44(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t13 = o */
movb	$111, -45(%rbp)
/* t14 = 5 */
movl	$5, -49(%rbp)
/* t8[t14] = t13 */
movb	-45(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-49(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t15 = r */
movb	$114, -50(%rbp)
/* t16 = 6 */
movl	$6, -54(%rbp)
/* t8[t16] = t15 */
movb	-50(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-54(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t17 = r */
movb	$114, -55(%rbp)
/* t18 = 7 */
movl	$7, -59(%rbp)
/* t8[t18] = t17 */
movb	-55(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-59(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t19 = e */
movb	$101, -60(%rbp)
/* t20 = 8 */
movl	$8, -64(%rbp)
/* t8[t20] = t19 */
movb	-60(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t21 = c */
movb	$99, -65(%rbp)
/* t22 = 9 */
movl	$9, -69(%rbp)
/* t8[t22] = t21 */
movb	-65(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-69(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t23 = t */
movb	$116, -70(%rbp)
/* t24 = 10 */
movl	$10, -74(%rbp)
/* t8[t24] = t23 */
movb	-70(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-74(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t25 = e */
movb	$101, -75(%rbp)
/* t26 = 11 */
movl	$11, -79(%rbp)
/* t8[t26] = t25 */
movb	-75(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-79(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t27 = ? */
movb	$63, -80(%rbp)
/* t28 = 12 */
movl	$12, -84(%rbp)
/* t8[t28] = t27 */
movb	-80(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-84(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t29 = 
 */
movb	$10, -85(%rbp)
/* t30 = 13 */
movl	$13, -89(%rbp)
/* t8[t30] = t29 */
movb	-85(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-89(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t31 =   */
movb	$0, -90(%rbp)
/* t32 = 14 */
movl	$14, -94(%rbp)
/* t8[t32] = t31 */
movb	-90(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-94(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* return t8 */
movq	-16(%rbp), %rax
movq	%rax, 8(%rbp)
addq	$88, %rsp
pop	%rbp
ret
/* e11: skip */
e11:
/* return */
addq	$88, %rsp
pop	%rbp
ret
/* e12: skip */
e12:
/* goto e18 */
jmp	e18
/* e13: skip */
e13:
/* preamble e13 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$32, %rsp
/* t34 = 0 */
movl	$0, -12(%rbp)
/* if n == t34 then goto e14 */
movl	8(%rbp), %eax
movl	-12(%rbp), %edx
cmpl	%eax, %edx
je	e14
/* goto e15 */
jmp	e15
/* e14: skip */
e14:
/* t35 = 1 */
movl	$1, -16(%rbp)
/* t40 = t35 */
movl	-16(%rbp), %eax
movl	%eax, -36(%rbp)

/* goto e16 */
jmp	e16
/* e15: skip */
e15:
/*  */
subq	$8, %rsp

/* t36 = 1 */
movl	$1, -20(%rbp)
/* t37 = n - t36 */
movl	8(%rbp), %eax
movl	-20(%rbp), %edx
subl	%edx, %eax
movl	%eax, -24(%rbp)

/* put param t37 */
movl	-24(%rbp), %eax
movl	%eax, 0(%rsp)
/* t38 = call e13 */
call 	e13
movl	4(%rsp), %eax
movl	%eax, -28(%rbp)
addq	$8, %rsp
/* t39 = n * t38 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	8(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -32(%rbp)

/* t40 = t39 */
movl	-32(%rbp), %eax
movl	%eax, -36(%rbp)

/* e16: skip */
e16:
/* return t40 */
movl	-36(%rbp), %eax
movl	%eax, 12(%rbp)
addq	$32, %rsp
pop	%rbp
ret
/* e17: skip */
e17:
/* return */
addq	$32, %rsp
pop	%rbp
ret
/* e18: skip */
e18:
/* goto e24 */
jmp	e24
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$32, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

/*  */
subq	$8, %rsp

/*  */
subq	$8, %rsp

/* t41 = call malUs */
call 	malUs
movq	0(%rsp), %rax
movq	%rax, -16(%rbp)
addq	$8, %rsp
/* put param t41 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* call print */
call 	print
addq	$8, %rsp
/* decrement t41 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* t42 = call malUs */
call 	malUs
movq	0(%rsp), %rax
movq	%rax, -24(%rbp)
addq	$8, %rsp
/* str = t42 */
movq	-24(%rbp), %rax
movq	%rax, -32(%rbp)

/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* t44 = 5 */
movl	$5, -36(%rbp)
/* put param t44 */
movl	-36(%rbp), %eax
movl	%eax, 0(%rsp)
/* t45 = call e13 */
call 	e13
movl	4(%rsp), %eax
movl	%eax, -40(%rbp)
addq	$8, %rsp
/* e22: skip */
e22:
/*  */
subq	$8, %rsp

/* put param str */
movq	-32(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment str */
movq	-32(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement str */
movq	-32(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e23: skip */
e23:
/* decrement str */
movq	-32(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$32, %rsp
pop	%rbp
ret
/* e24: skip */
e24:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

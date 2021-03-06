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
/* t8 = 3 */
movl	$3, var8
/* N = t8 */
movl	var8, %eax
movl	%eax, var9

/* goto e16 */
jmp	e16
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$24, %rsp
/* t11 = 0 */
movl	$0, -12(%rbp)
/* if n == t11 then goto e11 */
movl	8(%rbp), %eax
movl	-12(%rbp), %edx
cmpl	%eax, %edx
je	e11
/* goto e13 */
jmp	e13
/* e11: skip */
e11:
/* t12 = 1 */
movl	$1, -16(%rbp)
/* return t12 */
movl	-16(%rbp), %eax
movl	%eax, 12(%rbp)
addq	$24, %rsp
pop	%rbp
ret
/* e12: skip */
e12:
/* goto e15 */
jmp	e15
/* e13: skip */
e13:
/*  */
subq	$8, %rsp

/* t13 = 1 */
movl	$1, -20(%rbp)
/* t14 = n - t13 */
movl	8(%rbp), %eax
movl	-20(%rbp), %edx
subl	%edx, %eax
movl	%eax, -24(%rbp)

/* put param t14 */
movl	-24(%rbp), %eax
movl	%eax, 0(%rsp)
/* t15 = call e10 */
call 	e10
movl	4(%rsp), %eax
movl	%eax, -28(%rbp)
addq	$8, %rsp
/* t16 = n * t15 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	8(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -32(%rbp)

/* return t16 */
movl	-32(%rbp), %eax
movl	%eax, 12(%rbp)
addq	$24, %rsp
pop	%rbp
ret
/* e14: skip */
e14:
/* e15: skip */
e15:
/* return */
addq	$24, %rsp
pop	%rbp
ret
/* e16: skip */
e16:
/* goto e22 */
jmp	e22
/* e17: skip */
e17:
/* preamble e17 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$24, %rsp
/* t19 = 0 */
movl	$0, -12(%rbp)
/* i = t19 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e18: skip */
e18:
/* if i < N then goto e19 */
movl	-16(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e19
/* goto e21 */
jmp	e21
/* e19: skip */
e19:
/* t22 = 4 */
movl	$4, -24(%rbp)
/* t23 = i * t22 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	-24(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -28(%rbp)

/* t24 = vector[t23] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-28(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -32(%rbp)

/* t24 = t24 * factor */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-32(%rbp), %eax
movl	16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -32(%rbp)

/* vector[t23] = t24 */
movl	-32(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-28(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e20: skip */
e20:
/* t21 = 1 */
movl	$1, -20(%rbp)
/* i = i + t21 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e18 */
jmp	e18
/* e21: skip */
e21:
/* return */
addq	$24, %rsp
pop	%rbp
ret
/* e22: skip */
e22:
/* goto e30 */
jmp	e30
/* e23: skip */
e23:
/* preamble e23 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$64, %rsp
lea	-47(%rbp), %rax
movq	%rax, -41(%rbp)

/* t26 = 0 */
movl	$0, -12(%rbp)
/* i = t26 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e24: skip */
e24:
/* if i < N then goto e25 */
movl	-16(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e25
/* goto e28 */
jmp	e28
/* e25: skip */
e25:
/*  */
subq	$8, %rsp

/* t29 = 4 */
movl	$4, -24(%rbp)
/* t30 = i * t29 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	-24(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -28(%rbp)

/* t31 = vector[t30] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-28(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -32(%rbp)

/* put param t31 */
movl	-32(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e26: skip */
e26:
/*  */
subq	$8, %rsp

/* t32 =   */
movb	$32, -33(%rbp)
/* put param t32 */
movb	-33(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e27: skip */
e27:
/* t28 = 1 */
movl	$1, -20(%rbp)
/* i = i + t28 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e24 */
jmp	e24
/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* t34 = 1 */
movl	$1, -51(%rbp)
/* t35 = 0 */
movl	$0, -55(%rbp)
/* t33[t35] = t34 */
movl	-51(%rbp), %ecx
movq	-41(%rbp), %rax
movq	$0, %rbx
movl	-55(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t36 = 
 */
movb	$10, -56(%rbp)
/* t37 = 4 */
movl	$4, -60(%rbp)
/* t33[t37] = t36 */
movb	-56(%rbp), %cl
movq	-41(%rbp), %rax
movq	$0, %rbx
movl	-60(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t38 =   */
movb	$0, -61(%rbp)
/* t39 = 5 */
movl	$5, -65(%rbp)
/* t33[t39] = t38 */
movb	-61(%rbp), %cl
movq	-41(%rbp), %rax
movq	$0, %rbx
movl	-65(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t33 */
movq	-41(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t33 */
movq	-41(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t33 */
movq	-41(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e29: skip */
e29:
/* return */
addq	$64, %rsp
pop	%rbp
ret
/* e30: skip */
e30:
/* goto e36 */
jmp	e36
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$64, %rsp
lea	-40(%rbp), %rax
movq	%rax, -28(%rbp)

lea	-60(%rbp), %rax
movq	%rax, -60(%rbp)

/* t40 = 1 */
movl	$1, -12(%rbp)
/* t41 = 3 */
movl	$3, -16(%rbp)
/* t42 = 2 */
movl	$2, -20(%rbp)
/* t44 = 0 */
movl	$0, -44(%rbp)
/* t43[t44] = t40 */
movl	-12(%rbp), %ecx
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-44(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t45 = 4 */
movl	$4, -48(%rbp)
/* t43[t45] = t41 */
movl	-16(%rbp), %ecx
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t46 = 8 */
movl	$8, -52(%rbp)
/* t43[t46] = t42 */
movl	-20(%rbp), %ecx
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* vector = t43 */
movq	-28(%rbp), %rax
movq	%rax, -60(%rbp)

/* vector = t43 */
movq	-28(%rbp), %rax
movq	%rax, -60(%rbp)

/* e32: skip */
e32:
/*  */
subq	$8, %rsp

/* t48 = 5 */
movl	$5, -64(%rbp)
/* put param t48 */
movl	-64(%rbp), %eax
movl	%eax, 0(%rsp)
/* t49 = call e10 */
call 	e10
movl	4(%rsp), %eax
movl	%eax, -68(%rbp)
addq	$8, %rsp
/* aux = t49 */
movl	-68(%rbp), %eax
movl	%eax, -72(%rbp)

/* e33: skip */
e33:
/*  */
subq	$16, %rsp

/* put param vector */
movq	-60(%rbp), %rax
movq	%rax, 0(%rsp)
/* put param aux */
movl	-72(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e17 */
call 	e17
addq	$16, %rsp
/* e34: skip */
e34:
/*  */
subq	$8, %rsp

/* put param vector */
movq	-60(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/* e35: skip */
e35:
/* return */
addq	$64, %rsp
pop	%rbp
ret
/* e36: skip */
e36:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

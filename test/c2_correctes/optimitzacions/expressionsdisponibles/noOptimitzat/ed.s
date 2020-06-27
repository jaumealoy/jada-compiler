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
/* t8 = 2147483647 */
movl	$2147483647, var8
/* N = t8 */
movl	var8, %eax
movl	%eax, var9

/* goto e25 */
jmp	e25
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
/* t10 = 0 */
movl	$0, -12(%rbp)
/* n = t10 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e11: skip */
e11:
/*  */
subq	$8, %rsp

/* put param n */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e12: skip */
e12:
/* t12 = 7 */
movl	$7, -20(%rbp)
/* n = t12 */
movl	-20(%rbp), %eax
movl	%eax, -16(%rbp)

/* e13: skip */
e13:
/* t13 = 2 */
movl	$2, -24(%rbp)
/* t14 = n * t13 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	-24(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -28(%rbp)

/* k = t14 */
movl	-28(%rbp), %eax
movl	%eax, -32(%rbp)

/* e14: skip */
e14:
/*  */
subq	$8, %rsp

/* put param k */
movl	-32(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e15: skip */
e15:
/*  */
subq	$8, %rsp

/* t16 = 2 */
movl	$2, -36(%rbp)
/* t17 = n * t16 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	-36(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* put param t17 */
movl	-40(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e16: skip */
e16:
/* t18 = 0 */
movl	$0, -44(%rbp)
/* sum = t18 */
movl	-44(%rbp), %eax
movl	%eax, -48(%rbp)

/* e17: skip */
e17:
/* t20 = 0 */
movl	$0, -52(%rbp)
/* i = t20 */
movl	-52(%rbp), %eax
movl	%eax, -56(%rbp)

/* e18: skip */
e18:
/* if i < N then goto e19 */
movl	-56(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e19
/* goto e21 */
jmp	e21
/* e19: skip */
e19:
/* t23 = 2 */
movl	$2, -64(%rbp)
/* t24 = n * t23 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	-64(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* sum = sum + t24 */
movl	-48(%rbp), %eax
movl	-68(%rbp), %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* e20: skip */
e20:
/* t22 = 1 */
movl	$1, -60(%rbp)
/* i = i + t22 */
movl	-56(%rbp), %eax
movl	-60(%rbp), %edx
addl	%edx, %eax
movl	%eax, -56(%rbp)

/* goto e18 */
jmp	e18
/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* put param sum */
movl	-48(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e22: skip */
e22:
/* t25 = 1 */
movl	$1, -72(%rbp)
/* n = n + t25 */
movl	-16(%rbp), %eax
movl	-72(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* e23: skip */
e23:
/*  */
subq	$8, %rsp

/* t26 = 2 */
movl	$2, -76(%rbp)
/* t27 = n * t26 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	-76(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -80(%rbp)

/* put param t27 */
movl	-80(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e24: skip */
e24:
/* return */
addq	$72, %rsp
pop	%rbp
ret
/* e25: skip */
e25:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

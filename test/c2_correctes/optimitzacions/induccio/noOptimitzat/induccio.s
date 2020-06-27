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

/* goto e22 */
jmp	e22
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$64, %rsp
/* t10 = 0 */
movl	$0, -12(%rbp)
/* sum = t10 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e11: skip */
e11:
/* e12: skip */
e12:
/* t13 = 0 */
movl	$0, -24(%rbp)
/* i = t13 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e13: skip */
e13:
/* if i < N then goto e14 */
movl	-28(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e14
/* goto e17 */
jmp	e17
/* e14: skip */
e14:
/* t16 = 3 */
movl	$3, -36(%rbp)
/* t17 = t16 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-36(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* t18 = 7 */
movl	$7, -44(%rbp)
/* t19 = t17 + t18 */
movl	-40(%rbp), %eax
movl	-44(%rbp), %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* j = t19 */
movl	-48(%rbp), %eax
movl	%eax, -20(%rbp)

/* e15: skip */
e15:
/* t20 = 2 */
movl	$2, -52(%rbp)
/* t21 = t20 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-52(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -56(%rbp)

/* t22 = sum + t21 */
movl	-16(%rbp), %eax
movl	-56(%rbp), %edx
addl	%edx, %eax
movl	%eax, -60(%rbp)

/* t23 = t22 + j */
movl	-60(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -64(%rbp)

/* sum = t23 */
movl	-64(%rbp), %eax
movl	%eax, -16(%rbp)

/* e16: skip */
e16:
/* t15 = 1 */
movl	$1, -32(%rbp)
/* i = i + t15 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* goto e13 */
jmp	e13
/* e17: skip */
e17:
/*  */
subq	$8, %rsp

/* put param j */
movl	-20(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e18: skip */
e18:
/*  */
subq	$8, %rsp

/* t24 = 
 */
movb	$10, -65(%rbp)
/* put param t24 */
movb	-65(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e19: skip */
e19:
/*  */
subq	$8, %rsp

/* put param sum */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* t25 = 
 */
movb	$10, -66(%rbp)
/* put param t25 */
movb	-66(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e21: skip */
e21:
/* return */
addq	$64, %rsp
pop	%rbp
ret
/* e22: skip */
e22:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

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

/* goto e20 */
jmp	e20
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$88, %rsp
/* e11: skip */
e11:
/* e12: skip */
e12:
/* e13: skip */
e13:
/* t13 = 0 */
movl	$0, -24(%rbp)
/* i = t13 */
movl	-24(%rbp), %eax
movl	%eax, -28(%rbp)

/* e14: skip */
e14:
/* if i < N then goto e15 */
movl	-28(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e15
/* goto e19 */
jmp	e19
/* e15: skip */
e15:
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
movl	%eax, -12(%rbp)

/* e16: skip */
e16:
/* t20 = 4 */
movl	$4, -52(%rbp)
/* t21 = t20 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-52(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -56(%rbp)

/* t22 = 2 */
movl	$2, -60(%rbp)
/* t23 = t21 * t22 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-56(%rbp), %eax
movl	-60(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* k = t23 */
movl	-64(%rbp), %eax
movl	%eax, -16(%rbp)

/* e17: skip */
e17:
/* t24 = 7 */
movl	$7, -68(%rbp)
/* t25 = t24 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-68(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -72(%rbp)

/* t26 = 2 */
movl	$2, -76(%rbp)
/* t27 = t25 * t26 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-72(%rbp), %eax
movl	-76(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -80(%rbp)

/* t28 = 4 */
movl	$4, -84(%rbp)
/* t29 = t27 * t28 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-80(%rbp), %eax
movl	-84(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -88(%rbp)

/* t30 = 8 */
movl	$8, -92(%rbp)
/* t31 = t29 * t30 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-88(%rbp), %eax
movl	-92(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -96(%rbp)

/* z = t31 */
movl	-96(%rbp), %eax
movl	%eax, -20(%rbp)

/* e18: skip */
e18:
/* t15 = 1 */
movl	$1, -32(%rbp)
/* i = i + t15 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* goto e14 */
jmp	e14
/* e19: skip */
e19:
/* return */
addq	$88, %rsp
pop	%rbp
ret
/* e20: skip */
e20:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

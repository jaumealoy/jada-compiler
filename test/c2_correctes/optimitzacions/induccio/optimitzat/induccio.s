.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e22 */
jmp	e22
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
/* sum = 0 */
movl	$0, -12(%rbp)
/* i = 0 */
movl	$0, -20(%rbp)
/* if i >= 2147483647 then goto e17 */
movl	-20(%rbp), %eax
movl	$2147483647, %edx
cmpl	%eax, %edx
jle	e17
/* t44 = i * 3 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	$3, %edx
imul	%rdx, %rax
movl	%eax, -80(%rbp)

/* t28 = t44 */
movl	-80(%rbp), %eax
movl	%eax, -48(%rbp)

/* t26 = t28 + 0 */
movl	-48(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* t34 = t44 */
movl	-80(%rbp), %eax
movl	%eax, -60(%rbp)

/* t32 = t34 + 7 */
movl	-60(%rbp), %eax
movl	$7, %edx
addl	%edx, %eax
movl	%eax, -56(%rbp)

/* t40 = i * 2 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	$2, %edx
imul	%rdx, %rax
movl	%eax, -72(%rbp)

/* t38 = t40 + 0 */
movl	-72(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -68(%rbp)

/* e23: skip */
e23:
/* t26 = t26 + 3 */
movl	-44(%rbp), %eax
movl	$3, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* j = t32 */
movl	-56(%rbp), %eax
movl	%eax, -16(%rbp)

/* t32 = t32 + 3 */
movl	-56(%rbp), %eax
movl	$3, %edx
addl	%edx, %eax
movl	%eax, -56(%rbp)

/* t21 = t38 */
movl	-68(%rbp), %eax
movl	%eax, -32(%rbp)

/* t38 = t38 + 2 */
movl	-68(%rbp), %eax
movl	$2, %edx
addl	%edx, %eax
movl	%eax, -68(%rbp)

/* t22 = sum + t21 */
movl	-12(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -36(%rbp)

/* sum = t22 + j */
movl	-36(%rbp), %eax
movl	-16(%rbp), %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* i = i + 1 */
movl	-20(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/* if i >= 2147483647 then goto e17 */
movl	-20(%rbp), %eax
movl	$2147483647, %edx
cmpl	%eax, %edx
jle	e17
/* goto e23 */
jmp	e23
/* e17: skip */
e17:
/*  */
subq	$8, %rsp

/* put param j */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param sum */
movl	-12(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* return */
addq	$72, %rsp
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

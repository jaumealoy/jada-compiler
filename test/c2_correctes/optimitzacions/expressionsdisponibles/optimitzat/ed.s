.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e25 */
jmp	e25
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$40, %rsp
/* n = 0 */
movl	$0, -12(%rbp)
/*  */
subq	$8, %rsp

/* put param n */
movl	-12(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* n = 7 */
movl	$7, -12(%rbp)
/* t28 = n * 2 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	$2, %edx
imul	%rdx, %rax
movl	%eax, -44(%rbp)

/* k = t28 */
movl	-44(%rbp), %eax
movl	%eax, -20(%rbp)

/*  */
subq	$8, %rsp

/* put param k */
movl	-20(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t17 = t28 */
movl	-44(%rbp), %eax
movl	%eax, -24(%rbp)

/* put param t17 */
movl	-24(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* sum = 0 */
movl	$0, -28(%rbp)
/* i = 0 */
movl	$0, -32(%rbp)
/* if i >= 2147483647 then goto e21 */
movl	-32(%rbp), %eax
movl	$2147483647, %edx
cmpl	%eax, %edx
jle	e21
/* t24 = t28 */
movl	-44(%rbp), %eax
movl	%eax, -36(%rbp)

/* e26: skip */
e26:
/* sum = sum + t24 */
movl	-28(%rbp), %eax
movl	-36(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* i = i + 1 */
movl	-32(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -32(%rbp)

/* if i >= 2147483647 then goto e21 */
movl	-32(%rbp), %eax
movl	$2147483647, %edx
cmpl	%eax, %edx
jle	e21
/* goto e26 */
jmp	e26
/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* put param sum */
movl	-28(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* n = n + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/*  */
subq	$8, %rsp

/* t28 = n * 2 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	$2, %edx
imul	%rdx, %rax
movl	%eax, -44(%rbp)

/* t27 = t28 */
movl	-44(%rbp), %eax
movl	%eax, -40(%rbp)

/* put param t27 */
movl	-40(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* return */
addq	$40, %rsp
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

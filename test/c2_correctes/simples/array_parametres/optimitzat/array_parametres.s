.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e36 */
jmp	e36
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$16, %rsp
/* if n != 0 then goto e13 */
movl	8(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jne	e13
/* return 1 */
movl	$1, %eax
movl	%eax, 12(%rbp)
addq	$16, %rsp
pop	%rbp
ret
/* e13: skip */
e13:
/*  */
subq	$8, %rsp

/* t14 = n - 1 */
movl	8(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -12(%rbp)

/* put param t14 */
movl	-12(%rbp), %eax
movl	%eax, 0(%rsp)
/* t15 = call e10 */
call 	e10
movl	4(%rsp), %eax
movl	%eax, -16(%rbp)
addq	$8, %rsp
/* t16 = n * t15 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	8(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -20(%rbp)

/* return t16 */
movl	-20(%rbp), %eax
movl	%eax, 12(%rbp)
addq	$16, %rsp
pop	%rbp
ret
/* goto e36 */
jmp	e36
/* e17: skip */
e17:
/* preamble e17 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$24, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= 3 then goto e21 */
movl	-12(%rbp), %eax
movl	$3, %edx
cmpl	%eax, %edx
jle	e21
/* t53 = i * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -28(%rbp)

/* t51 = t53 + 0 */
movl	-28(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -24(%rbp)

/* e37: skip */
e37:
/* t23 = t51 */
movl	-24(%rbp), %eax
movl	%eax, -16(%rbp)

/* t51 = t51 + 4 */
movl	-24(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -24(%rbp)

/* t24 = vector[t23] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-16(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -20(%rbp)

/* t24 = t24 * factor */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -20(%rbp)

/* vector[t23] = t24 */
movl	-20(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-16(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= 3 then goto e21 */
movl	-12(%rbp), %eax
movl	$3, %edx
cmpl	%eax, %edx
jle	e21
/* goto e37 */
jmp	e37
/* e21: skip */
e21:
/* return */
addq	$24, %rsp
pop	%rbp
ret
/* goto e36 */
jmp	e36
/* e23: skip */
e23:
/* preamble e23 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$40, %rsp
lea	-34(%rbp), %rax
movq	%rax, -28(%rbp)

/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= 3 then goto e28 */
movl	-12(%rbp), %eax
movl	$3, %edx
cmpl	%eax, %edx
jle	e28
/* t59 = i * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -42(%rbp)

/* t57 = t59 + 0 */
movl	-42(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -38(%rbp)

/* e38: skip */
e38:
/*  */
subq	$8, %rsp

/* t30 = t57 */
movl	-38(%rbp), %eax
movl	%eax, -16(%rbp)

/* t57 = t57 + 4 */
movl	-38(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -38(%rbp)

/* t31 = vector[t30] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-16(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -20(%rbp)

/* put param t31 */
movl	-20(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 32 */
movb	$32, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= 3 then goto e28 */
movl	-12(%rbp), %eax
movl	$3, %edx
cmpl	%eax, %edx
jle	e28
/* goto e38 */
jmp	e38
/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* t33[0] = 1 */
movl	$1, %ecx
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t33[4] = 10 */
movb	$10, %cl
movq	-28(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t33[5] = 0 */
movb	$0, %cl
movq	-28(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* put param t33 */
movq	-28(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t33 */
movq	-28(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t33 */
movq	-28(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$40, %rsp
pop	%rbp
ret
/* goto e36 */
jmp	e36
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$40, %rsp
lea	-28(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-36(%rbp), %rax
movq	%rax, -36(%rbp)

/* t43[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t43[4] = 3 */
movl	$3, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* t43[8] = 2 */
movl	$2, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 8(%rax)
/* vector = t43 */
movq	-16(%rbp), %rax
movq	%rax, -36(%rbp)

/*  */
subq	$8, %rsp

/* put param 5 */
movl	$5, %eax
movl	%eax, 0(%rsp)
/* aux = call e10 */
call 	e10
movl	4(%rsp), %eax
movl	%eax, -44(%rbp)
addq	$8, %rsp
/*  */
subq	$16, %rsp

/* put param vector */
movq	-36(%rbp), %rax
movq	%rax, 0(%rsp)
/* put param aux */
movl	-44(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e17 */
call 	e17
addq	$16, %rsp
/*  */
subq	$8, %rsp

/* put param vector */
movq	-36(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/* return */
addq	$40, %rsp
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

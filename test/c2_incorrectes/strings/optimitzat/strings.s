.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e24 */
jmp	e24
/* malUs: skip */
malUs:
/* preamble malUs */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$24, %rsp
lea	-31(%rbp), %rax
movq	%rax, -16(%rbp)

/* t8[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t8[4] = 67 */
movb	$67, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t8[5] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t8[6] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t8[7] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t8[8] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t8[9] = 99 */
movb	$99, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t8[10] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t8[11] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t8[12] = 63 */
movb	$63, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t8[13] = 10 */
movb	$10, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t8[14] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* return t8 */
movq	-16(%rbp), %rax
movq	%rax, 8(%rbp)
addq	$24, %rsp
pop	%rbp
ret
/* goto e24 */
jmp	e24
/* e13: skip */
e13:
/* preamble e13 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$16, %rsp
/* if n != 0 then goto e15 */
movl	8(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jne	e15
/* t40 = 1 */
movl	$1, -24(%rbp)
/* goto e16 */
jmp	e16
/* e15: skip */
e15:
/*  */
subq	$8, %rsp

/* t37 = n - 1 */
movl	8(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -12(%rbp)

/* put param t37 */
movl	-12(%rbp), %eax
movl	%eax, 0(%rsp)
/* t38 = call e13 */
call 	e13
movl	4(%rsp), %eax
movl	%eax, -16(%rbp)
addq	$8, %rsp
/* t40 = n * t38 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	8(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -24(%rbp)

/* e16: skip */
e16:
/* return t40 */
movl	-24(%rbp), %eax
movl	%eax, 12(%rbp)
addq	$16, %rsp
pop	%rbp
ret
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

/*  */
subq	$8, %rsp

/* str = call malUs */
call 	malUs
movq	0(%rsp), %rax
movq	%rax, -32(%rbp)
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 5 */
movl	$5, %eax
movl	%eax, 0(%rsp)
/* t45 = call e13 */
call 	e13
movl	4(%rsp), %eax
movl	%eax, -36(%rbp)
addq	$8, %rsp
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

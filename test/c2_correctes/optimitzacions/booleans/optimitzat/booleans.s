.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e61 */
jmp	e61
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$56, %rsp
lea	-24(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-42(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-61(%rbp), %rax
movq	%rax, -50(%rbp)

/*  */
subq	$8, %rsp

/* put param name */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment name */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement name */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t10[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t10[4] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t10[5] = 61 */
movb	$61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t10[6] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t10[7] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* put param t10 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t10 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t10 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 != value then goto e15 */
movb	$1, %al
movb	16(%rbp), %dl
cmpb	%al, %dl
jne	e15
/*  */
subq	$8, %rsp

/* t21[0] = 1 */
movl	$1, %ecx
movq	-32(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t21[4] = 116 */
movb	$116, %cl
movq	-32(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t21[5] = 114 */
movb	$114, %cl
movq	-32(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t21[6] = 117 */
movb	$117, %cl
movq	-32(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t21[7] = 101 */
movb	$101, %cl
movq	-32(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t21[8] = 10 */
movb	$10, %cl
movq	-32(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t21[9] = 0 */
movb	$0, %cl
movq	-32(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* put param t21 */
movq	-32(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t21 */
movq	-32(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t21 */
movq	-32(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e17 */
jmp	e17
/* e15: skip */
e15:
/*  */
subq	$8, %rsp

/* t36[0] = 1 */
movl	$1, %ecx
movq	-50(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t36[4] = 102 */
movb	$102, %cl
movq	-50(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t36[5] = 97 */
movb	$97, %cl
movq	-50(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t36[6] = 108 */
movb	$108, %cl
movq	-50(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t36[7] = 115 */
movb	$115, %cl
movq	-50(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t36[8] = 101 */
movb	$101, %cl
movq	-50(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t36[9] = 10 */
movb	$10, %cl
movq	-50(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t36[10] = 0 */
movb	$0, %cl
movq	-50(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* put param t36 */
movq	-50(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t36 */
movq	-50(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t36 */
movq	-50(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e17: skip */
e17:
/* return */
addq	$56, %rsp
pop	%rbp
ret
/* goto e61 */
jmp	e61
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$96, %rsp
lea	-26(%rbp), %rax
movq	%rax, -17(%rbp)

lea	-44(%rbp), %rax
movq	%rax, -35(%rbp)

lea	-63(%rbp), %rax
movq	%rax, -54(%rbp)

lea	-81(%rbp), %rax
movq	%rax, -72(%rbp)

lea	-100(%rbp), %rax
movq	%rax, -91(%rbp)

/* a = true */
movb	$1, -9(%rbp)
/*  */
subq	$16, %rsp

/* t55[0] = 1 */
movl	$1, %ecx
movq	-17(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t55[4] = 49 */
movb	$49, %cl
movq	-17(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t55[5] = 46 */
movb	$46, %cl
movq	-17(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t55[6] = 32 */
movb	$32, %cl
movq	-17(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t55[7] = 97 */
movb	$97, %cl
movq	-17(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t55[8] = 0 */
movb	$0, %cl
movq	-17(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t68 = a */
movb	-9(%rbp), %al
movb	%al, -27(%rbp)

/* put param t68 */
movb	-27(%rbp), %al
movb	%al, 8(%rsp)
/* put param t55 */
movq	-17(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t55 */
movq	-17(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t55 */
movq	-17(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* a = false */
movb	$0, -9(%rbp)
/*  */
subq	$16, %rsp

/* t69[0] = 1 */
movl	$1, %ecx
movq	-35(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t69[4] = 50 */
movb	$50, %cl
movq	-35(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t69[5] = 46 */
movb	$46, %cl
movq	-35(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t69[6] = 32 */
movb	$32, %cl
movq	-35(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t69[7] = 97 */
movb	$97, %cl
movq	-35(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t69[8] = 0 */
movb	$0, %cl
movq	-35(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t82 = a */
movb	-9(%rbp), %al
movb	%al, -45(%rbp)

/* put param t82 */
movb	-45(%rbp), %al
movb	%al, 8(%rsp)
/* put param t69 */
movq	-35(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t69 */
movq	-35(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t69 */
movq	-35(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* b = true */
movb	$1, -46(%rbp)
/*  */
subq	$16, %rsp

/* t87[0] = 1 */
movl	$1, %ecx
movq	-54(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t87[4] = 49 */
movb	$49, %cl
movq	-54(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t87[5] = 46 */
movb	$46, %cl
movq	-54(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t87[6] = 32 */
movb	$32, %cl
movq	-54(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t87[7] = 98 */
movb	$98, %cl
movq	-54(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t87[8] = 0 */
movb	$0, %cl
movq	-54(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t100 = b */
movb	-46(%rbp), %al
movb	%al, -64(%rbp)

/* put param t100 */
movb	-64(%rbp), %al
movb	%al, 8(%rsp)
/* put param t87 */
movq	-54(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t87 */
movq	-54(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t87 */
movq	-54(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* b = false */
movb	$0, -46(%rbp)
/*  */
subq	$16, %rsp

/* t103[0] = 1 */
movl	$1, %ecx
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t103[4] = 50 */
movb	$50, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t103[5] = 46 */
movb	$46, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t103[6] = 32 */
movb	$32, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t103[7] = 98 */
movb	$98, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t103[8] = 0 */
movb	$0, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t116 = b */
movb	-46(%rbp), %al
movb	%al, -82(%rbp)

/* put param t116 */
movb	-82(%rbp), %al
movb	%al, 8(%rsp)
/* put param t103 */
movq	-72(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t103 */
movq	-72(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t103 */
movq	-72(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* b = c */
movb	-83(%rbp), %al
movb	%al, -46(%rbp)

/*  */
subq	$16, %rsp

/* t118[0] = 1 */
movl	$1, %ecx
movq	-91(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t118[4] = 51 */
movb	$51, %cl
movq	-91(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t118[5] = 46 */
movb	$46, %cl
movq	-91(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t118[6] = 32 */
movb	$32, %cl
movq	-91(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t118[7] = 98 */
movb	$98, %cl
movq	-91(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t118[8] = 0 */
movb	$0, %cl
movq	-91(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t131 = b */
movb	-46(%rbp), %al
movb	%al, -101(%rbp)

/* put param t131 */
movb	-101(%rbp), %al
movb	%al, 8(%rsp)
/* put param t118 */
movq	-91(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t118 */
movq	-91(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t118 */
movq	-91(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$96, %rsp
pop	%rbp
ret
/* e61: skip */
e61:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

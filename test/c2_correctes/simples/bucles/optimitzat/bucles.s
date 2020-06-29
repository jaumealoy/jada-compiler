.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e45 */
jmp	e45
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$88, %rsp
lea	-28(%rbp), %rax
movq	%rax, -20(%rbp)

lea	-44(%rbp), %rax
movq	%rax, -36(%rbp)

lea	-68(%rbp), %rax
movq	%rax, -60(%rbp)

lea	-84(%rbp), %rax
movq	%rax, -76(%rbp)

/* i = 1 */
movl	$1, -12(%rbp)
/* if i > 10 then goto e21 */
movl	-12(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jl	e21
/* e48: skip */
e48:
/*  */
subq	$8, %rsp

/* put param n */
movl	8(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t12[0] = 1 */
movl	$1, %ecx
movq	-20(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t12[4] = 32 */
movb	$32, %cl
movq	-20(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t12[5] = 120 */
movb	$120, %cl
movq	-20(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t12[6] = 32 */
movb	$32, %cl
movq	-20(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t12[7] = 0 */
movb	$0, %cl
movq	-20(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* put param t12 */
movq	-20(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t12 */
movq	-20(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t12 */
movq	-20(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param i */
movl	-12(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t23[0] = 1 */
movl	$1, %ecx
movq	-36(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t23[4] = 32 */
movb	$32, %cl
movq	-36(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t23[5] = 61 */
movb	$61, %cl
movq	-36(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t23[6] = 32 */
movb	$32, %cl
movq	-36(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t23[7] = 0 */
movb	$0, %cl
movq	-36(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* put param t23 */
movq	-36(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t23 */
movq	-36(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t23 */
movq	-36(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t164 = i * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	8(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -92(%rbp)

/* t34 = t164 */
movl	-92(%rbp), %eax
movl	%eax, -48(%rbp)

/* put param t34 */
movl	-48(%rbp), %eax
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
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i <= 10 then goto e48 */
movl	-12(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jge	e48
/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* i = 0 */
movl	$0, -52(%rbp)
/* if i >= 10 then goto e26 */
movl	-52(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jle	e26
/* e47: skip */
e47:
/*  */
subq	$8, %rsp

/* put param 61 */
movb	$61, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* i = i + 1 */
movl	-52(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -52(%rbp)

/* if i < 10 then goto e47 */
movl	-52(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jg	e47
/* e26: skip */
e26:
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

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i > 10 then goto e38 */
movl	-12(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jl	e38
/* e46: skip */
e46:
/*  */
subq	$8, %rsp

/* put param n */
movl	8(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t48[0] = 1 */
movl	$1, %ecx
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t48[4] = 32 */
movb	$32, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t48[5] = 120 */
movb	$120, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t48[6] = 32 */
movb	$32, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t48[7] = 0 */
movb	$0, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* put param t48 */
movq	-60(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t48 */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t48 */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param i */
movl	-12(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t59[0] = 1 */
movl	$1, %ecx
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t59[4] = 32 */
movb	$32, %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t59[5] = 61 */
movb	$61, %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t59[6] = 32 */
movb	$32, %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t59[7] = 0 */
movb	$0, %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* put param t59 */
movq	-76(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t59 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t59 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t164 = i * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	8(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -92(%rbp)

/* t70 = t164 */
movl	-92(%rbp), %eax
movl	%eax, -88(%rbp)

/* put param t70 */
movl	-88(%rbp), %eax
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
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i <= 10 then goto e46 */
movl	-12(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jge	e46
/* e38: skip */
e38:
/* return */
addq	$88, %rsp
pop	%rbp
ret
/* goto e45 */
jmp	e45
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
lea	-63(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-71(%rbp), %rax
movq	%rax, -71(%rbp)

/* t72[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t72[4] = 81 */
movb	$81, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t72[5] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t72[6] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t72[7] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t72[8] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t72[9] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t72[10] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t72[11] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t72[12] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t72[13] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t72[14] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t72[15] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t72[16] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t72[17] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t72[18] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t72[19] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t72[20] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t72[21] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t72[22] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t72[23] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t72[24] = 112 */
movb	$112, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t72[25] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t72[26] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t72[27] = 99 */
movb	$99, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t72[28] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t72[29] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t72[30] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t72[31] = 118 */
movb	$118, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t72[32] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t72[33] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t72[34] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t72[35] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t72[36] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t72[37] = 112 */
movb	$112, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t72[38] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* t72[39] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 39(%rax)
/* t72[40] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 40(%rax)
/* t72[41] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 41(%rax)
/* t72[42] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 42(%rax)
/* t72[43] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 43(%rax)
/* t72[44] = 63 */
movb	$63, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 44(%rax)
/* t72[45] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 45(%rax)
/* t72[46] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 46(%rax)
/* increment t72 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* str = t72 */
movq	-16(%rbp), %rax
movq	%rax, -71(%rbp)

/*  */
subq	$8, %rsp

/* put param str */
movq	-71(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment str */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement str */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* n = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -79(%rbp)
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param n */
movl	-79(%rbp), %eax
movl	%eax, 0(%rsp)
/* call e10 */
call 	e10
addq	$8, %rsp
/* decrement str */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$72, %rsp
pop	%rbp
ret
/* e45: skip */
e45:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

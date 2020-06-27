.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e41 */
jmp	e41
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$128, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-70(%rbp), %rax
movq	%rax, -52(%rbp)

lea	-105(%rbp), %rax
movq	%rax, -78(%rbp)

/* t12 = 1 */
movq	$1, -32(%rbp)
/* t12 = t12 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -32(%rbp)

/* t10 = t12 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t10 = t10 + 4 */
movq	-24(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t9 = malloc t10 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t9[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t9 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v = t9 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -44(%rbp)
/*  */
subq	$8, %rsp

/* t19[0] = 1 */
movl	$1, %ecx
movq	-52(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t19[4] = 86 */
movb	$86, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t19[5] = 111 */
movb	$111, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t19[6] = 108 */
movb	$108, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t19[7] = 115 */
movb	$115, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t19[8] = 32 */
movb	$32, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t19[9] = 99 */
movb	$99, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t19[10] = 111 */
movb	$111, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t19[11] = 109 */
movb	$109, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t19[12] = 112 */
movb	$112, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t19[13] = 116 */
movb	$116, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t19[14] = 97 */
movb	$97, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t19[15] = 114 */
movb	$114, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t19[16] = 32 */
movb	$32, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t19[17] = 0 */
movb	$0, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* put param t19 */
movq	-52(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t19 */
movq	-52(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t19 */
movq	-52(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

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

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* if n <= 0 then goto e24 */
movl	8(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jge	e24
/* t300 = i */
movl	-44(%rbp), %eax
movl	%eax, -129(%rbp)

/* t298 = t300 - 1 */
movl	-129(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -125(%rbp)

/* t298 = t298 + 1 */
movl	-125(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -125(%rbp)

/* e42: skip */
e42:
/*  */
subq	$8, %rsp

/* t52[0] = 1 */
movl	$1, %ecx
movq	-78(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t52[4] = 73 */
movb	$73, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t52[5] = 110 */
movb	$110, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t52[6] = 116 */
movb	$116, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t52[7] = 114 */
movb	$114, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t52[8] = 111 */
movb	$111, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t52[9] = 100 */
movb	$100, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t52[10] = 117 */
movb	$117, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t52[11] = 101 */
movb	$101, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t52[12] = 105 */
movb	$105, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t52[13] = 120 */
movb	$120, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t52[14] = 32 */
movb	$32, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t52[15] = 101 */
movb	$101, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t52[16] = 108 */
movb	$108, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t52[17] = 32 */
movb	$32, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t52[18] = 110 */
movb	$110, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t52[19] = -61 */
movb	$-61, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t52[20] = -70 */
movb	$-70, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t52[21] = 109 */
movb	$109, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t52[22] = 101 */
movb	$101, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t52[23] = 114 */
movb	$114, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t52[24] = 111 */
movb	$111, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t52[25] = 32 */
movb	$32, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t52[26] = 0 */
movb	$0, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* put param t52 */
movq	-78(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t52 */
movq	-78(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t52 */
movq	-78(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* i = i + 1 */
movl	-44(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* put param i */
movl	-44(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 58 */
movb	$58, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 32 */
movb	$32, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* t107 = t298 */
movl	-125(%rbp), %eax
movl	%eax, -113(%rbp)

/* t298 = t298 + 1 */
movl	-125(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -125(%rbp)

/* t110 = t107 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-113(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -117(%rbp)

/* t110 = t110 + 4 */
movl	-117(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -117(%rbp)

/*  */
subq	$8, %rsp

/* t112 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -121(%rbp)
addq	$8, %rsp
/* v[t110] = t112 */
movl	-121(%rbp), %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-117(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* n = n - 1 */
movl	8(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, 8(%rbp)

/* if n > 0 then goto e42 */
movl	8(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jl	e42
/* e24: skip */
e24:
/* return v */
movq	-40(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$128, %rsp
pop	%rbp
ret
/* goto e41 */
jmp	e41
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$184, %rsp
lea	-54(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-70(%rbp), %rax
movq	%rax, -70(%rbp)

lea	-78(%rbp), %rax
movq	%rax, -78(%rbp)

lea	-106(%rbp), %rax
movq	%rax, -90(%rbp)

lea	-159(%rbp), %rax
movq	%rax, -142(%rbp)

lea	-186(%rbp), %rax
movq	%rax, -167(%rbp)

/*  */
subq	$8, %rsp

/* t114[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t114[4] = 81 */
movb	$81, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t114[5] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t114[6] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t114[7] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t114[8] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t114[9] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t114[10] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t114[11] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t114[12] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t114[13] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t114[14] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t114[15] = -61 */
movb	$-61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t114[16] = -70 */
movb	$-70, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t114[17] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t114[18] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t114[19] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t114[20] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t114[21] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t114[22] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t114[23] = 118 */
movb	$118, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t114[24] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t114[25] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t114[26] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t114[27] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t114[28] = 99 */
movb	$99, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t114[29] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t114[30] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t114[31] = 112 */
movb	$112, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t114[32] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t114[33] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t114[34] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t114[35] = 63 */
movb	$63, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t114[36] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t114[37] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* put param t114 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t114 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t114 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* k = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -62(%rbp)
addq	$8, %rsp
/*  */
subq	$16, %rsp

/* put param k */
movl	-62(%rbp), %eax
movl	%eax, 0(%rsp)
/* vector = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -78(%rbp)
addq	$16, %rsp
/* i = 0 */
movl	$0, -82(%rbp)
/* if i >= k then goto e40 */
movl	-82(%rbp), %eax
movl	-62(%rbp), %edx
cmpl	%eax, %edx
jle	e40
/* e43: skip */
e43:
/*  */
subq	$8, %rsp

/* t192[0] = 1 */
movl	$1, %ecx
movq	-90(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t192[4] = 69 */
movb	$69, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t192[5] = 108 */
movb	$108, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t192[6] = 32 */
movb	$32, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t192[7] = 110 */
movb	$110, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t192[8] = -61 */
movb	$-61, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t192[9] = -70 */
movb	$-70, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t192[10] = 109 */
movb	$109, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t192[11] = 101 */
movb	$101, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t192[12] = 114 */
movb	$114, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t192[13] = 111 */
movb	$111, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t192[14] = 32 */
movb	$32, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t192[15] = 0 */
movb	$0, %cl
movq	-90(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* put param t192 */
movq	-90(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t192 */
movq	-90(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t192 */
movq	-90(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t220 = i */
movl	-82(%rbp), %eax
movl	%eax, -110(%rbp)

/* t223 = t220 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-110(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -114(%rbp)

/* t223 = t223 + 4 */
movl	-114(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -114(%rbp)

/* t225 = vector[t223] */
movq	-78(%rbp), %rax
movq	$0, %rbx
movl	-114(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -118(%rbp)

/* put param t225 */
movl	-118(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* t227 = i */
movl	-82(%rbp), %eax
movl	%eax, -122(%rbp)

/* t230 = t227 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-122(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -126(%rbp)

/* t230 = t230 + 4 */
movl	-126(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -126(%rbp)

/* t234 = vector[t230] */
movq	-78(%rbp), %rax
movq	$0, %rbx
movl	-126(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -134(%rbp)

/* t233 = t234 % 2 */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	$2, %eax
cdqe
movq	%rax, %r8
movl	-134(%rbp), %eax
cdqe
idiv	%r8
movl	%edx, -130(%rbp)

/* if t233 != 0 then goto e37 */
movl	-130(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jne	e37
/*  */
subq	$8, %rsp

/* t236[0] = 1 */
movl	$1, %ecx
movq	-142(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t236[4] = 32 */
movb	$32, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t236[5] = -61 */
movb	$-61, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t236[6] = -87 */
movb	$-87, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t236[7] = 115 */
movb	$115, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t236[8] = 32 */
movb	$32, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t236[9] = 112 */
movb	$112, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t236[10] = 97 */
movb	$97, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t236[11] = 114 */
movb	$114, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t236[12] = 101 */
movb	$101, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t236[13] = 108 */
movb	$108, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t236[14] = 108 */
movb	$108, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t236[15] = 10 */
movb	$10, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t236[16] = 0 */
movb	$0, %cl
movq	-142(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* put param t236 */
movq	-142(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t236 */
movq	-142(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t236 */
movq	-142(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e39 */
jmp	e39
/* e37: skip */
e37:
/*  */
subq	$8, %rsp

/* t265[0] = 1 */
movl	$1, %ecx
movq	-167(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t265[4] = 32 */
movb	$32, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t265[5] = -61 */
movb	$-61, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t265[6] = -87 */
movb	$-87, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t265[7] = 115 */
movb	$115, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t265[8] = 32 */
movb	$32, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t265[9] = 105 */
movb	$105, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t265[10] = 109 */
movb	$109, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t265[11] = 112 */
movb	$112, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t265[12] = 97 */
movb	$97, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t265[13] = 114 */
movb	$114, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t265[14] = 101 */
movb	$101, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t265[15] = 108 */
movb	$108, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t265[16] = 108 */
movb	$108, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t265[17] = 10 */
movb	$10, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t265[18] = 0 */
movb	$0, %cl
movq	-167(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* put param t265 */
movq	-167(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t265 */
movq	-167(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t265 */
movq	-167(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e39: skip */
e39:
/* i = i + 1 */
movl	-82(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -82(%rbp)

/* if i < k then goto e43 */
movl	-82(%rbp), %eax
movl	-62(%rbp), %edx
cmpl	%eax, %edx
jg	e43
/* e40: skip */
e40:
/* decrement vector */
movq	-78(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$184, %rsp
pop	%rbp
ret
/* e41: skip */
e41:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

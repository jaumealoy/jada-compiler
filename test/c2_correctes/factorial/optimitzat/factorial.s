.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e38 */
jmp	e38
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$16, %rsp
/* if num != 0 then goto e13 */
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

/* t12 = num - 1 */
movl	8(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -12(%rbp)

/* put param t12 */
movl	-12(%rbp), %eax
movl	%eax, 0(%rsp)
/* t13 = call e10 */
call 	e10
movl	4(%rsp), %eax
movl	%eax, -16(%rbp)
addq	$8, %rsp
/* t14 = num * t13 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	8(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -20(%rbp)

/* return t14 */
movl	-20(%rbp), %eax
movl	%eax, 12(%rbp)
addq	$16, %rsp
pop	%rbp
ret
/* goto e38 */
jmp	e38
/* e17: skip */
e17:
/* preamble e17 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$8, %rsp
/* tmp = 1 */
movl	$1, -12(%rbp)
/* i = 2 */
movl	$2, -16(%rbp)
/* if i > num then goto e22 */
movl	-16(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jl	e22
/* e39: skip */
e39:
/* tmp = tmp * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -12(%rbp)

/* i = i + 1 */
movl	-16(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* if i > num then goto e22 */
movl	-16(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jl	e22
/* goto e39 */
jmp	e39
/* e22: skip */
e22:
/* return tmp */
movl	-12(%rbp), %eax
movl	%eax, 12(%rbp)
addq	$8, %rsp
pop	%rbp
ret
/* goto e38 */
jmp	e38
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$152, %rsp
lea	-44(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-81(%rbp), %rax
movq	%rax, -60(%rbp)

lea	-99(%rbp), %rax
movq	%rax, -89(%rbp)

lea	-132(%rbp), %rax
movq	%rax, -111(%rbp)

lea	-150(%rbp), %rax
movq	%rax, -140(%rbp)

/*  */
subq	$8, %rsp

/* t21[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t21[4] = 73 */
movb	$73, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t21[5] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t21[6] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t21[7] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t21[8] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t21[9] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t21[10] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t21[11] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t21[12] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t21[13] = 120 */
movb	$120, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t21[14] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t21[15] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t21[16] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t21[17] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t21[18] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t21[19] = -61 */
movb	$-61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t21[20] = -70 */
movb	$-70, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t21[21] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t21[22] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t21[23] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t21[24] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t21[25] = 58 */
movb	$58, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t21[26] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t21[27] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* put param t21 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t21 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t21 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* n = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -52(%rbp)
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t74[0] = 1 */
movl	$1, %ecx
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t74[4] = 69 */
movb	$69, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t74[5] = 108 */
movb	$108, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t74[6] = 32 */
movb	$32, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t74[7] = 102 */
movb	$102, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t74[8] = 97 */
movb	$97, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t74[9] = 99 */
movb	$99, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t74[10] = 116 */
movb	$116, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t74[11] = 111 */
movb	$111, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t74[12] = 114 */
movb	$114, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t74[13] = 105 */
movb	$105, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t74[14] = 97 */
movb	$97, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t74[15] = 108 */
movb	$108, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t74[16] = 32 */
movb	$32, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t74[17] = 100 */
movb	$100, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t74[18] = 101 */
movb	$101, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t74[19] = 32 */
movb	$32, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t74[20] = 0 */
movb	$0, %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* put param t74 */
movq	-60(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t74 */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t74 */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param n */
movl	-52(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t111[0] = 1 */
movl	$1, %ecx
movq	-89(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t111[4] = 32 */
movb	$32, %cl
movq	-89(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t111[5] = -61 */
movb	$-61, %cl
movq	-89(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t111[6] = -87 */
movb	$-87, %cl
movq	-89(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t111[7] = 115 */
movb	$115, %cl
movq	-89(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t111[8] = 32 */
movb	$32, %cl
movq	-89(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t111[9] = 0 */
movb	$0, %cl
movq	-89(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* put param t111 */
movq	-89(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t111 */
movq	-89(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t111 */
movq	-89(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param n */
movl	-52(%rbp), %eax
movl	%eax, 0(%rsp)
/* t126 = call e17 */
call 	e17
movl	4(%rsp), %eax
movl	%eax, -103(%rbp)
addq	$8, %rsp
/* put param t126 */
movl	-103(%rbp), %eax
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

/* t128[0] = 1 */
movl	$1, %ecx
movq	-111(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t128[4] = 69 */
movb	$69, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t128[5] = 108 */
movb	$108, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t128[6] = 32 */
movb	$32, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t128[7] = 102 */
movb	$102, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t128[8] = 97 */
movb	$97, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t128[9] = 99 */
movb	$99, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t128[10] = 116 */
movb	$116, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t128[11] = 111 */
movb	$111, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t128[12] = 114 */
movb	$114, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t128[13] = 105 */
movb	$105, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t128[14] = 97 */
movb	$97, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t128[15] = 108 */
movb	$108, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t128[16] = 32 */
movb	$32, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t128[17] = 100 */
movb	$100, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t128[18] = 101 */
movb	$101, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t128[19] = 32 */
movb	$32, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t128[20] = 0 */
movb	$0, %cl
movq	-111(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* put param t128 */
movq	-111(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t128 */
movq	-111(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t128 */
movq	-111(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param n */
movl	-52(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t165[0] = 1 */
movl	$1, %ecx
movq	-140(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t165[4] = 32 */
movb	$32, %cl
movq	-140(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t165[5] = -61 */
movb	$-61, %cl
movq	-140(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t165[6] = -87 */
movb	$-87, %cl
movq	-140(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t165[7] = 115 */
movb	$115, %cl
movq	-140(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t165[8] = 32 */
movb	$32, %cl
movq	-140(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t165[9] = 0 */
movb	$0, %cl
movq	-140(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* put param t165 */
movq	-140(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t165 */
movq	-140(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t165 */
movq	-140(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param n */
movl	-52(%rbp), %eax
movl	%eax, 0(%rsp)
/* t180 = call e10 */
call 	e10
movl	4(%rsp), %eax
movl	%eax, -154(%rbp)
addq	$8, %rsp
/* put param t180 */
movl	-154(%rbp), %eax
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
addq	$152, %rsp
pop	%rbp
ret
/* e38: skip */
e38:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

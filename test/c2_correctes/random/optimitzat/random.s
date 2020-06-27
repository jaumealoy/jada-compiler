.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e23 */
jmp	e23
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$168, %rsp
lea	-49(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-98(%rbp), %rax
movq	%rax, -65(%rbp)

lea	-151(%rbp), %rax
movq	%rax, -114(%rbp)

lea	-170(%rbp), %rax
movq	%rax, -159(%rbp)

/*  */
subq	$8, %rsp

/* t8[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t8[4] = 73 */
movb	$73, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t8[5] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t8[6] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t8[7] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t8[8] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t8[9] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t8[10] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t8[11] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t8[12] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t8[13] = 120 */
movb	$120, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t8[14] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t8[15] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t8[16] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t8[17] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t8[18] = 118 */
movb	$118, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t8[19] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t8[20] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t8[21] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t8[22] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t8[23] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t8[24] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t8[25] = -61 */
movb	$-61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t8[26] = -83 */
movb	$-83, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t8[27] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t8[28] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t8[29] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t8[30] = 58 */
movb	$58, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t8[31] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t8[32] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* put param t8 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t8 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t8 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* minim = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -57(%rbp)
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t71[0] = 1 */
movl	$1, %ecx
movq	-65(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t71[4] = 73 */
movb	$73, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t71[5] = 110 */
movb	$110, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t71[6] = 116 */
movb	$116, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t71[7] = 114 */
movb	$114, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t71[8] = 111 */
movb	$111, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t71[9] = 100 */
movb	$100, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t71[10] = 117 */
movb	$117, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t71[11] = 101 */
movb	$101, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t71[12] = 105 */
movb	$105, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t71[13] = 120 */
movb	$120, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t71[14] = 32 */
movb	$32, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t71[15] = 101 */
movb	$101, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t71[16] = 108 */
movb	$108, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t71[17] = 32 */
movb	$32, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t71[18] = 118 */
movb	$118, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t71[19] = 97 */
movb	$97, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t71[20] = 108 */
movb	$108, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t71[21] = 111 */
movb	$111, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t71[22] = 114 */
movb	$114, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t71[23] = 32 */
movb	$32, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t71[24] = 109 */
movb	$109, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t71[25] = -61 */
movb	$-61, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t71[26] = -96 */
movb	$-96, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t71[27] = 120 */
movb	$120, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t71[28] = 105 */
movb	$105, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t71[29] = 109 */
movb	$109, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t71[30] = 58 */
movb	$58, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t71[31] = 32 */
movb	$32, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t71[32] = 0 */
movb	$0, %cl
movq	-65(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* put param t71 */
movq	-65(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t71 */
movq	-65(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t71 */
movq	-65(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* maxim = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -106(%rbp)
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t134[0] = 1 */
movl	$1, %ecx
movq	-114(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t134[4] = 85 */
movb	$85, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t134[5] = 110 */
movb	$110, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t134[6] = 32 */
movb	$32, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t134[7] = 118 */
movb	$118, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t134[8] = 97 */
movb	$97, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t134[9] = 108 */
movb	$108, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t134[10] = 111 */
movb	$111, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t134[11] = 114 */
movb	$114, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t134[12] = 32 */
movb	$32, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t134[13] = 97 */
movb	$97, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t134[14] = 108 */
movb	$108, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t134[15] = 101 */
movb	$101, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t134[16] = 97 */
movb	$97, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t134[17] = 116 */
movb	$116, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t134[18] = 111 */
movb	$111, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t134[19] = 114 */
movb	$114, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t134[20] = 105 */
movb	$105, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t134[21] = 32 */
movb	$32, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t134[22] = 97 */
movb	$97, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t134[23] = 32 */
movb	$32, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t134[24] = 108 */
movb	$108, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t134[25] = 39 */
movb	$39, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t134[26] = 105 */
movb	$105, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t134[27] = 110 */
movb	$110, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t134[28] = 116 */
movb	$116, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t134[29] = 101 */
movb	$101, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t134[30] = 114 */
movb	$114, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t134[31] = 118 */
movb	$118, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t134[32] = 97 */
movb	$97, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t134[33] = 108 */
movb	$108, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t134[34] = 32 */
movb	$32, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t134[35] = 91 */
movb	$91, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t134[36] = 0 */
movb	$0, %cl
movq	-114(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* put param t134 */
movq	-114(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t134 */
movq	-114(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t134 */
movq	-114(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param minim */
movl	-57(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 44 */
movb	$44, %al
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
/*  */
subq	$8, %rsp

/* put param maxim */
movl	-106(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t205[0] = 1 */
movl	$1, %ecx
movq	-159(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t205[4] = 93 */
movb	$93, %cl
movq	-159(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t205[5] = 32 */
movb	$32, %cl
movq	-159(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t205[6] = -61 */
movb	$-61, %cl
movq	-159(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t205[7] = -87 */
movb	$-87, %cl
movq	-159(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t205[8] = 115 */
movb	$115, %cl
movq	-159(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t205[9] = 32 */
movb	$32, %cl
movq	-159(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t205[10] = 0 */
movb	$0, %cl
movq	-159(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* put param t205 */
movq	-159(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t205 */
movq	-159(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t205 */
movq	-159(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param minim */
movl	-57(%rbp), %eax
movl	%eax, 0(%rsp)
/* put param maxim */
movl	-106(%rbp), %eax
movl	%eax, 4(%rsp)
/* t222 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -174(%rbp)
addq	$16, %rsp
/* put param t222 */
movl	-174(%rbp), %eax
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
addq	$168, %rsp
pop	%rbp
ret
/* e23: skip */
e23:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

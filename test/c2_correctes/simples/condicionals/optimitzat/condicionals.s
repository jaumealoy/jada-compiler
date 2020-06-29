.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e46 */
jmp	e46
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$256, %rsp
lea	-51(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-93(%rbp), %rax
movq	%rax, -67(%rbp)

lea	-127(%rbp), %rax
movq	%rax, -101(%rbp)

lea	-149(%rbp), %rax
movq	%rax, -135(%rbp)

lea	-171(%rbp), %rax
movq	%rax, -157(%rbp)

lea	-191(%rbp), %rax
movq	%rax, -179(%rbp)

lea	-212(%rbp), %rax
movq	%rax, -199(%rbp)

lea	-238(%rbp), %rax
movq	%rax, -221(%rbp)

lea	-260(%rbp), %rax
movq	%rax, -246(%rbp)

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
/* t8[15] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t8[16] = 110 */
movb	$110, %cl
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
/* t8[24] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t8[25] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t8[26] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t8[27] = -61 */
movb	$-61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t8[28] = -88 */
movb	$-88, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t8[29] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t8[30] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t8[31] = 99 */
movb	$99, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t8[32] = 58 */
movb	$58, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t8[33] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t8[34] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
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

/* n = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -59(%rbp)
addq	$8, %rsp
/* if n <= 0 then goto e15 */
movl	-59(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jge	e15
/*  */
subq	$8, %rsp

/* t76[0] = 1 */
movl	$1, %ecx
movq	-67(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t76[4] = -61 */
movb	$-61, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t76[5] = -119 */
movb	$-119, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t76[6] = 115 */
movb	$115, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t76[7] = 32 */
movb	$32, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t76[8] = 117 */
movb	$117, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t76[9] = 110 */
movb	$110, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t76[10] = 32 */
movb	$32, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t76[11] = 118 */
movb	$118, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t76[12] = 97 */
movb	$97, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t76[13] = 108 */
movb	$108, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t76[14] = 111 */
movb	$111, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t76[15] = 114 */
movb	$114, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t76[16] = 32 */
movb	$32, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t76[17] = 112 */
movb	$112, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t76[18] = 111 */
movb	$111, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t76[19] = 115 */
movb	$115, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t76[20] = 105 */
movb	$105, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t76[21] = 116 */
movb	$116, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t76[22] = 105 */
movb	$105, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t76[23] = 117 */
movb	$117, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t76[24] = 10 */
movb	$10, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t76[25] = 0 */
movb	$0, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* put param t76 */
movq	-67(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t76 */
movq	-67(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t76 */
movq	-67(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e20 */
jmp	e20
/* e15: skip */
e15:
/* if n >= 0 then goto e18 */
movl	-59(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jle	e18
/*  */
subq	$8, %rsp

/* t124[0] = 1 */
movl	$1, %ecx
movq	-101(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t124[4] = -61 */
movb	$-61, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t124[5] = -119 */
movb	$-119, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t124[6] = 115 */
movb	$115, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t124[7] = 32 */
movb	$32, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t124[8] = 117 */
movb	$117, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t124[9] = 110 */
movb	$110, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t124[10] = 32 */
movb	$32, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t124[11] = 118 */
movb	$118, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t124[12] = 97 */
movb	$97, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t124[13] = 108 */
movb	$108, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t124[14] = 111 */
movb	$111, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t124[15] = 114 */
movb	$114, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t124[16] = 32 */
movb	$32, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t124[17] = 110 */
movb	$110, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t124[18] = 101 */
movb	$101, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t124[19] = 103 */
movb	$103, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t124[20] = 97 */
movb	$97, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t124[21] = 116 */
movb	$116, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t124[22] = 105 */
movb	$105, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t124[23] = 117 */
movb	$117, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t124[24] = 10 */
movb	$10, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t124[25] = 0 */
movb	$0, %cl
movq	-101(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* put param t124 */
movq	-101(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t124 */
movq	-101(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t124 */
movq	-101(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e20 */
jmp	e20
/* e18: skip */
e18:
/*  */
subq	$8, %rsp

/* t171[0] = 1 */
movl	$1, %ecx
movq	-135(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t171[4] = -61 */
movb	$-61, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t171[5] = -119 */
movb	$-119, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t171[6] = 115 */
movb	$115, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t171[7] = 32 */
movb	$32, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t171[8] = 122 */
movb	$122, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t171[9] = 101 */
movb	$101, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t171[10] = 114 */
movb	$114, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t171[11] = 111 */
movb	$111, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t171[12] = 10 */
movb	$10, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t171[13] = 0 */
movb	$0, %cl
movq	-135(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* put param t171 */
movq	-135(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t171 */
movq	-135(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t171 */
movq	-135(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e20: skip */
e20:
/* if 0 != n then goto e26 */
movl	$0, %eax
movl	-59(%rbp), %edx
cmpl	%eax, %edx
jne	e26
/*  */
subq	$8, %rsp

/* t195[0] = 1 */
movl	$1, %ecx
movq	-157(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t195[4] = -61 */
movb	$-61, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t195[5] = -119 */
movb	$-119, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t195[6] = 115 */
movb	$115, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t195[7] = 32 */
movb	$32, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t195[8] = 122 */
movb	$122, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t195[9] = 101 */
movb	$101, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t195[10] = 114 */
movb	$114, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t195[11] = 111 */
movb	$111, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t195[12] = 10 */
movb	$10, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t195[13] = 0 */
movb	$0, %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* put param t195 */
movq	-157(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t195 */
movq	-157(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t195 */
movq	-157(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e21 */
jmp	e21
/* e26: skip */
e26:
/* if 1 != n then goto e29 */
movl	$1, %eax
movl	-59(%rbp), %edx
cmpl	%eax, %edx
jne	e29
/*  */
subq	$8, %rsp

/* t219[0] = 1 */
movl	$1, %ecx
movq	-179(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t219[4] = -61 */
movb	$-61, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t219[5] = -119 */
movb	$-119, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t219[6] = 115 */
movb	$115, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t219[7] = 32 */
movb	$32, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t219[8] = 49 */
movb	$49, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t219[9] = 46 */
movb	$46, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t219[10] = 10 */
movb	$10, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t219[11] = 0 */
movb	$0, %cl
movq	-179(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* put param t219 */
movq	-179(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t219 */
movq	-179(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t219 */
movq	-179(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e29: skip */
e29:
/*  */
subq	$8, %rsp

/* t238[0] = 1 */
movl	$1, %ecx
movq	-199(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t238[4] = 68 */
movb	$68, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t238[5] = 101 */
movb	$101, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t238[6] = 102 */
movb	$102, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t238[7] = 97 */
movb	$97, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t238[8] = 117 */
movb	$117, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t238[9] = 108 */
movb	$108, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t238[10] = 116 */
movb	$116, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t238[11] = 10 */
movb	$10, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t238[12] = 0 */
movb	$0, %cl
movq	-199(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* put param t238 */
movq	-199(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t238 */
movq	-199(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t238 */
movq	-199(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e21: skip */
e21:
/* if n <= 0 then goto e34 */
movl	-59(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jge	e34
/* t260 = true */
movb	$1, -213(%rbp)
/* goto e32 */
jmp	e32
/* e34: skip */
e34:
/* t260 = false */
movb	$0, -213(%rbp)
/* e32: skip */
e32:
/* if 1 != t260 then goto e43 */
movb	$1, %al
movb	-213(%rbp), %dl
cmpb	%al, %dl
jne	e43
/*  */
subq	$8, %rsp

/* t262[0] = 1 */
movl	$1, %ecx
movq	-221(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t262[4] = -61 */
movb	$-61, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t262[5] = -119 */
movb	$-119, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t262[6] = 115 */
movb	$115, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t262[7] = 32 */
movb	$32, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t262[8] = 112 */
movb	$112, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t262[9] = 111 */
movb	$111, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t262[10] = 115 */
movb	$115, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t262[11] = 105 */
movb	$105, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t262[12] = 116 */
movb	$116, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t262[13] = 105 */
movb	$105, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t262[14] = 117 */
movb	$117, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t262[15] = 10 */
movb	$10, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t262[16] = 0 */
movb	$0, %cl
movq	-221(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* put param t262 */
movq	-221(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t262 */
movq	-221(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t262 */
movq	-221(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e35 */
jmp	e35
/* e43: skip */
e43:
/*  */
subq	$8, %rsp

/* t291[0] = 1 */
movl	$1, %ecx
movq	-246(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t291[4] = -61 */
movb	$-61, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t291[5] = -119 */
movb	$-119, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t291[6] = 115 */
movb	$115, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t291[7] = 32 */
movb	$32, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t291[8] = 60 */
movb	$60, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t291[9] = 61 */
movb	$61, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t291[10] = 32 */
movb	$32, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t291[11] = 48 */
movb	$48, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t291[12] = 10 */
movb	$10, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t291[13] = 0 */
movb	$0, %cl
movq	-246(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* put param t291 */
movq	-246(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t291 */
movq	-246(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t291 */
movq	-246(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e35: skip */
e35:
/* return */
addq	$256, %rsp
pop	%rbp
ret
/* e46: skip */
e46:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

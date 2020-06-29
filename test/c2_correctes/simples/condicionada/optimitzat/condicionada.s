.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e30 */
jmp	e30
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$232, %rsp
lea	-51(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-102(%rbp), %rax
movq	%rax, -67(%rbp)

lea	-129(%rbp), %rax
movq	%rax, -122(%rbp)

lea	-148(%rbp), %rax
movq	%rax, -141(%rbp)

lea	-195(%rbp), %rax
movq	%rax, -156(%rbp)

lea	-211(%rbp), %rax
movq	%rax, -203(%rbp)

lea	-227(%rbp), %rax
movq	%rax, -219(%rbp)

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

/* a = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -59(%rbp)
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t75[0] = 1 */
movl	$1, %ecx
movq	-67(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t75[4] = 73 */
movb	$73, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t75[5] = 110 */
movb	$110, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t75[6] = 116 */
movb	$116, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t75[7] = 114 */
movb	$114, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t75[8] = 111 */
movb	$111, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t75[9] = 100 */
movb	$100, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t75[10] = 117 */
movb	$117, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t75[11] = 101 */
movb	$101, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t75[12] = 105 */
movb	$105, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t75[13] = 120 */
movb	$120, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t75[14] = 32 */
movb	$32, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t75[15] = 117 */
movb	$117, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t75[16] = 110 */
movb	$110, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t75[17] = 32 */
movb	$32, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t75[18] = 118 */
movb	$118, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t75[19] = 97 */
movb	$97, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t75[20] = 108 */
movb	$108, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t75[21] = 111 */
movb	$111, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t75[22] = 114 */
movb	$114, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t75[23] = 32 */
movb	$32, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t75[24] = 110 */
movb	$110, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t75[25] = 117 */
movb	$117, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t75[26] = 109 */
movb	$109, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t75[27] = -61 */
movb	$-61, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t75[28] = -88 */
movb	$-88, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t75[29] = 114 */
movb	$114, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t75[30] = 105 */
movb	$105, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t75[31] = 99 */
movb	$99, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t75[32] = 58 */
movb	$58, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t75[33] = 32 */
movb	$32, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t75[34] = 0 */
movb	$0, %cl
movq	-67(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* put param t75 */
movq	-67(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t75 */
movq	-67(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t75 */
movq	-67(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* b = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -110(%rbp)
addq	$8, %rsp
/* if b == 0 then goto e18 */
movl	-110(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
je	e18
/* t263 = a / b */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-110(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-59(%rbp), %eax
cdqe
idiv	%r8
movl	%eax, -235(%rbp)

/* t143 = t263 */
movl	-235(%rbp), %eax
movl	%eax, -114(%rbp)

/* if t143 <= 0 then goto e18 */
movl	-114(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jge	e18
/*  */
subq	$8, %rsp

/* t145[0] = 1 */
movl	$1, %ecx
movq	-122(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t145[4] = 65 */
movb	$65, %cl
movq	-122(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t145[5] = 10 */
movb	$10, %cl
movq	-122(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t145[6] = 0 */
movb	$0, %cl
movq	-122(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* put param t145 */
movq	-122(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t145 */
movq	-122(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t145 */
movq	-122(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e22 */
jmp	e22
/* e18: skip */
e18:
/* if b == 0 then goto e20 */
movl	-110(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
je	e20
/* t263 = a / b */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-110(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-59(%rbp), %eax
cdqe
idiv	%r8
movl	%eax, -235(%rbp)

/* t155 = t263 */
movl	-235(%rbp), %eax
movl	%eax, -133(%rbp)

/* if t155 >= 0 then goto e22 */
movl	-133(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jle	e22
/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* t157[0] = 1 */
movl	$1, %ecx
movq	-141(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t157[4] = 66 */
movb	$66, %cl
movq	-141(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t157[5] = 10 */
movb	$10, %cl
movq	-141(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t157[6] = 0 */
movb	$0, %cl
movq	-141(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* put param t157 */
movq	-141(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t157 */
movq	-141(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t157 */
movq	-141(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e22: skip */
e22:
/*  */
subq	$8, %rsp

/* t166[0] = 1 */
movl	$1, %ecx
movq	-156(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t166[4] = 80 */
movb	$80, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t166[5] = 111 */
movb	$111, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t166[6] = 116 */
movb	$116, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t166[7] = 101 */
movb	$101, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t166[8] = 110 */
movb	$110, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t166[9] = 99 */
movb	$99, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t166[10] = 105 */
movb	$105, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t166[11] = 97 */
movb	$97, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t166[12] = 108 */
movb	$108, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t166[13] = 32 */
movb	$32, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t166[14] = 101 */
movb	$101, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t166[15] = 120 */
movb	$120, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t166[16] = 99 */
movb	$99, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t166[17] = 101 */
movb	$101, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t166[18] = 112 */
movb	$112, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t166[19] = 99 */
movb	$99, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t166[20] = 105 */
movb	$105, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t166[21] = -61 */
movb	$-61, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t166[22] = -77 */
movb	$-77, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t166[23] = 32 */
movb	$32, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t166[24] = 110 */
movb	$110, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t166[25] = 111 */
movb	$111, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t166[26] = 32 */
movb	$32, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t166[27] = 99 */
movb	$99, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t166[28] = 111 */
movb	$111, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t166[29] = 110 */
movb	$110, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t166[30] = 116 */
movb	$116, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t166[31] = 114 */
movb	$114, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t166[32] = 111 */
movb	$111, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t166[33] = 108 */
movb	$108, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t166[34] = 97 */
movb	$97, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t166[35] = 100 */
movb	$100, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t166[36] = 97 */
movb	$97, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t166[37] = 10 */
movb	$10, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t166[38] = 0 */
movb	$0, %cl
movq	-156(%rbp), %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* put param t166 */
movq	-156(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t166 */
movq	-156(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t166 */
movq	-156(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param a */
movl	-59(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t239[0] = 1 */
movl	$1, %ecx
movq	-203(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t239[4] = 32 */
movb	$32, %cl
movq	-203(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t239[5] = 47 */
movb	$47, %cl
movq	-203(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t239[6] = 32 */
movb	$32, %cl
movq	-203(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t239[7] = 0 */
movb	$0, %cl
movq	-203(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* put param t239 */
movq	-203(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t239 */
movq	-203(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t239 */
movq	-203(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param b */
movl	-110(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t250[0] = 1 */
movl	$1, %ecx
movq	-219(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t250[4] = 32 */
movb	$32, %cl
movq	-219(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t250[5] = 61 */
movb	$61, %cl
movq	-219(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t250[6] = 32 */
movb	$32, %cl
movq	-219(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t250[7] = 0 */
movb	$0, %cl
movq	-219(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* put param t250 */
movq	-219(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t250 */
movq	-219(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t250 */
movq	-219(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t263 = a / b */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-110(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-59(%rbp), %eax
cdqe
idiv	%r8
movl	%eax, -235(%rbp)

/* t261 = t263 */
movl	-235(%rbp), %eax
movl	%eax, -231(%rbp)

/* put param t261 */
movl	-231(%rbp), %eax
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
addq	$232, %rsp
pop	%rbp
ret
/* e30: skip */
e30:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

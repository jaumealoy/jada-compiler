.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e31 */
jmp	e31
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$152, %rsp
lea	-44(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-95(%rbp), %rax
movq	%rax, -78(%rbp)

lea	-123(%rbp), %rax
movq	%rax, -103(%rbp)

lea	-158(%rbp), %rax
movq	%rax, -131(%rbp)

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
/* t8[18] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t8[19] = -61 */
movb	$-61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t8[20] = -70 */
movb	$-70, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t8[21] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t8[22] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t8[23] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t8[24] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t8[25] = 58 */
movb	$58, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t8[26] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t8[27] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
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
movl	%eax, -52(%rbp)
addq	$8, %rsp
/* t62 = n % 2 */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	$2, %eax
cdqe
movq	%rax, %r8
movl	-52(%rbp), %eax
cdqe
idiv	%r8
movl	%edx, -56(%rbp)

/* if t62 != 0 then goto e16 */
movl	-56(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jne	e16
/* t64 = true */
movb	$1, -57(%rbp)
/* goto e17 */
jmp	e17
/* e16: skip */
e16:
/* t64 = false */
movb	$0, -57(%rbp)
/* e17: skip */
e17:
/* esParell = t64 */
movb	-57(%rbp), %al
movb	%al, -58(%rbp)

/* if 1 == esParell then goto e20 */
movb	$1, %al
movb	-58(%rbp), %dl
cmpb	%al, %dl
je	e20
/* t68 = n * 2 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-52(%rbp), %eax
movl	$2, %edx
imul	%rdx, %rax
movl	%eax, -66(%rbp)

/* goto e21 */
jmp	e21
/* e20: skip */
e20:
/* t68 = n */
movl	-52(%rbp), %eax
movl	%eax, -66(%rbp)

/* e21: skip */
e21:
/* m = t68 */
movl	-66(%rbp), %eax
movl	%eax, -70(%rbp)

/* if 1 != esParell then goto e25 */
movb	$1, %al
movb	-58(%rbp), %dl
cmpb	%al, %dl
jne	e25
/*  */
subq	$8, %rsp

/* t70[0] = 1 */
movl	$1, %ecx
movq	-78(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t70[4] = -61 */
movb	$-61, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t70[5] = -119 */
movb	$-119, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t70[6] = 115 */
movb	$115, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t70[7] = 32 */
movb	$32, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t70[8] = 112 */
movb	$112, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t70[9] = 97 */
movb	$97, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t70[10] = 114 */
movb	$114, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t70[11] = 101 */
movb	$101, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t70[12] = 108 */
movb	$108, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t70[13] = 108 */
movb	$108, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t70[14] = 33 */
movb	$33, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t70[15] = 10 */
movb	$10, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t70[16] = 0 */
movb	$0, %cl
movq	-78(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* put param t70 */
movq	-78(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t70 */
movq	-78(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t70 */
movq	-78(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e27 */
jmp	e27
/* e25: skip */
e25:
/*  */
subq	$8, %rsp

/* t99[0] = 1 */
movl	$1, %ecx
movq	-103(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t99[4] = 78 */
movb	$78, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t99[5] = 111 */
movb	$111, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t99[6] = 32 */
movb	$32, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t99[7] = -61 */
movb	$-61, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t99[8] = -87 */
movb	$-87, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t99[9] = 115 */
movb	$115, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t99[10] = 32 */
movb	$32, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t99[11] = 112 */
movb	$112, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t99[12] = 97 */
movb	$97, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t99[13] = 114 */
movb	$114, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t99[14] = 101 */
movb	$101, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t99[15] = 108 */
movb	$108, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t99[16] = 108 */
movb	$108, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t99[17] = 33 */
movb	$33, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t99[18] = 10 */
movb	$10, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t99[19] = 0 */
movb	$0, %cl
movq	-103(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* put param t99 */
movq	-103(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t99 */
movq	-103(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t99 */
movq	-103(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e27: skip */
e27:
/*  */
subq	$8, %rsp

/* t134[0] = 1 */
movl	$1, %ecx
movq	-131(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t134[4] = 85 */
movb	$85, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t134[5] = 110 */
movb	$110, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t134[6] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t134[7] = 110 */
movb	$110, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t134[8] = -61 */
movb	$-61, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t134[9] = -70 */
movb	$-70, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t134[10] = 109 */
movb	$109, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t134[11] = 101 */
movb	$101, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t134[12] = 114 */
movb	$114, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t134[13] = 111 */
movb	$111, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t134[14] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t134[15] = 112 */
movb	$112, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t134[16] = 97 */
movb	$97, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t134[17] = 114 */
movb	$114, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t134[18] = 101 */
movb	$101, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t134[19] = 108 */
movb	$108, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t134[20] = 108 */
movb	$108, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t134[21] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t134[22] = -61 */
movb	$-61, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t134[23] = -87 */
movb	$-87, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t134[24] = 115 */
movb	$115, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t134[25] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t134[26] = 0 */
movb	$0, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* put param t134 */
movq	-131(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t134 */
movq	-131(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t134 */
movq	-131(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param m */
movl	-70(%rbp), %eax
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
/* e31: skip */
e31:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

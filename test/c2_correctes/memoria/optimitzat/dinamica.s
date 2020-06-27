.global _start
.bss
	var9_data:	.fill	0, 1, 0
	var10_data:	.fill	0, 1, 0
	var12_data:	.fill	0, 1, 0
	var16_data:	.fill	0, 1, 0
.data
	var9:	.quad	var9_data
	var10:	.quad	var10_data
	var12:	.quad	var12_data
	var16:	.quad	var16_data
.text
_start:
call	jada_init
/* t12 = 1 */
movq	$1, var12
/* t12 = t12 * 5 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	var12, %rax
movl	$5, %edx
imul	%rdx, %rax
movq	%rax, var12

/* t10 = t12 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	var12, %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, var10

/* t10 = t10 + 4 */
movq	var10, %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, var10

/* t9 = malloc t10 */
movq	var10, %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, var9
pop	%rax

/* t9[0] = 1 */
movl	$1, %ecx
movq	var9, %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t9 */
movq	var9, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* VECTOR_GLOBAL = t9 */
movq	var9, %rax
movq	%rax, var16

/* goto e49 */
jmp	e49
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$48, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

/* t21 = 1 */
movq	$1, -32(%rbp)
/* t21 = t21 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -32(%rbp)

/* t19 = t21 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t19 = t19 + 4 */
movq	-24(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t18 = malloc t19 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t18[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t18 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v = t18 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -44(%rbp)
/* if i >= n then goto e15 */
movl	-44(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e15
/* e50: skip */
e50:
/* t30 = i */
movl	-44(%rbp), %eax
movl	%eax, -48(%rbp)

/* t33 = t30 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-48(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -52(%rbp)

/* t33 = t33 + 4 */
movl	-52(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -52(%rbp)

/*  */
subq	$16, %rsp

/* put param 1 */
movl	$1, %eax
movl	%eax, 0(%rsp)
/* put param 100 */
movl	$100, %eax
movl	%eax, 4(%rsp)
/* t37 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -56(%rbp)
addq	$16, %rsp
/* v[t33] = t37 */
movl	-56(%rbp), %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* i = i + 1 */
movl	-44(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* if i >= n then goto e15 */
movl	-44(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e15
/* goto e50 */
jmp	e50
/* e15: skip */
e15:
/* return v */
movq	-40(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$48, %rsp
pop	%rbp
ret
/* goto e49 */
jmp	e49
/* e18: skip */
e18:
/* preamble e18 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$16, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= n then goto e23 */
movl	-12(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e23
/* e51: skip */
e51:
/*  */
subq	$8, %rsp

/* t44 = i */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* t47 = t44 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -20(%rbp)

/* t47 = t47 + 4 */
movl	-20(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/* t49 = v[t47] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-20(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -24(%rbp)

/* put param t49 */
movl	-24(%rbp), %eax
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

/* if i >= n then goto e23 */
movl	-12(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e23
/* goto e51 */
jmp	e51
/* e23: skip */
e23:
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* return */
addq	$16, %rsp
pop	%rbp
ret
/* goto e49 */
jmp	e49
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$312, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-48(%rbp), %rax
movq	%rax, -48(%rbp)

lea	-56(%rbp), %rax
movq	%rax, -56(%rbp)

lea	-64(%rbp), %rax
movq	%rax, -64(%rbp)

lea	-72(%rbp), %rax
movq	%rax, -72(%rbp)

lea	-92(%rbp), %rax
movq	%rax, -92(%rbp)

lea	-100(%rbp), %rax
movq	%rax, -100(%rbp)

lea	-108(%rbp), %rax
movq	%rax, -108(%rbp)

lea	-116(%rbp), %rax
movq	%rax, -116(%rbp)

lea	-169(%rbp), %rax
movq	%rax, -132(%rbp)

lea	-206(%rbp), %rax
movq	%rax, -177(%rbp)

lea	-214(%rbp), %rax
movq	%rax, -214(%rbp)

lea	-222(%rbp), %rax
movq	%rax, -222(%rbp)

lea	-230(%rbp), %rax
movq	%rax, -230(%rbp)

lea	-238(%rbp), %rax
movq	%rax, -238(%rbp)

lea	-246(%rbp), %rax
movq	%rax, -246(%rbp)

lea	-254(%rbp), %rax
movq	%rax, -254(%rbp)

lea	-266(%rbp), %rax
movq	%rax, -266(%rbp)

lea	-274(%rbp), %rax
movq	%rax, -274(%rbp)

lea	-282(%rbp), %rax
movq	%rax, -282(%rbp)

lea	-290(%rbp), %rax
movq	%rax, -290(%rbp)

lea	-298(%rbp), %rax
movq	%rax, -298(%rbp)

lea	-306(%rbp), %rax
movq	%rax, -306(%rbp)

lea	-318(%rbp), %rax
movq	%rax, -318(%rbp)

/* t57 = 1 */
movq	$1, -32(%rbp)
/* t57 = t57 * 5 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	$5, %edx
imul	%rdx, %rax
movq	%rax, -32(%rbp)

/* t55 = t57 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t55 = t55 + 4 */
movq	-24(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t54 = malloc t55 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t54[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t54 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* t67 = 1 */
movq	$1, -64(%rbp)
/* t67 = t67 * 5 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-64(%rbp), %rax
movl	$5, %edx
imul	%rdx, %rax
movq	%rax, -64(%rbp)

/* t65 = t67 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-64(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -56(%rbp)

/* t65 = t65 + 4 */
movq	-56(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -56(%rbp)

/* t64 = malloc t65 */
movq	-56(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -48(%rbp)
pop	%rax

/* t64[0] = 1 */
movl	$1, %ecx
movq	-48(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t64 */
movq	-48(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v2 = t64 */
movq	-48(%rbp), %rax
movq	%rax, -72(%rbp)

/* t267 = 0 */
movl	$0, -310(%rbp)
/* t77 = t267 */
movl	-310(%rbp), %eax
movl	%eax, -76(%rbp)

/* t77 = t77 + 4 */
movl	-76(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -76(%rbp)

/* v2[t77] = 30 */
movl	$30, %ecx
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-76(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t84 = 4 */
movl	$4, -80(%rbp)
/* t84 = t84 + 4 */
movl	-80(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -80(%rbp)

/* v2[t84] = 4 */
movl	$4, %ecx
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-80(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t92 = 8 */
movl	$8, -84(%rbp)
/* t92 = t92 + 4 */
movl	-84(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -84(%rbp)

/* v2[t92] = 99 */
movl	$99, %ecx
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-84(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* decrement v2 */
movq	-72(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* t100 = 1 */
movq	$1, -108(%rbp)
/* t268 = t100 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-108(%rbp), %rax
movl	$4, %edx
imul	%rdx, %rax
movq	%rax, -318(%rbp)

/* t100 = t268 */
movq	-318(%rbp), %rax
movq	%rax, -108(%rbp)

/* t268 = t100 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-108(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -318(%rbp)

/* t98 = t268 */
movq	-318(%rbp), %rax
movq	%rax, -100(%rbp)

/* t98 = t98 + 4 */
movq	-100(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -100(%rbp)

/* t97 = malloc t98 */
movq	-100(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -92(%rbp)
pop	%rax

/* t97[0] = 1 */
movl	$1, %ecx
movq	-92(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t97 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v3 = t97 */
movq	-92(%rbp), %rax
movq	%rax, -116(%rbp)

/* t110 = t267 */
movl	-310(%rbp), %eax
movl	%eax, -120(%rbp)

/* t110 = t110 + 4 */
movl	-120(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -120(%rbp)

/* t112 = v3[t110] */
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-120(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -124(%rbp)

/* if t112 != 30 then goto e39 */
movl	-124(%rbp), %eax
movl	$30, %edx
cmpl	%eax, %edx
jne	e39
/*  */
subq	$8, %rsp

/* t113[0] = 1 */
movl	$1, %ecx
movq	-132(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t113[4] = 118 */
movb	$118, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t113[5] = 51 */
movb	$51, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t113[6] = 32 */
movb	$32, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t113[7] = 111 */
movb	$111, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t113[8] = 99 */
movb	$99, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t113[9] = 117 */
movb	$117, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t113[10] = 112 */
movb	$112, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t113[11] = 97 */
movb	$97, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t113[12] = 32 */
movb	$32, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t113[13] = 101 */
movb	$101, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t113[14] = 108 */
movb	$108, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t113[15] = 32 */
movb	$32, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t113[16] = 109 */
movb	$109, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t113[17] = 97 */
movb	$97, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t113[18] = 116 */
movb	$116, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t113[19] = 101 */
movb	$101, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t113[20] = 105 */
movb	$105, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t113[21] = 120 */
movb	$120, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t113[22] = 32 */
movb	$32, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t113[23] = 101 */
movb	$101, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t113[24] = 115 */
movb	$115, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t113[25] = 112 */
movb	$112, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t113[26] = 97 */
movb	$97, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t113[27] = 105 */
movb	$105, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t113[28] = 32 */
movb	$32, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t113[29] = 113 */
movb	$113, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t113[30] = 117 */
movb	$117, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t113[31] = 101 */
movb	$101, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t113[32] = 32 */
movb	$32, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t113[33] = 118 */
movb	$118, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t113[34] = 50 */
movb	$50, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t113[35] = 10 */
movb	$10, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t113[36] = 0 */
movb	$0, %cl
movq	-132(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* put param t113 */
movq	-132(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t113 */
movq	-132(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t113 */
movq	-132(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e41 */
jmp	e41
/* e39: skip */
e39:
/*  */
subq	$8, %rsp

/* t182[0] = 1 */
movl	$1, %ecx
movq	-177(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t182[4] = 118 */
movb	$118, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t182[5] = 51 */
movb	$51, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t182[6] = 32 */
movb	$32, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t182[7] = -61 */
movb	$-61, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t182[8] = -87 */
movb	$-87, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t182[9] = 115 */
movb	$115, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t182[10] = 32 */
movb	$32, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t182[11] = 117 */
movb	$117, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t182[12] = 110 */
movb	$110, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t182[13] = 32 */
movb	$32, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t182[14] = 98 */
movb	$98, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t182[15] = 108 */
movb	$108, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t182[16] = 111 */
movb	$111, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t182[17] = 99 */
movb	$99, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t182[18] = 32 */
movb	$32, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t182[19] = 100 */
movb	$100, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t182[20] = 105 */
movb	$105, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t182[21] = 102 */
movb	$102, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t182[22] = 101 */
movb	$101, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t182[23] = 114 */
movb	$114, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t182[24] = 101 */
movb	$101, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t182[25] = 110 */
movb	$110, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t182[26] = 116 */
movb	$116, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t182[27] = 10 */
movb	$10, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t182[28] = 0 */
movb	$0, %cl
movq	-177(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* put param t182 */
movq	-177(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t182 */
movq	-177(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t182 */
movq	-177(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e41: skip */
e41:
/*  */
subq	$16, %rsp

/* put param 5 */
movl	$5, %eax
movl	%eax, 0(%rsp)
/* v4 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -222(%rbp)
addq	$16, %rsp
/* t240 = 1 */
movq	$1, -246(%rbp)
/* t240 = t240 * 5 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-246(%rbp), %rax
movl	$5, %edx
imul	%rdx, %rax
movq	%rax, -246(%rbp)

/* t238 = t240 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-246(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -238(%rbp)

/* t238 = t238 + 4 */
movq	-238(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -238(%rbp)

/* t237 = malloc t238 */
movq	-238(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -230(%rbp)
pop	%rax

/* t237[0] = 1 */
movl	$1, %ecx
movq	-230(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t237 */
movq	-230(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v5 = t237 */
movq	-230(%rbp), %rax
movq	%rax, -254(%rbp)

/* t267 = 0 */
movl	$0, -310(%rbp)
/* t250 = t267 */
movl	-310(%rbp), %eax
movl	%eax, -258(%rbp)

/* t250 = t250 + 4 */
movl	-258(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -258(%rbp)

/* v5[t250] = 909 */
movl	$909, %ecx
movq	-254(%rbp), %rax
movq	$0, %rbx
movl	-258(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/*  */
subq	$16, %rsp

/* put param v4 */
movq	-222(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v4 */
movq	-222(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 5 */
movl	$5, %eax
movl	%eax, 8(%rsp)
/* call e18 */
call 	e18
addq	$16, %rsp
/* decrement v4 */
movq	-222(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param v5 */
movq	-254(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v5 */
movq	-254(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 5 */
movl	$5, %eax
movl	%eax, 8(%rsp)
/* call e18 */
call 	e18
addq	$16, %rsp
/* decrement v5 */
movq	-254(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* t256 = 1 */
movq	$1, -282(%rbp)
/* t256 = t256 * 5 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-282(%rbp), %rax
movl	$5, %edx
imul	%rdx, %rax
movq	%rax, -282(%rbp)

/* t254 = t256 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-282(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -274(%rbp)

/* t254 = t254 + 4 */
movq	-274(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -274(%rbp)

/* t253 = malloc t254 */
movq	-274(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -266(%rbp)
pop	%rax

/* t253[0] = 1 */
movl	$1, %ecx
movq	-266(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* decrement v5 */
movq	-254(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* increment t253 */
movq	-266(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* t263 = 1 */
movq	$1, -306(%rbp)
/* t263 = t263 * 5 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-306(%rbp), %rax
movl	$5, %edx
imul	%rdx, %rax
movq	%rax, -306(%rbp)

/* t261 = t263 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-306(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -298(%rbp)

/* t261 = t261 + 4 */
movq	-298(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -298(%rbp)

/* t260 = malloc t261 */
movq	-298(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -290(%rbp)
pop	%rax

/* t260[0] = 1 */
movl	$1, %ecx
movq	-290(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* put param t260 */
movq	-290(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t260 */
movq	-290(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 5 */
movl	$5, %eax
movl	%eax, 8(%rsp)
/* call e18 */
call 	e18
addq	$16, %rsp
/* decrement t260 */
movq	-290(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v */
movq	-40(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v3 */
movq	-116(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v4 */
movq	-222(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v5 */
movq	-254(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$312, %rsp
pop	%rbp
ret
/* e49: skip */
e49:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

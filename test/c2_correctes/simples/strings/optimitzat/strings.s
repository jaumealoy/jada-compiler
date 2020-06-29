.global _start
.bss
	var20_data:	.fill	35, 1, 0
	var85_data:	.fill	0, 1, 0
	var86_data:	.fill	50, 1, 0
	var181_data:	.fill	0, 1, 0
.data
	var20:	.quad	var20_data
	var85:	.quad	var85_data
	var86:	.quad	var86_data
	var181:	.quad	var181_data
.text
_start:
call	jada_init
/* goto e17 */
jmp	e17
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$24, %rsp
/* length = 0 */
movl	$0, -12(%rbp)
/* t12 = length */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* t15 = t12 */
movl	-16(%rbp), %eax
movl	%eax, -20(%rbp)

/* t723 = t15 + 4 */
movl	-20(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -25(%rbp)

/* t15 = t723 */
movl	-25(%rbp), %eax
movl	%eax, -20(%rbp)

/* t18 = str[t15] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-20(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -21(%rbp)

/* if t18 == 0 then goto e15 */
movb	-21(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e15
/* e78: skip */
e78:
/* length = length + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* t12 = length */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* t15 = t12 */
movl	-16(%rbp), %eax
movl	%eax, -20(%rbp)

/* t723 = t15 + 4 */
movl	-20(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -25(%rbp)

/* t15 = t723 */
movl	-25(%rbp), %eax
movl	%eax, -20(%rbp)

/* t18 = str[t15] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-20(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -21(%rbp)

/* if t18 == 0 then goto e15 */
movb	-21(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e15
/* goto e78 */
jmp	e78
/* e15: skip */
e15:
/* return length */
movl	-12(%rbp), %eax
movl	%eax, 16(%rbp)
addq	$24, %rsp
pop	%rbp
ret
/* e17: skip */
e17:
/* t20[0] = 1 */
movl	$1, %ecx
movq	var20, %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t20[4] = -61 */
movb	$-61, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t20[5] = -119 */
movb	$-119, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t20[6] = 115 */
movb	$115, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t20[7] = 32 */
movb	$32, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t20[8] = 117 */
movb	$117, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t20[9] = 110 */
movb	$110, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t20[10] = 97 */
movb	$97, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t20[11] = 32 */
movb	$32, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t20[12] = 99 */
movb	$99, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t20[13] = 97 */
movb	$97, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t20[14] = 100 */
movb	$100, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t20[15] = 101 */
movb	$101, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t20[16] = 110 */
movb	$110, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t20[17] = 97 */
movb	$97, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t20[18] = 32 */
movb	$32, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t20[19] = 100 */
movb	$100, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t20[20] = 101 */
movb	$101, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t20[21] = 32 */
movb	$32, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t20[22] = 116 */
movb	$116, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t20[23] = 101 */
movb	$101, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t20[24] = 120 */
movb	$120, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t20[25] = 116 */
movb	$116, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t20[26] = 32 */
movb	$32, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t20[27] = 103 */
movb	$103, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t20[28] = 108 */
movb	$108, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t20[29] = 111 */
movb	$111, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t20[30] = 98 */
movb	$98, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t20[31] = 97 */
movb	$97, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t20[32] = 108 */
movb	$108, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t20[33] = 46 */
movb	$46, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t20[34] = 0 */
movb	$0, %cl
movq	var20, %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* increment t20 */
movq	var20, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* TXT_1 = t20 */
movq	var20, %rax
movq	%rax, var85

/* t86[0] = 1 */
movl	$1, %ecx
movq	var86, %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t86[4] = 73 */
movb	$73, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t86[5] = 32 */
movb	$32, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t86[6] = 97 */
movb	$97, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t86[7] = 113 */
movb	$113, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t86[8] = 117 */
movb	$117, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t86[9] = 101 */
movb	$101, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t86[10] = 115 */
movb	$115, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t86[11] = 116 */
movb	$116, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t86[12] = 97 */
movb	$97, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t86[13] = 32 */
movb	$32, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t86[14] = 117 */
movb	$117, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t86[15] = 110 */
movb	$110, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t86[16] = 97 */
movb	$97, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t86[17] = 32 */
movb	$32, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t86[18] = 99 */
movb	$99, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t86[19] = 97 */
movb	$97, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t86[20] = 100 */
movb	$100, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t86[21] = 101 */
movb	$101, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t86[22] = 110 */
movb	$110, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t86[23] = 97 */
movb	$97, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t86[24] = 32 */
movb	$32, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t86[25] = 100 */
movb	$100, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t86[26] = 101 */
movb	$101, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t86[27] = 32 */
movb	$32, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t86[28] = 116 */
movb	$116, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t86[29] = 101 */
movb	$101, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t86[30] = 120 */
movb	$120, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t86[31] = 116 */
movb	$116, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t86[32] = 32 */
movb	$32, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t86[33] = 103 */
movb	$103, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t86[34] = 108 */
movb	$108, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t86[35] = 111 */
movb	$111, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t86[36] = 98 */
movb	$98, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t86[37] = 97 */
movb	$97, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t86[38] = 108 */
movb	$108, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* t86[39] = 32 */
movb	$32, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 39(%rax)
/* t86[40] = 99 */
movb	$99, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 40(%rax)
/* t86[41] = 111 */
movb	$111, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 41(%rax)
/* t86[42] = 110 */
movb	$110, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 42(%rax)
/* t86[43] = 115 */
movb	$115, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 43(%rax)
/* t86[44] = 116 */
movb	$116, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 44(%rax)
/* t86[45] = 97 */
movb	$97, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 45(%rax)
/* t86[46] = 110 */
movb	$110, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 46(%rax)
/* t86[47] = 116 */
movb	$116, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 47(%rax)
/* t86[48] = 46 */
movb	$46, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 48(%rax)
/* t86[49] = 0 */
movb	$0, %cl
movq	var86, %rax
movq	$0, %rbx
movb	%cl, 49(%rax)
/* increment t86 */
movq	var86, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* TXT_2 = t86 */
movq	var86, %rax
movq	%rax, var181

/* goto e77 */
jmp	e77
/* e18: skip */
e18:
/* preamble e18 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$144, %rsp
lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-48(%rbp), %rax
movq	%rax, -48(%rbp)

/* t190 = 1 */
movq	$1, -40(%rbp)
/* t190 = t190 * 1000 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	$1000, %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t188 = t190 */
movq	-40(%rbp), %rax
movq	%rax, -32(%rbp)

/* t188 = t188 + 4 */
movq	-32(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -32(%rbp)

/* t187 = malloc t188 */
movq	-32(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -24(%rbp)
pop	%rax

/* t187[0] = 1 */
movl	$1, %ecx
movq	-24(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t187 */
movq	-24(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* aux = t187 */
movq	-24(%rbp), %rax
movq	%rax, -48(%rbp)

/* total = 0 */
movl	$0, -52(%rbp)
/* i = 0 */
movl	$0, -56(%rbp)
/* t200 = i */
movl	-56(%rbp), %eax
movl	%eax, -60(%rbp)

/* t203 = t200 */
movl	-60(%rbp), %eax
movl	%eax, -64(%rbp)

/* t724 = t203 + 4 */
movl	-64(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -144(%rbp)

/* t203 = t724 */
movl	-144(%rbp), %eax
movl	%eax, -64(%rbp)

/* t206 = a[t203] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -65(%rbp)

/* if t206 == 0 then goto e27 */
movb	-65(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e27
/* e80: skip */
e80:
/* t213 = total */
movl	-52(%rbp), %eax
movl	%eax, -77(%rbp)

/* t721 = total + 1 */
movl	-52(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -136(%rbp)

/* total = t721 */
movl	-136(%rbp), %eax
movl	%eax, -52(%rbp)

/* t213 = t213 + 4 */
movl	-77(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -77(%rbp)

/* t221 = i */
movl	-56(%rbp), %eax
movl	%eax, -89(%rbp)

/* t722 = i + 1 */
movl	-56(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -140(%rbp)

/* i = t722 */
movl	-140(%rbp), %eax
movl	%eax, -56(%rbp)

/* t221 = t221 + 4 */
movl	-89(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -89(%rbp)

/* t223 = a[t221] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-89(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -90(%rbp)

/* aux[t213] = t223 */
movb	-90(%rbp), %cl
movq	-48(%rbp), %rax
movq	$0, %rbx
movl	-77(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t200 = i */
movl	-56(%rbp), %eax
movl	%eax, -60(%rbp)

/* t203 = t200 */
movl	-60(%rbp), %eax
movl	%eax, -64(%rbp)

/* t724 = t203 + 4 */
movl	-64(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -144(%rbp)

/* t203 = t724 */
movl	-144(%rbp), %eax
movl	%eax, -64(%rbp)

/* t206 = a[t203] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -65(%rbp)

/* if t206 == 0 then goto e27 */
movb	-65(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e27
/* goto e80 */
jmp	e80
/* e27: skip */
e27:
/* i = 0 */
movl	$0, -56(%rbp)
/* t226 = i */
movl	-56(%rbp), %eax
movl	%eax, -94(%rbp)

/* t229 = t226 */
movl	-94(%rbp), %eax
movl	%eax, -98(%rbp)

/* t725 = t229 + 4 */
movl	-98(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -148(%rbp)

/* t229 = t725 */
movl	-148(%rbp), %eax
movl	%eax, -98(%rbp)

/* t232 = b[t229] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-98(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -99(%rbp)

/* if t232 == 0 then goto e32 */
movb	-99(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e32
/* e79: skip */
e79:
/* t239 = total */
movl	-52(%rbp), %eax
movl	%eax, -111(%rbp)

/* t721 = total + 1 */
movl	-52(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -136(%rbp)

/* total = t721 */
movl	-136(%rbp), %eax
movl	%eax, -52(%rbp)

/* t239 = t239 + 4 */
movl	-111(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -111(%rbp)

/* t247 = i */
movl	-56(%rbp), %eax
movl	%eax, -123(%rbp)

/* t722 = i + 1 */
movl	-56(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -140(%rbp)

/* i = t722 */
movl	-140(%rbp), %eax
movl	%eax, -56(%rbp)

/* t247 = t247 + 4 */
movl	-123(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -123(%rbp)

/* t249 = b[t247] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-123(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -124(%rbp)

/* aux[t239] = t249 */
movb	-124(%rbp), %cl
movq	-48(%rbp), %rax
movq	$0, %rbx
movl	-111(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t226 = i */
movl	-56(%rbp), %eax
movl	%eax, -94(%rbp)

/* t229 = t226 */
movl	-94(%rbp), %eax
movl	%eax, -98(%rbp)

/* t725 = t229 + 4 */
movl	-98(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -148(%rbp)

/* t229 = t725 */
movl	-148(%rbp), %eax
movl	%eax, -98(%rbp)

/* t232 = b[t229] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-98(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -99(%rbp)

/* if t232 == 0 then goto e32 */
movb	-99(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e32
/* goto e79 */
jmp	e79
/* e32: skip */
e32:
/* t254 = total */
movl	-52(%rbp), %eax
movl	%eax, -132(%rbp)

/* t254 = t254 + 4 */
movl	-132(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -132(%rbp)

/* aux[t254] = 0 */
movb	$0, %cl
movq	-48(%rbp), %rax
movq	$0, %rbx
movl	-132(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* return aux */
movq	-48(%rbp), %rax
movq	%rax, 24(%rbp)
addq	$144, %rsp
pop	%rbp
ret
/* goto e77 */
jmp	e77
/* e36: skip */
e36:
/* preamble e36 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$8, %rsp
/* if a == 97 then goto e41 */
movb	8(%rbp), %al
movb	$97, %dl
cmpb	%al, %dl
je	e41
/* if a == 101 then goto e41 */
movb	8(%rbp), %al
movb	$101, %dl
cmpb	%al, %dl
je	e41
/* if a == 105 then goto e41 */
movb	8(%rbp), %al
movb	$105, %dl
cmpb	%al, %dl
je	e41
/* if a == 111 then goto e41 */
movb	8(%rbp), %al
movb	$111, %dl
cmpb	%al, %dl
je	e41
/* if a != 117 then goto e42 */
movb	8(%rbp), %al
movb	$117, %dl
cmpb	%al, %dl
jne	e42
/* e41: skip */
e41:
/* t263 = true */
movb	$1, -9(%rbp)
/* goto e43 */
jmp	e43
/* e42: skip */
e42:
/* t263 = false */
movb	$0, -9(%rbp)
/* e43: skip */
e43:
/* return t263 */
movb	-9(%rbp), %al
movb	%al, 9(%rbp)
addq	$8, %rsp
pop	%rbp
ret
/* goto e77 */
jmp	e77
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$400, %rsp
lea	-37(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-66(%rbp), %rax
movq	%rax, -49(%rbp)

lea	-94(%rbp), %rax
movq	%rax, -74(%rbp)

lea	-123(%rbp), %rax
movq	%rax, -106(%rbp)

lea	-165(%rbp), %rax
movq	%rax, -131(%rbp)

lea	-173(%rbp), %rax
movq	%rax, -173(%rbp)

lea	-181(%rbp), %rax
movq	%rax, -181(%rbp)

lea	-196(%rbp), %rax
movq	%rax, -189(%rbp)

lea	-263(%rbp), %rax
movq	%rax, -204(%rbp)

lea	-271(%rbp), %rax
movq	%rax, -271(%rbp)

lea	-279(%rbp), %rax
movq	%rax, -279(%rbp)

lea	-341(%rbp), %rax
movq	%rax, -313(%rbp)

lea	-366(%rbp), %rax
movq	%rax, -349(%rbp)

lea	-385(%rbp), %rax
movq	%rax, -374(%rbp)

lea	-406(%rbp), %rax
movq	%rax, -393(%rbp)

/*  */
subq	$8, %rsp

/* put param TXT_1 */
movq	var85, %rax
movq	%rax, 0(%rsp)
/* increment TXT_1 */
movq	var85, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement TXT_1 */
movq	var85, %rax
push	%rax
call	jada_reference_decrement
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

/* put param TXT_2 */
movq	var181, %rax
movq	%rax, 0(%rsp)
/* increment TXT_2 */
movq	var181, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement TXT_2 */
movq	var181, %rax
push	%rax
call	jada_reference_decrement
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

/* t266[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t266[4] = 76 */
movb	$76, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t266[5] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t266[6] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t266[7] = 112 */
movb	$112, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t266[8] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t266[9] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t266[10] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t266[11] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t266[12] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t266[13] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t266[14] = 44 */
movb	$44, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t266[15] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t266[16] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t266[17] = -61 */
movb	$-61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t266[18] = -87 */
movb	$-87, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t266[19] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t266[20] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* put param t266 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t266 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t266 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param TXT_1 */
movq	var85, %rax
movq	%rax, 0(%rsp)
/* increment TXT_1 */
movq	var85, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* t303 = call e10 */
call 	e10
movl	8(%rsp), %eax
movl	%eax, -41(%rbp)
addq	$16, %rsp
/* decrement TXT_1 */
movq	var85, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* put param t303 */
movl	-41(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t304[0] = 1 */
movl	$1, %ecx
movq	-49(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t304[4] = 32 */
movb	$32, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t304[5] = 99 */
movb	$99, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t304[6] = 97 */
movb	$97, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t304[7] = 114 */
movb	$114, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t304[8] = -61 */
movb	$-61, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t304[9] = -96 */
movb	$-96, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t304[10] = 99 */
movb	$99, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t304[11] = 116 */
movb	$116, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t304[12] = 101 */
movb	$101, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t304[13] = 114 */
movb	$114, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t304[14] = 115 */
movb	$115, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t304[15] = 10 */
movb	$10, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t304[16] = 0 */
movb	$0, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* put param t304 */
movq	-49(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t304 */
movq	-49(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t304 */
movq	-49(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t333[0] = 1 */
movl	$1, %ecx
movq	-74(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t333[4] = 76 */
movb	$76, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t333[5] = 97 */
movb	$97, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t333[6] = 32 */
movb	$32, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t333[7] = 115 */
movb	$115, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t333[8] = 101 */
movb	$101, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t333[9] = 103 */
movb	$103, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t333[10] = 111 */
movb	$111, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t333[11] = 110 */
movb	$110, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t333[12] = 97 */
movb	$97, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t333[13] = 44 */
movb	$44, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t333[14] = 32 */
movb	$32, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t333[15] = 116 */
movb	$116, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t333[16] = -61 */
movb	$-61, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t333[17] = -87 */
movb	$-87, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t333[18] = 32 */
movb	$32, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t333[19] = 0 */
movb	$0, %cl
movq	-74(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* put param t333 */
movq	-74(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t333 */
movq	-74(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t333 */
movq	-74(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param TXT_2 */
movq	var181, %rax
movq	%rax, 0(%rsp)
/* increment TXT_2 */
movq	var181, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* t368 = call e10 */
call 	e10
movl	8(%rsp), %eax
movl	%eax, -98(%rbp)
addq	$16, %rsp
/* decrement TXT_2 */
movq	var181, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* put param t368 */
movl	-98(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t369[0] = 1 */
movl	$1, %ecx
movq	-106(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t369[4] = 32 */
movb	$32, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t369[5] = 99 */
movb	$99, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t369[6] = 97 */
movb	$97, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t369[7] = 114 */
movb	$114, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t369[8] = -61 */
movb	$-61, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t369[9] = -96 */
movb	$-96, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t369[10] = 99 */
movb	$99, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t369[11] = 116 */
movb	$116, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t369[12] = 101 */
movb	$101, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t369[13] = 114 */
movb	$114, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t369[14] = 115 */
movb	$115, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t369[15] = 10 */
movb	$10, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t369[16] = 0 */
movb	$0, %cl
movq	-106(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* put param t369 */
movq	-106(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t369 */
movq	-106(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t369 */
movq	-106(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t398[0] = 1 */
movl	$1, %ecx
movq	-131(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t398[4] = 76 */
movb	$76, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t398[5] = 97 */
movb	$97, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t398[6] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t398[7] = 115 */
movb	$115, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t398[8] = 101 */
movb	$101, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t398[9] = 118 */
movb	$118, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t398[10] = 97 */
movb	$97, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t398[11] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t398[12] = 99 */
movb	$99, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t398[13] = 111 */
movb	$111, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t398[14] = 110 */
movb	$110, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t398[15] = 99 */
movb	$99, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t398[16] = 97 */
movb	$97, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t398[17] = 116 */
movb	$116, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t398[18] = 101 */
movb	$101, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t398[19] = 110 */
movb	$110, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t398[20] = 97 */
movb	$97, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t398[21] = 99 */
movb	$99, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t398[22] = 105 */
movb	$105, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t398[23] = -61 */
movb	$-61, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t398[24] = -77 */
movb	$-77, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t398[25] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t398[26] = -61 */
movb	$-61, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t398[27] = -87 */
movb	$-87, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t398[28] = 115 */
movb	$115, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t398[29] = 58 */
movb	$58, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t398[30] = 32 */
movb	$32, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t398[31] = 10 */
movb	$10, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t398[32] = 34 */
movb	$34, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t398[33] = 0 */
movb	$0, %cl
movq	-131(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* put param t398 */
movq	-131(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t398 */
movq	-131(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t398 */
movq	-131(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$24, %rsp

/* put param TXT_1 */
movq	var85, %rax
movq	%rax, 0(%rsp)
/* increment TXT_1 */
movq	var85, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param TXT_2 */
movq	var181, %rax
movq	%rax, 8(%rsp)
/* increment TXT_2 */
movq	var181, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* cat = call e18 */
call 	e18
movq	16(%rsp), %rax
movq	%rax, -181(%rbp)
addq	$24, %rsp
/* decrement TXT_1 */
movq	var85, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement TXT_2 */
movq	var181, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param cat */
movq	-181(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment cat */
movq	-181(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement cat */
movq	-181(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t463[0] = 1 */
movl	$1, %ecx
movq	-189(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t463[4] = 34 */
movb	$34, %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t463[5] = 10 */
movb	$10, %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t463[6] = 0 */
movb	$0, %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* put param t463 */
movq	-189(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t463 */
movq	-189(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t463 */
movq	-189(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t472[0] = 1 */
movl	$1, %ecx
movq	-204(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t472[4] = 73 */
movb	$73, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t472[5] = 110 */
movb	$110, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t472[6] = 116 */
movb	$116, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t472[7] = 114 */
movb	$114, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t472[8] = 111 */
movb	$111, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t472[9] = 100 */
movb	$100, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t472[10] = 117 */
movb	$117, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t472[11] = 101 */
movb	$101, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t472[12] = 105 */
movb	$105, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t472[13] = 120 */
movb	$120, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t472[14] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t472[15] = 117 */
movb	$117, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t472[16] = 110 */
movb	$110, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t472[17] = 97 */
movb	$97, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t472[18] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t472[19] = 99 */
movb	$99, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t472[20] = 97 */
movb	$97, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t472[21] = 100 */
movb	$100, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t472[22] = 101 */
movb	$101, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t472[23] = 110 */
movb	$110, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t472[24] = 97 */
movb	$97, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t472[25] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t472[26] = 100 */
movb	$100, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t472[27] = 101 */
movb	$101, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t472[28] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t472[29] = 116 */
movb	$116, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t472[30] = 101 */
movb	$101, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t472[31] = 120 */
movb	$120, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t472[32] = 116 */
movb	$116, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t472[33] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t472[34] = 100 */
movb	$100, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t472[35] = 101 */
movb	$101, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t472[36] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t472[37] = 113 */
movb	$113, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t472[38] = 117 */
movb	$117, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* t472[39] = 97 */
movb	$97, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 39(%rax)
/* t472[40] = 108 */
movb	$108, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 40(%rax)
/* t472[41] = 115 */
movb	$115, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 41(%rax)
/* t472[42] = 101 */
movb	$101, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 42(%rax)
/* t472[43] = 118 */
movb	$118, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 43(%rax)
/* t472[44] = 111 */
movb	$111, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 44(%rax)
/* t472[45] = 108 */
movb	$108, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 45(%rax)
/* t472[46] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 46(%rax)
/* t472[47] = 108 */
movb	$108, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 47(%rax)
/* t472[48] = 111 */
movb	$111, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 48(%rax)
/* t472[49] = 110 */
movb	$110, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 49(%rax)
/* t472[50] = 103 */
movb	$103, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 50(%rax)
/* t472[51] = 105 */
movb	$105, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 51(%rax)
/* t472[52] = 116 */
movb	$116, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 52(%rax)
/* t472[53] = 117 */
movb	$117, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 53(%rax)
/* t472[54] = 100 */
movb	$100, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 54(%rax)
/* t472[55] = 58 */
movb	$58, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 55(%rax)
/* t472[56] = 32 */
movb	$32, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 56(%rax)
/* t472[57] = 10 */
movb	$10, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 57(%rax)
/* t472[58] = 0 */
movb	$0, %cl
movq	-204(%rbp), %rax
movq	$0, %rbx
movb	%cl, 58(%rax)
/* put param t472 */
movq	-204(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t472 */
movq	-204(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t472 */
movq	-204(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* input = call read */
call 	read
movq	0(%rsp), %rax
movq	%rax, -279(%rbp)
addq	$8, %rsp
/* numVocals = 0 */
movl	$0, -283(%rbp)
/*  */
subq	$16, %rsp

/* put param input */
movq	-279(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment input */
movq	-279(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* inputLength = call e10 */
call 	e10
movl	8(%rsp), %eax
movl	%eax, -291(%rbp)
addq	$16, %rsp
/* decrement input */
movq	-279(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* i = 0 */
movl	$0, -295(%rbp)
/* if i >= inputLength then goto e70 */
movl	-295(%rbp), %eax
movl	-291(%rbp), %edx
cmpl	%eax, %edx
jle	e70
/* e81: skip */
e81:
/*  */
subq	$8, %rsp

/* t598 = i */
movl	-295(%rbp), %eax
movl	%eax, -303(%rbp)

/* t598 = t598 + 4 */
movl	-303(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -303(%rbp)

/* t600 = input[t598] */
movq	-279(%rbp), %rax
movq	$0, %rbx
movl	-303(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -304(%rbp)

/* put param t600 */
movb	-304(%rbp), %al
movb	%al, 0(%rsp)
/* t601 = call e36 */
call 	e36
movb	1(%rsp), %al
movb	%al, -305(%rbp)
addq	$8, %rsp
/* if 1 != t601 then goto e69 */
movb	$1, %al
movb	-305(%rbp), %dl
cmpb	%al, %dl
jne	e69
/* numVocals = numVocals + 1 */
movl	-283(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -283(%rbp)

/* e69: skip */
e69:
/* i = i + 1 */
movl	-295(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -295(%rbp)

/* if i < inputLength then goto e81 */
movl	-295(%rbp), %eax
movl	-291(%rbp), %edx
cmpl	%eax, %edx
jg	e81
/* e70: skip */
e70:
/*  */
subq	$8, %rsp

/* t603[0] = 1 */
movl	$1, %ecx
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t603[4] = 69 */
movb	$69, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t603[5] = 108 */
movb	$108, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t603[6] = 32 */
movb	$32, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t603[7] = 116 */
movb	$116, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t603[8] = 101 */
movb	$101, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t603[9] = 120 */
movb	$120, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t603[10] = 116 */
movb	$116, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t603[11] = 32 */
movb	$32, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t603[12] = 105 */
movb	$105, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t603[13] = 110 */
movb	$110, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t603[14] = 116 */
movb	$116, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t603[15] = 114 */
movb	$114, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t603[16] = 111 */
movb	$111, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t603[17] = 100 */
movb	$100, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t603[18] = 117 */
movb	$117, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t603[19] = -61 */
movb	$-61, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t603[20] = -81 */
movb	$-81, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t603[21] = 116 */
movb	$116, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t603[22] = 32 */
movb	$32, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t603[23] = 116 */
movb	$116, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t603[24] = -61 */
movb	$-61, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t603[25] = -87 */
movb	$-87, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t603[26] = 32 */
movb	$32, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t603[27] = 0 */
movb	$0, %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* put param t603 */
movq	-313(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t603 */
movq	-313(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t603 */
movq	-313(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param inputLength */
movl	-291(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t654[0] = 1 */
movl	$1, %ecx
movq	-349(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t654[4] = 32 */
movb	$32, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t654[5] = 99 */
movb	$99, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t654[6] = 97 */
movb	$97, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t654[7] = 114 */
movb	$114, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t654[8] = -61 */
movb	$-61, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t654[9] = -96 */
movb	$-96, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t654[10] = 99 */
movb	$99, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t654[11] = 116 */
movb	$116, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t654[12] = 101 */
movb	$101, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t654[13] = 114 */
movb	$114, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t654[14] = 115 */
movb	$115, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t654[15] = 10 */
movb	$10, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t654[16] = 0 */
movb	$0, %cl
movq	-349(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* put param t654 */
movq	-349(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t654 */
movq	-349(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t654 */
movq	-349(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t683[0] = 1 */
movl	$1, %ecx
movq	-374(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t683[4] = 72 */
movb	$72, %cl
movq	-374(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t683[5] = 105 */
movb	$105, %cl
movq	-374(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t683[6] = 32 */
movb	$32, %cl
movq	-374(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t683[7] = 104 */
movb	$104, %cl
movq	-374(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t683[8] = 97 */
movb	$97, %cl
movq	-374(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t683[9] = 32 */
movb	$32, %cl
movq	-374(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t683[10] = 0 */
movb	$0, %cl
movq	-374(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* put param t683 */
movq	-374(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t683 */
movq	-374(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t683 */
movq	-374(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param numVocals */
movl	-283(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t700[0] = 1 */
movl	$1, %ecx
movq	-393(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t700[4] = 32 */
movb	$32, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t700[5] = 118 */
movb	$118, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t700[6] = 111 */
movb	$111, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t700[7] = 99 */
movb	$99, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t700[8] = 97 */
movb	$97, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t700[9] = 108 */
movb	$108, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t700[10] = 115 */
movb	$115, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t700[11] = 10 */
movb	$10, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t700[12] = 0 */
movb	$0, %cl
movq	-393(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* put param t700 */
movq	-393(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t700 */
movq	-393(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t700 */
movq	-393(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement cat */
movq	-181(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement input */
movq	-279(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$400, %rsp
pop	%rbp
ret
/* e77: skip */
e77:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

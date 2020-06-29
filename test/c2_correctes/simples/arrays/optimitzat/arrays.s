.global _start
.bss
	var15_data:	.fill	5, 1, 0
	var21_data:	.fill	0, 1, 0
.data
	var15:	.quad	var15_data
	var21:	.quad	var21_data
.text
_start:
call	jada_init
/* t15[0] = 97 */
movb	$97, %cl
movq	var15, %rax
movq	$0, %rbx
movb	%cl, 0(%rax)
/* t15[1] = 101 */
movb	$101, %cl
movq	var15, %rax
movq	$0, %rbx
movb	%cl, 1(%rax)
/* t15[2] = 105 */
movb	$105, %cl
movq	var15, %rax
movq	$0, %rbx
movb	%cl, 2(%rax)
/* t15[3] = 111 */
movb	$111, %cl
movq	var15, %rax
movq	$0, %rbx
movb	%cl, 3(%rax)
/* t15[4] = 117 */
movb	$117, %cl
movq	var15, %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* vocals = t15 */
movq	var15, %rax
movq	%rax, var21

/* vocals = t15 */
movq	var15, %rax
movq	%rax, var21

/* goto e45 */
jmp	e45
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$32, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= 5 then goto e16 */
movl	-12(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jle	e16
/* t29 = 0 */
movl	$0, -16(%rbp)
/* t224 = 2 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	$2, %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -34(%rbp)

/* t31 = t224 */
movl	-34(%rbp), %eax
movl	%eax, -20(%rbp)

/* t225 = t29 + t31 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -38(%rbp)

/* t29 = t225 */
movl	-38(%rbp), %eax
movl	%eax, -16(%rbp)

/* t32 = array[t29] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-16(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -21(%rbp)

/* if t32 == valor then goto e16 */
movb	-21(%rbp), %al
movb	16(%rbp), %dl
cmpb	%al, %dl
je	e16
/* e46: skip */
e46:
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= 5 then goto e16 */
movl	-12(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jle	e16
/* t29 = 0 */
movl	$0, -16(%rbp)
/* t224 = 2 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	$2, %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -34(%rbp)

/* t31 = t224 */
movl	-34(%rbp), %eax
movl	%eax, -20(%rbp)

/* t225 = t29 + t31 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -38(%rbp)

/* t29 = t225 */
movl	-38(%rbp), %eax
movl	%eax, -16(%rbp)

/* t32 = array[t29] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-16(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -21(%rbp)

/* if t32 == valor then goto e16 */
movb	-21(%rbp), %al
movb	16(%rbp), %dl
cmpb	%al, %dl
je	e16
/* goto e46 */
jmp	e46
/* e16: skip */
e16:
/* if i != 5 then goto e19 */
movl	-12(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jne	e19
/* return 0 */
movb	$0, %al
movb	%al, 17(%rbp)
addq	$32, %rsp
pop	%rbp
ret
/* e19: skip */
e19:
/* t37 = 1 */
movl	$1, -25(%rbp)
/* t224 = 2 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	$2, %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -34(%rbp)

/* t39 = t224 */
movl	-34(%rbp), %eax
movl	%eax, -29(%rbp)

/* t37 = t37 + t39 */
movl	-25(%rbp), %eax
movl	-29(%rbp), %edx
addl	%edx, %eax
movl	%eax, -25(%rbp)

/* t40 = array[t37] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-25(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -30(%rbp)

/* return t40 */
movb	-30(%rbp), %al
movb	%al, 17(%rbp)
addq	$32, %rsp
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
subq	$432, %rsp
lea	-26(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-34(%rbp), %rax
movq	%rax, -34(%rbp)

lea	-298(%rbp), %rax
movq	%rax, -42(%rbp)

lea	-351(%rbp), %rax
movq	%rax, -306(%rbp)

lea	-413(%rbp), %rax
movq	%rax, -391(%rbp)

/* t52[0] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 0(%rax)
/* t52[1] = 98 */
movb	$98, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 1(%rax)
/* t52[2] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 2(%rax)
/* t52[3] = 99 */
movb	$99, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 3(%rax)
/* t52[4] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t52[5] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t52[6] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t52[7] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t52[8] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t52[9] = 102 */
movb	$102, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* substituir = t52 */
movq	-16(%rbp), %rax
movq	%rax, -34(%rbp)

/* t65[0] = 1 */
movl	$1, %ecx
movq	-306(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t65[4] = 76 */
movb	$76, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t65[5] = 101 */
movb	$101, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t65[6] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t65[7] = 32 */
movb	$32, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t65[8] = 118 */
movb	$118, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t65[9] = 111 */
movb	$111, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t65[10] = 99 */
movb	$99, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t65[11] = 97 */
movb	$97, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t65[12] = 108 */
movb	$108, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t65[13] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t65[14] = 32 */
movb	$32, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t65[15] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t65[16] = 111 */
movb	$111, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t65[17] = 110 */
movb	$110, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t65[18] = 32 */
movb	$32, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t65[19] = 117 */
movb	$117, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t65[20] = 110 */
movb	$110, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t65[21] = 101 */
movb	$101, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t65[22] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t65[23] = 32 */
movb	$32, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t65[24] = 108 */
movb	$108, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t65[25] = 108 */
movb	$108, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t65[26] = 101 */
movb	$101, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t65[27] = 116 */
movb	$116, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t65[28] = 114 */
movb	$114, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t65[29] = 101 */
movb	$101, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t65[30] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t65[31] = 32 */
movb	$32, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t65[32] = 110 */
movb	$110, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t65[33] = 101 */
movb	$101, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t65[34] = 99 */
movb	$99, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t65[35] = 101 */
movb	$101, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t65[36] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t65[37] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t65[38] = 97 */
movb	$97, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* t65[39] = 114 */
movb	$114, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 39(%rax)
/* t65[40] = 105 */
movb	$105, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 40(%rax)
/* t65[41] = 101 */
movb	$101, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 41(%rax)
/* t65[42] = 115 */
movb	$115, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 42(%rax)
/* t65[43] = 10 */
movb	$10, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 43(%rax)
/* t65[44] = 0 */
movb	$0, %cl
movq	-306(%rbp), %rax
movq	$0, %rbx
movb	%cl, 44(%rax)
/* decrement str */
movq	-42(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* increment t65 */
movq	-306(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* str = t65 */
movq	-306(%rbp), %rax
movq	%rax, -42(%rbp)

/*  */
subq	$8, %rsp

/* put param str */
movq	-42(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment str */
movq	-42(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement str */
movq	-42(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* i = 0 */
movl	$0, -355(%rbp)
/* t153 = i */
movl	-355(%rbp), %eax
movl	%eax, -359(%rbp)

/* t156 = t153 */
movl	-359(%rbp), %eax
movl	%eax, -363(%rbp)

/* t226 = t156 + 4 */
movl	-363(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -426(%rbp)

/* t156 = t226 */
movl	-426(%rbp), %eax
movl	%eax, -363(%rbp)

/* t159 = str[t156] */
movq	-42(%rbp), %rax
movq	$0, %rbx
movl	-363(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -364(%rbp)

/* if t159 == 0 then goto e36 */
movb	-364(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e36
/* e49: skip */
e49:
/*  */
subq	$16, %rsp

/* t164 = i */
movl	-355(%rbp), %eax
movl	%eax, -372(%rbp)

/* t164 = t164 + 4 */
movl	-372(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -372(%rbp)

/* put param substituir */
movq	-34(%rbp), %rax
movq	%rax, 0(%rsp)
/* t166 = str[t164] */
movq	-42(%rbp), %rax
movq	$0, %rbx
movl	-372(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -373(%rbp)

/* put param t166 */
movb	-373(%rbp), %al
movb	%al, 8(%rsp)
/* tmp = call e10 */
call 	e10
movb	9(%rsp), %al
movb	%al, -375(%rbp)
addq	$16, %rsp
/* if tmp == 0 then goto e34 */
movb	-375(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e34
/* t174 = i */
movl	-355(%rbp), %eax
movl	%eax, -383(%rbp)

/* t174 = t174 + 4 */
movl	-383(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -383(%rbp)

/* str[t174] = tmp */
movb	-375(%rbp), %cl
movq	-42(%rbp), %rax
movq	$0, %rbx
movl	-383(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* e34: skip */
e34:
/* i = i + 1 */
movl	-355(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -355(%rbp)

/* t153 = i */
movl	-355(%rbp), %eax
movl	%eax, -359(%rbp)

/* t156 = t153 */
movl	-359(%rbp), %eax
movl	%eax, -363(%rbp)

/* t226 = t156 + 4 */
movl	-363(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -426(%rbp)

/* t156 = t226 */
movl	-426(%rbp), %eax
movl	%eax, -363(%rbp)

/* t159 = str[t156] */
movq	-42(%rbp), %rax
movq	$0, %rbx
movl	-363(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -364(%rbp)

/* if t159 == 0 then goto e36 */
movb	-364(%rbp), %al
movb	$0, %dl
cmpb	%al, %dl
je	e36
/* goto e49 */
jmp	e49
/* e36: skip */
e36:
/*  */
subq	$8, %rsp

/* put param str */
movq	-42(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment str */
movq	-42(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement str */
movq	-42(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t177[0] = 1 */
movl	$1, %ecx
movq	-391(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t177[4] = 76 */
movb	$76, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t177[5] = 101 */
movb	$101, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t177[6] = 115 */
movb	$115, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t177[7] = 32 */
movb	$32, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t177[8] = 118 */
movb	$118, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t177[9] = 111 */
movb	$111, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t177[10] = 99 */
movb	$99, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t177[11] = 97 */
movb	$97, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t177[12] = 108 */
movb	$108, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t177[13] = 115 */
movb	$115, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t177[14] = 32 */
movb	$32, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t177[15] = 115 */
movb	$115, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t177[16] = -61 */
movb	$-61, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t177[17] = -77 */
movb	$-77, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t177[18] = 110 */
movb	$110, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t177[19] = 58 */
movb	$58, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t177[20] = 32 */
movb	$32, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t177[21] = 0 */
movb	$0, %cl
movq	-391(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* put param t177 */
movq	-391(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t177 */
movq	-391(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t177 */
movq	-391(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* i = 0 */
movl	$0, -417(%rbp)
/* if i >= 5 then goto e43 */
movl	-417(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jle	e43
/* t229 = i */
movl	-417(%rbp), %eax
movl	%eax, -434(%rbp)

/* t227 = t229 + 0 */
movl	-434(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -430(%rbp)

/* e48: skip */
e48:
/*  */
subq	$8, %rsp

/* t220 = t227 */
movl	-430(%rbp), %eax
movl	%eax, -421(%rbp)

/* t227 = t227 + 1 */
movl	-430(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -430(%rbp)

/* t221 = vocals[t220] */
movq	var21, %rax
movq	$0, %rbx
movl	-421(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -422(%rbp)

/* put param t221 */
movb	-422(%rbp), %al
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
/* i = i + 1 */
movl	-417(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -417(%rbp)

/* if i < 5 then goto e48 */
movl	-417(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jg	e48
/* e43: skip */
e43:
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* decrement str */
movq	-42(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$432, %rsp
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

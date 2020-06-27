.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e50 */
jmp	e50
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$200152, %rsp
lea	-200020(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-200067(%rbp), %rax
movq	%rax, -200058(%rbp)

lea	-200112(%rbp), %rax
movq	%rax, -200075(%rbp)

/* n = 1 */
movl	$1, -200024(%rbp)
/* primers[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* i = 2 */
movl	$2, -200028(%rbp)
/* if n >= 50000 then goto e40 */
movl	-200024(%rbp), %eax
movl	$50000, %edx
cmpl	%eax, %edx
jle	e40
/* t133 = n * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200024(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -200144(%rbp)

/* t131 = t133 + 0 */
movl	-200144(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -200140(%rbp)

/* e52: skip */
e52:
/* primer = true */
movb	$1, -200029(%rbp)
/* j = 1 */
movl	$1, -200033(%rbp)
/* if 1 != primer then goto e29 */
movb	$1, %al
movb	-200029(%rbp), %dl
cmpb	%al, %dl
jne	e29
/* if j >= n then goto e29 */
movl	-200033(%rbp), %eax
movl	-200024(%rbp), %edx
cmpl	%eax, %edx
jle	e29
/* t127 = j * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200033(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -200132(%rbp)

/* t125 = t127 + 0 */
movl	-200132(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -200128(%rbp)

/* e53: skip */
e53:
/* t26 = t125 */
movl	-200128(%rbp), %eax
movl	%eax, -200037(%rbp)

/* t125 = t125 + 4 */
movl	-200128(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -200128(%rbp)

/* t28 = primers[t26] */
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200037(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -200045(%rbp)

/* t27 = i % t28 */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-200045(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-200028(%rbp), %eax
cdqe
idiv	%r8
movl	%edx, -200041(%rbp)

/* if t27 != 0 then goto e28 */
movl	-200041(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jne	e28
/* primer = false */
movb	$0, -200029(%rbp)
/* e28: skip */
e28:
/* j = j + 1 */
movl	-200033(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -200033(%rbp)

/* if 1 != primer then goto e29 */
movb	$1, %al
movb	-200029(%rbp), %dl
cmpb	%al, %dl
jne	e29
/* if j >= n then goto e29 */
movl	-200033(%rbp), %eax
movl	-200024(%rbp), %edx
cmpl	%eax, %edx
jle	e29
/* goto e53 */
jmp	e53
/* e29: skip */
e29:
/* t30 = primer */
movb	-200029(%rbp), %al
movb	%al, -200046(%rbp)

/* if t30 != 1 then goto e39 */
movb	-200046(%rbp), %al
movb	$1, %dl
cmpb	%al, %dl
jne	e39
/* t33 = t131 */
movl	-200140(%rbp), %eax
movl	%eax, -200050(%rbp)

/* t131 = t131 + 4 */
movl	-200140(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -200140(%rbp)

/* primers[t33] = i */
movl	-200028(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200050(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* n = n + 1 */
movl	-200024(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -200024(%rbp)

/* e39: skip */
e39:
/* i = i + 1 */
movl	-200028(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -200028(%rbp)

/* if n >= 50000 then goto e40 */
movl	-200024(%rbp), %eax
movl	$50000, %edx
cmpl	%eax, %edx
jle	e40
/* goto e52 */
jmp	e52
/* e40: skip */
e40:
/*  */
subq	$8, %rsp

/* t35[0] = 1 */
movl	$1, %ecx
movq	-200058(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t35[4] = 69 */
movb	$69, %cl
movq	-200058(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t35[5] = 108 */
movb	$108, %cl
movq	-200058(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t35[6] = 115 */
movb	$115, %cl
movq	-200058(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t35[7] = 32 */
movb	$32, %cl
movq	-200058(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t35[8] = 0 */
movb	$0, %cl
movq	-200058(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* put param t35 */
movq	-200058(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t35 */
movq	-200058(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t35 */
movq	-200058(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param 50000 */
movl	$50000, %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t48[0] = 1 */
movl	$1, %ecx
movq	-200075(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t48[4] = 32 */
movb	$32, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t48[5] = 112 */
movb	$112, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t48[6] = 114 */
movb	$114, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t48[7] = 105 */
movb	$105, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t48[8] = 109 */
movb	$109, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t48[9] = 101 */
movb	$101, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t48[10] = 114 */
movb	$114, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t48[11] = 115 */
movb	$115, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t48[12] = 32 */
movb	$32, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t48[13] = 110 */
movb	$110, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t48[14] = -61 */
movb	$-61, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t48[15] = -70 */
movb	$-70, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t48[16] = 109 */
movb	$109, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t48[17] = 101 */
movb	$101, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t48[18] = 114 */
movb	$114, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t48[19] = 111 */
movb	$111, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t48[20] = 115 */
movb	$115, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t48[21] = 32 */
movb	$32, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t48[22] = 112 */
movb	$112, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t48[23] = 114 */
movb	$114, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t48[24] = 105 */
movb	$105, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t48[25] = 109 */
movb	$109, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t48[26] = 101 */
movb	$101, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t48[27] = 114 */
movb	$114, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t48[28] = 115 */
movb	$115, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t48[29] = 32 */
movb	$32, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t48[30] = 115 */
movb	$115, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t48[31] = -61 */
movb	$-61, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t48[32] = -77 */
movb	$-77, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t48[33] = 110 */
movb	$110, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t48[34] = 58 */
movb	$58, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t48[35] = 32 */
movb	$32, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t48[36] = 0 */
movb	$0, %cl
movq	-200075(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* put param t48 */
movq	-200075(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t48 */
movq	-200075(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t48 */
movq	-200075(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* i = 0 */
movl	$0, -200116(%rbp)
/* if i >= 50000 then goto e48 */
movl	-200116(%rbp), %eax
movl	$50000, %edx
cmpl	%eax, %edx
jle	e48
/* t139 = i * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200116(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -200156(%rbp)

/* t137 = t139 + 0 */
movl	-200156(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -200152(%rbp)

/* e51: skip */
e51:
/*  */
subq	$8, %rsp

/* t121 = t137 */
movl	-200152(%rbp), %eax
movl	%eax, -200120(%rbp)

/* t137 = t137 + 4 */
movl	-200152(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -200152(%rbp)

/* t122 = primers[t121] */
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-200120(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -200124(%rbp)

/* put param t122 */
movl	-200124(%rbp), %eax
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
movl	-200116(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -200116(%rbp)

/* if i >= 50000 then goto e48 */
movl	-200116(%rbp), %eax
movl	$50000, %edx
cmpl	%eax, %edx
jle	e48
/* goto e51 */
jmp	e51
/* e48: skip */
e48:
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* return */
addq	$200152, %rsp
pop	%rbp
ret
/* e50: skip */
e50:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e55 */
jmp	e55
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$0, %rsp
/* vocals[0] = 97 */
movb	$97, %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movb	%cl, 0(%rax)
/* vocals[1] = 101 */
movb	$101, %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movb	%cl, 1(%rax)
/* vocals[2] = 105 */
movb	$105, %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movb	%cl, 2(%rax)
/* vocals[3] = 111 */
movb	$111, %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movb	%cl, 3(%rax)
/* vocals[4] = 117 */
movb	$117, %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* return */
addq	$0, %rsp
pop	%rbp
ret
/* goto e55 */
jmp	e55
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$416, %rsp
lea	-272(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-308(%rbp), %rax
movq	%rax, -280(%rbp)

lea	-325(%rbp), %rax
movq	%rax, -316(%rbp)

lea	-373(%rbp), %rax
movq	%rax, -354(%rbp)

lea	-403(%rbp), %rax
movq	%rax, -381(%rbp)

/* t32[0] = 1 */
movl	$1, %ecx
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t32[4] = 73 */
movb	$73, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t32[5] = 110 */
movb	$110, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t32[6] = 116 */
movb	$116, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t32[7] = 114 */
movb	$114, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t32[8] = 111 */
movb	$111, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t32[9] = 100 */
movb	$100, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t32[10] = 117 */
movb	$117, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t32[11] = 101 */
movb	$101, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t32[12] = 105 */
movb	$105, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t32[13] = 120 */
movb	$120, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t32[14] = 32 */
movb	$32, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t32[15] = 117 */
movb	$117, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t32[16] = 110 */
movb	$110, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t32[17] = 97 */
movb	$97, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t32[18] = 32 */
movb	$32, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t32[19] = 108 */
movb	$108, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t32[20] = 108 */
movb	$108, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t32[21] = 101 */
movb	$101, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t32[22] = 116 */
movb	$116, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t32[23] = 114 */
movb	$114, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t32[24] = 97 */
movb	$97, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t32[25] = 58 */
movb	$58, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t32[26] = 32 */
movb	$32, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t32[27] = 0 */
movb	$0, %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* decrement txt1 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* increment t32 */
movq	-280(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* txt1 = t32 */
movq	-280(%rbp), %rax
movq	%rax, -16(%rbp)

/*  */
subq	$8, %rsp

/* put param v */
movq	-316(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e10 */
call 	e10
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param txt1 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment txt1 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement txt1 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* caracter = call readChar */
call 	readChar
movb	0(%rsp), %al
movb	%al, -327(%rbp)
addq	$8, %rsp
/* trobat = false */
movb	$0, -328(%rbp)
/* j = 0 */
movl	$0, -332(%rbp)
/* if j >= 5 then goto e42 */
movl	-332(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jle	e42
/* if 1 != trobat then goto e31 */
movb	$1, %al
movb	-328(%rbp), %dl
cmpb	%al, %dl
jne	e31
/* e56: skip */
e56:
/* e31: skip */
e31:
/*  */
subq	$8, %rsp

/* t180 = j */
movl	-332(%rbp), %eax
movl	%eax, -420(%rbp)

/* t91 = t180 */
movl	-420(%rbp), %eax
movl	%eax, -336(%rbp)

/* t92 = v[t91] */
movq	-316(%rbp), %rax
movq	$0, %rbx
movl	-336(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -337(%rbp)

/* put param t92 */
movb	-337(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param caracter */
movb	-327(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* t95 = t180 */
movl	-420(%rbp), %eax
movl	%eax, -341(%rbp)

/* t96 = v[t95] */
movq	-316(%rbp), %rax
movq	$0, %rbx
movl	-341(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -342(%rbp)

/* if t96 != caracter then goto e40 */
movb	-342(%rbp), %al
movb	-327(%rbp), %dl
cmpb	%al, %dl
jne	e40
/* trobat = true */
movb	$1, -328(%rbp)
/* e40: skip */
e40:
/* j = j + 1 */
movl	-332(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -332(%rbp)

/* if j >= 5 then goto e42 */
movl	-332(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jle	e42
/* if 1 != trobat then goto e56 */
movb	$1, %al
movb	-328(%rbp), %dl
cmpb	%al, %dl
jne	e56
/* e42: skip */
e42:
/* if 1 != trobat then goto e45 */
movb	$1, %al
movb	-328(%rbp), %dl
cmpb	%al, %dl
jne	e45
/*  */
subq	$8, %rsp

/* t99[0] = 1 */
movl	$1, %ecx
movq	-354(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t99[4] = -61 */
movb	$-61, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t99[5] = -119 */
movb	$-119, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t99[6] = 115 */
movb	$115, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t99[7] = 32 */
movb	$32, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t99[8] = 117 */
movb	$117, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t99[9] = 110 */
movb	$110, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t99[10] = 97 */
movb	$97, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t99[11] = 32 */
movb	$32, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t99[12] = 118 */
movb	$118, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t99[13] = 111 */
movb	$111, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t99[14] = 99 */
movb	$99, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t99[15] = 97 */
movb	$97, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t99[16] = 108 */
movb	$108, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t99[17] = 10 */
movb	$10, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t99[18] = 0 */
movb	$0, %cl
movq	-354(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* put param t99 */
movq	-354(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t99 */
movq	-354(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t99 */
movq	-354(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e47 */
jmp	e47
/* e45: skip */
e45:
/*  */
subq	$8, %rsp

/* t132[0] = 1 */
movl	$1, %ecx
movq	-381(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t132[4] = 78 */
movb	$78, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t132[5] = 111 */
movb	$111, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t132[6] = 32 */
movb	$32, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t132[7] = -61 */
movb	$-61, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t132[8] = -87 */
movb	$-87, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t132[9] = 115 */
movb	$115, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t132[10] = 32 */
movb	$32, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t132[11] = 117 */
movb	$117, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t132[12] = 110 */
movb	$110, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t132[13] = 97 */
movb	$97, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t132[14] = 32 */
movb	$32, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t132[15] = 118 */
movb	$118, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t132[16] = 111 */
movb	$111, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t132[17] = 99 */
movb	$99, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t132[18] = 97 */
movb	$97, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t132[19] = 108 */
movb	$108, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t132[20] = 10 */
movb	$10, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t132[21] = 0 */
movb	$0, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* put param t132 */
movq	-381(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t132 */
movq	-381(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t132 */
movq	-381(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e47: skip */
e47:
/* i = 0 */
movl	$0, -407(%rbp)
/* if i == 5 then goto e54 */
movl	-407(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
je	e54
/* e58: skip */
e58:
/*  */
subq	$8, %rsp

/* t175 = i */
movl	-407(%rbp), %eax
movl	%eax, -411(%rbp)

/* t176 = v[t175] */
movq	-316(%rbp), %rax
movq	$0, %rbx
movl	-411(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -412(%rbp)

/* put param t176 */
movb	-412(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* i = i + 1 */
movl	-407(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -407(%rbp)

/* if i != 5 then goto e58 */
movl	-407(%rbp), %eax
movl	$5, %edx
cmpl	%eax, %edx
jne	e58
/* e54: skip */
e54:
/* decrement txt1 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$416, %rsp
pop	%rbp
ret
/* e55: skip */
e55:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e68 */
jmp	e68
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$32, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= 500 then goto e21 */
movl	-12(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e21
/* e69: skip */
e69:
/* j = 0 */
movl	$0, -16(%rbp)
/* if j >= 500 then goto e20 */
movl	-16(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e20
/* e70: skip */
e70:
/* if i != j then goto e17 */
movl	-12(%rbp), %eax
movl	-16(%rbp), %edx
cmpl	%eax, %edx
jne	e17
/* t122 = j * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -36(%rbp)

/* t18 = t122 */
movl	-36(%rbp), %eax
movl	%eax, -20(%rbp)

/* t123 = 2000 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	$2000, %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* t20 = t123 */
movl	-40(%rbp), %eax
movl	%eax, -24(%rbp)

/* t18 = t18 + t20 */
movl	-20(%rbp), %eax
movl	-24(%rbp), %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/* matriu[t18] = 1 */
movl	$1, %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-20(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* goto e19 */
jmp	e19
/* e17: skip */
e17:
/* t122 = j * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -36(%rbp)

/* t23 = t122 */
movl	-36(%rbp), %eax
movl	%eax, -28(%rbp)

/* t123 = 2000 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	$2000, %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* t25 = t123 */
movl	-40(%rbp), %eax
movl	%eax, -32(%rbp)

/* t23 = t23 + t25 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* matriu[t23] = 0 */
movl	$0, %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-28(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e19: skip */
e19:
/* j = j + 1 */
movl	-16(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* if j >= 500 then goto e20 */
movl	-16(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e20
/* goto e70 */
jmp	e70
/* e20: skip */
e20:
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= 500 then goto e21 */
movl	-12(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e21
/* goto e69 */
jmp	e69
/* e21: skip */
e21:
/* return */
addq	$32, %rsp
pop	%rbp
ret
/* goto e68 */
jmp	e68
/* e23: skip */
e23:
/* preamble e23 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$64, %rsp
lea	-36(%rbp), %rax
movq	%rax, -16(%rbp)

/*  */
subq	$8, %rsp

/* t28[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t28[4] = 80 */
movb	$80, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t28[5] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t28[6] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t28[7] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t28[8] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t28[9] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t28[10] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t28[11] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t28[12] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t28[13] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t28[14] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t28[15] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t28[16] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t28[17] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t28[18] = 10 */
movb	$10, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t28[19] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* put param t28 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t28 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t28 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* i = 0 */
movl	$0, -40(%rbp)
/* if i >= 500 then goto e33 */
movl	-40(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e33
/* t128 = i * 2000 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-40(%rbp), %eax
movl	$2000, %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t126 = t128 + 0 */
movl	-64(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -60(%rbp)

/* e71: skip */
e71:
/* j = 0 */
movl	$0, -44(%rbp)
/* if j >= 500 then goto e31 */
movl	-44(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e31
/* t72 = t126 */
movl	-60(%rbp), %eax
movl	%eax, -52(%rbp)

/* t126 = t126 + 2000 */
movl	-60(%rbp), %eax
movl	$2000, %edx
addl	%edx, %eax
movl	%eax, -60(%rbp)

/* e72: skip */
e72:
/*  */
subq	$8, %rsp

/* t70 = j * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-44(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -48(%rbp)

/* t70 = t70 + t72 */
movl	-48(%rbp), %eax
movl	-52(%rbp), %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* t73 = matriu[t70] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -56(%rbp)

/* put param t73 */
movl	-56(%rbp), %eax
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
/* j = j + 1 */
movl	-44(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* if j >= 500 then goto e31 */
movl	-44(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e31
/* goto e72 */
jmp	e72
/* e31: skip */
e31:
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* i = i + 1 */
movl	-40(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/* if i >= 500 then goto e33 */
movl	-40(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e33
/* goto e71 */
jmp	e71
/* e33: skip */
e33:
/* return */
addq	$64, %rsp
pop	%rbp
ret
/* goto e68 */
jmp	e68
/* e35: skip */
e35:
/* preamble e35 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= 500 then goto e47 */
movl	-12(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e47
/* e73: skip */
e73:
/* j = 0 */
movl	$0, -16(%rbp)
/* if j >= 500 then goto e46 */
movl	-16(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e46
/* e74: skip */
e74:
/* suma = 0 */
movl	$0, -20(%rbp)
/* k = 0 */
movl	$0, -24(%rbp)
/* if k >= 500 then goto e44 */
movl	-24(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e44
/* t124 = 2000 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	$2000, %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t93 = t124 */
movl	-64(%rbp), %eax
movl	%eax, -32(%rbp)

/* t125 = j * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t134 = k * 2000 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-24(%rbp), %eax
movl	$2000, %edx
imul	%rdx, %rax
movl	%eax, -76(%rbp)

/* t132 = t134 + 0 */
movl	-76(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* e75: skip */
e75:
/* t91 = k * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-24(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -28(%rbp)

/* t91 = t91 + t93 */
movl	-28(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -28(%rbp)

/* t95 = t125 */
movl	-68(%rbp), %eax
movl	%eax, -36(%rbp)

/* t97 = t132 */
movl	-72(%rbp), %eax
movl	%eax, -40(%rbp)

/* t132 = t132 + 2000 */
movl	-72(%rbp), %eax
movl	$2000, %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* t95 = t95 + t97 */
movl	-36(%rbp), %eax
movl	-40(%rbp), %edx
addl	%edx, %eax
movl	%eax, -36(%rbp)

/* t99 = a[t91] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-28(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -48(%rbp)

/* t100 = b[t95] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-36(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -52(%rbp)

/* t98 = t99 * t100 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-48(%rbp), %eax
movl	-52(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -44(%rbp)

/* suma = suma + t98 */
movl	-20(%rbp), %eax
movl	-44(%rbp), %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/* k = k + 1 */
movl	-24(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -24(%rbp)

/* if k >= 500 then goto e44 */
movl	-24(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e44
/* goto e75 */
jmp	e75
/* e44: skip */
e44:
/* t125 = j * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t102 = t125 */
movl	-68(%rbp), %eax
movl	%eax, -56(%rbp)

/* t124 = 2000 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	$2000, %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t104 = t124 */
movl	-64(%rbp), %eax
movl	%eax, -60(%rbp)

/* t102 = t102 + t104 */
movl	-56(%rbp), %eax
movl	-60(%rbp), %edx
addl	%edx, %eax
movl	%eax, -56(%rbp)

/* resultat[t102] = suma */
movl	-20(%rbp), %ecx
movq	24(%rbp), %rax
movq	$0, %rbx
movl	-56(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* j = j + 1 */
movl	-16(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* if j >= 500 then goto e46 */
movl	-16(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e46
/* goto e74 */
jmp	e74
/* e46: skip */
e46:
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= 500 then goto e47 */
movl	-12(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e47
/* goto e73 */
jmp	e73
/* e47: skip */
e47:
/* return */
addq	$72, %rsp
pop	%rbp
ret
/* goto e68 */
jmp	e68
/* e49: skip */
e49:
/* preamble e49 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$32, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= 500 then goto e56 */
movl	-12(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e56
/* t140 = i * 2000 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	$2000, %edx
imul	%rdx, %rax
movl	%eax, -36(%rbp)

/* t138 = t140 + 0 */
movl	-36(%rbp), %eax
movl	$0, %edx
addl	%edx, %eax
movl	%eax, -32(%rbp)

/* e76: skip */
e76:
/* j = 0 */
movl	$0, -16(%rbp)
/* if j >= 500 then goto e55 */
movl	-16(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e55
/* t115 = t138 */
movl	-32(%rbp), %eax
movl	%eax, -24(%rbp)

/* t138 = t138 + 2000 */
movl	-32(%rbp), %eax
movl	$2000, %edx
addl	%edx, %eax
movl	%eax, -32(%rbp)

/* e77: skip */
e77:
/* t113 = j * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -20(%rbp)

/* t113 = t113 + t115 */
movl	-20(%rbp), %eax
movl	-24(%rbp), %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/*  */
subq	$16, %rsp

/* put param 0 */
movl	$0, %eax
movl	%eax, 0(%rsp)
/* put param 9 */
movl	$9, %eax
movl	%eax, 4(%rsp)
/* t118 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -28(%rbp)
addq	$16, %rsp
/* a[t113] = t118 */
movl	-28(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-20(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* j = j + 1 */
movl	-16(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* if j >= 500 then goto e55 */
movl	-16(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e55
/* goto e77 */
jmp	e77
/* e55: skip */
e55:
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= 500 then goto e56 */
movl	-12(%rbp), %eax
movl	$500, %edx
cmpl	%eax, %edx
jle	e56
/* goto e76 */
jmp	e76
/* e56: skip */
e56:
/* return */
addq	$32, %rsp
pop	%rbp
ret
/* goto e68 */
jmp	e68
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$3000048, %rsp
lea	-1000024(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-2000040(%rbp), %rax
movq	%rax, -1000032(%rbp)

lea	-3000056(%rbp), %rax
movq	%rax, -2000048(%rbp)

/*  */
subq	$8, %rsp

/* put param i */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e10 */
call 	e10
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param i */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param i2 */
movq	-1000032(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e49 */
call 	e49
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param i2 */
movq	-1000032(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/*  */
subq	$24, %rsp

/* put param i */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* put param i2 */
movq	-1000032(%rbp), %rax
movq	%rax, 8(%rsp)
/* put param resultat */
movq	-2000048(%rbp), %rax
movq	%rax, 16(%rsp)
/* call e35 */
call 	e35
addq	$24, %rsp
/*  */
subq	$8, %rsp

/* put param resultat */
movq	-2000048(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e23 */
call 	e23
addq	$8, %rsp
/* return */
addq	$3000048, %rsp
pop	%rbp
ret
/* e68: skip */
e68:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

.global _start
.bss
	var8:	.fill	4, 1, 0
	var13_data:	.fill	3, 1, 0
	var17_data:	.fill	0, 1, 0
	var18:	.fill	4, 1, 0
	var19_data:	.fill	0, 1, 0
.data
	var13:	.quad	var13_data
	var17:	.quad	var17_data
	var19:	.quad	var19_data
.text
_start:
call	jada_init
/* t13[0] = 45 */
movb	$45, %cl
movq	var13, %rax
movq	$0, %rbx
movb	%cl, 0(%rax)
/* t13[1] = 88 */
movb	$88, %cl
movq	var13, %rax
movq	$0, %rbx
movb	%cl, 1(%rax)
/* t13[2] = 79 */
movb	$79, %cl
movq	var13, %rax
movq	$0, %rbx
movb	%cl, 2(%rax)
/* jugadorsIcona = t13 */
movq	var13, %rax
movq	%rax, var17

/* jugadorsIcona = t13 */
movq	var13, %rax
movq	%rax, var17

/* goto e237 */
jmp	e237
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-76(%rbp), %rax
movq	%rax, -76(%rbp)

/* t24 = 1 */
movq	$1, -32(%rbp)
/* t772 = t24 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -76(%rbp)

/* t24 = t772 */
movq	-76(%rbp), %rax
movq	%rax, -32(%rbp)

/* t772 = t24 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -76(%rbp)

/* t24 = t772 */
movq	-76(%rbp), %rax
movq	%rax, -32(%rbp)

/* t22 = t24 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t22 = t22 + 8 */
movq	-24(%rbp), %rax
movl	$8, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t21 = malloc t22 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t21[0] = n */
movl	8(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t21[4] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* increment t21 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* tauler = t21 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -44(%rbp)
/* if i >= n then goto e18 */
movl	-44(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e18
/* e238: skip */
e238:
/* j = 0 */
movl	$0, -48(%rbp)
/* if j >= n then goto e17 */
movl	-48(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e17
/* e239: skip */
e239:
/* t37 = j */
movl	-48(%rbp), %eax
movl	%eax, -52(%rbp)

/* t38 = 1 */
movl	$1, -56(%rbp)
/* t40 = tauler[0] */
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -60(%rbp)

/* t38 = t38 * t40 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-56(%rbp), %eax
movl	-60(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -56(%rbp)

/* t41 = t38 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-56(%rbp), %eax
movl	-44(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t37 = t37 + t41 */
movl	-52(%rbp), %eax
movl	-64(%rbp), %edx
addl	%edx, %eax
movl	%eax, -52(%rbp)

/* t43 = t37 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-52(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t43 = t43 + 8 */
movl	-68(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -68(%rbp)

/* tauler[t43] = 0 */
movl	$0, %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-68(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* j = j + 1 */
movl	-48(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* if j >= n then goto e17 */
movl	-48(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e17
/* goto e239 */
jmp	e239
/* e17: skip */
e17:
/* i = i + 1 */
movl	-44(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* if i >= n then goto e18 */
movl	-44(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e18
/* goto e238 */
jmp	e238
/* e18: skip */
e18:
/* return tauler */
movq	-40(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$72, %rsp
pop	%rbp
ret
/* goto e237 */
jmp	e237
/* e21: skip */
e21:
/* preamble e21 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$40, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= n then goto e30 */
movl	-12(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e30
/* e240: skip */
e240:
/* j = 0 */
movl	$0, -16(%rbp)
/* if j >= n then goto e28 */
movl	-16(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e28
/* e241: skip */
e241:
/*  */
subq	$8, %rsp

/* t55 = j */
movl	-16(%rbp), %eax
movl	%eax, -20(%rbp)

/* t56 = 1 */
movl	$1, -24(%rbp)
/* t58 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -28(%rbp)

/* t56 = t56 * t58 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-24(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -24(%rbp)

/* t59 = t56 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-24(%rbp), %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -32(%rbp)

/* t55 = t55 + t59 */
movl	-20(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/* t61 = t55 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -36(%rbp)

/* t61 = t61 + 8 */
movl	-36(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -36(%rbp)

/* t65 = tauler[t61] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-36(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -44(%rbp)

/* t64 = t65 */
movl	-44(%rbp), %eax
movl	%eax, -40(%rbp)

/* t66 = jugadorsIcona[t64] */
movq	var17, %rax
movq	$0, %rbx
movl	-40(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -45(%rbp)

/* put param t66 */
movb	-45(%rbp), %al
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
/* j = j + 1 */
movl	-16(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* if j >= n then goto e28 */
movl	-16(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e28
/* goto e241 */
jmp	e241
/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* put param 10 */
movb	$10, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= n then goto e30 */
movl	-12(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e30
/* goto e240 */
jmp	e240
/* e30: skip */
e30:
/* return */
addq	$40, %rsp
pop	%rbp
ret
/* goto e237 */
jmp	e237
/* e32: skip */
e32:
/* preamble e32 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$40, %rsp
/* complet = true */
movb	$1, -9(%rbp)
/* i = 0 */
movl	$0, -13(%rbp)
/* if i >= n then goto e48 */
movl	-13(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e48
/* if 1 != complet then goto e48 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e48
/* e242: skip */
e242:
/* j = 0 */
movl	$0, -17(%rbp)
/* if j >= n then goto e47 */
movl	-17(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e47
/* if 1 != complet then goto e47 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e47
/* e244: skip */
e244:
/* t80 = j */
movl	-17(%rbp), %eax
movl	%eax, -21(%rbp)

/* t81 = 1 */
movl	$1, -25(%rbp)
/* t83 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -29(%rbp)

/* t81 = t81 * t83 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-25(%rbp), %eax
movl	-29(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -25(%rbp)

/* t84 = t81 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-25(%rbp), %eax
movl	-13(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -33(%rbp)

/* t80 = t80 + t84 */
movl	-21(%rbp), %eax
movl	-33(%rbp), %edx
addl	%edx, %eax
movl	%eax, -21(%rbp)

/* t86 = t80 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-21(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -37(%rbp)

/* t86 = t86 + 8 */
movl	-37(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -37(%rbp)

/* t89 = tauler[t86] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-37(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -41(%rbp)

/* if t89 == 0 then goto e44 */
movl	-41(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
je	e44
/* complet = true */
movb	$1, -9(%rbp)
/* goto e45 */
jmp	e45
/* e44: skip */
e44:
/* complet = false */
movb	$0, -9(%rbp)
/* e45: skip */
e45:
/* j = j + 1 */
movl	-17(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -17(%rbp)

/* if j >= n then goto e47 */
movl	-17(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e47
/* if 1 != complet then goto e47 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e47
/* goto e244 */
jmp	e244
/* e47: skip */
e47:
/* i = i + 1 */
movl	-13(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -13(%rbp)

/* if i >= n then goto e48 */
movl	-13(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e48
/* if 1 != complet then goto e48 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e48
/* goto e242 */
jmp	e242
/* e48: skip */
e48:
/* t90 = complet */
movb	-9(%rbp), %al
movb	%al, -42(%rbp)

/* return t90 */
movb	-42(%rbp), %al
movb	%al, 20(%rbp)
addq	$40, %rsp
pop	%rbp
ret
/* goto e237 */
jmp	e237
/* e54: skip */
e54:
/* preamble e54 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$136, %rsp
/* victoria = true */
movb	$1, -9(%rbp)
/* i = 0 */
movl	$0, -13(%rbp)
/* if i >= n then goto e66 */
movl	-13(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e66
/* if 1 != victoria then goto e66 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e66
/* e256: skip */
e256:
/* t100 = i */
movl	-13(%rbp), %eax
movl	%eax, -17(%rbp)

/* t101 = 1 */
movl	$1, -21(%rbp)
/* t103 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -25(%rbp)

/* t101 = t101 * t103 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-21(%rbp), %eax
movl	-25(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -21(%rbp)

/* t104 = t101 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-21(%rbp), %eax
movl	-13(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -29(%rbp)

/* t100 = t100 + t104 */
movl	-17(%rbp), %eax
movl	-29(%rbp), %edx
addl	%edx, %eax
movl	%eax, -17(%rbp)

/* t106 = t100 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-17(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -33(%rbp)

/* t106 = t106 + 8 */
movl	-33(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -33(%rbp)

/* t108 = tauler[t106] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-33(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -37(%rbp)

/* if t108 != jugador then goto e63 */
movl	-37(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
jne	e63
/* victoria = true */
movb	$1, -9(%rbp)
/* goto e64 */
jmp	e64
/* e63: skip */
e63:
/* victoria = false */
movb	$0, -9(%rbp)
/* e64: skip */
e64:
/* i = i + 1 */
movl	-13(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -13(%rbp)

/* if i >= n then goto e66 */
movl	-13(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e66
/* if 1 != victoria then goto e66 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e66
/* goto e256 */
jmp	e256
/* e66: skip */
e66:
/* if 1 == victoria then goto e80 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e80
/* victoria = true */
movb	$1, -9(%rbp)
/* i = 0 */
movl	$0, -41(%rbp)
/* if i >= n then goto e80 */
movl	-41(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e80
/* if 1 != victoria then goto e80 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e80
/* e254: skip */
e254:
/* t112 = n - i */
movl	16(%rbp), %eax
movl	-41(%rbp), %edx
subl	%edx, %eax
movl	%eax, -45(%rbp)

/* t116 = t112 - 1 */
movl	-45(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -53(%rbp)

/* t117 = 1 */
movl	$1, -57(%rbp)
/* t119 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -61(%rbp)

/* t117 = t117 * t119 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-57(%rbp), %eax
movl	-61(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -57(%rbp)

/* t120 = t117 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-57(%rbp), %eax
movl	-41(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -65(%rbp)

/* t116 = t116 + t120 */
movl	-53(%rbp), %eax
movl	-65(%rbp), %edx
addl	%edx, %eax
movl	%eax, -53(%rbp)

/* t122 = t116 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-53(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -69(%rbp)

/* t122 = t122 + 8 */
movl	-69(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -69(%rbp)

/* t124 = tauler[t122] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-69(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -73(%rbp)

/* if t124 != jugador then goto e76 */
movl	-73(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
jne	e76
/* victoria = true */
movb	$1, -9(%rbp)
/* goto e77 */
jmp	e77
/* e76: skip */
e76:
/* victoria = false */
movb	$0, -9(%rbp)
/* e77: skip */
e77:
/* i = i + 1 */
movl	-41(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -41(%rbp)

/* if i >= n then goto e80 */
movl	-41(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e80
/* if 1 != victoria then goto e80 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
jne	e80
/* goto e254 */
jmp	e254
/* e80: skip */
e80:
/* if 1 == victoria then goto e102 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e102
/* i = 0 */
movl	$0, -77(%rbp)
/* if i >= n then goto e102 */
movl	-77(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e102
/* if 1 == victoria then goto e102 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e102
/* e250: skip */
e250:
/* tmpFila = true */
movb	$1, -78(%rbp)
/* j = 0 */
movl	$0, -82(%rbp)
/* if j >= n then goto e96 */
movl	-82(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e96
/* if 1 != tmpFila then goto e96 */
movb	$1, %al
movb	-78(%rbp), %dl
cmpb	%al, %dl
jne	e96
/* e252: skip */
e252:
/* t134 = j */
movl	-82(%rbp), %eax
movl	%eax, -86(%rbp)

/* t135 = 1 */
movl	$1, -90(%rbp)
/* t137 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -94(%rbp)

/* t135 = t135 * t137 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-90(%rbp), %eax
movl	-94(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -90(%rbp)

/* t138 = t135 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-90(%rbp), %eax
movl	-77(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -98(%rbp)

/* t134 = t134 + t138 */
movl	-86(%rbp), %eax
movl	-98(%rbp), %edx
addl	%edx, %eax
movl	%eax, -86(%rbp)

/* t140 = t134 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-86(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -102(%rbp)

/* t140 = t140 + 8 */
movl	-102(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -102(%rbp)

/* t142 = tauler[t140] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-102(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -106(%rbp)

/* if t142 != jugador then goto e93 */
movl	-106(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
jne	e93
/* tmpFila = true */
movb	$1, -78(%rbp)
/* goto e94 */
jmp	e94
/* e93: skip */
e93:
/* tmpFila = false */
movb	$0, -78(%rbp)
/* e94: skip */
e94:
/* j = j + 1 */
movl	-82(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -82(%rbp)

/* if j >= n then goto e96 */
movl	-82(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e96
/* if 1 != tmpFila then goto e96 */
movb	$1, %al
movb	-78(%rbp), %dl
cmpb	%al, %dl
jne	e96
/* goto e252 */
jmp	e252
/* e96: skip */
e96:
/* victoria = tmpFila */
movb	-78(%rbp), %al
movb	%al, -9(%rbp)

/* i = i + 1 */
movl	-77(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -77(%rbp)

/* if i >= n then goto e102 */
movl	-77(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e102
/* if 1 == victoria then goto e102 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e102
/* goto e250 */
jmp	e250
/* e102: skip */
e102:
/* if 1 == victoria then goto e124 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e124
/* i = 0 */
movl	$0, -110(%rbp)
/* if i >= n then goto e124 */
movl	-110(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e124
/* if 1 == victoria then goto e124 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e124
/* e246: skip */
e246:
/* tmpColumna = true */
movb	$1, -111(%rbp)
/* j = 0 */
movl	$0, -115(%rbp)
/* if j >= n then goto e118 */
movl	-115(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e118
/* if 1 != tmpColumna then goto e118 */
movb	$1, %al
movb	-111(%rbp), %dl
cmpb	%al, %dl
jne	e118
/* e248: skip */
e248:
/* t152 = i */
movl	-110(%rbp), %eax
movl	%eax, -119(%rbp)

/* t153 = 1 */
movl	$1, -123(%rbp)
/* t155 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -127(%rbp)

/* t153 = t153 * t155 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-123(%rbp), %eax
movl	-127(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -123(%rbp)

/* t156 = t153 * j */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-123(%rbp), %eax
movl	-115(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -131(%rbp)

/* t152 = t152 + t156 */
movl	-119(%rbp), %eax
movl	-131(%rbp), %edx
addl	%edx, %eax
movl	%eax, -119(%rbp)

/* t158 = t152 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-119(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -135(%rbp)

/* t158 = t158 + 8 */
movl	-135(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -135(%rbp)

/* t160 = tauler[t158] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-135(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -139(%rbp)

/* if t160 != jugador then goto e115 */
movl	-139(%rbp), %eax
movl	20(%rbp), %edx
cmpl	%eax, %edx
jne	e115
/* tmpColumna = true */
movb	$1, -111(%rbp)
/* goto e116 */
jmp	e116
/* e115: skip */
e115:
/* tmpColumna = false */
movb	$0, -111(%rbp)
/* e116: skip */
e116:
/* j = j + 1 */
movl	-115(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -115(%rbp)

/* if j >= n then goto e118 */
movl	-115(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e118
/* if 1 != tmpColumna then goto e118 */
movb	$1, %al
movb	-111(%rbp), %dl
cmpb	%al, %dl
jne	e118
/* goto e248 */
jmp	e248
/* e118: skip */
e118:
/* victoria = tmpColumna */
movb	-111(%rbp), %al
movb	%al, -9(%rbp)

/* i = i + 1 */
movl	-110(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -110(%rbp)

/* if i >= n then goto e124 */
movl	-110(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e124
/* if 1 == victoria then goto e124 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e124
/* goto e246 */
jmp	e246
/* e124: skip */
e124:
/* t161 = victoria */
movb	-9(%rbp), %al
movb	%al, -140(%rbp)

/* return t161 */
movb	-140(%rbp), %al
movb	%al, 24(%rbp)
addq	$136, %rsp
pop	%rbp
ret
/* goto e237 */
jmp	e237
/* e130: skip */
e130:
/* preamble e130 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$8, %rsp
/*  */
subq	$16, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* t164 = call e32 */
call 	e32
movb	12(%rsp), %al
movb	%al, -9(%rbp)
addq	$16, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 == t164 then goto e133 */
movb	$1, %al
movb	-9(%rbp), %dl
cmpb	%al, %dl
je	e133
/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param 1 */
movl	$1, %eax
movl	%eax, 12(%rsp)
/* t166 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -10(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 == t166 then goto e133 */
movb	$1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e133
/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param 2 */
movl	$2, %eax
movl	%eax, 12(%rsp)
/* t169 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -12(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e135 */
jmp	e135
/* e133: skip */
e133:
/* t169 = true */
movb	$1, -12(%rbp)
/* e135: skip */
e135:
/* return t169 */
movb	-12(%rbp), %al
movb	%al, 20(%rbp)
addq	$8, %rsp
pop	%rbp
ret
/* goto e237 */
jmp	e237
/* e138: skip */
e138:
/* preamble e138 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$96, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-100(%rbp), %rax
movq	%rax, -100(%rbp)

/* t175 = 1 */
movq	$1, -32(%rbp)
/* t773 = t175 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -100(%rbp)

/* t175 = t773 */
movq	-100(%rbp), %rax
movq	%rax, -32(%rbp)

/* t773 = t175 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -100(%rbp)

/* t175 = t773 */
movq	-100(%rbp), %rax
movq	%rax, -32(%rbp)

/* t173 = t175 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t173 = t173 + 8 */
movq	-24(%rbp), %rax
movl	$8, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t172 = malloc t173 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t172[0] = n */
movl	16(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t172[4] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* increment t172 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* nouTauler = t172 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -44(%rbp)
/* if i >= n then goto e146 */
movl	-44(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e146
/* e258: skip */
e258:
/* j = 0 */
movl	$0, -48(%rbp)
/* if j >= n then goto e145 */
movl	-48(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e145
/* e259: skip */
e259:
/* t188 = j */
movl	-48(%rbp), %eax
movl	%eax, -52(%rbp)

/* t189 = 1 */
movl	$1, -56(%rbp)
/* t191 = nouTauler[0] */
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -60(%rbp)

/* t189 = t189 * t191 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-56(%rbp), %eax
movl	-60(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -56(%rbp)

/* t192 = t189 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-56(%rbp), %eax
movl	-44(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t188 = t188 + t192 */
movl	-52(%rbp), %eax
movl	-64(%rbp), %edx
addl	%edx, %eax
movl	%eax, -52(%rbp)

/* t194 = t188 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-52(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t194 = t194 + 8 */
movl	-68(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -68(%rbp)

/* t197 = j */
movl	-48(%rbp), %eax
movl	%eax, -72(%rbp)

/* t198 = 1 */
movl	$1, -76(%rbp)
/* t200 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -80(%rbp)

/* t198 = t198 * t200 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-76(%rbp), %eax
movl	-80(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -76(%rbp)

/* t201 = t198 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-76(%rbp), %eax
movl	-44(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -84(%rbp)

/* t197 = t197 + t201 */
movl	-72(%rbp), %eax
movl	-84(%rbp), %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* t203 = t197 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-72(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -88(%rbp)

/* t203 = t203 + 8 */
movl	-88(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -88(%rbp)

/* t205 = tauler[t203] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-88(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -92(%rbp)

/* nouTauler[t194] = t205 */
movl	-92(%rbp), %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-68(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* j = j + 1 */
movl	-48(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* if j >= n then goto e145 */
movl	-48(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e145
/* goto e259 */
jmp	e259
/* e145: skip */
e145:
/* i = i + 1 */
movl	-44(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* if i >= n then goto e146 */
movl	-44(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e146
/* goto e258 */
jmp	e258
/* e146: skip */
e146:
/* return nouTauler */
movq	-40(%rbp), %rax
movq	%rax, 20(%rbp)
addq	$96, %rsp
pop	%rbp
ret
/* goto e237 */
jmp	e237
/* e149: skip */
e149:
/* preamble e149 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$128, %rsp
lea	-63(%rbp), %rax
movq	%rax, -63(%rbp)

lea	-71(%rbp), %rax
movq	%rax, -71(%rbp)

lea	-107(%rbp), %rax
movq	%rax, -99(%rbp)

lea	-115(%rbp), %rax
movq	%rax, -115(%rbp)

/* if torn != 1 then goto e151 */
movl	20(%rbp), %eax
movl	$1, %edx
cmpl	%eax, %edx
jne	e151
/* t215 = 2 */
movl	$2, -12(%rbp)
/* goto e152 */
jmp	e152
/* e151: skip */
e151:
/* t215 = 1 */
movl	$1, -12(%rbp)
/* e152: skip */
e152:
/* contrari = t215 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param torn */
movl	20(%rbp), %eax
movl	%eax, 12(%rsp)
/* t217 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -17(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 != t217 then goto e156 */
movb	$1, %al
movb	-17(%rbp), %dl
cmpb	%al, %dl
jne	e156
/* return 10 */
movl	$10, %eax
movl	%eax, 36(%rbp)
addq	$128, %rsp
pop	%rbp
ret
/* e156: skip */
e156:
/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param contrari */
movl	-16(%rbp), %eax
movl	%eax, 12(%rsp)
/* t219 = call e54 */
call 	e54
movb	16(%rsp), %al
movb	%al, -18(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 != t219 then goto e159 */
movb	$1, %al
movb	-18(%rbp), %dl
cmpb	%al, %dl
jne	e159
/* return -10 */
movl	$-10, %eax
movl	%eax, 36(%rbp)
addq	$128, %rsp
pop	%rbp
ret
/* e159: skip */
e159:
/*  */
subq	$16, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* t223 = call e32 */
call 	e32
movb	12(%rsp), %al
movb	%al, -19(%rbp)
addq	$16, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 != t223 then goto e162 */
movb	$1, %al
movb	-19(%rbp), %dl
cmpb	%al, %dl
jne	e162
/* return 0 */
movl	$0, %eax
movl	%eax, 36(%rbp)
addq	$128, %rsp
pop	%rbp
ret
/* e162: skip */
e162:
/* bestMovement = -100000 */
movl	$-100000, -23(%rbp)
/* i = 0 */
movl	$0, -27(%rbp)
/* if i >= n then goto e180 */
movl	-27(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e180
/* e260: skip */
e260:
/* j = 0 */
movl	$0, -31(%rbp)
/* if j >= n then goto e179 */
movl	-31(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e179
/* e261: skip */
e261:
/* t236 = j */
movl	-31(%rbp), %eax
movl	%eax, -35(%rbp)

/* t237 = 1 */
movl	$1, -39(%rbp)
/* t239 = tauler[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -43(%rbp)

/* t237 = t237 * t239 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-39(%rbp), %eax
movl	-43(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -39(%rbp)

/* t240 = t237 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-39(%rbp), %eax
movl	-27(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -47(%rbp)

/* t236 = t236 + t240 */
movl	-35(%rbp), %eax
movl	-47(%rbp), %edx
addl	%edx, %eax
movl	%eax, -35(%rbp)

/* t242 = t236 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-35(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -51(%rbp)

/* t242 = t242 + 8 */
movl	-51(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -51(%rbp)

/* t245 = tauler[t242] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-51(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -55(%rbp)

/* if t245 != 0 then goto e178 */
movl	-55(%rbp), %eax
movl	$0, %edx
cmpl	%eax, %edx
jne	e178
/*  */
subq	$24, %rsp

/* put param tauler */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* taulerCopia = call e138 */
call 	e138
movq	12(%rsp), %rax
movq	%rax, -71(%rbp)
addq	$24, %rsp
/* decrement tauler */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* t249 = j */
movl	-31(%rbp), %eax
movl	%eax, -75(%rbp)

/* t250 = 1 */
movl	$1, -79(%rbp)
/* t252 = taulerCopia[0] */
movq	-71(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -83(%rbp)

/* t250 = t250 * t252 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-79(%rbp), %eax
movl	-83(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -79(%rbp)

/* t253 = t250 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-79(%rbp), %eax
movl	-27(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -87(%rbp)

/* t249 = t249 + t253 */
movl	-75(%rbp), %eax
movl	-87(%rbp), %edx
addl	%edx, %eax
movl	%eax, -75(%rbp)

/* t255 = t249 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-75(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -91(%rbp)

/* t255 = t255 + 8 */
movl	-91(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -91(%rbp)

/* taulerCopia[t255] = torn */
movl	20(%rbp), %ecx
movq	-71(%rbp), %rax
movq	$0, %rbx
movl	-91(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t260[0] = 0 */
movl	$0, %ecx
movq	-99(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t260[4] = 0 */
movl	$0, %ecx
movq	-99(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* aux = t260 */
movq	-99(%rbp), %rax
movq	%rax, -115(%rbp)

/*  */
subq	$32, %rsp

/* t265 = moviments + 1 */
movl	32(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -119(%rbp)

/* put param taulerCopia */
movq	-71(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment taulerCopia */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	16(%rbp), %eax
movl	%eax, 8(%rsp)
/* put param contrari */
movl	-16(%rbp), %eax
movl	%eax, 12(%rsp)
/* put param aux */
movq	-115(%rbp), %rax
movq	%rax, 16(%rsp)
/* put param t265 */
movl	-119(%rbp), %eax
movl	%eax, 24(%rsp)
/* t266 = call e149 */
call 	e149
movl	28(%rsp), %eax
movl	%eax, -123(%rbp)
addq	$32, %rsp
/* decrement taulerCopia */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* tmp = 0 - t266 */
movl	$0, %eax
movl	-123(%rbp), %edx
subl	%edx, %eax
movl	%eax, -131(%rbp)

/* if tmp <= bestMovement then goto e177 */
movl	-131(%rbp), %eax
movl	-23(%rbp), %edx
cmpl	%eax, %edx
jge	e177
/* bestMovement = tmp */
movl	-131(%rbp), %eax
movl	%eax, -23(%rbp)

/* solucio[0] = i */
movl	-27(%rbp), %ecx
movq	24(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* solucio[4] = j */
movl	-31(%rbp), %ecx
movq	24(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* e177: skip */
e177:
/* decrement taulerCopia */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e178: skip */
e178:
/* j = j + 1 */
movl	-31(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -31(%rbp)

/* if j >= n then goto e179 */
movl	-31(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e179
/* goto e261 */
jmp	e261
/* e179: skip */
e179:
/* i = i + 1 */
movl	-27(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -27(%rbp)

/* if i >= n then goto e180 */
movl	-27(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e180
/* goto e260 */
jmp	e260
/* e180: skip */
e180:
/* return bestMovement */
movl	-23(%rbp), %eax
movl	%eax, 36(%rbp)
addq	$128, %rsp
pop	%rbp
ret
/* goto e237 */
jmp	e237
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$504, %rsp
lea	-58(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-136(%rbp), %rax
movq	%rax, -71(%rbp)

lea	-144(%rbp), %rax
movq	%rax, -144(%rbp)

lea	-152(%rbp), %rax
movq	%rax, -152(%rbp)

lea	-201(%rbp), %rax
movq	%rax, -178(%rbp)

lea	-220(%rbp), %rax
movq	%rax, -214(%rbp)

lea	-228(%rbp), %rax
movq	%rax, -228(%rbp)

lea	-255(%rbp), %rax
movq	%rax, -245(%rbp)

lea	-277(%rbp), %rax
movq	%rax, -263(%rbp)

lea	-297(%rbp), %rax
movq	%rax, -290(%rbp)

lea	-313(%rbp), %rax
movq	%rax, -305(%rbp)

lea	-321(%rbp), %rax
movq	%rax, -321(%rbp)

lea	-329(%rbp), %rax
movq	%rax, -329(%rbp)

lea	-337(%rbp), %rax
movq	%rax, -337(%rbp)

lea	-406(%rbp), %rax
movq	%rax, -381(%rbp)

lea	-450(%rbp), %rax
movq	%rax, -422(%rbp)

lea	-509(%rbp), %rax
movq	%rax, -502(%rbp)

/*  */
subq	$8, %rsp

/* t276[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t276[4] = 73 */
movb	$73, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t276[5] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t276[6] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t276[7] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t276[8] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t276[9] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t276[10] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t276[11] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t276[12] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t276[13] = 120 */
movb	$120, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t276[14] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t276[15] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t276[16] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t276[17] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t276[18] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t276[19] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t276[20] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t276[21] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t276[22] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t276[23] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t276[24] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t276[25] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t276[26] = -61 */
movb	$-61, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t276[27] = -77 */
movb	$-77, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t276[28] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t276[29] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t276[30] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t276[31] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t276[32] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t276[33] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t276[34] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t276[35] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t276[36] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t276[37] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t276[38] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* t276[39] = 58 */
movb	$58, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 39(%rax)
/* t276[40] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 40(%rax)
/* t276[41] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 41(%rax)
/* put param t276 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t276 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t276 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* dimensions = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, var8
addq	$8, %rsp
/* ia = false */
movb	$0, -63(%rbp)
/*  */
subq	$8, %rsp

/* t358[0] = 1 */
movl	$1, %ecx
movq	-71(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t358[4] = 86 */
movb	$86, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t358[5] = 111 */
movb	$111, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t358[6] = 108 */
movb	$108, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t358[7] = 115 */
movb	$115, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t358[8] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t358[9] = 106 */
movb	$106, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t358[10] = 117 */
movb	$117, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t358[11] = 103 */
movb	$103, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t358[12] = 97 */
movb	$97, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t358[13] = 114 */
movb	$114, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t358[14] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t358[15] = 99 */
movb	$99, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t358[16] = 111 */
movb	$111, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t358[17] = 110 */
movb	$110, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t358[18] = 116 */
movb	$116, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t358[19] = 114 */
movb	$114, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t358[20] = 97 */
movb	$97, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t358[21] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t358[22] = 108 */
movb	$108, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t358[23] = 97 */
movb	$97, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t358[24] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t358[25] = 109 */
movb	$109, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t358[26] = -61 */
movb	$-61, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t358[27] = -96 */
movb	$-96, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t358[28] = 113 */
movb	$113, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t358[29] = 117 */
movb	$117, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t358[30] = 105 */
movb	$105, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t358[31] = 110 */
movb	$110, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t358[32] = 97 */
movb	$97, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t358[33] = 63 */
movb	$63, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t358[34] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t358[35] = 73 */
movb	$73, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t358[36] = 110 */
movb	$110, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t358[37] = 116 */
movb	$116, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t358[38] = 114 */
movb	$114, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* t358[39] = 111 */
movb	$111, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 39(%rax)
/* t358[40] = 100 */
movb	$100, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 40(%rax)
/* t358[41] = 117 */
movb	$117, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 41(%rax)
/* t358[42] = 101 */
movb	$101, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 42(%rax)
/* t358[43] = 105 */
movb	$105, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 43(%rax)
/* t358[44] = 120 */
movb	$120, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 44(%rax)
/* t358[45] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 45(%rax)
/* t358[46] = 39 */
movb	$39, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 46(%rax)
/* t358[47] = 83 */
movb	$83, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 47(%rax)
/* t358[48] = 39 */
movb	$39, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 48(%rax)
/* t358[49] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 49(%rax)
/* t358[50] = 112 */
movb	$112, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 50(%rax)
/* t358[51] = 101 */
movb	$101, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 51(%rax)
/* t358[52] = 114 */
movb	$114, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 52(%rax)
/* t358[53] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 53(%rax)
/* t358[54] = 106 */
movb	$106, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 54(%rax)
/* t358[55] = 117 */
movb	$117, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 55(%rax)
/* t358[56] = 103 */
movb	$103, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 56(%rax)
/* t358[57] = 97 */
movb	$97, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 57(%rax)
/* t358[58] = 114 */
movb	$114, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 58(%rax)
/* t358[59] = 45 */
movb	$45, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 59(%rax)
/* t358[60] = 104 */
movb	$104, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 60(%rax)
/* t358[61] = 105 */
movb	$105, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 61(%rax)
/* t358[62] = 58 */
movb	$58, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 62(%rax)
/* t358[63] = 32 */
movb	$32, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 63(%rax)
/* t358[64] = 0 */
movb	$0, %cl
movq	-71(%rbp), %rax
movq	$0, %rbx
movb	%cl, 64(%rax)
/* put param t358 */
movq	-71(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t358 */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t358 */
movq	-71(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* iaInput = call read */
call 	read
movq	0(%rsp), %rax
movq	%rax, -152(%rbp)
addq	$8, %rsp
/* t491 = 0 */
movl	$0, -160(%rbp)
/* t491 = t491 + 4 */
movl	-160(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -160(%rbp)

/* t494 = iaInput[t491] */
movq	-152(%rbp), %rax
movq	$0, %rbx
movl	-160(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -161(%rbp)

/* if t494 == 83 then goto e196 */
movb	-161(%rbp), %al
movb	$83, %dl
cmpb	%al, %dl
je	e196
/* t500 = 0 */
movl	$0, -165(%rbp)
/* t500 = t500 + 4 */
movl	-165(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -165(%rbp)

/* t503 = iaInput[t500] */
movq	-152(%rbp), %rax
movq	$0, %rbx
movl	-165(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -166(%rbp)

/* if t503 != 115 then goto e204 */
movb	-166(%rbp), %al
movb	$115, %dl
cmpb	%al, %dl
jne	e204
/* e196: skip */
e196:
/* ia = true */
movb	$1, -63(%rbp)
/*  */
subq	$16, %rsp

/* put param 1 */
movl	$1, %eax
movl	%eax, 0(%rsp)
/* put param 2 */
movl	$2, %eax
movl	%eax, 4(%rsp)
/* jugadorLocal = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -156(%rbp)
addq	$16, %rsp
/*  */
subq	$8, %rsp

/* t507[0] = 1 */
movl	$1, %ecx
movq	-178(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t507[4] = 84 */
movb	$84, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t507[5] = 117 */
movb	$117, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t507[6] = 32 */
movb	$32, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t507[7] = 101 */
movb	$101, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t507[8] = 116 */
movb	$116, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t507[9] = 115 */
movb	$115, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t507[10] = 32 */
movb	$32, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t507[11] = 101 */
movb	$101, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t507[12] = 108 */
movb	$108, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t507[13] = 32 */
movb	$32, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t507[14] = 106 */
movb	$106, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t507[15] = 117 */
movb	$117, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t507[16] = 103 */
movb	$103, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t507[17] = 97 */
movb	$97, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t507[18] = 100 */
movb	$100, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t507[19] = 111 */
movb	$111, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t507[20] = 114 */
movb	$114, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t507[21] = 32 */
movb	$32, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t507[22] = 0 */
movb	$0, %cl
movq	-178(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* put param t507 */
movq	-178(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t507 */
movq	-178(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t507 */
movq	-178(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t549 = jugadorLocal */
movl	-156(%rbp), %eax
movl	%eax, -205(%rbp)

/* t550 = jugadorsIcona[t549] */
movq	var17, %rax
movq	$0, %rbx
movl	-205(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -206(%rbp)

/* put param t550 */
movb	-206(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t551[0] = 1 */
movl	$1, %ecx
movq	-214(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t551[4] = 10 */
movb	$10, %cl
movq	-214(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t551[5] = 0 */
movb	$0, %cl
movq	-214(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* put param t551 */
movq	-214(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t551 */
movq	-214(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t551 */
movq	-214(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e204: skip */
e204:
/*  */
subq	$16, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 0(%rsp)
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* taulerActual = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, var19
addq	$16, %rsp
/*  */
subq	$16, %rsp

/* put param 1 */
movl	$1, %eax
movl	%eax, 0(%rsp)
/* put param 2 */
movl	$2, %eax
movl	%eax, 4(%rsp)
/* torn = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, var18
addq	$16, %rsp
/* numTorns = 1 */
movl	$1, -236(%rbp)
/*  */
subq	$16, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* t564 = call e130 */
call 	e130
movb	12(%rsp), %al
movb	%al, -237(%rbp)
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 != t564 then goto e209 */
movb	$1, %al
movb	-237(%rbp), %dl
cmpb	%al, %dl
jne	e209
/* e262: skip */
e262:
/* e209: skip */
e209:
/*  */
subq	$8, %rsp

/* t565[0] = 1 */
movl	$1, %ecx
movq	-245(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t565[4] = 84 */
movb	$84, %cl
movq	-245(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t565[5] = 111 */
movb	$111, %cl
movq	-245(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t565[6] = 114 */
movb	$114, %cl
movq	-245(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t565[7] = 110 */
movb	$110, %cl
movq	-245(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t565[8] = 32 */
movb	$32, %cl
movq	-245(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t565[9] = 0 */
movb	$0, %cl
movq	-245(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* put param t565 */
movq	-245(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t565 */
movq	-245(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t565 */
movq	-245(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param numTorns */
movl	-236(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t580[0] = 1 */
movl	$1, %ecx
movq	-263(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t580[4] = 46 */
movb	$46, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t580[5] = 32 */
movb	$32, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t580[6] = 84 */
movb	$84, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t580[7] = 111 */
movb	$111, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t580[8] = 99 */
movb	$99, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t580[9] = 97 */
movb	$97, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t580[10] = 32 */
movb	$32, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t580[11] = 97 */
movb	$97, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t580[12] = 32 */
movb	$32, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t580[13] = 0 */
movb	$0, %cl
movq	-263(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* put param t580 */
movq	-263(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t580 */
movq	-263(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t580 */
movq	-263(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t604 = torn */
movl	var18, %eax
movl	%eax, -281(%rbp)

/* t605 = jugadorsIcona[t604] */
movq	var17, %rax
movq	$0, %rbx
movl	-281(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -282(%rbp)

/* put param t605 */
movb	-282(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t606[0] = 1 */
movl	$1, %ecx
movq	-290(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t606[4] = 46 */
movb	$46, %cl
movq	-290(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t606[5] = 10 */
movb	$10, %cl
movq	-290(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t606[6] = 0 */
movb	$0, %cl
movq	-290(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* put param t606 */
movq	-290(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t606 */
movq	-290(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t606 */
movq	-290(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* call e21 */
call 	e21
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 != ia then goto e222 */
movb	$1, %al
movb	-63(%rbp), %dl
cmpb	%al, %dl
jne	e222
/* if torn == jugadorLocal then goto e222 */
movl	var18, %eax
movl	-156(%rbp), %edx
cmpl	%eax, %edx
je	e222
/* t618[0] = 0 */
movl	$0, %ecx
movq	-305(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t618[4] = 0 */
movl	$0, %ecx
movq	-305(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* best = t618 */
movq	-305(%rbp), %rax
movq	%rax, -321(%rbp)

/*  */
subq	$24, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* copia = call e138 */
call 	e138
movq	12(%rsp), %rax
movq	%rax, -337(%rbp)
addq	$24, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$32, %rsp

/* put param copia */
movq	-337(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment copia */
movq	-337(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* put param torn */
movl	var18, %eax
movl	%eax, 12(%rsp)
/* put param best */
movq	-321(%rbp), %rax
movq	%rax, 16(%rsp)
/* put param 0 */
movl	$0, %eax
movl	%eax, 24(%rsp)
/* t625 = call e149 */
call 	e149
movl	28(%rsp), %eax
movl	%eax, -341(%rbp)
addq	$32, %rsp
/* decrement copia */
movq	-337(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* t635 = best[4] */
movq	-321(%rbp), %rax
movq	$0, %rbx
movl	4(%rax), %eax
movl	%eax, -353(%rbp)

/* t634 = t635 */
movl	-353(%rbp), %eax
movl	%eax, -349(%rbp)

/* t636 = 1 */
movl	$1, -357(%rbp)
/* t638 = taulerActual[0] */
movq	var19, %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -361(%rbp)

/* t636 = t636 * t638 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-357(%rbp), %eax
movl	-361(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -357(%rbp)

/* t640 = best[0] */
movq	-321(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -369(%rbp)

/* t639 = t636 * t640 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-357(%rbp), %eax
movl	-369(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -365(%rbp)

/* t634 = t634 + t639 */
movl	-349(%rbp), %eax
movl	-365(%rbp), %edx
addl	%edx, %eax
movl	%eax, -349(%rbp)

/* t642 = t634 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-349(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -373(%rbp)

/* t642 = t642 + 8 */
movl	-373(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -373(%rbp)

/* taulerActual[t642] = torn */
movl	var18, %ecx
movq	var19, %rax
movq	$0, %rbx
movl	-373(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* decrement copia */
movq	-337(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e228 */
jmp	e228
/* e222: skip */
e222:
/*  */
subq	$8, %rsp

/* t644[0] = 1 */
movl	$1, %ecx
movq	-381(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t644[4] = 73 */
movb	$73, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t644[5] = 110 */
movb	$110, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t644[6] = 116 */
movb	$116, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t644[7] = 114 */
movb	$114, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t644[8] = 111 */
movb	$111, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t644[9] = 100 */
movb	$100, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t644[10] = 117 */
movb	$117, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t644[11] = 101 */
movb	$101, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t644[12] = 105 */
movb	$105, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t644[13] = 120 */
movb	$120, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t644[14] = 32 */
movb	$32, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t644[15] = 108 */
movb	$108, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t644[16] = 97 */
movb	$97, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t644[17] = 32 */
movb	$32, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t644[18] = 102 */
movb	$102, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t644[19] = 105 */
movb	$105, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t644[20] = 108 */
movb	$108, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t644[21] = 97 */
movb	$97, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t644[22] = 58 */
movb	$58, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t644[23] = 32 */
movb	$32, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t644[24] = 0 */
movb	$0, %cl
movq	-381(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* put param t644 */
movq	-381(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t644 */
movq	-381(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t644 */
movq	-381(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* fila = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -414(%rbp)
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t691[0] = 1 */
movl	$1, %ecx
movq	-422(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t691[4] = 73 */
movb	$73, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t691[5] = 110 */
movb	$110, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t691[6] = 116 */
movb	$116, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t691[7] = 114 */
movb	$114, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t691[8] = 111 */
movb	$111, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t691[9] = 100 */
movb	$100, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t691[10] = 117 */
movb	$117, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t691[11] = 101 */
movb	$101, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t691[12] = 105 */
movb	$105, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t691[13] = 120 */
movb	$120, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t691[14] = 32 */
movb	$32, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t691[15] = 108 */
movb	$108, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t691[16] = 97 */
movb	$97, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t691[17] = 32 */
movb	$32, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t691[18] = 99 */
movb	$99, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t691[19] = 111 */
movb	$111, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t691[20] = 108 */
movb	$108, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t691[21] = 117 */
movb	$117, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t691[22] = 109 */
movb	$109, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t691[23] = 110 */
movb	$110, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t691[24] = 97 */
movb	$97, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t691[25] = 58 */
movb	$58, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t691[26] = 32 */
movb	$32, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t691[27] = 0 */
movb	$0, %cl
movq	-422(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* put param t691 */
movq	-422(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t691 */
movq	-422(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t691 */
movq	-422(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* columna = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -458(%rbp)
addq	$8, %rsp
/* t745 = fila - 1 */
movl	-414(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -462(%rbp)

/* t749 = columna - 1 */
movl	-458(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -470(%rbp)

/* t750 = 1 */
movl	$1, -474(%rbp)
/* t752 = taulerActual[0] */
movq	var19, %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -478(%rbp)

/* t750 = t750 * t752 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-474(%rbp), %eax
movl	-478(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -474(%rbp)

/* t753 = t750 * t745 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-474(%rbp), %eax
movl	-462(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -482(%rbp)

/* t749 = t749 + t753 */
movl	-470(%rbp), %eax
movl	-482(%rbp), %edx
addl	%edx, %eax
movl	%eax, -470(%rbp)

/* t755 = t749 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-470(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -486(%rbp)

/* t755 = t755 + 8 */
movl	-486(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -486(%rbp)

/* taulerActual[t755] = torn */
movl	var18, %ecx
movq	var19, %rax
movq	$0, %rbx
movl	-486(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e228: skip */
e228:
/* numTorns = numTorns + 1 */
movl	-236(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -236(%rbp)

/* if torn != 1 then goto e231 */
movl	var18, %eax
movl	$1, %edx
cmpl	%eax, %edx
jne	e231
/* t762 = 2 */
movl	$2, -494(%rbp)
/* goto e232 */
jmp	e232
/* e231: skip */
e231:
/* t762 = 1 */
movl	$1, -494(%rbp)
/* e232: skip */
e232:
/* torn = t762 */
movl	-494(%rbp), %eax
movl	%eax, var18

/*  */
subq	$8, %rsp

/* t763[0] = 1 */
movl	$1, %ecx
movq	-502(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t763[4] = 10 */
movb	$10, %cl
movq	-502(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t763[5] = 10 */
movb	$10, %cl
movq	-502(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t763[6] = 0 */
movb	$0, %cl
movq	-502(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* put param t763 */
movq	-502(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t763 */
movq	-502(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t763 */
movq	-502(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* t564 = call e130 */
call 	e130
movb	12(%rsp), %al
movb	%al, -237(%rbp)
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* if 1 != t564 then goto e262 */
movb	$1, %al
movb	-237(%rbp), %dl
cmpb	%al, %dl
jne	e262
/*  */
subq	$16, %rsp

/* put param taulerActual */
movq	var19, %rax
movq	%rax, 0(%rsp)
/* increment taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param dimensions */
movl	var8, %eax
movl	%eax, 8(%rsp)
/* call e21 */
call 	e21
addq	$16, %rsp
/* decrement taulerActual */
movq	var19, %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement iaInput */
movq	-152(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$504, %rsp
pop	%rbp
ret
/* e237: skip */
e237:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

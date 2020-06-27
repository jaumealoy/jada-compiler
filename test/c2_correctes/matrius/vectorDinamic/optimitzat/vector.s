.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e65 */
jmp	e65
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$88, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-64(%rbp), %rax
movq	%rax, -52(%rbp)

lea	-81(%rbp), %rax
movq	%rax, -72(%rbp)

/* t12 = 1 */
movq	$1, -32(%rbp)
/* t12 = t12 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -32(%rbp)

/* t10 = t12 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t10 = t10 + 4 */
movq	-24(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t9 = malloc t10 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t9[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t9 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* vector = t9 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -44(%rbp)
/* if i >= n then goto e18 */
movl	-44(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e18
/* e66: skip */
e66:
/*  */
subq	$8, %rsp

/* t20[0] = 1 */
movl	$1, %ecx
movq	-52(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t20[4] = 118 */
movb	$118, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t20[5] = 101 */
movb	$101, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t20[6] = 99 */
movb	$99, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t20[7] = 116 */
movb	$116, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t20[8] = 111 */
movb	$111, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t20[9] = 114 */
movb	$114, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t20[10] = 91 */
movb	$91, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t20[11] = 0 */
movb	$0, %cl
movq	-52(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* put param t20 */
movq	-52(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t20 */
movq	-52(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t20 */
movq	-52(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* put param i */
movl	-44(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* t39[0] = 1 */
movl	$1, %ecx
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t39[4] = 93 */
movb	$93, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t39[5] = 32 */
movb	$32, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t39[6] = 61 */
movb	$61, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t39[7] = 32 */
movb	$32, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t39[8] = 0 */
movb	$0, %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* put param t39 */
movq	-72(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t39 */
movq	-72(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t39 */
movq	-72(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* t53 = i */
movl	-44(%rbp), %eax
movl	%eax, -85(%rbp)

/* t56 = t53 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-85(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -89(%rbp)

/* t56 = t56 + 4 */
movl	-89(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -89(%rbp)

/*  */
subq	$8, %rsp

/* t58 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -93(%rbp)
addq	$8, %rsp
/* vector[t56] = t58 */
movl	-93(%rbp), %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-89(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
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
/* goto e66 */
jmp	e66
/* e18: skip */
e18:
/* return vector */
movq	-40(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$88, %rsp
pop	%rbp
ret
/* goto e65 */
jmp	e65
/* e21: skip */
e21:
/* preamble e21 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$40, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/*  */
subq	$8, %rsp

/* put param 40 */
movb	$40, %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* t323 = n - 1 */
movl	16(%rbp), %eax
movl	$1, %edx
subl	%edx, %eax
movl	%eax, -48(%rbp)

/* t65 = t323 */
movl	-48(%rbp), %eax
movl	%eax, -16(%rbp)

/* if i >= t65 then goto e30 */
movl	-12(%rbp), %eax
movl	-16(%rbp), %edx
cmpl	%eax, %edx
jle	e30
/* t65 = t323 */
movl	-48(%rbp), %eax
movl	%eax, -16(%rbp)

/* e67: skip */
e67:
/*  */
subq	$8, %rsp

/* t67 = i */
movl	-12(%rbp), %eax
movl	%eax, -20(%rbp)

/* t70 = t67 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -24(%rbp)

/* t70 = t70 + 4 */
movl	-24(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -24(%rbp)

/* t72 = v[t70] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-24(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -28(%rbp)

/* put param t72 */
movl	-28(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 44 */
movb	$44, %al
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
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= t65 then goto e30 */
movl	-12(%rbp), %eax
movl	-16(%rbp), %edx
cmpl	%eax, %edx
jle	e30
/* goto e67 */
jmp	e67
/* e30: skip */
e30:
/*  */
subq	$8, %rsp

/* t79 = t323 */
movl	-48(%rbp), %eax
movl	%eax, -36(%rbp)

/* t82 = t79 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-36(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* t82 = t82 + 4 */
movl	-40(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/* t84 = v[t82] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-40(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -44(%rbp)

/* put param t84 */
movl	-44(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/*  */
subq	$8, %rsp

/* put param 41 */
movb	$41, %al
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
/* return */
addq	$40, %rsp
pop	%rbp
ret
/* goto e65 */
jmp	e65
/* e35: skip */
e35:
/* preamble e35 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$40, %rsp
/* resultat = 0 */
movl	$0, -12(%rbp)
/* i = 0 */
movl	$0, -16(%rbp)
/* if i >= n then goto e40 */
movl	-16(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e40
/* e68: skip */
e68:
/* t96 = i */
movl	-16(%rbp), %eax
movl	%eax, -20(%rbp)

/* t99 = t96 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -24(%rbp)

/* t99 = t99 + 4 */
movl	-24(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -24(%rbp)

/* t102 = i */
movl	-16(%rbp), %eax
movl	%eax, -28(%rbp)

/* t105 = t102 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-28(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -32(%rbp)

/* t105 = t105 + 4 */
movl	-32(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -32(%rbp)

/* t108 = v1[t99] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-24(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -40(%rbp)

/* t109 = v2[t105] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-32(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -44(%rbp)

/* t107 = t108 * t109 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-40(%rbp), %eax
movl	-44(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -36(%rbp)

/* resultat = resultat + t107 */
movl	-12(%rbp), %eax
movl	-36(%rbp), %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* i = i + 1 */
movl	-16(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* if i >= n then goto e40 */
movl	-16(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e40
/* goto e68 */
jmp	e68
/* e40: skip */
e40:
/* return resultat */
movl	-12(%rbp), %eax
movl	%eax, 28(%rbp)
addq	$40, %rsp
pop	%rbp
ret
/* goto e65 */
jmp	e65
/* e43: skip */
e43:
/* preamble e43 */
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

/* t116 = 1 */
movq	$1, -32(%rbp)
/* t116 = t116 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	24(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -32(%rbp)

/* t114 = t116 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t114 = t114 + 4 */
movq	-24(%rbp), %rax
movl	$4, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t113 = malloc t114 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t113[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* increment t113 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v = t113 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -44(%rbp)
/* if i >= n then goto e48 */
movl	-44(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e48
/* e69: skip */
e69:
/* t125 = i */
movl	-44(%rbp), %eax
movl	%eax, -48(%rbp)

/* t128 = t125 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-48(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -52(%rbp)

/* t128 = t128 + 4 */
movl	-52(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -52(%rbp)

/* t131 = i */
movl	-44(%rbp), %eax
movl	%eax, -56(%rbp)

/* t134 = t131 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-56(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -60(%rbp)

/* t134 = t134 + 4 */
movl	-60(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -60(%rbp)

/* t137 = i */
movl	-44(%rbp), %eax
movl	%eax, -64(%rbp)

/* t140 = t137 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-64(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t140 = t140 + 4 */
movl	-68(%rbp), %eax
movl	$4, %edx
addl	%edx, %eax
movl	%eax, -68(%rbp)

/* t143 = v1[t134] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-60(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -76(%rbp)

/* t144 = v2[t140] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-68(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -80(%rbp)

/* t142 = t143 + t144 */
movl	-76(%rbp), %eax
movl	-80(%rbp), %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* v[t128] = t142 */
movl	-72(%rbp), %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* i = i + 1 */
movl	-44(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* if i >= n then goto e48 */
movl	-44(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e48
/* goto e69 */
jmp	e69
/* e48: skip */
e48:
/* return v */
movq	-40(%rbp), %rax
movq	%rax, 28(%rbp)
addq	$72, %rsp
pop	%rbp
ret
/* goto e65 */
jmp	e65
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$192, %rsp
lea	-52(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-68(%rbp), %rax
movq	%rax, -68(%rbp)

lea	-76(%rbp), %rax
movq	%rax, -76(%rbp)

lea	-84(%rbp), %rax
movq	%rax, -84(%rbp)

lea	-92(%rbp), %rax
movq	%rax, -92(%rbp)

lea	-115(%rbp), %rax
movq	%rax, -100(%rbp)

lea	-138(%rbp), %rax
movq	%rax, -123(%rbp)

lea	-162(%rbp), %rax
movq	%rax, -146(%rbp)

lea	-189(%rbp), %rax
movq	%rax, -174(%rbp)

lea	-197(%rbp), %rax
movq	%rax, -197(%rbp)

/*  */
subq	$8, %rsp

/* t145[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t145[4] = 73 */
movb	$73, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t145[5] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t145[6] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t145[7] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t145[8] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t145[9] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t145[10] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t145[11] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t145[12] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t145[13] = 120 */
movb	$120, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t145[14] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t145[15] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t145[16] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t145[17] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t145[18] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t145[19] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t145[20] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t145[21] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t145[22] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t145[23] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t145[24] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t145[25] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t145[26] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t145[27] = 118 */
movb	$118, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t145[28] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t145[29] = 99 */
movb	$99, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t145[30] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t145[31] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t145[32] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t145[33] = 58 */
movb	$58, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t145[34] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t145[35] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* put param t145 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t145 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t145 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* n = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -60(%rbp)
addq	$8, %rsp
/*  */
subq	$16, %rsp

/* put param n */
movl	-60(%rbp), %eax
movl	%eax, 0(%rsp)
/* v1 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -76(%rbp)
addq	$16, %rsp
/*  */
subq	$16, %rsp

/* put param n */
movl	-60(%rbp), %eax
movl	%eax, 0(%rsp)
/* v2 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -92(%rbp)
addq	$16, %rsp
/*  */
subq	$8, %rsp

/* t218[0] = 1 */
movl	$1, %ecx
movq	-100(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t218[4] = 86 */
movb	$86, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t218[5] = 101 */
movb	$101, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t218[6] = 99 */
movb	$99, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t218[7] = 116 */
movb	$116, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t218[8] = 111 */
movb	$111, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t218[9] = 114 */
movb	$114, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t218[10] = 32 */
movb	$32, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t218[11] = 49 */
movb	$49, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t218[12] = 58 */
movb	$58, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t218[13] = 32 */
movb	$32, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t218[14] = 0 */
movb	$0, %cl
movq	-100(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* put param t218 */
movq	-100(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t218 */
movq	-100(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t218 */
movq	-100(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param v1 */
movq	-76(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v1 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-60(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e21 */
call 	e21
addq	$16, %rsp
/* decrement v1 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t243[0] = 1 */
movl	$1, %ecx
movq	-123(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t243[4] = 86 */
movb	$86, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t243[5] = 101 */
movb	$101, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t243[6] = 99 */
movb	$99, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t243[7] = 116 */
movb	$116, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t243[8] = 111 */
movb	$111, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t243[9] = 114 */
movb	$114, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t243[10] = 32 */
movb	$32, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t243[11] = 50 */
movb	$50, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t243[12] = 58 */
movb	$58, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t243[13] = 32 */
movb	$32, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t243[14] = 0 */
movb	$0, %cl
movq	-123(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* put param t243 */
movq	-123(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t243 */
movq	-123(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t243 */
movq	-123(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param v2 */
movq	-92(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v2 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-60(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e21 */
call 	e21
addq	$16, %rsp
/* decrement v2 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/* t268[0] = 1 */
movl	$1, %ecx
movq	-146(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t268[4] = 118 */
movb	$118, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t268[5] = 49 */
movb	$49, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t268[6] = 32 */
movb	$32, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t268[7] = -62 */
movb	$-62, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t268[8] = -73 */
movb	$-73, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t268[9] = 32 */
movb	$32, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t268[10] = 118 */
movb	$118, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t268[11] = 50 */
movb	$50, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t268[12] = 32 */
movb	$32, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t268[13] = 61 */
movb	$61, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t268[14] = 32 */
movb	$32, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t268[15] = 0 */
movb	$0, %cl
movq	-146(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* put param t268 */
movq	-146(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t268 */
movq	-146(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t268 */
movq	-146(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$8, %rsp

/*  */
subq	$24, %rsp

/* put param v1 */
movq	-76(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v1 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param v2 */
movq	-92(%rbp), %rax
movq	%rax, 8(%rsp)
/* increment v2 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-60(%rbp), %eax
movl	%eax, 16(%rsp)
/* t295 = call e35 */
call 	e35
movl	20(%rsp), %eax
movl	%eax, -166(%rbp)
addq	$24, %rsp
/* decrement v1 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v2 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* put param t295 */
movl	-166(%rbp), %eax
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
/*  */
subq	$8, %rsp

/* t297[0] = 1 */
movl	$1, %ecx
movq	-174(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t297[4] = 118 */
movb	$118, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t297[5] = 49 */
movb	$49, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t297[6] = 32 */
movb	$32, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t297[7] = 43 */
movb	$43, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t297[8] = 32 */
movb	$32, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t297[9] = 118 */
movb	$118, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t297[10] = 50 */
movb	$50, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t297[11] = 32 */
movb	$32, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t297[12] = 61 */
movb	$61, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t297[13] = 32 */
movb	$32, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t297[14] = 0 */
movb	$0, %cl
movq	-174(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* put param t297 */
movq	-174(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t297 */
movq	-174(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t297 */
movq	-174(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/*  */
subq	$32, %rsp

/* put param v1 */
movq	-76(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v1 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param v2 */
movq	-92(%rbp), %rax
movq	%rax, 8(%rsp)
/* increment v2 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-60(%rbp), %eax
movl	%eax, 16(%rsp)
/* t322 = call e43 */
call 	e43
movq	20(%rsp), %rax
movq	%rax, -197(%rbp)
addq	$32, %rsp
/* decrement v1 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v2 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* put param t322 */
movq	-197(%rbp), %rax
movq	%rax, 0(%rsp)
/* put param n */
movl	-60(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e21 */
call 	e21
addq	$16, %rsp
/* decrement t322 */
movq	-197(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v1 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v2 */
movq	-92(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$192, %rsp
pop	%rbp
ret
/* e65: skip */
e65:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

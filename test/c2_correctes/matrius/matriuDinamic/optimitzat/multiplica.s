.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e74 */
jmp	e74
/* e10: skip */
e10:
/* preamble e10 */
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

lea	-104(%rbp), %rax
movq	%rax, -104(%rbp)

/* t12 = 1 */
movq	$1, -32(%rbp)
/* t280 = t12 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -104(%rbp)

/* t12 = t280 */
movq	-104(%rbp), %rax
movq	%rax, -32(%rbp)

/* t280 = t12 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -104(%rbp)

/* t12 = t280 */
movq	-104(%rbp), %rax
movq	%rax, -32(%rbp)

/* t10 = t12 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t10 = t10 + 8 */
movq	-24(%rbp), %rax
movl	$8, %edx
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

/* t9[0] = n */
movl	8(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t9[4] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* increment t9 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* matriu = t9 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -48(%rbp)
/* if i >= n then goto e24 */
movl	-48(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e24
/* e75: skip */
e75:
/* j = 0 */
movl	$0, -52(%rbp)
/* if j >= n then goto e23 */
movl	-52(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e23
/* e76: skip */
e76:
/* if i != j then goto e19 */
movl	-48(%rbp), %eax
movl	-52(%rbp), %edx
cmpl	%eax, %edx
jne	e19
/* t26 = j */
movl	-52(%rbp), %eax
movl	%eax, -56(%rbp)

/* t27 = 1 */
movl	$1, -60(%rbp)
/* t29 = matriu[0] */
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -64(%rbp)

/* t27 = t27 * t29 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-60(%rbp), %eax
movl	-64(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -60(%rbp)

/* t30 = t27 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-60(%rbp), %eax
movl	-48(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -68(%rbp)

/* t26 = t26 + t30 */
movl	-56(%rbp), %eax
movl	-68(%rbp), %edx
addl	%edx, %eax
movl	%eax, -56(%rbp)

/* t32 = t26 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-56(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -72(%rbp)

/* t32 = t32 + 8 */
movl	-72(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -72(%rbp)

/* matriu[t32] = 1 */
movl	$1, %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-72(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* goto e21 */
jmp	e21
/* e19: skip */
e19:
/* t36 = j */
movl	-52(%rbp), %eax
movl	%eax, -76(%rbp)

/* t37 = 1 */
movl	$1, -80(%rbp)
/* t39 = matriu[0] */
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -84(%rbp)

/* t37 = t37 * t39 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-80(%rbp), %eax
movl	-84(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -80(%rbp)

/* t40 = t37 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-80(%rbp), %eax
movl	-48(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -88(%rbp)

/* t36 = t36 + t40 */
movl	-76(%rbp), %eax
movl	-88(%rbp), %edx
addl	%edx, %eax
movl	%eax, -76(%rbp)

/* t42 = t36 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-76(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -92(%rbp)

/* t42 = t42 + 8 */
movl	-92(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -92(%rbp)

/* matriu[t42] = 0 */
movl	$0, %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-92(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e21: skip */
e21:
/* j = j + 1 */
movl	-52(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -52(%rbp)

/* if j >= n then goto e23 */
movl	-52(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e23
/* goto e76 */
jmp	e76
/* e23: skip */
e23:
/* i = i + 1 */
movl	-48(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* if i >= n then goto e24 */
movl	-48(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jle	e24
/* goto e75 */
jmp	e75
/* e24: skip */
e24:
/* return matriu */
movq	-40(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$96, %rsp
pop	%rbp
ret
/* goto e74 */
jmp	e74
/* e27: skip */
e27:
/* preamble e27 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$64, %rsp
lea	-36(%rbp), %rax
movq	%rax, -16(%rbp)

/*  */
subq	$8, %rsp

/* t49[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t49[4] = 80 */
movb	$80, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t49[5] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t49[6] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t49[7] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t49[8] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t49[9] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t49[10] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t49[11] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t49[12] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t49[13] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t49[14] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t49[15] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t49[16] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t49[17] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t49[18] = 10 */
movb	$10, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t49[19] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* put param t49 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t49 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t49 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* i = 0 */
movl	$0, -40(%rbp)
/* if i >= n then goto e37 */
movl	-40(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e37
/* e77: skip */
e77:
/* j = 0 */
movl	$0, -44(%rbp)
/* if j >= n then goto e35 */
movl	-44(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e35
/* e78: skip */
e78:
/*  */
subq	$8, %rsp

/* t91 = j */
movl	-44(%rbp), %eax
movl	%eax, -48(%rbp)

/* t92 = 1 */
movl	$1, -52(%rbp)
/* t94 = matriu[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -56(%rbp)

/* t92 = t92 * t94 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-52(%rbp), %eax
movl	-56(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -52(%rbp)

/* t95 = t92 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-52(%rbp), %eax
movl	-40(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -60(%rbp)

/* t91 = t91 + t95 */
movl	-48(%rbp), %eax
movl	-60(%rbp), %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* t97 = t91 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-48(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t97 = t97 + 8 */
movl	-64(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -64(%rbp)

/* t99 = matriu[t97] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -68(%rbp)

/* put param t99 */
movl	-68(%rbp), %eax
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

/* if j >= n then goto e35 */
movl	-44(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e35
/* goto e78 */
jmp	e78
/* e35: skip */
e35:
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

/* if i >= n then goto e37 */
movl	-40(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e37
/* goto e77 */
jmp	e77
/* e37: skip */
e37:
/* return */
addq	$64, %rsp
pop	%rbp
ret
/* goto e74 */
jmp	e74
/* e39: skip */
e39:
/* preamble e39 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$128, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-136(%rbp), %rax
movq	%rax, -136(%rbp)

/* t108 = 1 */
movq	$1, -32(%rbp)
/* t281 = t108 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	24(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -136(%rbp)

/* t108 = t281 */
movq	-136(%rbp), %rax
movq	%rax, -32(%rbp)

/* t281 = t108 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movl	24(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -136(%rbp)

/* t108 = t281 */
movq	-136(%rbp), %rax
movq	%rax, -32(%rbp)

/* t106 = t108 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-32(%rbp), %rax
movq	$4, %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t106 = t106 + 8 */
movq	-24(%rbp), %rax
movl	$8, %edx
addq	%rdx, %rax
movq	%rax, -24(%rbp)

/* t105 = malloc t106 */
movq	-24(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -16(%rbp)
pop	%rax

/* t105[0] = n */
movl	24(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t105[4] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 4(%rax)
/* increment t105 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* resultat = t105 */
movq	-16(%rbp), %rax
movq	%rax, -40(%rbp)

/* i = 0 */
movl	$0, -44(%rbp)
/* if i >= n then goto e52 */
movl	-44(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e52
/* e79: skip */
e79:
/* j = 0 */
movl	$0, -48(%rbp)
/* if j >= n then goto e51 */
movl	-48(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e51
/* e80: skip */
e80:
/* suma = 0 */
movl	$0, -52(%rbp)
/* k = 0 */
movl	$0, -56(%rbp)
/* if k >= n then goto e49 */
movl	-56(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e49
/* e81: skip */
e81:
/* t126 = k */
movl	-56(%rbp), %eax
movl	%eax, -60(%rbp)

/* t127 = 1 */
movl	$1, -64(%rbp)
/* t129 = a[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -68(%rbp)

/* t127 = t127 * t129 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-64(%rbp), %eax
movl	-68(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -64(%rbp)

/* t130 = t127 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-64(%rbp), %eax
movl	-44(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -72(%rbp)

/* t126 = t126 + t130 */
movl	-60(%rbp), %eax
movl	-72(%rbp), %edx
addl	%edx, %eax
movl	%eax, -60(%rbp)

/* t132 = t126 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-60(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -76(%rbp)

/* t132 = t132 + 8 */
movl	-76(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -76(%rbp)

/* t135 = j */
movl	-48(%rbp), %eax
movl	%eax, -80(%rbp)

/* t136 = 1 */
movl	$1, -84(%rbp)
/* t138 = b[0] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -88(%rbp)

/* t136 = t136 * t138 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-84(%rbp), %eax
movl	-88(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -84(%rbp)

/* t139 = t136 * k */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-84(%rbp), %eax
movl	-56(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -92(%rbp)

/* t135 = t135 + t139 */
movl	-80(%rbp), %eax
movl	-92(%rbp), %edx
addl	%edx, %eax
movl	%eax, -80(%rbp)

/* t141 = t135 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-80(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -96(%rbp)

/* t141 = t141 + 8 */
movl	-96(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -96(%rbp)

/* t144 = a[t132] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-76(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -104(%rbp)

/* t145 = b[t141] */
movq	16(%rbp), %rax
movq	$0, %rbx
movl	-96(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -108(%rbp)

/* t143 = t144 * t145 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-104(%rbp), %eax
movl	-108(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -100(%rbp)

/* suma = suma + t143 */
movl	-52(%rbp), %eax
movl	-100(%rbp), %edx
addl	%edx, %eax
movl	%eax, -52(%rbp)

/* k = k + 1 */
movl	-56(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -56(%rbp)

/* if k >= n then goto e49 */
movl	-56(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e49
/* goto e81 */
jmp	e81
/* e49: skip */
e49:
/* t147 = j */
movl	-48(%rbp), %eax
movl	%eax, -112(%rbp)

/* t148 = 1 */
movl	$1, -116(%rbp)
/* t150 = resultat[0] */
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -120(%rbp)

/* t148 = t148 * t150 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-116(%rbp), %eax
movl	-120(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -116(%rbp)

/* t151 = t148 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-116(%rbp), %eax
movl	-44(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -124(%rbp)

/* t147 = t147 + t151 */
movl	-112(%rbp), %eax
movl	-124(%rbp), %edx
addl	%edx, %eax
movl	%eax, -112(%rbp)

/* t153 = t147 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-112(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -128(%rbp)

/* t153 = t153 + 8 */
movl	-128(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -128(%rbp)

/* resultat[t153] = suma */
movl	-52(%rbp), %ecx
movq	-40(%rbp), %rax
movq	$0, %rbx
movl	-128(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* j = j + 1 */
movl	-48(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -48(%rbp)

/* if j >= n then goto e51 */
movl	-48(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e51
/* goto e80 */
jmp	e80
/* e51: skip */
e51:
/* i = i + 1 */
movl	-44(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -44(%rbp)

/* if i >= n then goto e52 */
movl	-44(%rbp), %eax
movl	24(%rbp), %edx
cmpl	%eax, %edx
jle	e52
/* goto e79 */
jmp	e79
/* e52: skip */
e52:
/* return resultat */
movq	-40(%rbp), %rax
movq	%rax, 28(%rbp)
addq	$128, %rsp
pop	%rbp
ret
/* goto e74 */
jmp	e74
/* e55: skip */
e55:
/* preamble e55 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$32, %rsp
/* i = 0 */
movl	$0, -12(%rbp)
/* if i >= n then goto e62 */
movl	-12(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e62
/* e82: skip */
e82:
/* j = 0 */
movl	$0, -16(%rbp)
/* if j >= n then goto e61 */
movl	-16(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e61
/* e83: skip */
e83:
/* t164 = j */
movl	-16(%rbp), %eax
movl	%eax, -20(%rbp)

/* t165 = 1 */
movl	$1, -24(%rbp)
/* t167 = a[0] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	0(%rax), %eax
movl	%eax, -28(%rbp)

/* t165 = t165 * t167 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-24(%rbp), %eax
movl	-28(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -24(%rbp)

/* t168 = t165 * i */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-24(%rbp), %eax
movl	-12(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -32(%rbp)

/* t164 = t164 + t168 */
movl	-20(%rbp), %eax
movl	-32(%rbp), %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/* t170 = t164 * 4 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-20(%rbp), %eax
movl	$4, %edx
imul	%rdx, %rax
movl	%eax, -36(%rbp)

/* t170 = t170 + 8 */
movl	-36(%rbp), %eax
movl	$8, %edx
addl	%edx, %eax
movl	%eax, -36(%rbp)

/*  */
subq	$16, %rsp

/* put param 0 */
movl	$0, %eax
movl	%eax, 0(%rsp)
/* put param 9 */
movl	$9, %eax
movl	%eax, 4(%rsp)
/* t174 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -40(%rbp)
addq	$16, %rsp
/* a[t170] = t174 */
movl	-40(%rbp), %ecx
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-36(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* j = j + 1 */
movl	-16(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* if j >= n then goto e61 */
movl	-16(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e61
/* goto e83 */
jmp	e83
/* e61: skip */
e61:
/* i = i + 1 */
movl	-12(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -12(%rbp)

/* if i >= n then goto e62 */
movl	-12(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jle	e62
/* goto e82 */
jmp	e82
/* e62: skip */
e62:
/* return */
addq	$32, %rsp
pop	%rbp
ret
/* goto e74 */
jmp	e74
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$112, %rsp
lea	-67(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-75(%rbp), %rax
movq	%rax, -75(%rbp)

lea	-83(%rbp), %rax
movq	%rax, -83(%rbp)

lea	-91(%rbp), %rax
movq	%rax, -91(%rbp)

lea	-99(%rbp), %rax
movq	%rax, -99(%rbp)

lea	-107(%rbp), %rax
movq	%rax, -107(%rbp)

lea	-115(%rbp), %rax
movq	%rax, -115(%rbp)

/*  */
subq	$8, %rsp

/* t175[0] = 1 */
movl	$1, %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t175[4] = 73 */
movb	$73, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t175[5] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t175[6] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t175[7] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t175[8] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t175[9] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t175[10] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t175[11] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t175[12] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t175[13] = 120 */
movb	$120, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t175[14] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t175[15] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t175[16] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t175[17] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t175[18] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t175[19] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t175[20] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t175[21] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t175[22] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* t175[23] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 23(%rax)
/* t175[24] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 24(%rax)
/* t175[25] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 25(%rax)
/* t175[26] = 111 */
movb	$111, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 26(%rax)
/* t175[27] = 110 */
movb	$110, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 27(%rax)
/* t175[28] = 115 */
movb	$115, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 28(%rax)
/* t175[29] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 29(%rax)
/* t175[30] = 100 */
movb	$100, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 30(%rax)
/* t175[31] = 101 */
movb	$101, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 31(%rax)
/* t175[32] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 32(%rax)
/* t175[33] = 108 */
movb	$108, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 33(%rax)
/* t175[34] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 34(%rax)
/* t175[35] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 35(%rax)
/* t175[36] = 109 */
movb	$109, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 36(%rax)
/* t175[37] = 97 */
movb	$97, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 37(%rax)
/* t175[38] = 116 */
movb	$116, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 38(%rax)
/* t175[39] = 114 */
movb	$114, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 39(%rax)
/* t175[40] = 105 */
movb	$105, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 40(%rax)
/* t175[41] = 117 */
movb	$117, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 41(%rax)
/* t175[42] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 42(%rax)
/* t175[43] = 40 */
movb	$40, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 43(%rax)
/* t175[44] = 78 */
movb	$78, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 44(%rax)
/* t175[45] = 120 */
movb	$120, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 45(%rax)
/* t175[46] = 78 */
movb	$78, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 46(%rax)
/* t175[47] = 41 */
movb	$41, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 47(%rax)
/* t175[48] = 58 */
movb	$58, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 48(%rax)
/* t175[49] = 32 */
movb	$32, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 49(%rax)
/* t175[50] = 0 */
movb	$0, %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movb	%cl, 50(%rax)
/* put param t175 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t175 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t175 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param 500 */
movl	$500, %eax
movl	%eax, 0(%rsp)
/* i = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -83(%rbp)
addq	$16, %rsp
/*  */
subq	$16, %rsp

/* put param i */
movq	-83(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i */
movq	-83(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 500 */
movl	$500, %eax
movl	%eax, 8(%rsp)
/* call e27 */
call 	e27
addq	$16, %rsp
/* decrement i */
movq	-83(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param 500 */
movl	$500, %eax
movl	%eax, 0(%rsp)
/* i2 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -99(%rbp)
addq	$16, %rsp
/*  */
subq	$16, %rsp

/* put param i2 */
movq	-99(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i2 */
movq	-99(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 500 */
movl	$500, %eax
movl	%eax, 8(%rsp)
/* call e55 */
call 	e55
addq	$16, %rsp
/* decrement i2 */
movq	-99(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param i2 */
movq	-99(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i2 */
movq	-99(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 500 */
movl	$500, %eax
movl	%eax, 8(%rsp)
/* call e27 */
call 	e27
addq	$16, %rsp
/* decrement i2 */
movq	-99(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$32, %rsp

/* put param i */
movq	-83(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment i */
movq	-83(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param i2 */
movq	-99(%rbp), %rax
movq	%rax, 8(%rsp)
/* increment i2 */
movq	-99(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 500 */
movl	$500, %eax
movl	%eax, 16(%rsp)
/* resultat = call e39 */
call 	e39
movq	20(%rsp), %rax
movq	%rax, -115(%rbp)
addq	$32, %rsp
/* decrement i */
movq	-83(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement i2 */
movq	-99(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/*  */
subq	$16, %rsp

/* put param resultat */
movq	-115(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment resultat */
movq	-115(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param 500 */
movl	$500, %eax
movl	%eax, 8(%rsp)
/* call e27 */
call 	e27
addq	$16, %rsp
/* decrement resultat */
movq	-115(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement i */
movq	-83(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement i2 */
movq	-99(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement resultat */
movq	-115(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$112, %rsp
pop	%rbp
ret
/* e74: skip */
e74:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

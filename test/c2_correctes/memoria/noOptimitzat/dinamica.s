.global _start
.bss
	var1:	.fill	1, 1, 0
	var2:	.fill	1, 1, 0
	var8:	.fill	4, 1, 0
	var9_data:	.fill	0, 1, 0
	var10_data:	.fill	0, 1, 0
	var11_data:	.fill	0, 1, 0
	var12_data:	.fill	0, 1, 0
	var13:	.fill	4, 1, 0
	var14:	.fill	4, 1, 0
	var15:	.fill	4, 1, 0
	var16_data:	.fill	0, 1, 0
.data
	var9:	.quad	var9_data
	var10:	.quad	var10_data
	var11:	.quad	var11_data
	var12:	.quad	var12_data
	var16:	.quad	var16_data
.text
_start:
call	jada_init
/* trueConst = true */
movb	$1, var1
/* falseConst = false */
movb	$0, var2
/* t8 = 5 */
movl	$5, var8
/* t11 = 4 */
movq	$4, var11
/* t12 = 1 */
movq	$1, var12
/* t12 = t12 * t8 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	var12, %rax
movl	var8, %edx
imul	%rdx, %rax
movq	%rax, var12

/* t10 = t12 * t11 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	var12, %rax
movq	var11, %rdx
imul	%rdx, %rax
movq	%rax, var10

/* t13 = 4 */
movl	$4, var13
/* t10 = t10 + t13 */
movq	var10, %rax
movl	var13, %edx
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

/* t14 = 0 */
movl	$0, var14
/* t15 = 1 */
movl	$1, var15
/* t9[t14] = t15 */
movl	var15, %ecx
movq	var9, %rax
movq	$0, %rbx
movl	var14, %ebx
movl	%ecx, (%rax, %rbx)
/* increment t9 */
movq	var9, %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* VECTOR_GLOBAL = t9 */
movq	var9, %rax
movq	%rax, var16

/* goto e17 */
jmp	e17
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$104, %rsp
lea	-16(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-60(%rbp), %rax
movq	%rax, -60(%rbp)

/* t20 = 4 */
movq	$4, -32(%rbp)
/* t21 = 1 */
movq	$1, -40(%rbp)
/* t21 = t21 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t19 = t21 * t20 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movq	-32(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t22 = 4 */
movl	$4, -44(%rbp)
/* t19 = t19 + t22 */
movq	-24(%rbp), %rax
movl	-44(%rbp), %edx
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

/* t23 = 0 */
movl	$0, -48(%rbp)
/* t24 = 1 */
movl	$1, -52(%rbp)
/* t18[t23] = t24 */
movl	-52(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t18 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v = t18 */
movq	-16(%rbp), %rax
movq	%rax, -60(%rbp)

/* e11: skip */
e11:
/* t26 = 0 */
movl	$0, -64(%rbp)
/* i = t26 */
movl	-64(%rbp), %eax
movl	%eax, -68(%rbp)

/* e12: skip */
e12:
/* if i < n then goto e13 */
movl	-68(%rbp), %eax
movl	8(%rbp), %edx
cmpl	%eax, %edx
jg	e13
/* goto e15 */
jmp	e15
/* e13: skip */
e13:
/* t29 = 4 */
movl	$4, -76(%rbp)
/* t30 = i */
movl	-68(%rbp), %eax
movl	%eax, -80(%rbp)

/* t31 = 1 */
movl	$1, -84(%rbp)
/* t32 = 4 */
movl	$4, -88(%rbp)
/* t33 = t30 * t32 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-80(%rbp), %eax
movl	-88(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -92(%rbp)

/* t34 = 4 */
movl	$4, -96(%rbp)
/* t33 = t33 + t34 */
movl	-92(%rbp), %eax
movl	-96(%rbp), %edx
addl	%edx, %eax
movl	%eax, -92(%rbp)

/*  */
subq	$16, %rsp

/* t35 = 1 */
movl	$1, -100(%rbp)
/* t36 = 100 */
movl	$100, -104(%rbp)
/* put param t35 */
movl	-100(%rbp), %eax
movl	%eax, 0(%rsp)
/* put param t36 */
movl	-104(%rbp), %eax
movl	%eax, 4(%rsp)
/* t37 = call randInt */
call 	randInt
movl	8(%rsp), %eax
movl	%eax, -108(%rbp)
addq	$16, %rsp
/* v[t33] = t37 */
movl	-108(%rbp), %ecx
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-92(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e14: skip */
e14:
/* t28 = 1 */
movl	$1, -72(%rbp)
/* i = i + t28 */
movl	-68(%rbp), %eax
movl	-72(%rbp), %edx
addl	%edx, %eax
movl	%eax, -68(%rbp)

/* goto e12 */
jmp	e12
/* e15: skip */
e15:
/* return v */
movq	-60(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$104, %rsp
pop	%rbp
ret
/* e16: skip */
e16:
/* decrement v */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$104, %rsp
pop	%rbp
ret
/* e17: skip */
e17:
/* goto e25 */
jmp	e25
/* e18: skip */
e18:
/* preamble e18 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$48, %rsp
/* t40 = 0 */
movl	$0, -12(%rbp)
/* i = t40 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e19: skip */
e19:
/* if i < n then goto e20 */
movl	-16(%rbp), %eax
movl	16(%rbp), %edx
cmpl	%eax, %edx
jg	e20
/* goto e23 */
jmp	e23
/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* t43 = 4 */
movl	$4, -24(%rbp)
/* t44 = i */
movl	-16(%rbp), %eax
movl	%eax, -28(%rbp)

/* t45 = 1 */
movl	$1, -32(%rbp)
/* t46 = 4 */
movl	$4, -36(%rbp)
/* t47 = t44 * t46 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-28(%rbp), %eax
movl	-36(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -40(%rbp)

/* t48 = 4 */
movl	$4, -44(%rbp)
/* t47 = t47 + t48 */
movl	-40(%rbp), %eax
movl	-44(%rbp), %edx
addl	%edx, %eax
movl	%eax, -40(%rbp)

/* t49 = v[t47] */
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-40(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -48(%rbp)

/* put param t49 */
movl	-48(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* t50 =   */
movb	$32, -49(%rbp)
/* put param t50 */
movb	-49(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e22: skip */
e22:
/* t42 = 1 */
movl	$1, -20(%rbp)
/* i = i + t42 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e19 */
jmp	e19
/* e23: skip */
e23:
/*  */
subq	$8, %rsp

/* t51 = 
 */
movb	$10, -50(%rbp)
/* put param t51 */
movb	-50(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e24: skip */
e24:
/* return */
addq	$48, %rsp
pop	%rbp
ret
/* e25: skip */
e25:
/* goto e49 */
jmp	e49
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$880, %rsp
lea	-24(%rbp), %rax
movq	%rax, -24(%rbp)

lea	-32(%rbp), %rax
movq	%rax, -32(%rbp)

lea	-40(%rbp), %rax
movq	%rax, -40(%rbp)

lea	-48(%rbp), %rax
movq	%rax, -48(%rbp)

lea	-68(%rbp), %rax
movq	%rax, -68(%rbp)

lea	-84(%rbp), %rax
movq	%rax, -84(%rbp)

lea	-92(%rbp), %rax
movq	%rax, -92(%rbp)

lea	-100(%rbp), %rax
movq	%rax, -100(%rbp)

lea	-108(%rbp), %rax
movq	%rax, -108(%rbp)

lea	-128(%rbp), %rax
movq	%rax, -128(%rbp)

lea	-236(%rbp), %rax
movq	%rax, -236(%rbp)

lea	-244(%rbp), %rax
movq	%rax, -244(%rbp)

lea	-252(%rbp), %rax
movq	%rax, -252(%rbp)

lea	-260(%rbp), %rax
movq	%rax, -260(%rbp)

lea	-280(%rbp), %rax
movq	%rax, -280(%rbp)

lea	-357(%rbp), %rax
movq	%rax, -320(%rbp)

lea	-567(%rbp), %rax
movq	%rax, -538(%rbp)

lea	-708(%rbp), %rax
movq	%rax, -708(%rbp)

lea	-716(%rbp), %rax
movq	%rax, -716(%rbp)

lea	-724(%rbp), %rax
movq	%rax, -724(%rbp)

lea	-732(%rbp), %rax
movq	%rax, -732(%rbp)

lea	-740(%rbp), %rax
movq	%rax, -740(%rbp)

lea	-748(%rbp), %rax
movq	%rax, -748(%rbp)

lea	-768(%rbp), %rax
movq	%rax, -768(%rbp)

lea	-808(%rbp), %rax
movq	%rax, -808(%rbp)

lea	-816(%rbp), %rax
movq	%rax, -816(%rbp)

lea	-824(%rbp), %rax
movq	%rax, -824(%rbp)

lea	-832(%rbp), %rax
movq	%rax, -832(%rbp)

lea	-852(%rbp), %rax
movq	%rax, -852(%rbp)

lea	-860(%rbp), %rax
movq	%rax, -860(%rbp)

lea	-868(%rbp), %rax
movq	%rax, -868(%rbp)

lea	-876(%rbp), %rax
movq	%rax, -876(%rbp)

/* t52 = 5 */
movl	$5, -12(%rbp)
/* n = t52 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e27: skip */
e27:
/* t56 = 4 */
movq	$4, -40(%rbp)
/* t57 = 1 */
movq	$1, -48(%rbp)
/* t57 = t57 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-48(%rbp), %rax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -48(%rbp)

/* t55 = t57 * t56 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-48(%rbp), %rax
movq	-40(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -32(%rbp)

/* t58 = 4 */
movl	$4, -52(%rbp)
/* t55 = t55 + t58 */
movq	-32(%rbp), %rax
movl	-52(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -32(%rbp)

/* t54 = malloc t55 */
movq	-32(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -24(%rbp)
pop	%rax

/* t59 = 0 */
movl	$0, -56(%rbp)
/* t60 = 1 */
movl	$1, -60(%rbp)
/* t54[t59] = t60 */
movl	-60(%rbp), %ecx
movq	-24(%rbp), %rax
movq	$0, %rbx
movl	-56(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t54 */
movq	-24(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v = t54 */
movq	-24(%rbp), %rax
movq	%rax, -68(%rbp)

/* e28: skip */
e28:
/* t62 = 30 */
movl	$30, -72(%rbp)
/* V2_1 = t62 */
movl	-72(%rbp), %eax
movl	%eax, -76(%rbp)

/* e29: skip */
e29:
/* if trueConst == trueConst then goto e30 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e30
/* goto e35 */
jmp	e35
/* e30: skip */
e30:
/* t66 = 4 */
movq	$4, -100(%rbp)
/* t67 = 1 */
movq	$1, -108(%rbp)
/* t67 = t67 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-108(%rbp), %rax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -108(%rbp)

/* t65 = t67 * t66 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-108(%rbp), %rax
movq	-100(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -92(%rbp)

/* t68 = 4 */
movl	$4, -112(%rbp)
/* t65 = t65 + t68 */
movq	-92(%rbp), %rax
movl	-112(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -92(%rbp)

/* t64 = malloc t65 */
movq	-92(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -84(%rbp)
pop	%rax

/* t69 = 0 */
movl	$0, -116(%rbp)
/* t70 = 1 */
movl	$1, -120(%rbp)
/* t64[t69] = t70 */
movl	-120(%rbp), %ecx
movq	-84(%rbp), %rax
movq	$0, %rbx
movl	-116(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t64 */
movq	-84(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v2 = t64 */
movq	-84(%rbp), %rax
movq	%rax, -128(%rbp)

/* e31: skip */
e31:
/* t72 = 0 */
movl	$0, -132(%rbp)
/* t73 = 4 */
movl	$4, -136(%rbp)
/* t74 = t72 */
movl	-132(%rbp), %eax
movl	%eax, -140(%rbp)

/* t75 = 1 */
movl	$1, -144(%rbp)
/* t76 = 4 */
movl	$4, -148(%rbp)
/* t77 = t74 * t76 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-140(%rbp), %eax
movl	-148(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -152(%rbp)

/* t78 = 4 */
movl	$4, -156(%rbp)
/* t77 = t77 + t78 */
movl	-152(%rbp), %eax
movl	-156(%rbp), %edx
addl	%edx, %eax
movl	%eax, -152(%rbp)

/* v2[t77] = V2_1 */
movl	-76(%rbp), %ecx
movq	-128(%rbp), %rax
movq	$0, %rbx
movl	-152(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e32: skip */
e32:
/* t79 = 1 */
movl	$1, -160(%rbp)
/* t80 = 4 */
movl	$4, -164(%rbp)
/* t81 = t79 */
movl	-160(%rbp), %eax
movl	%eax, -168(%rbp)

/* t82 = 1 */
movl	$1, -172(%rbp)
/* t83 = 4 */
movl	$4, -176(%rbp)
/* t84 = t81 * t83 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-168(%rbp), %eax
movl	-176(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -180(%rbp)

/* t85 = 4 */
movl	$4, -184(%rbp)
/* t84 = t84 + t85 */
movl	-180(%rbp), %eax
movl	-184(%rbp), %edx
addl	%edx, %eax
movl	%eax, -180(%rbp)

/* t86 = 4 */
movl	$4, -188(%rbp)
/* v2[t84] = t86 */
movl	-188(%rbp), %ecx
movq	-128(%rbp), %rax
movq	$0, %rbx
movl	-180(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e33: skip */
e33:
/* t87 = 2 */
movl	$2, -192(%rbp)
/* t88 = 4 */
movl	$4, -196(%rbp)
/* t89 = t87 */
movl	-192(%rbp), %eax
movl	%eax, -200(%rbp)

/* t90 = 1 */
movl	$1, -204(%rbp)
/* t91 = 4 */
movl	$4, -208(%rbp)
/* t92 = t89 * t91 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-200(%rbp), %eax
movl	-208(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -212(%rbp)

/* t93 = 4 */
movl	$4, -216(%rbp)
/* t92 = t92 + t93 */
movl	-212(%rbp), %eax
movl	-216(%rbp), %edx
addl	%edx, %eax
movl	%eax, -212(%rbp)

/* t94 = 99 */
movl	$99, -220(%rbp)
/* v2[t92] = t94 */
movl	-220(%rbp), %ecx
movq	-128(%rbp), %rax
movq	$0, %rbx
movl	-212(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e34: skip */
e34:
/* decrement v2 */
movq	-128(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e35 */
jmp	e35
/* e35: skip */
e35:
/* t95 = 1 */
movl	$1, -224(%rbp)
/* t96 = n - t95 */
movl	-16(%rbp), %eax
movl	-224(%rbp), %edx
subl	%edx, %eax
movl	%eax, -228(%rbp)

/* t99 = 4 */
movq	$4, -252(%rbp)
/* t100 = 1 */
movq	$1, -260(%rbp)
/* t100 = t100 * t96 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-260(%rbp), %rax
movl	-228(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -260(%rbp)

/* t98 = t100 * t99 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-260(%rbp), %rax
movq	-252(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -244(%rbp)

/* t101 = 4 */
movl	$4, -264(%rbp)
/* t98 = t98 + t101 */
movq	-244(%rbp), %rax
movl	-264(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -244(%rbp)

/* t97 = malloc t98 */
movq	-244(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -236(%rbp)
pop	%rax

/* t102 = 0 */
movl	$0, -268(%rbp)
/* t103 = 1 */
movl	$1, -272(%rbp)
/* t97[t102] = t103 */
movl	-272(%rbp), %ecx
movq	-236(%rbp), %rax
movq	$0, %rbx
movl	-268(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t97 */
movq	-236(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v3 = t97 */
movq	-236(%rbp), %rax
movq	%rax, -280(%rbp)

/* e36: skip */
e36:
/* t105 = 0 */
movl	$0, -284(%rbp)
/* t106 = 4 */
movl	$4, -288(%rbp)
/* t107 = t105 */
movl	-284(%rbp), %eax
movl	%eax, -292(%rbp)

/* t108 = 1 */
movl	$1, -296(%rbp)
/* t109 = 4 */
movl	$4, -300(%rbp)
/* t110 = t107 * t109 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-292(%rbp), %eax
movl	-300(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -304(%rbp)

/* t111 = 4 */
movl	$4, -308(%rbp)
/* t110 = t110 + t111 */
movl	-304(%rbp), %eax
movl	-308(%rbp), %edx
addl	%edx, %eax
movl	%eax, -304(%rbp)

/* t112 = v3[t110] */
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-304(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -312(%rbp)

/* if t112 == V2_1 then goto e37 */
movl	-312(%rbp), %eax
movl	-76(%rbp), %edx
cmpl	%eax, %edx
je	e37
/* goto e39 */
jmp	e39
/* e37: skip */
e37:
/*  */
subq	$8, %rsp

/* t114 = 1 */
movl	$1, -361(%rbp)
/* t115 = 0 */
movl	$0, -365(%rbp)
/* t113[t115] = t114 */
movl	-361(%rbp), %ecx
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-365(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t116 = v */
movb	$118, -366(%rbp)
/* t117 = 4 */
movl	$4, -370(%rbp)
/* t113[t117] = t116 */
movb	-366(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-370(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t118 = 3 */
movb	$51, -371(%rbp)
/* t119 = 5 */
movl	$5, -375(%rbp)
/* t113[t119] = t118 */
movb	-371(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-375(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t120 =   */
movb	$32, -376(%rbp)
/* t121 = 6 */
movl	$6, -380(%rbp)
/* t113[t121] = t120 */
movb	-376(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-380(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t122 = o */
movb	$111, -381(%rbp)
/* t123 = 7 */
movl	$7, -385(%rbp)
/* t113[t123] = t122 */
movb	-381(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-385(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t124 = c */
movb	$99, -386(%rbp)
/* t125 = 8 */
movl	$8, -390(%rbp)
/* t113[t125] = t124 */
movb	-386(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-390(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t126 = u */
movb	$117, -391(%rbp)
/* t127 = 9 */
movl	$9, -395(%rbp)
/* t113[t127] = t126 */
movb	-391(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-395(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t128 = p */
movb	$112, -396(%rbp)
/* t129 = 10 */
movl	$10, -400(%rbp)
/* t113[t129] = t128 */
movb	-396(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-400(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t130 = a */
movb	$97, -401(%rbp)
/* t131 = 11 */
movl	$11, -405(%rbp)
/* t113[t131] = t130 */
movb	-401(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-405(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t132 =   */
movb	$32, -406(%rbp)
/* t133 = 12 */
movl	$12, -410(%rbp)
/* t113[t133] = t132 */
movb	-406(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-410(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t134 = e */
movb	$101, -411(%rbp)
/* t135 = 13 */
movl	$13, -415(%rbp)
/* t113[t135] = t134 */
movb	-411(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-415(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t136 = l */
movb	$108, -416(%rbp)
/* t137 = 14 */
movl	$14, -420(%rbp)
/* t113[t137] = t136 */
movb	-416(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-420(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t138 =   */
movb	$32, -421(%rbp)
/* t139 = 15 */
movl	$15, -425(%rbp)
/* t113[t139] = t138 */
movb	-421(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-425(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t140 = m */
movb	$109, -426(%rbp)
/* t141 = 16 */
movl	$16, -430(%rbp)
/* t113[t141] = t140 */
movb	-426(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-430(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t142 = a */
movb	$97, -431(%rbp)
/* t143 = 17 */
movl	$17, -435(%rbp)
/* t113[t143] = t142 */
movb	-431(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-435(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t144 = t */
movb	$116, -436(%rbp)
/* t145 = 18 */
movl	$18, -440(%rbp)
/* t113[t145] = t144 */
movb	-436(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-440(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t146 = e */
movb	$101, -441(%rbp)
/* t147 = 19 */
movl	$19, -445(%rbp)
/* t113[t147] = t146 */
movb	-441(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-445(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t148 = i */
movb	$105, -446(%rbp)
/* t149 = 20 */
movl	$20, -450(%rbp)
/* t113[t149] = t148 */
movb	-446(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-450(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t150 = x */
movb	$120, -451(%rbp)
/* t151 = 21 */
movl	$21, -455(%rbp)
/* t113[t151] = t150 */
movb	-451(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-455(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t152 =   */
movb	$32, -456(%rbp)
/* t153 = 22 */
movl	$22, -460(%rbp)
/* t113[t153] = t152 */
movb	-456(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-460(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t154 = e */
movb	$101, -461(%rbp)
/* t155 = 23 */
movl	$23, -465(%rbp)
/* t113[t155] = t154 */
movb	-461(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-465(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t156 = s */
movb	$115, -466(%rbp)
/* t157 = 24 */
movl	$24, -470(%rbp)
/* t113[t157] = t156 */
movb	-466(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-470(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t158 = p */
movb	$112, -471(%rbp)
/* t159 = 25 */
movl	$25, -475(%rbp)
/* t113[t159] = t158 */
movb	-471(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-475(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t160 = a */
movb	$97, -476(%rbp)
/* t161 = 26 */
movl	$26, -480(%rbp)
/* t113[t161] = t160 */
movb	-476(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-480(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t162 = i */
movb	$105, -481(%rbp)
/* t163 = 27 */
movl	$27, -485(%rbp)
/* t113[t163] = t162 */
movb	-481(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-485(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t164 =   */
movb	$32, -486(%rbp)
/* t165 = 28 */
movl	$28, -490(%rbp)
/* t113[t165] = t164 */
movb	-486(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-490(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t166 = q */
movb	$113, -491(%rbp)
/* t167 = 29 */
movl	$29, -495(%rbp)
/* t113[t167] = t166 */
movb	-491(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-495(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t168 = u */
movb	$117, -496(%rbp)
/* t169 = 30 */
movl	$30, -500(%rbp)
/* t113[t169] = t168 */
movb	-496(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-500(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t170 = e */
movb	$101, -501(%rbp)
/* t171 = 31 */
movl	$31, -505(%rbp)
/* t113[t171] = t170 */
movb	-501(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-505(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t172 =   */
movb	$32, -506(%rbp)
/* t173 = 32 */
movl	$32, -510(%rbp)
/* t113[t173] = t172 */
movb	-506(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-510(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t174 = v */
movb	$118, -511(%rbp)
/* t175 = 33 */
movl	$33, -515(%rbp)
/* t113[t175] = t174 */
movb	-511(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-515(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t176 = 2 */
movb	$50, -516(%rbp)
/* t177 = 34 */
movl	$34, -520(%rbp)
/* t113[t177] = t176 */
movb	-516(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-520(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t178 = 
 */
movb	$10, -521(%rbp)
/* t179 = 35 */
movl	$35, -525(%rbp)
/* t113[t179] = t178 */
movb	-521(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-525(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t180 =   */
movb	$0, -526(%rbp)
/* t181 = 36 */
movl	$36, -530(%rbp)
/* t113[t181] = t180 */
movb	-526(%rbp), %cl
movq	-320(%rbp), %rax
movq	$0, %rbx
movl	-530(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t113 */
movq	-320(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t113 */
movq	-320(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t113 */
movq	-320(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e38: skip */
e38:
/* goto e41 */
jmp	e41
/* e39: skip */
e39:
/*  */
subq	$8, %rsp

/* t183 = 1 */
movl	$1, -571(%rbp)
/* t184 = 0 */
movl	$0, -575(%rbp)
/* t182[t184] = t183 */
movl	-571(%rbp), %ecx
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-575(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t185 = v */
movb	$118, -576(%rbp)
/* t186 = 4 */
movl	$4, -580(%rbp)
/* t182[t186] = t185 */
movb	-576(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-580(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t187 = 3 */
movb	$51, -581(%rbp)
/* t188 = 5 */
movl	$5, -585(%rbp)
/* t182[t188] = t187 */
movb	-581(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-585(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t189 =   */
movb	$32, -586(%rbp)
/* t190 = 6 */
movl	$6, -590(%rbp)
/* t182[t190] = t189 */
movb	-586(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-590(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t191 = Ã */
movb	$-61, -591(%rbp)
/* t192 = 7 */
movl	$7, -595(%rbp)
/* t182[t192] = t191 */
movb	-591(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-595(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t193 = © */
movb	$-87, -596(%rbp)
/* t194 = 8 */
movl	$8, -600(%rbp)
/* t182[t194] = t193 */
movb	-596(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-600(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t195 = s */
movb	$115, -601(%rbp)
/* t196 = 9 */
movl	$9, -605(%rbp)
/* t182[t196] = t195 */
movb	-601(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-605(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t197 =   */
movb	$32, -606(%rbp)
/* t198 = 10 */
movl	$10, -610(%rbp)
/* t182[t198] = t197 */
movb	-606(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-610(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t199 = u */
movb	$117, -611(%rbp)
/* t200 = 11 */
movl	$11, -615(%rbp)
/* t182[t200] = t199 */
movb	-611(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-615(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t201 = n */
movb	$110, -616(%rbp)
/* t202 = 12 */
movl	$12, -620(%rbp)
/* t182[t202] = t201 */
movb	-616(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-620(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t203 =   */
movb	$32, -621(%rbp)
/* t204 = 13 */
movl	$13, -625(%rbp)
/* t182[t204] = t203 */
movb	-621(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-625(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t205 = b */
movb	$98, -626(%rbp)
/* t206 = 14 */
movl	$14, -630(%rbp)
/* t182[t206] = t205 */
movb	-626(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-630(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t207 = l */
movb	$108, -631(%rbp)
/* t208 = 15 */
movl	$15, -635(%rbp)
/* t182[t208] = t207 */
movb	-631(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-635(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t209 = o */
movb	$111, -636(%rbp)
/* t210 = 16 */
movl	$16, -640(%rbp)
/* t182[t210] = t209 */
movb	-636(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-640(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t211 = c */
movb	$99, -641(%rbp)
/* t212 = 17 */
movl	$17, -645(%rbp)
/* t182[t212] = t211 */
movb	-641(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-645(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t213 =   */
movb	$32, -646(%rbp)
/* t214 = 18 */
movl	$18, -650(%rbp)
/* t182[t214] = t213 */
movb	-646(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-650(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t215 = d */
movb	$100, -651(%rbp)
/* t216 = 19 */
movl	$19, -655(%rbp)
/* t182[t216] = t215 */
movb	-651(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-655(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t217 = i */
movb	$105, -656(%rbp)
/* t218 = 20 */
movl	$20, -660(%rbp)
/* t182[t218] = t217 */
movb	-656(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-660(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t219 = f */
movb	$102, -661(%rbp)
/* t220 = 21 */
movl	$21, -665(%rbp)
/* t182[t220] = t219 */
movb	-661(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-665(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t221 = e */
movb	$101, -666(%rbp)
/* t222 = 22 */
movl	$22, -670(%rbp)
/* t182[t222] = t221 */
movb	-666(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-670(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t223 = r */
movb	$114, -671(%rbp)
/* t224 = 23 */
movl	$23, -675(%rbp)
/* t182[t224] = t223 */
movb	-671(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-675(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t225 = e */
movb	$101, -676(%rbp)
/* t226 = 24 */
movl	$24, -680(%rbp)
/* t182[t226] = t225 */
movb	-676(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-680(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t227 = n */
movb	$110, -681(%rbp)
/* t228 = 25 */
movl	$25, -685(%rbp)
/* t182[t228] = t227 */
movb	-681(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-685(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t229 = t */
movb	$116, -686(%rbp)
/* t230 = 26 */
movl	$26, -690(%rbp)
/* t182[t230] = t229 */
movb	-686(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-690(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t231 = 
 */
movb	$10, -691(%rbp)
/* t232 = 27 */
movl	$27, -695(%rbp)
/* t182[t232] = t231 */
movb	-691(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-695(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t233 =   */
movb	$0, -696(%rbp)
/* t234 = 28 */
movl	$28, -700(%rbp)
/* t182[t234] = t233 */
movb	-696(%rbp), %cl
movq	-538(%rbp), %rax
movq	$0, %rbx
movl	-700(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t182 */
movq	-538(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t182 */
movq	-538(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t182 */
movq	-538(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e40: skip */
e40:
/* e41: skip */
e41:
/*  */
subq	$16, %rsp

/* put param n */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* t235 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -708(%rbp)
addq	$16, %rsp
/* v4 = t235 */
movq	-708(%rbp), %rax
movq	%rax, -716(%rbp)

/* e42: skip */
e42:
/* t239 = 4 */
movq	$4, -740(%rbp)
/* t240 = 1 */
movq	$1, -748(%rbp)
/* t240 = t240 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-748(%rbp), %rax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -748(%rbp)

/* t238 = t240 * t239 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-748(%rbp), %rax
movq	-740(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -732(%rbp)

/* t241 = 4 */
movl	$4, -752(%rbp)
/* t238 = t238 + t241 */
movq	-732(%rbp), %rax
movl	-752(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -732(%rbp)

/* t237 = malloc t238 */
movq	-732(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -724(%rbp)
pop	%rax

/* t242 = 0 */
movl	$0, -756(%rbp)
/* t243 = 1 */
movl	$1, -760(%rbp)
/* t237[t242] = t243 */
movl	-760(%rbp), %ecx
movq	-724(%rbp), %rax
movq	$0, %rbx
movl	-756(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t237 */
movq	-724(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v5 = t237 */
movq	-724(%rbp), %rax
movq	%rax, -768(%rbp)

/* e43: skip */
e43:
/* t245 = 0 */
movl	$0, -772(%rbp)
/* t246 = 4 */
movl	$4, -776(%rbp)
/* t247 = t245 */
movl	-772(%rbp), %eax
movl	%eax, -780(%rbp)

/* t248 = 1 */
movl	$1, -784(%rbp)
/* t249 = 4 */
movl	$4, -788(%rbp)
/* t250 = t247 * t249 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-780(%rbp), %eax
movl	-788(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -792(%rbp)

/* t251 = 4 */
movl	$4, -796(%rbp)
/* t250 = t250 + t251 */
movl	-792(%rbp), %eax
movl	-796(%rbp), %edx
addl	%edx, %eax
movl	%eax, -792(%rbp)

/* t252 = 909 */
movl	$909, -800(%rbp)
/* v5[t250] = t252 */
movl	-800(%rbp), %ecx
movq	-768(%rbp), %rax
movq	$0, %rbx
movl	-792(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e44: skip */
e44:
/*  */
subq	$16, %rsp

/* put param v4 */
movq	-716(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v4 */
movq	-716(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-16(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e18 */
call 	e18
addq	$16, %rsp
/* decrement v4 */
movq	-716(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e45: skip */
e45:
/*  */
subq	$16, %rsp

/* put param v5 */
movq	-768(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment v5 */
movq	-768(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-16(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e18 */
call 	e18
addq	$16, %rsp
/* decrement v5 */
movq	-768(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e46: skip */
e46:
/* t255 = 4 */
movq	$4, -824(%rbp)
/* t256 = 1 */
movq	$1, -832(%rbp)
/* t256 = t256 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-832(%rbp), %rax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -832(%rbp)

/* t254 = t256 * t255 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-832(%rbp), %rax
movq	-824(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -816(%rbp)

/* t257 = 4 */
movl	$4, -836(%rbp)
/* t254 = t254 + t257 */
movq	-816(%rbp), %rax
movl	-836(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -816(%rbp)

/* t253 = malloc t254 */
movq	-816(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -808(%rbp)
pop	%rax

/* t258 = 0 */
movl	$0, -840(%rbp)
/* t259 = 1 */
movl	$1, -844(%rbp)
/* t253[t258] = t259 */
movl	-844(%rbp), %ecx
movq	-808(%rbp), %rax
movq	$0, %rbx
movl	-840(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* decrement v5 */
movq	-768(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* increment t253 */
movq	-808(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v5 = t253 */
movq	-808(%rbp), %rax
movq	%rax, -768(%rbp)

/* e47: skip */
e47:
/*  */
subq	$16, %rsp

/* t262 = 4 */
movq	$4, -868(%rbp)
/* t263 = 1 */
movq	$1, -876(%rbp)
/* t263 = t263 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-876(%rbp), %rax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -876(%rbp)

/* t261 = t263 * t262 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-876(%rbp), %rax
movq	-868(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -860(%rbp)

/* t264 = 4 */
movl	$4, -880(%rbp)
/* t261 = t261 + t264 */
movq	-860(%rbp), %rax
movl	-880(%rbp), %edx
addq	%rdx, %rax
movq	%rax, -860(%rbp)

/* t260 = malloc t261 */
movq	-860(%rbp), %rax
push	%rax
push	%rax
call	jada_malloc
pop	%rax
movq	%rax, -852(%rbp)
pop	%rax

/* t265 = 0 */
movl	$0, -884(%rbp)
/* t266 = 1 */
movl	$1, -888(%rbp)
/* t260[t265] = t266 */
movl	-888(%rbp), %ecx
movq	-852(%rbp), %rax
movq	$0, %rbx
movl	-884(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* put param t260 */
movq	-852(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t260 */
movq	-852(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* put param n */
movl	-16(%rbp), %eax
movl	%eax, 8(%rsp)
/* call e18 */
call 	e18
addq	$16, %rsp
/* decrement t260 */
movq	-852(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e48: skip */
e48:
/* decrement v */
movq	-68(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v3 */
movq	-280(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v4 */
movq	-716(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* decrement v5 */
movq	-768(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$880, %rsp
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

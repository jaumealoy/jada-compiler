.global _start
.bss
	var1:	.fill	1, 1, 0
	var2:	.fill	1, 1, 0
.data
.text
_start:
call	jada_init
/* trueConst = true */
movb	$1, var1
/* falseConst = false */
movb	$0, var2
/* goto e39 */
jmp	e39
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$240, %rsp
lea	-36(%rbp), %rax
movq	%rax, -28(%rbp)

lea	-80(%rbp), %rax
movq	%rax, -72(%rbp)

lea	-165(%rbp), %rax
movq	%rax, -157(%rbp)

lea	-209(%rbp), %rax
movq	%rax, -201(%rbp)

/* t9 = 1 */
movl	$1, -12(%rbp)
/* i = t9 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e11: skip */
e11:
/* e12: skip */
e12:
/* t11 = 10 */
movl	$10, -20(%rbp)
/* if i <= t11 then goto e13 */
movl	-16(%rbp), %eax
movl	-20(%rbp), %edx
cmpl	%eax, %edx
jge	e13
/* goto e21 */
jmp	e21
/* e13: skip */
e13:
/*  */
subq	$8, %rsp

/* put param n */
movl	8(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e14: skip */
e14:
/*  */
subq	$8, %rsp

/* t13 = 1 */
movl	$1, -40(%rbp)
/* t14 = 0 */
movl	$0, -44(%rbp)
/* t12[t14] = t13 */
movl	-40(%rbp), %ecx
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-44(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t15 =   */
movb	$32, -45(%rbp)
/* t16 = 4 */
movl	$4, -49(%rbp)
/* t12[t16] = t15 */
movb	-45(%rbp), %cl
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-49(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t17 = x */
movb	$120, -50(%rbp)
/* t18 = 5 */
movl	$5, -54(%rbp)
/* t12[t18] = t17 */
movb	-50(%rbp), %cl
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-54(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t19 =   */
movb	$32, -55(%rbp)
/* t20 = 6 */
movl	$6, -59(%rbp)
/* t12[t20] = t19 */
movb	-55(%rbp), %cl
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-59(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t21 =   */
movb	$0, -60(%rbp)
/* t22 = 7 */
movl	$7, -64(%rbp)
/* t12[t22] = t21 */
movb	-60(%rbp), %cl
movq	-28(%rbp), %rax
movq	$0, %rbx
movl	-64(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t12 */
movq	-28(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t12 */
movq	-28(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t12 */
movq	-28(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e15: skip */
e15:
/*  */
subq	$8, %rsp

/* put param i */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e16: skip */
e16:
/*  */
subq	$8, %rsp

/* t24 = 1 */
movl	$1, -84(%rbp)
/* t25 = 0 */
movl	$0, -88(%rbp)
/* t23[t25] = t24 */
movl	-84(%rbp), %ecx
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-88(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t26 =   */
movb	$32, -89(%rbp)
/* t27 = 4 */
movl	$4, -93(%rbp)
/* t23[t27] = t26 */
movb	-89(%rbp), %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-93(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t28 = = */
movb	$61, -94(%rbp)
/* t29 = 5 */
movl	$5, -98(%rbp)
/* t23[t29] = t28 */
movb	-94(%rbp), %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-98(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t30 =   */
movb	$32, -99(%rbp)
/* t31 = 6 */
movl	$6, -103(%rbp)
/* t23[t31] = t30 */
movb	-99(%rbp), %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-103(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t32 =   */
movb	$0, -104(%rbp)
/* t33 = 7 */
movl	$7, -108(%rbp)
/* t23[t33] = t32 */
movb	-104(%rbp), %cl
movq	-72(%rbp), %rax
movq	$0, %rbx
movl	-108(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t23 */
movq	-72(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t23 */
movq	-72(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t23 */
movq	-72(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e17: skip */
e17:
/*  */
subq	$8, %rsp

/* t34 = i * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	8(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -112(%rbp)

/* put param t34 */
movl	-112(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e18: skip */
e18:
/*  */
subq	$8, %rsp

/* t35 = 
 */
movb	$10, -113(%rbp)
/* put param t35 */
movb	-113(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e19: skip */
e19:
/* t36 = 1 */
movl	$1, -117(%rbp)
/* i = i + t36 */
movl	-16(%rbp), %eax
movl	-117(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* e20: skip */
e20:
/* goto e12 */
jmp	e12
/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* t37 = 
 */
movb	$10, -118(%rbp)
/* put param t37 */
movb	-118(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e22: skip */
e22:
/* t38 = 0 */
movl	$0, -122(%rbp)
/* i = t38 */
movl	-122(%rbp), %eax
movl	%eax, -126(%rbp)

/* e23: skip */
e23:
/* t40 = 10 */
movl	$10, -130(%rbp)
/* if i < t40 then goto e24 */
movl	-126(%rbp), %eax
movl	-130(%rbp), %edx
cmpl	%eax, %edx
jg	e24
/* goto e26 */
jmp	e26
/* e24: skip */
e24:
/*  */
subq	$8, %rsp

/* t42 = = */
movb	$61, -135(%rbp)
/* put param t42 */
movb	-135(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e25: skip */
e25:
/* t41 = 1 */
movl	$1, -134(%rbp)
/* i = i + t41 */
movl	-126(%rbp), %eax
movl	-134(%rbp), %edx
addl	%edx, %eax
movl	%eax, -126(%rbp)

/* goto e23 */
jmp	e23
/* e26: skip */
e26:
/*  */
subq	$8, %rsp

/* t43 = 
 */
movb	$10, -136(%rbp)
/* put param t43 */
movb	-136(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e27: skip */
e27:
/*  */
subq	$8, %rsp

/* t44 = 
 */
movb	$10, -137(%rbp)
/* put param t44 */
movb	-137(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e28: skip */
e28:
/* t45 = 0 */
movl	$0, -141(%rbp)
/* i = t45 */
movl	-141(%rbp), %eax
movl	%eax, -16(%rbp)

/* e29: skip */
e29:
/* e30: skip */
e30:
/* t46 = 10 */
movl	$10, -145(%rbp)
/* if i <= t46 then goto e31 */
movl	-16(%rbp), %eax
movl	-145(%rbp), %edx
cmpl	%eax, %edx
jge	e31
/* goto e38 */
jmp	e38
/* e31: skip */
e31:
/*  */
subq	$8, %rsp

/* put param n */
movl	8(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e32: skip */
e32:
/*  */
subq	$8, %rsp

/* t49 = 1 */
movl	$1, -169(%rbp)
/* t50 = 0 */
movl	$0, -173(%rbp)
/* t48[t50] = t49 */
movl	-169(%rbp), %ecx
movq	-157(%rbp), %rax
movq	$0, %rbx
movl	-173(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t51 =   */
movb	$32, -174(%rbp)
/* t52 = 4 */
movl	$4, -178(%rbp)
/* t48[t52] = t51 */
movb	-174(%rbp), %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movl	-178(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t53 = x */
movb	$120, -179(%rbp)
/* t54 = 5 */
movl	$5, -183(%rbp)
/* t48[t54] = t53 */
movb	-179(%rbp), %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movl	-183(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t55 =   */
movb	$32, -184(%rbp)
/* t56 = 6 */
movl	$6, -188(%rbp)
/* t48[t56] = t55 */
movb	-184(%rbp), %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movl	-188(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 =   */
movb	$0, -189(%rbp)
/* t58 = 7 */
movl	$7, -193(%rbp)
/* t48[t58] = t57 */
movb	-189(%rbp), %cl
movq	-157(%rbp), %rax
movq	$0, %rbx
movl	-193(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t48 */
movq	-157(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t48 */
movq	-157(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t48 */
movq	-157(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e33: skip */
e33:
/*  */
subq	$8, %rsp

/* put param i */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e34: skip */
e34:
/*  */
subq	$8, %rsp

/* t60 = 1 */
movl	$1, -213(%rbp)
/* t61 = 0 */
movl	$0, -217(%rbp)
/* t59[t61] = t60 */
movl	-213(%rbp), %ecx
movq	-201(%rbp), %rax
movq	$0, %rbx
movl	-217(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t62 =   */
movb	$32, -218(%rbp)
/* t63 = 4 */
movl	$4, -222(%rbp)
/* t59[t63] = t62 */
movb	-218(%rbp), %cl
movq	-201(%rbp), %rax
movq	$0, %rbx
movl	-222(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t64 = = */
movb	$61, -223(%rbp)
/* t65 = 5 */
movl	$5, -227(%rbp)
/* t59[t65] = t64 */
movb	-223(%rbp), %cl
movq	-201(%rbp), %rax
movq	$0, %rbx
movl	-227(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t66 =   */
movb	$32, -228(%rbp)
/* t67 = 6 */
movl	$6, -232(%rbp)
/* t59[t67] = t66 */
movb	-228(%rbp), %cl
movq	-201(%rbp), %rax
movq	$0, %rbx
movl	-232(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t68 =   */
movb	$0, -233(%rbp)
/* t69 = 7 */
movl	$7, -237(%rbp)
/* t59[t69] = t68 */
movb	-233(%rbp), %cl
movq	-201(%rbp), %rax
movq	$0, %rbx
movl	-237(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t59 */
movq	-201(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t59 */
movq	-201(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t59 */
movq	-201(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e35: skip */
e35:
/*  */
subq	$8, %rsp

/* t70 = i * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-16(%rbp), %eax
movl	8(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -241(%rbp)

/* put param t70 */
movl	-241(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e36: skip */
e36:
/*  */
subq	$8, %rsp

/* t71 = 
 */
movb	$10, -242(%rbp)
/* put param t71 */
movb	-242(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e37: skip */
e37:
/* t47 = 1 */
movl	$1, -149(%rbp)
/* i = i + t47 */
movl	-16(%rbp), %eax
movl	-149(%rbp), %edx
addl	%edx, %eax
movl	%eax, -16(%rbp)

/* goto e30 */
jmp	e30
/* e38: skip */
e38:
/* return */
addq	$240, %rsp
pop	%rbp
ret
/* e39: skip */
e39:
/* goto e45 */
jmp	e45
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$296, %rsp
lea	-63(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-294(%rbp), %rax
movq	%rax, -294(%rbp)

/* t73 = 1 */
movl	$1, -67(%rbp)
/* t74 = 0 */
movl	$0, -71(%rbp)
/* t72[t74] = t73 */
movl	-67(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-71(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t75 = Q */
movb	$81, -72(%rbp)
/* t76 = 4 */
movl	$4, -76(%rbp)
/* t72[t76] = t75 */
movb	-72(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-76(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t77 = u */
movb	$117, -77(%rbp)
/* t78 = 5 */
movl	$5, -81(%rbp)
/* t72[t78] = t77 */
movb	-77(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-81(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t79 = i */
movb	$105, -82(%rbp)
/* t80 = 6 */
movl	$6, -86(%rbp)
/* t72[t80] = t79 */
movb	-82(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-86(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t81 = n */
movb	$110, -87(%rbp)
/* t82 = 7 */
movl	$7, -91(%rbp)
/* t72[t82] = t81 */
movb	-87(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-91(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t83 = a */
movb	$97, -92(%rbp)
/* t84 = 8 */
movl	$8, -96(%rbp)
/* t72[t84] = t83 */
movb	-92(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-96(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t85 =   */
movb	$32, -97(%rbp)
/* t86 = 9 */
movl	$9, -101(%rbp)
/* t72[t86] = t85 */
movb	-97(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-101(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t87 = t */
movb	$116, -102(%rbp)
/* t88 = 10 */
movl	$10, -106(%rbp)
/* t72[t88] = t87 */
movb	-102(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-106(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t89 = a */
movb	$97, -107(%rbp)
/* t90 = 11 */
movl	$11, -111(%rbp)
/* t72[t90] = t89 */
movb	-107(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-111(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t91 = u */
movb	$117, -112(%rbp)
/* t92 = 12 */
movl	$12, -116(%rbp)
/* t72[t92] = t91 */
movb	-112(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-116(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t93 = l */
movb	$108, -117(%rbp)
/* t94 = 13 */
movl	$13, -121(%rbp)
/* t72[t94] = t93 */
movb	-117(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-121(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t95 = a */
movb	$97, -122(%rbp)
/* t96 = 14 */
movl	$14, -126(%rbp)
/* t72[t96] = t95 */
movb	-122(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-126(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t97 =   */
movb	$32, -127(%rbp)
/* t98 = 15 */
movl	$15, -131(%rbp)
/* t72[t98] = t97 */
movb	-127(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-131(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t99 = d */
movb	$100, -132(%rbp)
/* t100 = 16 */
movl	$16, -136(%rbp)
/* t72[t100] = t99 */
movb	-132(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-136(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t101 = e */
movb	$101, -137(%rbp)
/* t102 = 17 */
movl	$17, -141(%rbp)
/* t72[t102] = t101 */
movb	-137(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-141(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t103 =   */
movb	$32, -142(%rbp)
/* t104 = 18 */
movl	$18, -146(%rbp)
/* t72[t104] = t103 */
movb	-142(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-146(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t105 = m */
movb	$109, -147(%rbp)
/* t106 = 19 */
movl	$19, -151(%rbp)
/* t72[t106] = t105 */
movb	-147(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-151(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t107 = u */
movb	$117, -152(%rbp)
/* t108 = 20 */
movl	$20, -156(%rbp)
/* t72[t108] = t107 */
movb	-152(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-156(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t109 = l */
movb	$108, -157(%rbp)
/* t110 = 21 */
movl	$21, -161(%rbp)
/* t72[t110] = t109 */
movb	-157(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-161(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t111 = t */
movb	$116, -162(%rbp)
/* t112 = 22 */
movl	$22, -166(%rbp)
/* t72[t112] = t111 */
movb	-162(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-166(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t113 = i */
movb	$105, -167(%rbp)
/* t114 = 23 */
movl	$23, -171(%rbp)
/* t72[t114] = t113 */
movb	-167(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-171(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t115 = p */
movb	$112, -172(%rbp)
/* t116 = 24 */
movl	$24, -176(%rbp)
/* t72[t116] = t115 */
movb	-172(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-176(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t117 = l */
movb	$108, -177(%rbp)
/* t118 = 25 */
movl	$25, -181(%rbp)
/* t72[t118] = t117 */
movb	-177(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-181(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t119 = i */
movb	$105, -182(%rbp)
/* t120 = 26 */
movl	$26, -186(%rbp)
/* t72[t120] = t119 */
movb	-182(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-186(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t121 = c */
movb	$99, -187(%rbp)
/* t122 = 27 */
movl	$27, -191(%rbp)
/* t72[t122] = t121 */
movb	-187(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-191(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t123 = a */
movb	$97, -192(%rbp)
/* t124 = 28 */
movl	$28, -196(%rbp)
/* t72[t124] = t123 */
movb	-192(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-196(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t125 = r */
movb	$114, -197(%rbp)
/* t126 = 29 */
movl	$29, -201(%rbp)
/* t72[t126] = t125 */
movb	-197(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-201(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t127 =   */
movb	$32, -202(%rbp)
/* t128 = 30 */
movl	$30, -206(%rbp)
/* t72[t128] = t127 */
movb	-202(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-206(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t129 = v */
movb	$118, -207(%rbp)
/* t130 = 31 */
movl	$31, -211(%rbp)
/* t72[t130] = t129 */
movb	-207(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-211(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t131 = o */
movb	$111, -212(%rbp)
/* t132 = 32 */
movl	$32, -216(%rbp)
/* t72[t132] = t131 */
movb	-212(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-216(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t133 = l */
movb	$108, -217(%rbp)
/* t134 = 33 */
movl	$33, -221(%rbp)
/* t72[t134] = t133 */
movb	-217(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-221(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t135 = s */
movb	$115, -222(%rbp)
/* t136 = 34 */
movl	$34, -226(%rbp)
/* t72[t136] = t135 */
movb	-222(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-226(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t137 =   */
movb	$32, -227(%rbp)
/* t138 = 35 */
movl	$35, -231(%rbp)
/* t72[t138] = t137 */
movb	-227(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-231(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t139 = a */
movb	$97, -232(%rbp)
/* t140 = 36 */
movl	$36, -236(%rbp)
/* t72[t140] = t139 */
movb	-232(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-236(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t141 = p */
movb	$112, -237(%rbp)
/* t142 = 37 */
movl	$37, -241(%rbp)
/* t72[t142] = t141 */
movb	-237(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-241(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t143 = r */
movb	$114, -242(%rbp)
/* t144 = 38 */
movl	$38, -246(%rbp)
/* t72[t144] = t143 */
movb	-242(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-246(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t145 = e */
movb	$101, -247(%rbp)
/* t146 = 39 */
movl	$39, -251(%rbp)
/* t72[t146] = t145 */
movb	-247(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-251(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t147 = n */
movb	$110, -252(%rbp)
/* t148 = 40 */
movl	$40, -256(%rbp)
/* t72[t148] = t147 */
movb	-252(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-256(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t149 = d */
movb	$100, -257(%rbp)
/* t150 = 41 */
movl	$41, -261(%rbp)
/* t72[t150] = t149 */
movb	-257(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-261(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t151 = r */
movb	$114, -262(%rbp)
/* t152 = 42 */
movl	$42, -266(%rbp)
/* t72[t152] = t151 */
movb	-262(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-266(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t153 = e */
movb	$101, -267(%rbp)
/* t154 = 43 */
movl	$43, -271(%rbp)
/* t72[t154] = t153 */
movb	-267(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-271(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t155 = ? */
movb	$63, -272(%rbp)
/* t156 = 44 */
movl	$44, -276(%rbp)
/* t72[t156] = t155 */
movb	-272(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-276(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t157 =   */
movb	$32, -277(%rbp)
/* t158 = 45 */
movl	$45, -281(%rbp)
/* t72[t158] = t157 */
movb	-277(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-281(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t159 =   */
movb	$0, -282(%rbp)
/* t160 = 46 */
movl	$46, -286(%rbp)
/* t72[t160] = t159 */
movb	-282(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-286(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* increment t72 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* str = t72 */
movq	-16(%rbp), %rax
movq	%rax, -294(%rbp)

/* e41: skip */
e41:
/*  */
subq	$8, %rsp

/* put param str */
movq	-294(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment str */
movq	-294(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement str */
movq	-294(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e42: skip */
e42:
/*  */
subq	$8, %rsp

/* t162 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -298(%rbp)
addq	$8, %rsp
/* n = t162 */
movl	-298(%rbp), %eax
movl	%eax, -302(%rbp)

/* e43: skip */
e43:
/*  */
subq	$8, %rsp

/* put param n */
movl	-302(%rbp), %eax
movl	%eax, 0(%rsp)
/* call e10 */
call 	e10
addq	$8, %rsp
/* e44: skip */
e44:
/* decrement str */
movq	-294(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$296, %rsp
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

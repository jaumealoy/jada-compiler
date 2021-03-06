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
/* goto e26 */
jmp	e26
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$376, %rsp
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

lea	-94(%rbp), %rax
movq	%rax, -76(%rbp)

lea	-212(%rbp), %rax
movq	%rax, -185(%rbp)

/* t11 = 4 */
movq	$4, -32(%rbp)
/* t12 = 1 */
movq	$1, -40(%rbp)
/* t12 = t12 * n */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movl	8(%rbp), %edx
imul	%rdx, %rax
movq	%rax, -40(%rbp)

/* t10 = t12 * t11 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movq	-40(%rbp), %rax
movq	-32(%rbp), %rdx
imul	%rdx, %rax
movq	%rax, -24(%rbp)

/* t13 = 4 */
movl	$4, -44(%rbp)
/* t10 = t10 + t13 */
movq	-24(%rbp), %rax
movl	-44(%rbp), %edx
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

/* t14 = 0 */
movl	$0, -48(%rbp)
/* t15 = 1 */
movl	$1, -52(%rbp)
/* t9[t14] = t15 */
movl	-52(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-48(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* increment t9 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* v = t9 */
movq	-16(%rbp), %rax
movq	%rax, -60(%rbp)

/* e11: skip */
e11:
/* t17 = 0 */
movl	$0, -64(%rbp)
/* i = t17 */
movl	-64(%rbp), %eax
movl	%eax, -68(%rbp)

/* e12: skip */
e12:
/*  */
subq	$8, %rsp

/* t20 = 1 */
movl	$1, -98(%rbp)
/* t21 = 0 */
movl	$0, -102(%rbp)
/* t19[t21] = t20 */
movl	-98(%rbp), %ecx
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-102(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t22 = V */
movb	$86, -103(%rbp)
/* t23 = 4 */
movl	$4, -107(%rbp)
/* t19[t23] = t22 */
movb	-103(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-107(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t24 = o */
movb	$111, -108(%rbp)
/* t25 = 5 */
movl	$5, -112(%rbp)
/* t19[t25] = t24 */
movb	-108(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-112(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t26 = l */
movb	$108, -113(%rbp)
/* t27 = 6 */
movl	$6, -117(%rbp)
/* t19[t27] = t26 */
movb	-113(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-117(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t28 = s */
movb	$115, -118(%rbp)
/* t29 = 7 */
movl	$7, -122(%rbp)
/* t19[t29] = t28 */
movb	-118(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-122(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t30 =   */
movb	$32, -123(%rbp)
/* t31 = 8 */
movl	$8, -127(%rbp)
/* t19[t31] = t30 */
movb	-123(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-127(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t32 = c */
movb	$99, -128(%rbp)
/* t33 = 9 */
movl	$9, -132(%rbp)
/* t19[t33] = t32 */
movb	-128(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-132(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t34 = o */
movb	$111, -133(%rbp)
/* t35 = 10 */
movl	$10, -137(%rbp)
/* t19[t35] = t34 */
movb	-133(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-137(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t36 = m */
movb	$109, -138(%rbp)
/* t37 = 11 */
movl	$11, -142(%rbp)
/* t19[t37] = t36 */
movb	-138(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-142(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t38 = p */
movb	$112, -143(%rbp)
/* t39 = 12 */
movl	$12, -147(%rbp)
/* t19[t39] = t38 */
movb	-143(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-147(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t40 = t */
movb	$116, -148(%rbp)
/* t41 = 13 */
movl	$13, -152(%rbp)
/* t19[t41] = t40 */
movb	-148(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-152(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t42 = a */
movb	$97, -153(%rbp)
/* t43 = 14 */
movl	$14, -157(%rbp)
/* t19[t43] = t42 */
movb	-153(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-157(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t44 = r */
movb	$114, -158(%rbp)
/* t45 = 15 */
movl	$15, -162(%rbp)
/* t19[t45] = t44 */
movb	-158(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-162(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t46 =   */
movb	$32, -163(%rbp)
/* t47 = 16 */
movl	$16, -167(%rbp)
/* t19[t47] = t46 */
movb	-163(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-167(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t48 =   */
movb	$0, -168(%rbp)
/* t49 = 17 */
movl	$17, -172(%rbp)
/* t19[t49] = t48 */
movb	-168(%rbp), %cl
movq	-76(%rbp), %rax
movq	$0, %rbx
movl	-172(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t19 */
movq	-76(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t19 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t19 */
movq	-76(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

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

/* t50 = 
 */
movb	$10, -173(%rbp)
/* put param t50 */
movb	-173(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e15: skip */
e15:
/* e16: skip */
e16:
/* t51 = 0 */
movl	$0, -177(%rbp)
/* if n > t51 then goto e17 */
movl	8(%rbp), %eax
movl	-177(%rbp), %edx
cmpl	%eax, %edx
jl	e17
/* goto e24 */
jmp	e24
/* e17: skip */
e17:
/*  */
subq	$8, %rsp

/* t53 = 1 */
movl	$1, -216(%rbp)
/* t54 = 0 */
movl	$0, -220(%rbp)
/* t52[t54] = t53 */
movl	-216(%rbp), %ecx
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-220(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t55 = I */
movb	$73, -221(%rbp)
/* t56 = 4 */
movl	$4, -225(%rbp)
/* t52[t56] = t55 */
movb	-221(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-225(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 = n */
movb	$110, -226(%rbp)
/* t58 = 5 */
movl	$5, -230(%rbp)
/* t52[t58] = t57 */
movb	-226(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-230(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t59 = t */
movb	$116, -231(%rbp)
/* t60 = 6 */
movl	$6, -235(%rbp)
/* t52[t60] = t59 */
movb	-231(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-235(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t61 = r */
movb	$114, -236(%rbp)
/* t62 = 7 */
movl	$7, -240(%rbp)
/* t52[t62] = t61 */
movb	-236(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-240(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t63 = o */
movb	$111, -241(%rbp)
/* t64 = 8 */
movl	$8, -245(%rbp)
/* t52[t64] = t63 */
movb	-241(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-245(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t65 = d */
movb	$100, -246(%rbp)
/* t66 = 9 */
movl	$9, -250(%rbp)
/* t52[t66] = t65 */
movb	-246(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-250(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t67 = u */
movb	$117, -251(%rbp)
/* t68 = 10 */
movl	$10, -255(%rbp)
/* t52[t68] = t67 */
movb	-251(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-255(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t69 = e */
movb	$101, -256(%rbp)
/* t70 = 11 */
movl	$11, -260(%rbp)
/* t52[t70] = t69 */
movb	-256(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-260(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t71 = i */
movb	$105, -261(%rbp)
/* t72 = 12 */
movl	$12, -265(%rbp)
/* t52[t72] = t71 */
movb	-261(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-265(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t73 = x */
movb	$120, -266(%rbp)
/* t74 = 13 */
movl	$13, -270(%rbp)
/* t52[t74] = t73 */
movb	-266(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-270(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t75 =   */
movb	$32, -271(%rbp)
/* t76 = 14 */
movl	$14, -275(%rbp)
/* t52[t76] = t75 */
movb	-271(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-275(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t77 = e */
movb	$101, -276(%rbp)
/* t78 = 15 */
movl	$15, -280(%rbp)
/* t52[t78] = t77 */
movb	-276(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-280(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t79 = l */
movb	$108, -281(%rbp)
/* t80 = 16 */
movl	$16, -285(%rbp)
/* t52[t80] = t79 */
movb	-281(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-285(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t81 =   */
movb	$32, -286(%rbp)
/* t82 = 17 */
movl	$17, -290(%rbp)
/* t52[t82] = t81 */
movb	-286(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-290(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t83 = n */
movb	$110, -291(%rbp)
/* t84 = 18 */
movl	$18, -295(%rbp)
/* t52[t84] = t83 */
movb	-291(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-295(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t85 = � */
movb	$-61, -296(%rbp)
/* t86 = 19 */
movl	$19, -300(%rbp)
/* t52[t86] = t85 */
movb	-296(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-300(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t87 = � */
movb	$-70, -301(%rbp)
/* t88 = 20 */
movl	$20, -305(%rbp)
/* t52[t88] = t87 */
movb	-301(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-305(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t89 = m */
movb	$109, -306(%rbp)
/* t90 = 21 */
movl	$21, -310(%rbp)
/* t52[t90] = t89 */
movb	-306(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-310(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t91 = e */
movb	$101, -311(%rbp)
/* t92 = 22 */
movl	$22, -315(%rbp)
/* t52[t92] = t91 */
movb	-311(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-315(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t93 = r */
movb	$114, -316(%rbp)
/* t94 = 23 */
movl	$23, -320(%rbp)
/* t52[t94] = t93 */
movb	-316(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-320(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t95 = o */
movb	$111, -321(%rbp)
/* t96 = 24 */
movl	$24, -325(%rbp)
/* t52[t96] = t95 */
movb	-321(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-325(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t97 =   */
movb	$32, -326(%rbp)
/* t98 = 25 */
movl	$25, -330(%rbp)
/* t52[t98] = t97 */
movb	-326(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-330(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t99 =   */
movb	$0, -331(%rbp)
/* t100 = 26 */
movl	$26, -335(%rbp)
/* t52[t100] = t99 */
movb	-331(%rbp), %cl
movq	-185(%rbp), %rax
movq	$0, %rbx
movl	-335(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t52 */
movq	-185(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t52 */
movq	-185(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t52 */
movq	-185(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e18: skip */
e18:
/*  */
subq	$8, %rsp

/* t101 = 1 */
movl	$1, -339(%rbp)
/* i = i + t101 */
movl	-68(%rbp), %eax
movl	-339(%rbp), %edx
addl	%edx, %eax
movl	%eax, -68(%rbp)

/* put param i */
movl	-68(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e19: skip */
e19:
/*  */
subq	$8, %rsp

/* t102 = : */
movb	$58, -340(%rbp)
/* put param t102 */
movb	-340(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* t103 =   */
movb	$32, -341(%rbp)
/* put param t103 */
movb	-341(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e21: skip */
e21:
/* t104 = 1 */
movl	$1, -345(%rbp)
/* t105 = i - t104 */
movl	-68(%rbp), %eax
movl	-345(%rbp), %edx
subl	%edx, %eax
movl	%eax, -349(%rbp)

/* t106 = 4 */
movl	$4, -353(%rbp)
/* t107 = t105 */
movl	-349(%rbp), %eax
movl	%eax, -357(%rbp)

/* t108 = 1 */
movl	$1, -361(%rbp)
/* t109 = 4 */
movl	$4, -365(%rbp)
/* t110 = t107 * t109 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-357(%rbp), %eax
movl	-365(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -369(%rbp)

/* t111 = 4 */
movl	$4, -373(%rbp)
/* t110 = t110 + t111 */
movl	-369(%rbp), %eax
movl	-373(%rbp), %edx
addl	%edx, %eax
movl	%eax, -369(%rbp)

/*  */
subq	$8, %rsp

/* t112 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -377(%rbp)
addq	$8, %rsp
/* v[t110] = t112 */
movl	-377(%rbp), %ecx
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-369(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* e22: skip */
e22:
/* t113 = 1 */
movl	$1, -381(%rbp)
/* n = n - t113 */
movl	8(%rbp), %eax
movl	-381(%rbp), %edx
subl	%edx, %eax
movl	%eax, 8(%rbp)

/* e23: skip */
e23:
/* goto e16 */
jmp	e16
/* e24: skip */
e24:
/* return v */
movq	-60(%rbp), %rax
movq	%rax, 12(%rbp)
addq	$376, %rsp
pop	%rbp
ret
/* e25: skip */
e25:
/* decrement v */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$376, %rsp
pop	%rbp
ret
/* e26: skip */
e26:
/* goto e41 */
jmp	e41
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$632, %rsp
lea	-54(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-248(%rbp), %rax
movq	%rax, -248(%rbp)

lea	-256(%rbp), %rax
movq	%rax, -256(%rbp)

lea	-292(%rbp), %rax
movq	%rax, -276(%rbp)

lea	-453(%rbp), %rax
movq	%rax, -436(%rbp)

lea	-553(%rbp), %rax
movq	%rax, -534(%rbp)

/*  */
subq	$8, %rsp

/* t115 = 1 */
movl	$1, -58(%rbp)
/* t116 = 0 */
movl	$0, -62(%rbp)
/* t114[t116] = t115 */
movl	-58(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-62(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t117 = Q */
movb	$81, -63(%rbp)
/* t118 = 4 */
movl	$4, -67(%rbp)
/* t114[t118] = t117 */
movb	-63(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-67(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t119 = u */
movb	$117, -68(%rbp)
/* t120 = 5 */
movl	$5, -72(%rbp)
/* t114[t120] = t119 */
movb	-68(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-72(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t121 = a */
movb	$97, -73(%rbp)
/* t122 = 6 */
movl	$6, -77(%rbp)
/* t114[t122] = t121 */
movb	-73(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-77(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t123 = n */
movb	$110, -78(%rbp)
/* t124 = 7 */
movl	$7, -82(%rbp)
/* t114[t124] = t123 */
movb	-78(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-82(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t125 = t */
movb	$116, -83(%rbp)
/* t126 = 8 */
movl	$8, -87(%rbp)
/* t114[t126] = t125 */
movb	-83(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-87(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t127 = s */
movb	$115, -88(%rbp)
/* t128 = 9 */
movl	$9, -92(%rbp)
/* t114[t128] = t127 */
movb	-88(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-92(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t129 =   */
movb	$32, -93(%rbp)
/* t130 = 10 */
movl	$10, -97(%rbp)
/* t114[t130] = t129 */
movb	-93(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-97(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t131 = d */
movb	$100, -98(%rbp)
/* t132 = 11 */
movl	$11, -102(%rbp)
/* t114[t132] = t131 */
movb	-98(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-102(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t133 = e */
movb	$101, -103(%rbp)
/* t134 = 12 */
movl	$12, -107(%rbp)
/* t114[t134] = t133 */
movb	-103(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-107(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t135 =   */
movb	$32, -108(%rbp)
/* t136 = 13 */
movl	$13, -112(%rbp)
/* t114[t136] = t135 */
movb	-108(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-112(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t137 = n */
movb	$110, -113(%rbp)
/* t138 = 14 */
movl	$14, -117(%rbp)
/* t114[t138] = t137 */
movb	-113(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-117(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t139 = � */
movb	$-61, -118(%rbp)
/* t140 = 15 */
movl	$15, -122(%rbp)
/* t114[t140] = t139 */
movb	-118(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-122(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t141 = � */
movb	$-70, -123(%rbp)
/* t142 = 16 */
movl	$16, -127(%rbp)
/* t114[t142] = t141 */
movb	-123(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-127(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t143 = m */
movb	$109, -128(%rbp)
/* t144 = 17 */
movl	$17, -132(%rbp)
/* t114[t144] = t143 */
movb	-128(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-132(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t145 = e */
movb	$101, -133(%rbp)
/* t146 = 18 */
movl	$18, -137(%rbp)
/* t114[t146] = t145 */
movb	-133(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-137(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t147 = r */
movb	$114, -138(%rbp)
/* t148 = 19 */
movl	$19, -142(%rbp)
/* t114[t148] = t147 */
movb	-138(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-142(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t149 = o */
movb	$111, -143(%rbp)
/* t150 = 20 */
movl	$20, -147(%rbp)
/* t114[t150] = t149 */
movb	-143(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-147(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t151 = s */
movb	$115, -148(%rbp)
/* t152 = 21 */
movl	$21, -152(%rbp)
/* t114[t152] = t151 */
movb	-148(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-152(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t153 =   */
movb	$32, -153(%rbp)
/* t154 = 22 */
movl	$22, -157(%rbp)
/* t114[t154] = t153 */
movb	-153(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-157(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t155 = v */
movb	$118, -158(%rbp)
/* t156 = 23 */
movl	$23, -162(%rbp)
/* t114[t156] = t155 */
movb	-158(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-162(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t157 = o */
movb	$111, -163(%rbp)
/* t158 = 24 */
movl	$24, -167(%rbp)
/* t114[t158] = t157 */
movb	-163(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-167(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t159 = l */
movb	$108, -168(%rbp)
/* t160 = 25 */
movl	$25, -172(%rbp)
/* t114[t160] = t159 */
movb	-168(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-172(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t161 = s */
movb	$115, -173(%rbp)
/* t162 = 26 */
movl	$26, -177(%rbp)
/* t114[t162] = t161 */
movb	-173(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-177(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t163 =   */
movb	$32, -178(%rbp)
/* t164 = 27 */
movl	$27, -182(%rbp)
/* t114[t164] = t163 */
movb	-178(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-182(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t165 = c */
movb	$99, -183(%rbp)
/* t166 = 28 */
movl	$28, -187(%rbp)
/* t114[t166] = t165 */
movb	-183(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-187(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t167 = o */
movb	$111, -188(%rbp)
/* t168 = 29 */
movl	$29, -192(%rbp)
/* t114[t168] = t167 */
movb	-188(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-192(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t169 = m */
movb	$109, -193(%rbp)
/* t170 = 30 */
movl	$30, -197(%rbp)
/* t114[t170] = t169 */
movb	-193(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-197(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t171 = p */
movb	$112, -198(%rbp)
/* t172 = 31 */
movl	$31, -202(%rbp)
/* t114[t172] = t171 */
movb	-198(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-202(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t173 = t */
movb	$116, -203(%rbp)
/* t174 = 32 */
movl	$32, -207(%rbp)
/* t114[t174] = t173 */
movb	-203(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-207(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t175 = a */
movb	$97, -208(%rbp)
/* t176 = 33 */
movl	$33, -212(%rbp)
/* t114[t176] = t175 */
movb	-208(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-212(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t177 = r */
movb	$114, -213(%rbp)
/* t178 = 34 */
movl	$34, -217(%rbp)
/* t114[t178] = t177 */
movb	-213(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-217(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t179 = ? */
movb	$63, -218(%rbp)
/* t180 = 35 */
movl	$35, -222(%rbp)
/* t114[t180] = t179 */
movb	-218(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-222(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t181 =   */
movb	$32, -223(%rbp)
/* t182 = 36 */
movl	$36, -227(%rbp)
/* t114[t182] = t181 */
movb	-223(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-227(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t183 =   */
movb	$0, -228(%rbp)
/* t184 = 37 */
movl	$37, -232(%rbp)
/* t114[t184] = t183 */
movb	-228(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-232(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t114 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t114 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t114 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* t185 = call readInt */
call 	readInt
movl	0(%rsp), %eax
movl	%eax, -236(%rbp)
addq	$8, %rsp
/* k = t185 */
movl	-236(%rbp), %eax
movl	%eax, -240(%rbp)

/* e29: skip */
e29:
/*  */
subq	$16, %rsp

/* put param k */
movl	-240(%rbp), %eax
movl	%eax, 0(%rsp)
/* t187 = call e10 */
call 	e10
movq	4(%rsp), %rax
movq	%rax, -248(%rbp)
addq	$16, %rsp
/* vector = t187 */
movq	-248(%rbp), %rax
movq	%rax, -256(%rbp)

/* e30: skip */
e30:
/* t189 = 0 */
movl	$0, -260(%rbp)
/* i = t189 */
movl	-260(%rbp), %eax
movl	%eax, -264(%rbp)

/* e31: skip */
e31:
/* if i < k then goto e32 */
movl	-264(%rbp), %eax
movl	-240(%rbp), %edx
cmpl	%eax, %edx
jg	e32
/* goto e40 */
jmp	e40
/* e32: skip */
e32:
/*  */
subq	$8, %rsp

/* t193 = 1 */
movl	$1, -296(%rbp)
/* t194 = 0 */
movl	$0, -300(%rbp)
/* t192[t194] = t193 */
movl	-296(%rbp), %ecx
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-300(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t195 = E */
movb	$69, -301(%rbp)
/* t196 = 4 */
movl	$4, -305(%rbp)
/* t192[t196] = t195 */
movb	-301(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-305(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t197 = l */
movb	$108, -306(%rbp)
/* t198 = 5 */
movl	$5, -310(%rbp)
/* t192[t198] = t197 */
movb	-306(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-310(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t199 =   */
movb	$32, -311(%rbp)
/* t200 = 6 */
movl	$6, -315(%rbp)
/* t192[t200] = t199 */
movb	-311(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-315(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t201 = n */
movb	$110, -316(%rbp)
/* t202 = 7 */
movl	$7, -320(%rbp)
/* t192[t202] = t201 */
movb	-316(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-320(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t203 = � */
movb	$-61, -321(%rbp)
/* t204 = 8 */
movl	$8, -325(%rbp)
/* t192[t204] = t203 */
movb	-321(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-325(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t205 = � */
movb	$-70, -326(%rbp)
/* t206 = 9 */
movl	$9, -330(%rbp)
/* t192[t206] = t205 */
movb	-326(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-330(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t207 = m */
movb	$109, -331(%rbp)
/* t208 = 10 */
movl	$10, -335(%rbp)
/* t192[t208] = t207 */
movb	-331(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-335(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t209 = e */
movb	$101, -336(%rbp)
/* t210 = 11 */
movl	$11, -340(%rbp)
/* t192[t210] = t209 */
movb	-336(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-340(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t211 = r */
movb	$114, -341(%rbp)
/* t212 = 12 */
movl	$12, -345(%rbp)
/* t192[t212] = t211 */
movb	-341(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-345(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t213 = o */
movb	$111, -346(%rbp)
/* t214 = 13 */
movl	$13, -350(%rbp)
/* t192[t214] = t213 */
movb	-346(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-350(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t215 =   */
movb	$32, -351(%rbp)
/* t216 = 14 */
movl	$14, -355(%rbp)
/* t192[t216] = t215 */
movb	-351(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-355(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t217 =   */
movb	$0, -356(%rbp)
/* t218 = 15 */
movl	$15, -360(%rbp)
/* t192[t218] = t217 */
movb	-356(%rbp), %cl
movq	-276(%rbp), %rax
movq	$0, %rbx
movl	-360(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t192 */
movq	-276(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t192 */
movq	-276(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t192 */
movq	-276(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e33: skip */
e33:
/*  */
subq	$8, %rsp

/* t219 = 4 */
movl	$4, -364(%rbp)
/* t220 = i */
movl	-264(%rbp), %eax
movl	%eax, -368(%rbp)

/* t221 = 1 */
movl	$1, -372(%rbp)
/* t222 = 4 */
movl	$4, -376(%rbp)
/* t223 = t220 * t222 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-368(%rbp), %eax
movl	-376(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -380(%rbp)

/* t224 = 4 */
movl	$4, -384(%rbp)
/* t223 = t223 + t224 */
movl	-380(%rbp), %eax
movl	-384(%rbp), %edx
addl	%edx, %eax
movl	%eax, -380(%rbp)

/* t225 = vector[t223] */
movq	-256(%rbp), %rax
movq	$0, %rbx
movl	-380(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -388(%rbp)

/* put param t225 */
movl	-388(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e34: skip */
e34:
/* t226 = 4 */
movl	$4, -392(%rbp)
/* t227 = i */
movl	-264(%rbp), %eax
movl	%eax, -396(%rbp)

/* t228 = 1 */
movl	$1, -400(%rbp)
/* t229 = 4 */
movl	$4, -404(%rbp)
/* t230 = t227 * t229 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-396(%rbp), %eax
movl	-404(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -408(%rbp)

/* t231 = 4 */
movl	$4, -412(%rbp)
/* t230 = t230 + t231 */
movl	-408(%rbp), %eax
movl	-412(%rbp), %edx
addl	%edx, %eax
movl	%eax, -408(%rbp)

/* t232 = 2 */
movl	$2, -416(%rbp)
/* t234 = vector[t230] */
movq	-256(%rbp), %rax
movq	$0, %rbx
movl	-408(%rbp), %ebx
movl	(%rax, %rbx), %eax
movl	%eax, -424(%rbp)

/* t233 = t234 % t232 */
movq	$0, %rax
movq	$0, %rdx
movq	$0, %r8
movl	-416(%rbp), %eax
cdqe
movq	%rax, %r8
movl	-424(%rbp), %eax
cdqe
idiv	%r8
movl	%edx, -420(%rbp)

/* t235 = 0 */
movl	$0, -428(%rbp)
/* if t233 == t235 then goto e35 */
movl	-420(%rbp), %eax
movl	-428(%rbp), %edx
cmpl	%eax, %edx
je	e35
/* goto e37 */
jmp	e37
/* e35: skip */
e35:
/*  */
subq	$8, %rsp

/* t237 = 1 */
movl	$1, -457(%rbp)
/* t238 = 0 */
movl	$0, -461(%rbp)
/* t236[t238] = t237 */
movl	-457(%rbp), %ecx
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-461(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t239 =   */
movb	$32, -462(%rbp)
/* t240 = 4 */
movl	$4, -466(%rbp)
/* t236[t240] = t239 */
movb	-462(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-466(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t241 = � */
movb	$-61, -467(%rbp)
/* t242 = 5 */
movl	$5, -471(%rbp)
/* t236[t242] = t241 */
movb	-467(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-471(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t243 = � */
movb	$-87, -472(%rbp)
/* t244 = 6 */
movl	$6, -476(%rbp)
/* t236[t244] = t243 */
movb	-472(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-476(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t245 = s */
movb	$115, -477(%rbp)
/* t246 = 7 */
movl	$7, -481(%rbp)
/* t236[t246] = t245 */
movb	-477(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-481(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t247 =   */
movb	$32, -482(%rbp)
/* t248 = 8 */
movl	$8, -486(%rbp)
/* t236[t248] = t247 */
movb	-482(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-486(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t249 = p */
movb	$112, -487(%rbp)
/* t250 = 9 */
movl	$9, -491(%rbp)
/* t236[t250] = t249 */
movb	-487(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-491(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t251 = a */
movb	$97, -492(%rbp)
/* t252 = 10 */
movl	$10, -496(%rbp)
/* t236[t252] = t251 */
movb	-492(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-496(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t253 = r */
movb	$114, -497(%rbp)
/* t254 = 11 */
movl	$11, -501(%rbp)
/* t236[t254] = t253 */
movb	-497(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-501(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t255 = e */
movb	$101, -502(%rbp)
/* t256 = 12 */
movl	$12, -506(%rbp)
/* t236[t256] = t255 */
movb	-502(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-506(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t257 = l */
movb	$108, -507(%rbp)
/* t258 = 13 */
movl	$13, -511(%rbp)
/* t236[t258] = t257 */
movb	-507(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-511(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t259 = l */
movb	$108, -512(%rbp)
/* t260 = 14 */
movl	$14, -516(%rbp)
/* t236[t260] = t259 */
movb	-512(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-516(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t261 = 
 */
movb	$10, -517(%rbp)
/* t262 = 15 */
movl	$15, -521(%rbp)
/* t236[t262] = t261 */
movb	-517(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-521(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t263 =   */
movb	$0, -522(%rbp)
/* t264 = 16 */
movl	$16, -526(%rbp)
/* t236[t264] = t263 */
movb	-522(%rbp), %cl
movq	-436(%rbp), %rax
movq	$0, %rbx
movl	-526(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t236 */
movq	-436(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t236 */
movq	-436(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t236 */
movq	-436(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e36: skip */
e36:
/* goto e39 */
jmp	e39
/* e37: skip */
e37:
/*  */
subq	$8, %rsp

/* t266 = 1 */
movl	$1, -557(%rbp)
/* t267 = 0 */
movl	$0, -561(%rbp)
/* t265[t267] = t266 */
movl	-557(%rbp), %ecx
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-561(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t268 =   */
movb	$32, -562(%rbp)
/* t269 = 4 */
movl	$4, -566(%rbp)
/* t265[t269] = t268 */
movb	-562(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-566(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t270 = � */
movb	$-61, -567(%rbp)
/* t271 = 5 */
movl	$5, -571(%rbp)
/* t265[t271] = t270 */
movb	-567(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-571(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t272 = � */
movb	$-87, -572(%rbp)
/* t273 = 6 */
movl	$6, -576(%rbp)
/* t265[t273] = t272 */
movb	-572(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-576(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t274 = s */
movb	$115, -577(%rbp)
/* t275 = 7 */
movl	$7, -581(%rbp)
/* t265[t275] = t274 */
movb	-577(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-581(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t276 =   */
movb	$32, -582(%rbp)
/* t277 = 8 */
movl	$8, -586(%rbp)
/* t265[t277] = t276 */
movb	-582(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-586(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t278 = i */
movb	$105, -587(%rbp)
/* t279 = 9 */
movl	$9, -591(%rbp)
/* t265[t279] = t278 */
movb	-587(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-591(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t280 = m */
movb	$109, -592(%rbp)
/* t281 = 10 */
movl	$10, -596(%rbp)
/* t265[t281] = t280 */
movb	-592(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-596(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t282 = p */
movb	$112, -597(%rbp)
/* t283 = 11 */
movl	$11, -601(%rbp)
/* t265[t283] = t282 */
movb	-597(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-601(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t284 = a */
movb	$97, -602(%rbp)
/* t285 = 12 */
movl	$12, -606(%rbp)
/* t265[t285] = t284 */
movb	-602(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-606(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t286 = r */
movb	$114, -607(%rbp)
/* t287 = 13 */
movl	$13, -611(%rbp)
/* t265[t287] = t286 */
movb	-607(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-611(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t288 = e */
movb	$101, -612(%rbp)
/* t289 = 14 */
movl	$14, -616(%rbp)
/* t265[t289] = t288 */
movb	-612(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-616(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t290 = l */
movb	$108, -617(%rbp)
/* t291 = 15 */
movl	$15, -621(%rbp)
/* t265[t291] = t290 */
movb	-617(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-621(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t292 = l */
movb	$108, -622(%rbp)
/* t293 = 16 */
movl	$16, -626(%rbp)
/* t265[t293] = t292 */
movb	-622(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-626(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t294 = 
 */
movb	$10, -627(%rbp)
/* t295 = 17 */
movl	$17, -631(%rbp)
/* t265[t295] = t294 */
movb	-627(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-631(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t296 =   */
movb	$0, -632(%rbp)
/* t297 = 18 */
movl	$18, -636(%rbp)
/* t265[t297] = t296 */
movb	-632(%rbp), %cl
movq	-534(%rbp), %rax
movq	$0, %rbx
movl	-636(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t265 */
movq	-534(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t265 */
movq	-534(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t265 */
movq	-534(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e38: skip */
e38:
/* e39: skip */
e39:
/* t191 = 1 */
movl	$1, -268(%rbp)
/* i = i + t191 */
movl	-264(%rbp), %eax
movl	-268(%rbp), %edx
addl	%edx, %eax
movl	%eax, -264(%rbp)

/* goto e31 */
jmp	e31
/* e40: skip */
e40:
/* decrement vector */
movq	-256(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$632, %rsp
pop	%rbp
ret
/* e41: skip */
e41:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

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
/* goto e11 */
jmp	e11
/* prova: skip */
prova:
/* preamble prova */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$0, %rsp
/* return */
addq	$0, %rsp
pop	%rbp
ret
/* e11: skip */
e11:
/* goto e30 */
jmp	e30
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$696, %rsp
lea	-66(%rbp), %rax
movq	%rax, -45(%rbp)

lea	-198(%rbp), %rax
movq	%rax, -175(%rbp)

lea	-379(%rbp), %rax
movq	%rax, -313(%rbp)

/* t8 = 4 */
movl	$4, -12(%rbp)
/* t9 = 7 */
movl	$7, -16(%rbp)
/* t10 = t8 * t9 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -20(%rbp)

/* valorConstant = t10 */
movl	-20(%rbp), %eax
movl	%eax, -24(%rbp)

/* e13: skip */
e13:
/*  */
subq	$8, %rsp

/* put param valorConstant */
movl	-24(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e14: skip */
e14:
/*  */
subq	$8, %rsp

/* t12 = 
 */
movb	$10, -25(%rbp)
/* put param t12 */
movb	-25(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e15: skip */
e15:
/* e16: skip */
e16:
/* e17: skip */
e17:
/* if trueConst == falseConst then goto e18 */
movb	var1, %al
movb	var2, %dl
cmpb	%al, %dl
je	e18
/* goto e21 */
jmp	e21
/* e18: skip */
e18:
/* t14 = 1 */
movl	$1, -33(%rbp)
/* t15 = j + t14 */
movl	-29(%rbp), %eax
movl	-33(%rbp), %edx
addl	%edx, %eax
movl	%eax, -37(%rbp)

/* j = t15 */
movl	-37(%rbp), %eax
movl	%eax, -29(%rbp)

/* e19: skip */
e19:
/*  */
subq	$8, %rsp

/* t17 = 1 */
movl	$1, -70(%rbp)
/* t18 = 0 */
movl	$0, -74(%rbp)
/* t16[t18] = t17 */
movl	-70(%rbp), %ecx
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-74(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t19 = � */
movb	$-61, -75(%rbp)
/* t20 = 4 */
movl	$4, -79(%rbp)
/* t16[t20] = t19 */
movb	-75(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-79(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t21 = � */
movb	$-119, -80(%rbp)
/* t22 = 5 */
movl	$5, -84(%rbp)
/* t16[t22] = t21 */
movb	-80(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-84(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t23 = s */
movb	$115, -85(%rbp)
/* t24 = 6 */
movl	$6, -89(%rbp)
/* t16[t24] = t23 */
movb	-85(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-89(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t25 =   */
movb	$32, -90(%rbp)
/* t26 = 7 */
movl	$7, -94(%rbp)
/* t16[t26] = t25 */
movb	-90(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-94(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t27 = i */
movb	$105, -95(%rbp)
/* t28 = 8 */
movl	$8, -99(%rbp)
/* t16[t28] = t27 */
movb	-95(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-99(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t29 = n */
movb	$110, -100(%rbp)
/* t30 = 9 */
movl	$9, -104(%rbp)
/* t16[t30] = t29 */
movb	-100(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-104(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t31 = a */
movb	$97, -105(%rbp)
/* t32 = 10 */
movl	$10, -109(%rbp)
/* t16[t32] = t31 */
movb	-105(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-109(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t33 = c */
movb	$99, -110(%rbp)
/* t34 = 11 */
movl	$11, -114(%rbp)
/* t16[t34] = t33 */
movb	-110(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-114(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t35 = c */
movb	$99, -115(%rbp)
/* t36 = 12 */
movl	$12, -119(%rbp)
/* t16[t36] = t35 */
movb	-115(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-119(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t37 = e */
movb	$101, -120(%rbp)
/* t38 = 13 */
movl	$13, -124(%rbp)
/* t16[t38] = t37 */
movb	-120(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-124(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t39 = s */
movb	$115, -125(%rbp)
/* t40 = 14 */
movl	$14, -129(%rbp)
/* t16[t40] = t39 */
movb	-125(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-129(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t41 = s */
movb	$115, -130(%rbp)
/* t42 = 15 */
movl	$15, -134(%rbp)
/* t16[t42] = t41 */
movb	-130(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-134(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t43 = i */
movb	$105, -135(%rbp)
/* t44 = 16 */
movl	$16, -139(%rbp)
/* t16[t44] = t43 */
movb	-135(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-139(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t45 = b */
movb	$98, -140(%rbp)
/* t46 = 17 */
movl	$17, -144(%rbp)
/* t16[t46] = t45 */
movb	-140(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-144(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t47 = l */
movb	$108, -145(%rbp)
/* t48 = 18 */
movl	$18, -149(%rbp)
/* t16[t48] = t47 */
movb	-145(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-149(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t49 = e */
movb	$101, -150(%rbp)
/* t50 = 19 */
movl	$19, -154(%rbp)
/* t16[t50] = t49 */
movb	-150(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-154(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t51 =   */
movb	$0, -155(%rbp)
/* t52 = 20 */
movl	$20, -159(%rbp)
/* t16[t52] = t51 */
movb	-155(%rbp), %cl
movq	-45(%rbp), %rax
movq	$0, %rbx
movl	-159(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t16 */
movq	-45(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t16 */
movq	-45(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t16 */
movq	-45(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e20: skip */
e20:
/* goto e17 */
jmp	e17
/* e21: skip */
e21:
/* e22: skip */
e22:
/* t53 = 4 */
movl	$4, -163(%rbp)
/* t54 = 5 */
movl	$5, -167(%rbp)
/* if t53 > t54 then goto e24 */
movl	-163(%rbp), %eax
movl	-167(%rbp), %edx
cmpl	%eax, %edx
jl	e24
/* goto e23 */
jmp	e23
/* e23: skip */
e23:
/* if trueConst == trueConst then goto e24 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e24
/* goto e26 */
jmp	e26
/* e24: skip */
e24:
/*  */
subq	$8, %rsp

/* t56 = 1 */
movl	$1, -202(%rbp)
/* t57 = 0 */
movl	$0, -206(%rbp)
/* t55[t57] = t56 */
movl	-202(%rbp), %ecx
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-206(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t58 = C */
movb	$67, -207(%rbp)
/* t59 = 4 */
movl	$4, -211(%rbp)
/* t55[t59] = t58 */
movb	-207(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-211(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t60 = T */
movb	$84, -212(%rbp)
/* t61 = 5 */
movl	$5, -216(%rbp)
/* t55[t61] = t60 */
movb	-212(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-216(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t62 = R */
movb	$82, -217(%rbp)
/* t63 = 6 */
movl	$6, -221(%rbp)
/* t55[t63] = t62 */
movb	-217(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-221(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t64 = L */
movb	$76, -222(%rbp)
/* t65 = 7 */
movl	$7, -226(%rbp)
/* t55[t65] = t64 */
movb	-222(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-226(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t66 = + */
movb	$43, -227(%rbp)
/* t67 = 8 */
movl	$8, -231(%rbp)
/* t55[t67] = t66 */
movb	-227(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-231(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t68 = C */
movb	$67, -232(%rbp)
/* t69 = 9 */
movl	$9, -236(%rbp)
/* t55[t69] = t68 */
movb	-232(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-236(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t70 =   */
movb	$32, -237(%rbp)
/* t71 = 10 */
movl	$10, -241(%rbp)
/* t55[t71] = t70 */
movb	-237(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-241(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t72 = p */
movb	$112, -242(%rbp)
/* t73 = 11 */
movl	$11, -246(%rbp)
/* t55[t73] = t72 */
movb	-242(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-246(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t74 = e */
movb	$101, -247(%rbp)
/* t75 = 12 */
movl	$12, -251(%rbp)
/* t55[t75] = t74 */
movb	-247(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-251(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t76 = r */
movb	$114, -252(%rbp)
/* t77 = 13 */
movl	$13, -256(%rbp)
/* t55[t77] = t76 */
movb	-252(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-256(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t78 =   */
movb	$32, -257(%rbp)
/* t79 = 14 */
movl	$14, -261(%rbp)
/* t55[t79] = t78 */
movb	-257(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-261(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t80 = a */
movb	$97, -262(%rbp)
/* t81 = 15 */
movl	$15, -266(%rbp)
/* t55[t81] = t80 */
movb	-262(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-266(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t82 = t */
movb	$116, -267(%rbp)
/* t83 = 16 */
movl	$16, -271(%rbp)
/* t55[t83] = t82 */
movb	-267(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-271(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t84 = u */
movb	$117, -272(%rbp)
/* t85 = 17 */
movl	$17, -276(%rbp)
/* t55[t85] = t84 */
movb	-272(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-276(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t86 = r */
movb	$114, -277(%rbp)
/* t87 = 18 */
movl	$18, -281(%rbp)
/* t55[t87] = t86 */
movb	-277(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-281(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t88 = a */
movb	$97, -282(%rbp)
/* t89 = 19 */
movl	$19, -286(%rbp)
/* t55[t89] = t88 */
movb	-282(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-286(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t90 = r */
movb	$114, -287(%rbp)
/* t91 = 20 */
movl	$20, -291(%rbp)
/* t55[t91] = t90 */
movb	-287(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-291(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t92 = 
 */
movb	$10, -292(%rbp)
/* t93 = 21 */
movl	$21, -296(%rbp)
/* t55[t93] = t92 */
movb	-292(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-296(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t94 =   */
movb	$0, -297(%rbp)
/* t95 = 22 */
movl	$22, -301(%rbp)
/* t55[t95] = t94 */
movb	-297(%rbp), %cl
movq	-175(%rbp), %rax
movq	$0, %rbx
movl	-301(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t55 */
movq	-175(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t55 */
movq	-175(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t55 */
movq	-175(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e25: skip */
e25:
/* goto e22 */
jmp	e22
/* e26: skip */
e26:
/* t96 = 7 */
movl	$7, -305(%rbp)
/* j = t96 */
movl	-305(%rbp), %eax
movl	%eax, -29(%rbp)

/* e27: skip */
e27:
/*  */
subq	$8, %rsp

/* put param j */
movl	-29(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e28: skip */
e28:
/*  */
subq	$8, %rsp

/* t98 = 1 */
movl	$1, -383(%rbp)
/* t99 = 0 */
movl	$0, -387(%rbp)
/* t97[t99] = t98 */
movl	-383(%rbp), %ecx
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-387(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t100 = A */
movb	$65, -388(%rbp)
/* t101 = 4 */
movl	$4, -392(%rbp)
/* t97[t101] = t100 */
movb	-388(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-392(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t102 = q */
movb	$113, -393(%rbp)
/* t103 = 5 */
movl	$5, -397(%rbp)
/* t97[t103] = t102 */
movb	-393(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-397(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t104 = u */
movb	$117, -398(%rbp)
/* t105 = 6 */
movl	$6, -402(%rbp)
/* t97[t105] = t104 */
movb	-398(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-402(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t106 = e */
movb	$101, -403(%rbp)
/* t107 = 7 */
movl	$7, -407(%rbp)
/* t97[t107] = t106 */
movb	-403(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-407(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t108 = s */
movb	$115, -408(%rbp)
/* t109 = 8 */
movl	$8, -412(%rbp)
/* t97[t109] = t108 */
movb	-408(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-412(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t110 = t */
movb	$116, -413(%rbp)
/* t111 = 9 */
movl	$9, -417(%rbp)
/* t97[t111] = t110 */
movb	-413(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-417(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t112 =   */
movb	$32, -418(%rbp)
/* t113 = 10 */
movl	$10, -422(%rbp)
/* t97[t113] = t112 */
movb	-418(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-422(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t114 = t */
movb	$116, -423(%rbp)
/* t115 = 11 */
movl	$11, -427(%rbp)
/* t97[t115] = t114 */
movb	-423(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-427(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t116 = e */
movb	$101, -428(%rbp)
/* t117 = 12 */
movl	$12, -432(%rbp)
/* t97[t117] = t116 */
movb	-428(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-432(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t118 = s */
movb	$115, -433(%rbp)
/* t119 = 13 */
movl	$13, -437(%rbp)
/* t97[t119] = t118 */
movb	-433(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-437(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t120 = t */
movb	$116, -438(%rbp)
/* t121 = 14 */
movl	$14, -442(%rbp)
/* t97[t121] = t120 */
movb	-438(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-442(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t122 =   */
movb	$32, -443(%rbp)
/* t123 = 15 */
movl	$15, -447(%rbp)
/* t97[t123] = t122 */
movb	-443(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-447(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t124 = m */
movb	$109, -448(%rbp)
/* t125 = 16 */
movl	$16, -452(%rbp)
/* t97[t125] = t124 */
movb	-448(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-452(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t126 = a */
movb	$97, -453(%rbp)
/* t127 = 17 */
movl	$17, -457(%rbp)
/* t97[t127] = t126 */
movb	-453(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-457(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t128 = i */
movb	$105, -458(%rbp)
/* t129 = 18 */
movl	$18, -462(%rbp)
/* t97[t129] = t128 */
movb	-458(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-462(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t130 =   */
movb	$32, -463(%rbp)
/* t131 = 19 */
movl	$19, -467(%rbp)
/* t97[t131] = t130 */
movb	-463(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-467(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t132 = e */
movb	$101, -468(%rbp)
/* t133 = 20 */
movl	$20, -472(%rbp)
/* t97[t133] = t132 */
movb	-468(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-472(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t134 = s */
movb	$115, -473(%rbp)
/* t135 = 21 */
movl	$21, -477(%rbp)
/* t97[t135] = t134 */
movb	-473(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-477(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t136 =   */
movb	$32, -478(%rbp)
/* t137 = 22 */
movl	$22, -482(%rbp)
/* t97[t137] = t136 */
movb	-478(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-482(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t138 = m */
movb	$109, -483(%rbp)
/* t139 = 23 */
movl	$23, -487(%rbp)
/* t97[t139] = t138 */
movb	-483(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-487(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t140 = o */
movb	$111, -488(%rbp)
/* t141 = 24 */
movl	$24, -492(%rbp)
/* t97[t141] = t140 */
movb	-488(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-492(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t142 = s */
movb	$115, -493(%rbp)
/* t143 = 25 */
movl	$25, -497(%rbp)
/* t97[t143] = t142 */
movb	-493(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-497(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t144 = t */
movb	$116, -498(%rbp)
/* t145 = 26 */
movl	$26, -502(%rbp)
/* t97[t145] = t144 */
movb	-498(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-502(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t146 = r */
movb	$114, -503(%rbp)
/* t147 = 27 */
movl	$27, -507(%rbp)
/* t97[t147] = t146 */
movb	-503(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-507(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t148 = a */
movb	$97, -508(%rbp)
/* t149 = 28 */
movl	$28, -512(%rbp)
/* t97[t149] = t148 */
movb	-508(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-512(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t150 = r */
movb	$114, -513(%rbp)
/* t151 = 29 */
movl	$29, -517(%rbp)
/* t97[t151] = t150 */
movb	-513(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-517(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t152 = � */
movb	$-61, -518(%rbp)
/* t153 = 30 */
movl	$30, -522(%rbp)
/* t97[t153] = t152 */
movb	-518(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-522(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t154 = � */
movb	$-96, -523(%rbp)
/* t155 = 31 */
movl	$31, -527(%rbp)
/* t97[t155] = t154 */
movb	-523(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-527(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t156 = , */
movb	$44, -528(%rbp)
/* t157 = 32 */
movl	$32, -532(%rbp)
/* t97[t157] = t156 */
movb	-528(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-532(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t158 =   */
movb	$32, -533(%rbp)
/* t159 = 33 */
movl	$33, -537(%rbp)
/* t97[t159] = t158 */
movb	-533(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-537(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t160 = � */
movb	$-61, -538(%rbp)
/* t161 = 34 */
movl	$34, -542(%rbp)
/* t97[t161] = t160 */
movb	-538(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-542(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t162 = � */
movb	$-87, -543(%rbp)
/* t163 = 35 */
movl	$35, -547(%rbp)
/* t97[t163] = t162 */
movb	-543(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-547(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t164 = s */
movb	$115, -548(%rbp)
/* t165 = 36 */
movl	$36, -552(%rbp)
/* t97[t165] = t164 */
movb	-548(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-552(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t166 =   */
movb	$32, -553(%rbp)
/* t167 = 37 */
movl	$37, -557(%rbp)
/* t97[t167] = t166 */
movb	-553(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-557(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t168 = i */
movb	$105, -558(%rbp)
/* t169 = 38 */
movl	$38, -562(%rbp)
/* t97[t169] = t168 */
movb	-558(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-562(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t170 = n */
movb	$110, -563(%rbp)
/* t171 = 39 */
movl	$39, -567(%rbp)
/* t97[t171] = t170 */
movb	-563(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-567(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t172 = a */
movb	$97, -568(%rbp)
/* t173 = 40 */
movl	$40, -572(%rbp)
/* t97[t173] = t172 */
movb	-568(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-572(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t174 = c */
movb	$99, -573(%rbp)
/* t175 = 41 */
movl	$41, -577(%rbp)
/* t97[t175] = t174 */
movb	-573(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-577(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t176 = c */
movb	$99, -578(%rbp)
/* t177 = 42 */
movl	$42, -582(%rbp)
/* t97[t177] = t176 */
movb	-578(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-582(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t178 = e */
movb	$101, -583(%rbp)
/* t179 = 43 */
movl	$43, -587(%rbp)
/* t97[t179] = t178 */
movb	-583(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-587(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t180 = s */
movb	$115, -588(%rbp)
/* t181 = 44 */
movl	$44, -592(%rbp)
/* t97[t181] = t180 */
movb	-588(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-592(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t182 = s */
movb	$115, -593(%rbp)
/* t183 = 45 */
movl	$45, -597(%rbp)
/* t97[t183] = t182 */
movb	-593(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-597(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t184 = i */
movb	$105, -598(%rbp)
/* t185 = 46 */
movl	$46, -602(%rbp)
/* t97[t185] = t184 */
movb	-598(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-602(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t186 = b */
movb	$98, -603(%rbp)
/* t187 = 47 */
movl	$47, -607(%rbp)
/* t97[t187] = t186 */
movb	-603(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-607(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t188 = l */
movb	$108, -608(%rbp)
/* t189 = 48 */
movl	$48, -612(%rbp)
/* t97[t189] = t188 */
movb	-608(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-612(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t190 = e */
movb	$101, -613(%rbp)
/* t191 = 49 */
movl	$49, -617(%rbp)
/* t97[t191] = t190 */
movb	-613(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-617(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t192 = . */
movb	$46, -618(%rbp)
/* t193 = 50 */
movl	$50, -622(%rbp)
/* t97[t193] = t192 */
movb	-618(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-622(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t194 =   */
movb	$32, -623(%rbp)
/* t195 = 51 */
movl	$51, -627(%rbp)
/* t97[t195] = t194 */
movb	-623(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-627(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t196 = B */
movb	$66, -628(%rbp)
/* t197 = 52 */
movl	$52, -632(%rbp)
/* t97[t197] = t196 */
movb	-628(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-632(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t198 = u */
movb	$117, -633(%rbp)
/* t199 = 53 */
movl	$53, -637(%rbp)
/* t97[t199] = t198 */
movb	-633(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-637(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t200 = c */
movb	$99, -638(%rbp)
/* t201 = 54 */
movl	$54, -642(%rbp)
/* t97[t201] = t200 */
movb	-638(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-642(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t202 = l */
movb	$108, -643(%rbp)
/* t203 = 55 */
movl	$55, -647(%rbp)
/* t97[t203] = t202 */
movb	-643(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-647(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t204 = e */
movb	$101, -648(%rbp)
/* t205 = 56 */
movl	$56, -652(%rbp)
/* t97[t205] = t204 */
movb	-648(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-652(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t206 =   */
movb	$32, -653(%rbp)
/* t207 = 57 */
movl	$57, -657(%rbp)
/* t97[t207] = t206 */
movb	-653(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-657(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t208 = i */
movb	$105, -658(%rbp)
/* t209 = 58 */
movl	$58, -662(%rbp)
/* t97[t209] = t208 */
movb	-658(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-662(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t210 = n */
movb	$110, -663(%rbp)
/* t211 = 59 */
movl	$59, -667(%rbp)
/* t97[t211] = t210 */
movb	-663(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-667(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t212 = f */
movb	$102, -668(%rbp)
/* t213 = 60 */
movl	$60, -672(%rbp)
/* t97[t213] = t212 */
movb	-668(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-672(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t214 = i */
movb	$105, -673(%rbp)
/* t215 = 61 */
movl	$61, -677(%rbp)
/* t97[t215] = t214 */
movb	-673(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-677(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t216 = n */
movb	$110, -678(%rbp)
/* t217 = 62 */
movl	$62, -682(%rbp)
/* t97[t217] = t216 */
movb	-678(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-682(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t218 = i */
movb	$105, -683(%rbp)
/* t219 = 63 */
movl	$63, -687(%rbp)
/* t97[t219] = t218 */
movb	-683(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-687(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t220 = t */
movb	$116, -688(%rbp)
/* t221 = 64 */
movl	$64, -692(%rbp)
/* t97[t221] = t220 */
movb	-688(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-692(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t222 =   */
movb	$0, -693(%rbp)
/* t223 = 65 */
movl	$65, -697(%rbp)
/* t97[t223] = t222 */
movb	-693(%rbp), %cl
movq	-313(%rbp), %rax
movq	$0, %rbx
movl	-697(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t97 */
movq	-313(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t97 */
movq	-313(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t97 */
movq	-313(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e29: skip */
e29:
/* return */
addq	$696, %rsp
pop	%rbp
ret
/* e30: skip */
e30:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

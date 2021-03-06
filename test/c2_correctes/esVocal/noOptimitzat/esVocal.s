.global _start
.bss
	var1:	.fill	1, 1, 0
	var2:	.fill	1, 1, 0
	var8:	.fill	4, 1, 0
	var9:	.fill	4, 1, 0
.data
.text
_start:
call	jada_init
/* trueConst = true */
movb	$1, var1
/* falseConst = false */
movb	$0, var2
/* t8 = 5 */
movl	$5, var8
/* numVocals = t8 */
movl	var8, %eax
movl	%eax, var9

/* goto e16 */
jmp	e16
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$72, %rsp
/* t11 = 0 */
movl	$0, -12(%rbp)
/* t12 = 1 */
movl	$1, -16(%rbp)
/* t13 = t11 * t12 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-12(%rbp), %eax
movl	-16(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -20(%rbp)

/* t14 = a */
movb	$97, -21(%rbp)
/* vocals[t13] = t14 */
movb	-21(%rbp), %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-20(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* e11: skip */
e11:
/* t15 = 1 */
movl	$1, -25(%rbp)
/* t16 = 1 */
movl	$1, -29(%rbp)
/* t17 = t15 * t16 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-25(%rbp), %eax
movl	-29(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -33(%rbp)

/* t18 = e */
movb	$101, -34(%rbp)
/* vocals[t17] = t18 */
movb	-34(%rbp), %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-33(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* e12: skip */
e12:
/* t19 = 2 */
movl	$2, -38(%rbp)
/* t20 = 1 */
movl	$1, -42(%rbp)
/* t21 = t19 * t20 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-38(%rbp), %eax
movl	-42(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -46(%rbp)

/* t22 = i */
movb	$105, -47(%rbp)
/* vocals[t21] = t22 */
movb	-47(%rbp), %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-46(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* e13: skip */
e13:
/* t23 = 3 */
movl	$3, -51(%rbp)
/* t24 = 1 */
movl	$1, -55(%rbp)
/* t25 = t23 * t24 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-51(%rbp), %eax
movl	-55(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -59(%rbp)

/* t26 = o */
movb	$111, -60(%rbp)
/* vocals[t25] = t26 */
movb	-60(%rbp), %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-59(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* e14: skip */
e14:
/* t27 = 4 */
movl	$4, -64(%rbp)
/* t28 = 1 */
movl	$1, -68(%rbp)
/* t29 = t27 * t28 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-64(%rbp), %eax
movl	-68(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -72(%rbp)

/* t30 = u */
movb	$117, -73(%rbp)
/* vocals[t29] = t30 */
movb	-73(%rbp), %cl
movq	8(%rbp), %rax
movq	$0, %rbx
movl	-72(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* e15: skip */
e15:
/* return */
addq	$72, %rsp
pop	%rbp
ret
/* e16: skip */
e16:
/* goto e55 */
jmp	e55
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$752, %rsp
lea	-272(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-308(%rbp), %rax
movq	%rax, -280(%rbp)

lea	-453(%rbp), %rax
movq	%rax, -444(%rbp)

lea	-519(%rbp), %rax
movq	%rax, -500(%rbp)

lea	-632(%rbp), %rax
movq	%rax, -610(%rbp)

/* e18: skip */
e18:
/* t33 = 1 */
movl	$1, -312(%rbp)
/* t34 = 0 */
movl	$0, -316(%rbp)
/* t32[t34] = t33 */
movl	-312(%rbp), %ecx
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-316(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t35 = I */
movb	$73, -317(%rbp)
/* t36 = 4 */
movl	$4, -321(%rbp)
/* t32[t36] = t35 */
movb	-317(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-321(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t37 = n */
movb	$110, -322(%rbp)
/* t38 = 5 */
movl	$5, -326(%rbp)
/* t32[t38] = t37 */
movb	-322(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-326(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t39 = t */
movb	$116, -327(%rbp)
/* t40 = 6 */
movl	$6, -331(%rbp)
/* t32[t40] = t39 */
movb	-327(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-331(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t41 = r */
movb	$114, -332(%rbp)
/* t42 = 7 */
movl	$7, -336(%rbp)
/* t32[t42] = t41 */
movb	-332(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-336(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t43 = o */
movb	$111, -337(%rbp)
/* t44 = 8 */
movl	$8, -341(%rbp)
/* t32[t44] = t43 */
movb	-337(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-341(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t45 = d */
movb	$100, -342(%rbp)
/* t46 = 9 */
movl	$9, -346(%rbp)
/* t32[t46] = t45 */
movb	-342(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-346(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t47 = u */
movb	$117, -347(%rbp)
/* t48 = 10 */
movl	$10, -351(%rbp)
/* t32[t48] = t47 */
movb	-347(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-351(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t49 = e */
movb	$101, -352(%rbp)
/* t50 = 11 */
movl	$11, -356(%rbp)
/* t32[t50] = t49 */
movb	-352(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-356(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t51 = i */
movb	$105, -357(%rbp)
/* t52 = 12 */
movl	$12, -361(%rbp)
/* t32[t52] = t51 */
movb	-357(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-361(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t53 = x */
movb	$120, -362(%rbp)
/* t54 = 13 */
movl	$13, -366(%rbp)
/* t32[t54] = t53 */
movb	-362(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-366(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t55 =   */
movb	$32, -367(%rbp)
/* t56 = 14 */
movl	$14, -371(%rbp)
/* t32[t56] = t55 */
movb	-367(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-371(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t57 = u */
movb	$117, -372(%rbp)
/* t58 = 15 */
movl	$15, -376(%rbp)
/* t32[t58] = t57 */
movb	-372(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-376(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t59 = n */
movb	$110, -377(%rbp)
/* t60 = 16 */
movl	$16, -381(%rbp)
/* t32[t60] = t59 */
movb	-377(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-381(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t61 = a */
movb	$97, -382(%rbp)
/* t62 = 17 */
movl	$17, -386(%rbp)
/* t32[t62] = t61 */
movb	-382(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-386(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t63 =   */
movb	$32, -387(%rbp)
/* t64 = 18 */
movl	$18, -391(%rbp)
/* t32[t64] = t63 */
movb	-387(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-391(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t65 = l */
movb	$108, -392(%rbp)
/* t66 = 19 */
movl	$19, -396(%rbp)
/* t32[t66] = t65 */
movb	-392(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-396(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t67 = l */
movb	$108, -397(%rbp)
/* t68 = 20 */
movl	$20, -401(%rbp)
/* t32[t68] = t67 */
movb	-397(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-401(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t69 = e */
movb	$101, -402(%rbp)
/* t70 = 21 */
movl	$21, -406(%rbp)
/* t32[t70] = t69 */
movb	-402(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-406(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t71 = t */
movb	$116, -407(%rbp)
/* t72 = 22 */
movl	$22, -411(%rbp)
/* t32[t72] = t71 */
movb	-407(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-411(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t73 = r */
movb	$114, -412(%rbp)
/* t74 = 23 */
movl	$23, -416(%rbp)
/* t32[t74] = t73 */
movb	-412(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-416(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t75 = a */
movb	$97, -417(%rbp)
/* t76 = 24 */
movl	$24, -421(%rbp)
/* t32[t76] = t75 */
movb	-417(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-421(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t77 = : */
movb	$58, -422(%rbp)
/* t78 = 25 */
movl	$25, -426(%rbp)
/* t32[t78] = t77 */
movb	-422(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-426(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t79 =   */
movb	$32, -427(%rbp)
/* t80 = 26 */
movl	$26, -431(%rbp)
/* t32[t80] = t79 */
movb	-427(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-431(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t81 =   */
movb	$0, -432(%rbp)
/* t82 = 27 */
movl	$27, -436(%rbp)
/* t32[t82] = t81 */
movb	-432(%rbp), %cl
movq	-280(%rbp), %rax
movq	$0, %rbx
movl	-436(%rbp), %ebx
movb	%cl, (%rax, %rbx)
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

/* e19: skip */
e19:
/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* put param v */
movq	-444(%rbp), %rax
movq	%rax, 0(%rsp)
/* call e10 */
call 	e10
addq	$8, %rsp
/* e21: skip */
e21:
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

/* e22: skip */
e22:
/*  */
subq	$8, %rsp

/* t84 = call readChar */
call 	readChar
movb	0(%rsp), %al
movb	%al, -454(%rbp)
addq	$8, %rsp
/* caracter = t84 */
movb	-454(%rbp), %al
movb	%al, -455(%rbp)

/* e23: skip */
e23:
/* if trueConst == falseConst then goto e24 */
movb	var1, %al
movb	var2, %dl
cmpb	%al, %dl
je	e24
/* goto e25 */
jmp	e25
/* e24: skip */
e24:
/* t86 = trueConst */
movb	var1, %al
movb	%al, -456(%rbp)

/* goto e26 */
jmp	e26
/* e25: skip */
e25:
/* t86 = falseConst */
movb	var2, %al
movb	%al, -456(%rbp)

/* e26: skip */
e26:
/* trobat = t86 */
movb	-456(%rbp), %al
movb	%al, -457(%rbp)

/* e27: skip */
e27:
/* t88 = 0 */
movl	$0, -461(%rbp)
/* j = t88 */
movl	-461(%rbp), %eax
movl	%eax, -465(%rbp)

/* e28: skip */
e28:
/* e29: skip */
e29:
/* if j < numVocals then goto e30 */
movl	-465(%rbp), %eax
movl	var9, %edx
cmpl	%eax, %edx
jg	e30
/* goto e42 */
jmp	e42
/* e30: skip */
e30:
/* if trueConst == trobat then goto e42 */
movb	var1, %al
movb	-457(%rbp), %dl
cmpb	%al, %dl
je	e42
/* goto e31 */
jmp	e31
/* e31: skip */
e31:
/*  */
subq	$8, %rsp

/* t90 = 1 */
movl	$1, -469(%rbp)
/* t91 = j * t90 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-465(%rbp), %eax
movl	-469(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -473(%rbp)

/* t92 = v[t91] */
movq	-444(%rbp), %rax
movq	$0, %rbx
movl	-473(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -474(%rbp)

/* put param t92 */
movb	-474(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e32: skip */
e32:
/*  */
subq	$8, %rsp

/* put param caracter */
movb	-455(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e33: skip */
e33:
/*  */
subq	$8, %rsp

/* t93 = 
 */
movb	$10, -475(%rbp)
/* put param t93 */
movb	-475(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e34: skip */
e34:
/* t94 = 1 */
movl	$1, -479(%rbp)
/* t95 = j * t94 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-465(%rbp), %eax
movl	-479(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -483(%rbp)

/* t96 = v[t95] */
movq	-444(%rbp), %rax
movq	$0, %rbx
movl	-483(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -484(%rbp)

/* if t96 == caracter then goto e35 */
movb	-484(%rbp), %al
movb	-455(%rbp), %dl
cmpb	%al, %dl
je	e35
/* goto e40 */
jmp	e40
/* e35: skip */
e35:
/* if trueConst == trueConst then goto e36 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e36
/* goto e37 */
jmp	e37
/* e36: skip */
e36:
/* trobat = trueConst */
movb	var1, %al
movb	%al, -457(%rbp)

/* goto e38 */
jmp	e38
/* e37: skip */
e37:
/* trobat = falseConst */
movb	var2, %al
movb	%al, -457(%rbp)

/* e38: skip */
e38:
/* e39: skip */
e39:
/* goto e40 */
jmp	e40
/* e40: skip */
e40:
/* t97 = 1 */
movl	$1, -488(%rbp)
/* t98 = j + t97 */
movl	-465(%rbp), %eax
movl	-488(%rbp), %edx
addl	%edx, %eax
movl	%eax, -492(%rbp)

/* j = t98 */
movl	-492(%rbp), %eax
movl	%eax, -465(%rbp)

/* e41: skip */
e41:
/* goto e29 */
jmp	e29
/* e42: skip */
e42:
/* if trueConst == trobat then goto e43 */
movb	var1, %al
movb	-457(%rbp), %dl
cmpb	%al, %dl
je	e43
/* goto e45 */
jmp	e45
/* e43: skip */
e43:
/*  */
subq	$8, %rsp

/* t100 = 1 */
movl	$1, -523(%rbp)
/* t101 = 0 */
movl	$0, -527(%rbp)
/* t99[t101] = t100 */
movl	-523(%rbp), %ecx
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-527(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t102 = � */
movb	$-61, -528(%rbp)
/* t103 = 4 */
movl	$4, -532(%rbp)
/* t99[t103] = t102 */
movb	-528(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-532(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t104 = � */
movb	$-119, -533(%rbp)
/* t105 = 5 */
movl	$5, -537(%rbp)
/* t99[t105] = t104 */
movb	-533(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-537(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t106 = s */
movb	$115, -538(%rbp)
/* t107 = 6 */
movl	$6, -542(%rbp)
/* t99[t107] = t106 */
movb	-538(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-542(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t108 =   */
movb	$32, -543(%rbp)
/* t109 = 7 */
movl	$7, -547(%rbp)
/* t99[t109] = t108 */
movb	-543(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-547(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t110 = u */
movb	$117, -548(%rbp)
/* t111 = 8 */
movl	$8, -552(%rbp)
/* t99[t111] = t110 */
movb	-548(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-552(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t112 = n */
movb	$110, -553(%rbp)
/* t113 = 9 */
movl	$9, -557(%rbp)
/* t99[t113] = t112 */
movb	-553(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-557(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t114 = a */
movb	$97, -558(%rbp)
/* t115 = 10 */
movl	$10, -562(%rbp)
/* t99[t115] = t114 */
movb	-558(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-562(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t116 =   */
movb	$32, -563(%rbp)
/* t117 = 11 */
movl	$11, -567(%rbp)
/* t99[t117] = t116 */
movb	-563(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-567(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t118 = v */
movb	$118, -568(%rbp)
/* t119 = 12 */
movl	$12, -572(%rbp)
/* t99[t119] = t118 */
movb	-568(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-572(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t120 = o */
movb	$111, -573(%rbp)
/* t121 = 13 */
movl	$13, -577(%rbp)
/* t99[t121] = t120 */
movb	-573(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-577(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t122 = c */
movb	$99, -578(%rbp)
/* t123 = 14 */
movl	$14, -582(%rbp)
/* t99[t123] = t122 */
movb	-578(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-582(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t124 = a */
movb	$97, -583(%rbp)
/* t125 = 15 */
movl	$15, -587(%rbp)
/* t99[t125] = t124 */
movb	-583(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-587(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t126 = l */
movb	$108, -588(%rbp)
/* t127 = 16 */
movl	$16, -592(%rbp)
/* t99[t127] = t126 */
movb	-588(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-592(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t128 = 
 */
movb	$10, -593(%rbp)
/* t129 = 17 */
movl	$17, -597(%rbp)
/* t99[t129] = t128 */
movb	-593(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-597(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t130 =   */
movb	$0, -598(%rbp)
/* t131 = 18 */
movl	$18, -602(%rbp)
/* t99[t131] = t130 */
movb	-598(%rbp), %cl
movq	-500(%rbp), %rax
movq	$0, %rbx
movl	-602(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t99 */
movq	-500(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t99 */
movq	-500(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t99 */
movq	-500(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e44: skip */
e44:
/* goto e47 */
jmp	e47
/* e45: skip */
e45:
/*  */
subq	$8, %rsp

/* t133 = 1 */
movl	$1, -636(%rbp)
/* t134 = 0 */
movl	$0, -640(%rbp)
/* t132[t134] = t133 */
movl	-636(%rbp), %ecx
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-640(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t135 = N */
movb	$78, -641(%rbp)
/* t136 = 4 */
movl	$4, -645(%rbp)
/* t132[t136] = t135 */
movb	-641(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-645(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t137 = o */
movb	$111, -646(%rbp)
/* t138 = 5 */
movl	$5, -650(%rbp)
/* t132[t138] = t137 */
movb	-646(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-650(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t139 =   */
movb	$32, -651(%rbp)
/* t140 = 6 */
movl	$6, -655(%rbp)
/* t132[t140] = t139 */
movb	-651(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-655(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t141 = � */
movb	$-61, -656(%rbp)
/* t142 = 7 */
movl	$7, -660(%rbp)
/* t132[t142] = t141 */
movb	-656(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-660(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t143 = � */
movb	$-87, -661(%rbp)
/* t144 = 8 */
movl	$8, -665(%rbp)
/* t132[t144] = t143 */
movb	-661(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-665(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t145 = s */
movb	$115, -666(%rbp)
/* t146 = 9 */
movl	$9, -670(%rbp)
/* t132[t146] = t145 */
movb	-666(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-670(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t147 =   */
movb	$32, -671(%rbp)
/* t148 = 10 */
movl	$10, -675(%rbp)
/* t132[t148] = t147 */
movb	-671(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-675(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t149 = u */
movb	$117, -676(%rbp)
/* t150 = 11 */
movl	$11, -680(%rbp)
/* t132[t150] = t149 */
movb	-676(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-680(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t151 = n */
movb	$110, -681(%rbp)
/* t152 = 12 */
movl	$12, -685(%rbp)
/* t132[t152] = t151 */
movb	-681(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-685(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t153 = a */
movb	$97, -686(%rbp)
/* t154 = 13 */
movl	$13, -690(%rbp)
/* t132[t154] = t153 */
movb	-686(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-690(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t155 =   */
movb	$32, -691(%rbp)
/* t156 = 14 */
movl	$14, -695(%rbp)
/* t132[t156] = t155 */
movb	-691(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-695(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t157 = v */
movb	$118, -696(%rbp)
/* t158 = 15 */
movl	$15, -700(%rbp)
/* t132[t158] = t157 */
movb	-696(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-700(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t159 = o */
movb	$111, -701(%rbp)
/* t160 = 16 */
movl	$16, -705(%rbp)
/* t132[t160] = t159 */
movb	-701(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-705(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t161 = c */
movb	$99, -706(%rbp)
/* t162 = 17 */
movl	$17, -710(%rbp)
/* t132[t162] = t161 */
movb	-706(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-710(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t163 = a */
movb	$97, -711(%rbp)
/* t164 = 18 */
movl	$18, -715(%rbp)
/* t132[t164] = t163 */
movb	-711(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-715(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t165 = l */
movb	$108, -716(%rbp)
/* t166 = 19 */
movl	$19, -720(%rbp)
/* t132[t166] = t165 */
movb	-716(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-720(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t167 = 
 */
movb	$10, -721(%rbp)
/* t168 = 20 */
movl	$20, -725(%rbp)
/* t132[t168] = t167 */
movb	-721(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-725(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t169 =   */
movb	$0, -726(%rbp)
/* t170 = 21 */
movl	$21, -730(%rbp)
/* t132[t170] = t169 */
movb	-726(%rbp), %cl
movq	-610(%rbp), %rax
movq	$0, %rbx
movl	-730(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t132 */
movq	-610(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t132 */
movq	-610(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t132 */
movq	-610(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e46: skip */
e46:
/* e47: skip */
e47:
/* t171 = 0 */
movl	$0, -734(%rbp)
/* i = t171 */
movl	-734(%rbp), %eax
movl	%eax, -738(%rbp)

/* e48: skip */
e48:
/* e49: skip */
e49:
/* t173 = 5 */
movl	$5, -742(%rbp)
/* if i != t173 then goto e50 */
movl	-738(%rbp), %eax
movl	-742(%rbp), %edx
cmpl	%eax, %edx
jne	e50
/* goto e54 */
jmp	e54
/* e50: skip */
e50:
/*  */
subq	$8, %rsp

/* t174 = 1 */
movl	$1, -746(%rbp)
/* t175 = i * t174 */
xorq	%rax, %rax
xorq	%rdx, %rdx
movl	-738(%rbp), %eax
movl	-746(%rbp), %edx
imul	%rdx, %rax
movl	%eax, -750(%rbp)

/* t176 = v[t175] */
movq	-444(%rbp), %rax
movq	$0, %rbx
movl	-750(%rbp), %ebx
movb	(%rax, %rbx), %al
movb	%al, -751(%rbp)

/* put param t176 */
movb	-751(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e51: skip */
e51:
/*  */
subq	$8, %rsp

/* t177 = 
 */
movb	$10, -752(%rbp)
/* put param t177 */
movb	-752(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e52: skip */
e52:
/* t178 = 1 */
movl	$1, -756(%rbp)
/* t179 = i + t178 */
movl	-738(%rbp), %eax
movl	-756(%rbp), %edx
addl	%edx, %eax
movl	%eax, -760(%rbp)

/* i = t179 */
movl	-760(%rbp), %eax
movl	%eax, -738(%rbp)

/* e53: skip */
e53:
/* goto e49 */
jmp	e49
/* e54: skip */
e54:
/* decrement txt1 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* return */
addq	$752, %rsp
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

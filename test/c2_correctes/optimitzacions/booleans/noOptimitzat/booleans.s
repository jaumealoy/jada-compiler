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
/* goto e18 */
jmp	e18
/* e10: skip */
e10:
/* preamble e10 */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$168, %rsp
lea	-24(%rbp), %rax
movq	%rax, -16(%rbp)

lea	-70(%rbp), %rax
movq	%rax, -60(%rbp)

lea	-127(%rbp), %rax
movq	%rax, -116(%rbp)

/*  */
subq	$8, %rsp

/* put param name */
movq	8(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment name */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement name */
movq	8(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e11: skip */
e11:
/*  */
subq	$8, %rsp

/* t11 = 1 */
movl	$1, -28(%rbp)
/* t12 = 0 */
movl	$0, -32(%rbp)
/* t10[t12] = t11 */
movl	-28(%rbp), %ecx
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-32(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t13 =   */
movb	$32, -33(%rbp)
/* t14 = 4 */
movl	$4, -37(%rbp)
/* t10[t14] = t13 */
movb	-33(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-37(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t15 = = */
movb	$61, -38(%rbp)
/* t16 = 5 */
movl	$5, -42(%rbp)
/* t10[t16] = t15 */
movb	-38(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-42(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t17 =   */
movb	$32, -43(%rbp)
/* t18 = 6 */
movl	$6, -47(%rbp)
/* t10[t18] = t17 */
movb	-43(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-47(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t19 =   */
movb	$0, -48(%rbp)
/* t20 = 7 */
movl	$7, -52(%rbp)
/* t10[t20] = t19 */
movb	-48(%rbp), %cl
movq	-16(%rbp), %rax
movq	$0, %rbx
movl	-52(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t10 */
movq	-16(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t10 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t10 */
movq	-16(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e12: skip */
e12:
/* if trueConst == value then goto e13 */
movb	var1, %al
movb	16(%rbp), %dl
cmpb	%al, %dl
je	e13
/* goto e15 */
jmp	e15
/* e13: skip */
e13:
/*  */
subq	$8, %rsp

/* t22 = 1 */
movl	$1, -74(%rbp)
/* t23 = 0 */
movl	$0, -78(%rbp)
/* t21[t23] = t22 */
movl	-74(%rbp), %ecx
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-78(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t24 = t */
movb	$116, -79(%rbp)
/* t25 = 4 */
movl	$4, -83(%rbp)
/* t21[t25] = t24 */
movb	-79(%rbp), %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-83(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t26 = r */
movb	$114, -84(%rbp)
/* t27 = 5 */
movl	$5, -88(%rbp)
/* t21[t27] = t26 */
movb	-84(%rbp), %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-88(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t28 = u */
movb	$117, -89(%rbp)
/* t29 = 6 */
movl	$6, -93(%rbp)
/* t21[t29] = t28 */
movb	-89(%rbp), %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-93(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t30 = e */
movb	$101, -94(%rbp)
/* t31 = 7 */
movl	$7, -98(%rbp)
/* t21[t31] = t30 */
movb	-94(%rbp), %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-98(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t32 = 
 */
movb	$10, -99(%rbp)
/* t33 = 8 */
movl	$8, -103(%rbp)
/* t21[t33] = t32 */
movb	-99(%rbp), %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-103(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t34 =   */
movb	$0, -104(%rbp)
/* t35 = 9 */
movl	$9, -108(%rbp)
/* t21[t35] = t34 */
movb	-104(%rbp), %cl
movq	-60(%rbp), %rax
movq	$0, %rbx
movl	-108(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t21 */
movq	-60(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t21 */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t21 */
movq	-60(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e14: skip */
e14:
/* goto e17 */
jmp	e17
/* e15: skip */
e15:
/*  */
subq	$8, %rsp

/* t37 = 1 */
movl	$1, -131(%rbp)
/* t38 = 0 */
movl	$0, -135(%rbp)
/* t36[t38] = t37 */
movl	-131(%rbp), %ecx
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-135(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t39 = f */
movb	$102, -136(%rbp)
/* t40 = 4 */
movl	$4, -140(%rbp)
/* t36[t40] = t39 */
movb	-136(%rbp), %cl
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-140(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t41 = a */
movb	$97, -141(%rbp)
/* t42 = 5 */
movl	$5, -145(%rbp)
/* t36[t42] = t41 */
movb	-141(%rbp), %cl
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-145(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t43 = l */
movb	$108, -146(%rbp)
/* t44 = 6 */
movl	$6, -150(%rbp)
/* t36[t44] = t43 */
movb	-146(%rbp), %cl
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-150(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t45 = s */
movb	$115, -151(%rbp)
/* t46 = 7 */
movl	$7, -155(%rbp)
/* t36[t46] = t45 */
movb	-151(%rbp), %cl
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-155(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t47 = e */
movb	$101, -156(%rbp)
/* t48 = 8 */
movl	$8, -160(%rbp)
/* t36[t48] = t47 */
movb	-156(%rbp), %cl
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-160(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t49 = 
 */
movb	$10, -161(%rbp)
/* t50 = 9 */
movl	$9, -165(%rbp)
/* t36[t50] = t49 */
movb	-161(%rbp), %cl
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-165(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t51 =   */
movb	$0, -166(%rbp)
/* t52 = 10 */
movl	$10, -170(%rbp)
/* t36[t52] = t51 */
movb	-166(%rbp), %cl
movq	-116(%rbp), %rax
movq	$0, %rbx
movl	-170(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* put param t36 */
movq	-116(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t36 */
movq	-116(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t36 */
movq	-116(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e16: skip */
e16:
/* e17: skip */
e17:
/* return */
addq	$168, %rsp
pop	%rbp
ret
/* e18: skip */
e18:
/* goto e61 */
jmp	e61
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$280, %rsp
lea	-27(%rbp), %rax
movq	%rax, -18(%rbp)

lea	-78(%rbp), %rax
movq	%rax, -69(%rbp)

lea	-139(%rbp), %rax
movq	%rax, -130(%rbp)

lea	-198(%rbp), %rax
movq	%rax, -189(%rbp)

lea	-250(%rbp), %rax
movq	%rax, -241(%rbp)

/* if trueConst == trueConst then goto e20 */
movb	var1, %al
movb	var1, %dl
cmpb	%al, %dl
je	e20
/* goto e21 */
jmp	e21
/* e20: skip */
e20:
/* t53 = trueConst */
movb	var1, %al
movb	%al, -9(%rbp)

/* goto e22 */
jmp	e22
/* e21: skip */
e21:
/* t53 = falseConst */
movb	var2, %al
movb	%al, -9(%rbp)

/* e22: skip */
e22:
/* a = t53 */
movb	-9(%rbp), %al
movb	%al, -10(%rbp)

/* e23: skip */
e23:
/*  */
subq	$16, %rsp

/* t56 = 1 */
movl	$1, -31(%rbp)
/* t57 = 0 */
movl	$0, -35(%rbp)
/* t55[t57] = t56 */
movl	-31(%rbp), %ecx
movq	-18(%rbp), %rax
movq	$0, %rbx
movl	-35(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t58 = 1 */
movb	$49, -36(%rbp)
/* t59 = 4 */
movl	$4, -40(%rbp)
/* t55[t59] = t58 */
movb	-36(%rbp), %cl
movq	-18(%rbp), %rax
movq	$0, %rbx
movl	-40(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t60 = . */
movb	$46, -41(%rbp)
/* t61 = 5 */
movl	$5, -45(%rbp)
/* t55[t61] = t60 */
movb	-41(%rbp), %cl
movq	-18(%rbp), %rax
movq	$0, %rbx
movl	-45(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t62 =   */
movb	$32, -46(%rbp)
/* t63 = 6 */
movl	$6, -50(%rbp)
/* t55[t63] = t62 */
movb	-46(%rbp), %cl
movq	-18(%rbp), %rax
movq	$0, %rbx
movl	-50(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t64 = a */
movb	$97, -51(%rbp)
/* t65 = 7 */
movl	$7, -55(%rbp)
/* t55[t65] = t64 */
movb	-51(%rbp), %cl
movq	-18(%rbp), %rax
movq	$0, %rbx
movl	-55(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t66 =   */
movb	$0, -56(%rbp)
/* t67 = 8 */
movl	$8, -60(%rbp)
/* t55[t67] = t66 */
movb	-56(%rbp), %cl
movq	-18(%rbp), %rax
movq	$0, %rbx
movl	-60(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* if trueConst == a then goto e24 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e24
/* goto e25 */
jmp	e25
/* e24: skip */
e24:
/* t68 = trueConst */
movb	var1, %al
movb	%al, -61(%rbp)

/* goto e26 */
jmp	e26
/* e25: skip */
e25:
/* t68 = falseConst */
movb	var2, %al
movb	%al, -61(%rbp)

/* e26: skip */
e26:
/* put param t68 */
movb	-61(%rbp), %al
movb	%al, 8(%rsp)
/* put param t55 */
movq	-18(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t55 */
movq	-18(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t55 */
movq	-18(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e27: skip */
e27:
/* if trueConst == falseConst then goto e28 */
movb	var1, %al
movb	var2, %dl
cmpb	%al, %dl
je	e28
/* goto e29 */
jmp	e29
/* e28: skip */
e28:
/* a = trueConst */
movb	var1, %al
movb	%al, -10(%rbp)

/* goto e30 */
jmp	e30
/* e29: skip */
e29:
/* a = falseConst */
movb	var2, %al
movb	%al, -10(%rbp)

/* e30: skip */
e30:
/* e31: skip */
e31:
/*  */
subq	$16, %rsp

/* t70 = 1 */
movl	$1, -82(%rbp)
/* t71 = 0 */
movl	$0, -86(%rbp)
/* t69[t71] = t70 */
movl	-82(%rbp), %ecx
movq	-69(%rbp), %rax
movq	$0, %rbx
movl	-86(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t72 = 2 */
movb	$50, -87(%rbp)
/* t73 = 4 */
movl	$4, -91(%rbp)
/* t69[t73] = t72 */
movb	-87(%rbp), %cl
movq	-69(%rbp), %rax
movq	$0, %rbx
movl	-91(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t74 = . */
movb	$46, -92(%rbp)
/* t75 = 5 */
movl	$5, -96(%rbp)
/* t69[t75] = t74 */
movb	-92(%rbp), %cl
movq	-69(%rbp), %rax
movq	$0, %rbx
movl	-96(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t76 =   */
movb	$32, -97(%rbp)
/* t77 = 6 */
movl	$6, -101(%rbp)
/* t69[t77] = t76 */
movb	-97(%rbp), %cl
movq	-69(%rbp), %rax
movq	$0, %rbx
movl	-101(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t78 = a */
movb	$97, -102(%rbp)
/* t79 = 7 */
movl	$7, -106(%rbp)
/* t69[t79] = t78 */
movb	-102(%rbp), %cl
movq	-69(%rbp), %rax
movq	$0, %rbx
movl	-106(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t80 =   */
movb	$0, -107(%rbp)
/* t81 = 8 */
movl	$8, -111(%rbp)
/* t69[t81] = t80 */
movb	-107(%rbp), %cl
movq	-69(%rbp), %rax
movq	$0, %rbx
movl	-111(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* if trueConst == a then goto e32 */
movb	var1, %al
movb	-10(%rbp), %dl
cmpb	%al, %dl
je	e32
/* goto e33 */
jmp	e33
/* e32: skip */
e32:
/* t82 = trueConst */
movb	var1, %al
movb	%al, -112(%rbp)

/* goto e34 */
jmp	e34
/* e33: skip */
e33:
/* t82 = falseConst */
movb	var2, %al
movb	%al, -112(%rbp)

/* e34: skip */
e34:
/* put param t82 */
movb	-112(%rbp), %al
movb	%al, 8(%rsp)
/* put param t69 */
movq	-69(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t69 */
movq	-69(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t69 */
movq	-69(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e35: skip */
e35:
/* t83 = 5 */
movl	$5, -116(%rbp)
/* t84 = 4 */
movl	$4, -120(%rbp)
/* if t83 > t84 then goto e36 */
movl	-116(%rbp), %eax
movl	-120(%rbp), %edx
cmpl	%eax, %edx
jl	e36
/* goto e37 */
jmp	e37
/* e36: skip */
e36:
/* t85 = trueConst */
movb	var1, %al
movb	%al, -121(%rbp)

/* goto e38 */
jmp	e38
/* e37: skip */
e37:
/* t85 = falseConst */
movb	var2, %al
movb	%al, -121(%rbp)

/* e38: skip */
e38:
/* b = t85 */
movb	-121(%rbp), %al
movb	%al, -122(%rbp)

/* e39: skip */
e39:
/*  */
subq	$16, %rsp

/* t88 = 1 */
movl	$1, -143(%rbp)
/* t89 = 0 */
movl	$0, -147(%rbp)
/* t87[t89] = t88 */
movl	-143(%rbp), %ecx
movq	-130(%rbp), %rax
movq	$0, %rbx
movl	-147(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t90 = 1 */
movb	$49, -148(%rbp)
/* t91 = 4 */
movl	$4, -152(%rbp)
/* t87[t91] = t90 */
movb	-148(%rbp), %cl
movq	-130(%rbp), %rax
movq	$0, %rbx
movl	-152(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t92 = . */
movb	$46, -153(%rbp)
/* t93 = 5 */
movl	$5, -157(%rbp)
/* t87[t93] = t92 */
movb	-153(%rbp), %cl
movq	-130(%rbp), %rax
movq	$0, %rbx
movl	-157(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t94 =   */
movb	$32, -158(%rbp)
/* t95 = 6 */
movl	$6, -162(%rbp)
/* t87[t95] = t94 */
movb	-158(%rbp), %cl
movq	-130(%rbp), %rax
movq	$0, %rbx
movl	-162(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t96 = b */
movb	$98, -163(%rbp)
/* t97 = 7 */
movl	$7, -167(%rbp)
/* t87[t97] = t96 */
movb	-163(%rbp), %cl
movq	-130(%rbp), %rax
movq	$0, %rbx
movl	-167(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t98 =   */
movb	$0, -168(%rbp)
/* t99 = 8 */
movl	$8, -172(%rbp)
/* t87[t99] = t98 */
movb	-168(%rbp), %cl
movq	-130(%rbp), %rax
movq	$0, %rbx
movl	-172(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* if trueConst == b then goto e40 */
movb	var1, %al
movb	-122(%rbp), %dl
cmpb	%al, %dl
je	e40
/* goto e41 */
jmp	e41
/* e40: skip */
e40:
/* t100 = trueConst */
movb	var1, %al
movb	%al, -173(%rbp)

/* goto e42 */
jmp	e42
/* e41: skip */
e41:
/* t100 = falseConst */
movb	var2, %al
movb	%al, -173(%rbp)

/* e42: skip */
e42:
/* put param t100 */
movb	-173(%rbp), %al
movb	%al, 8(%rsp)
/* put param t87 */
movq	-130(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t87 */
movq	-130(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t87 */
movq	-130(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e43: skip */
e43:
/* t101 = 7 */
movl	$7, -177(%rbp)
/* t102 = 5 */
movl	$5, -181(%rbp)
/* if t101 < t102 then goto e44 */
movl	-177(%rbp), %eax
movl	-181(%rbp), %edx
cmpl	%eax, %edx
jg	e44
/* goto e45 */
jmp	e45
/* e44: skip */
e44:
/* b = trueConst */
movb	var1, %al
movb	%al, -122(%rbp)

/* goto e46 */
jmp	e46
/* e45: skip */
e45:
/* b = falseConst */
movb	var2, %al
movb	%al, -122(%rbp)

/* e46: skip */
e46:
/* e47: skip */
e47:
/*  */
subq	$16, %rsp

/* t104 = 1 */
movl	$1, -202(%rbp)
/* t105 = 0 */
movl	$0, -206(%rbp)
/* t103[t105] = t104 */
movl	-202(%rbp), %ecx
movq	-189(%rbp), %rax
movq	$0, %rbx
movl	-206(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t106 = 2 */
movb	$50, -207(%rbp)
/* t107 = 4 */
movl	$4, -211(%rbp)
/* t103[t107] = t106 */
movb	-207(%rbp), %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movl	-211(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t108 = . */
movb	$46, -212(%rbp)
/* t109 = 5 */
movl	$5, -216(%rbp)
/* t103[t109] = t108 */
movb	-212(%rbp), %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movl	-216(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t110 =   */
movb	$32, -217(%rbp)
/* t111 = 6 */
movl	$6, -221(%rbp)
/* t103[t111] = t110 */
movb	-217(%rbp), %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movl	-221(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t112 = b */
movb	$98, -222(%rbp)
/* t113 = 7 */
movl	$7, -226(%rbp)
/* t103[t113] = t112 */
movb	-222(%rbp), %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movl	-226(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t114 =   */
movb	$0, -227(%rbp)
/* t115 = 8 */
movl	$8, -231(%rbp)
/* t103[t115] = t114 */
movb	-227(%rbp), %cl
movq	-189(%rbp), %rax
movq	$0, %rbx
movl	-231(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* if trueConst == b then goto e48 */
movb	var1, %al
movb	-122(%rbp), %dl
cmpb	%al, %dl
je	e48
/* goto e49 */
jmp	e49
/* e48: skip */
e48:
/* t116 = trueConst */
movb	var1, %al
movb	%al, -232(%rbp)

/* goto e50 */
jmp	e50
/* e49: skip */
e49:
/* t116 = falseConst */
movb	var2, %al
movb	%al, -232(%rbp)

/* e50: skip */
e50:
/* put param t116 */
movb	-232(%rbp), %al
movb	%al, 8(%rsp)
/* put param t103 */
movq	-189(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t103 */
movq	-189(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t103 */
movq	-189(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e51: skip */
e51:
/* e52: skip */
e52:
/* if trueConst == c then goto e53 */
movb	var1, %al
movb	-233(%rbp), %dl
cmpb	%al, %dl
je	e53
/* goto e54 */
jmp	e54
/* e53: skip */
e53:
/* b = trueConst */
movb	var1, %al
movb	%al, -122(%rbp)

/* goto e55 */
jmp	e55
/* e54: skip */
e54:
/* b = falseConst */
movb	var2, %al
movb	%al, -122(%rbp)

/* e55: skip */
e55:
/* e56: skip */
e56:
/*  */
subq	$16, %rsp

/* t119 = 1 */
movl	$1, -254(%rbp)
/* t120 = 0 */
movl	$0, -258(%rbp)
/* t118[t120] = t119 */
movl	-254(%rbp), %ecx
movq	-241(%rbp), %rax
movq	$0, %rbx
movl	-258(%rbp), %ebx
movl	%ecx, (%rax, %rbx)
/* t121 = 3 */
movb	$51, -259(%rbp)
/* t122 = 4 */
movl	$4, -263(%rbp)
/* t118[t122] = t121 */
movb	-259(%rbp), %cl
movq	-241(%rbp), %rax
movq	$0, %rbx
movl	-263(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t123 = . */
movb	$46, -264(%rbp)
/* t124 = 5 */
movl	$5, -268(%rbp)
/* t118[t124] = t123 */
movb	-264(%rbp), %cl
movq	-241(%rbp), %rax
movq	$0, %rbx
movl	-268(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t125 =   */
movb	$32, -269(%rbp)
/* t126 = 6 */
movl	$6, -273(%rbp)
/* t118[t126] = t125 */
movb	-269(%rbp), %cl
movq	-241(%rbp), %rax
movq	$0, %rbx
movl	-273(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t127 = b */
movb	$98, -274(%rbp)
/* t128 = 7 */
movl	$7, -278(%rbp)
/* t118[t128] = t127 */
movb	-274(%rbp), %cl
movq	-241(%rbp), %rax
movq	$0, %rbx
movl	-278(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* t129 =   */
movb	$0, -279(%rbp)
/* t130 = 8 */
movl	$8, -283(%rbp)
/* t118[t130] = t129 */
movb	-279(%rbp), %cl
movq	-241(%rbp), %rax
movq	$0, %rbx
movl	-283(%rbp), %ebx
movb	%cl, (%rax, %rbx)
/* if trueConst == b then goto e57 */
movb	var1, %al
movb	-122(%rbp), %dl
cmpb	%al, %dl
je	e57
/* goto e58 */
jmp	e58
/* e57: skip */
e57:
/* t131 = trueConst */
movb	var1, %al
movb	%al, -284(%rbp)

/* goto e59 */
jmp	e59
/* e58: skip */
e58:
/* t131 = falseConst */
movb	var2, %al
movb	%al, -284(%rbp)

/* e59: skip */
e59:
/* put param t131 */
movb	-284(%rbp), %al
movb	%al, 8(%rsp)
/* put param t118 */
movq	-241(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t118 */
movq	-241(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call e10 */
call 	e10
addq	$16, %rsp
/* decrement t118 */
movq	-241(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* e60: skip */
e60:
/* return */
addq	$280, %rsp
pop	%rbp
ret
/* e61: skip */
e61:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

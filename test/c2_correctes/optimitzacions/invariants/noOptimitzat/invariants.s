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
/* goto e36 */
jmp	e36
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$88, %rsp
/* t8 = 0 */
movl	$0, -12(%rbp)
/* constant = t8 */
movl	-12(%rbp), %eax
movl	%eax, -16(%rbp)

/* e11: skip */
e11:
/* t10 = 0 */
movl	$0, -20(%rbp)
/* constant2 = t10 */
movl	-20(%rbp), %eax
movl	%eax, -24(%rbp)

/* e12: skip */
e12:
/* t12 = 0 */
movl	$0, -28(%rbp)
/* i = t12 */
movl	-28(%rbp), %eax
movl	%eax, -32(%rbp)

/* e13: skip */
e13:
/* t14 = 10 */
movl	$10, -36(%rbp)
/* if i < t14 then goto e14 */
movl	-32(%rbp), %eax
movl	-36(%rbp), %edx
cmpl	%eax, %edx
jg	e14
/* goto e19 */
jmp	e19
/* e14: skip */
e14:
/* t16 = 4 */
movl	$4, -44(%rbp)
/* constant = t16 */
movl	-44(%rbp), %eax
movl	%eax, -16(%rbp)

/* e15: skip */
e15:
/* t17 = 50 */
movl	$50, -48(%rbp)
/* if i > t17 then goto e16 */
movl	-32(%rbp), %eax
movl	-48(%rbp), %edx
cmpl	%eax, %edx
jl	e16
/* goto e18 */
jmp	e18
/* e16: skip */
e16:
/* t18 = 4 */
movl	$4, -52(%rbp)
/* constant2 = t18 */
movl	-52(%rbp), %eax
movl	%eax, -24(%rbp)

/* e17: skip */
e17:
/* goto e18 */
jmp	e18
/* e18: skip */
e18:
/* t15 = 1 */
movl	$1, -40(%rbp)
/* i = i + t15 */
movl	-32(%rbp), %eax
movl	-40(%rbp), %edx
addl	%edx, %eax
movl	%eax, -32(%rbp)

/* goto e13 */
jmp	e13
/* e19: skip */
e19:
/*  */
subq	$8, %rsp

/* put param constant */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e20: skip */
e20:
/*  */
subq	$8, %rsp

/* t19 = 
 */
movb	$10, -53(%rbp)
/* put param t19 */
movb	-53(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e21: skip */
e21:
/*  */
subq	$8, %rsp

/* put param constant2 */
movl	-24(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e22: skip */
e22:
/*  */
subq	$8, %rsp

/* t20 = 
 */
movb	$10, -54(%rbp)
/* put param t20 */
movb	-54(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e23: skip */
e23:
/* t21 = 5 */
movl	$5, -58(%rbp)
/* t23 = 0 */
movl	$0, -66(%rbp)
/* t22 = t23 - t21 */
movl	-66(%rbp), %eax
movl	-58(%rbp), %edx
subl	%edx, %eax
movl	%eax, -62(%rbp)

/* constant = t22 */
movl	-62(%rbp), %eax
movl	%eax, -16(%rbp)

/* e24: skip */
e24:
/* t24 = 1000 */
movl	$1000, -70(%rbp)
/* i = t24 */
movl	-70(%rbp), %eax
movl	%eax, -74(%rbp)

/* e25: skip */
e25:
/* t26 = 10 */
movl	$10, -78(%rbp)
/* if i < t26 then goto e26 */
movl	-74(%rbp), %eax
movl	-78(%rbp), %edx
cmpl	%eax, %edx
jg	e26
/* goto e31 */
jmp	e31
/* e26: skip */
e26:
/* t28 = 4 */
movl	$4, -86(%rbp)
/* constant = t28 */
movl	-86(%rbp), %eax
movl	%eax, -16(%rbp)

/* e27: skip */
e27:
/* t29 = 50 */
movl	$50, -90(%rbp)
/* if i > t29 then goto e28 */
movl	-74(%rbp), %eax
movl	-90(%rbp), %edx
cmpl	%eax, %edx
jl	e28
/* goto e30 */
jmp	e30
/* e28: skip */
e28:
/* t30 = 4 */
movl	$4, -94(%rbp)
/* constant2 = t30 */
movl	-94(%rbp), %eax
movl	%eax, -24(%rbp)

/* e29: skip */
e29:
/* goto e30 */
jmp	e30
/* e30: skip */
e30:
/* t27 = 1 */
movl	$1, -82(%rbp)
/* i = i + t27 */
movl	-74(%rbp), %eax
movl	-82(%rbp), %edx
addl	%edx, %eax
movl	%eax, -74(%rbp)

/* goto e25 */
jmp	e25
/* e31: skip */
e31:
/*  */
subq	$8, %rsp

/* put param constant */
movl	-16(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e32: skip */
e32:
/*  */
subq	$8, %rsp

/* t31 = 
 */
movb	$10, -95(%rbp)
/* put param t31 */
movb	-95(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e33: skip */
e33:
/*  */
subq	$8, %rsp

/* put param constant2 */
movl	-24(%rbp), %eax
movl	%eax, 0(%rsp)
/* call printInt */
call 	printInt
addq	$8, %rsp
/* e34: skip */
e34:
/*  */
subq	$8, %rsp

/* t32 = 
 */
movb	$10, -96(%rbp)
/* put param t32 */
movb	-96(%rbp), %al
movb	%al, 0(%rsp)
/* call printChar */
call 	printChar
addq	$8, %rsp
/* e35: skip */
e35:
/* return */
addq	$88, %rsp
pop	%rbp
ret
/* e36: skip */
e36:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

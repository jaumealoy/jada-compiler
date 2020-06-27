.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e36 */
jmp	e36
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$16, %rsp
/* constant = 0 */
movl	$0, -12(%rbp)
/* constant2 = 0 */
movl	$0, -16(%rbp)
/* i = 0 */
movl	$0, -20(%rbp)
/* if i >= 10 then goto e19 */
movl	-20(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jle	e19
/* e38: skip */
e38:
/* constant = 4 */
movl	$4, -12(%rbp)
/* if i <= 50 then goto e18 */
movl	-20(%rbp), %eax
movl	$50, %edx
cmpl	%eax, %edx
jge	e18
/* constant2 = 4 */
movl	$4, -16(%rbp)
/* e18: skip */
e18:
/* i = i + 1 */
movl	-20(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -20(%rbp)

/* if i < 10 then goto e38 */
movl	-20(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jg	e38
/* e19: skip */
e19:
/*  */
subq	$8, %rsp

/* put param constant */
movl	-12(%rbp), %eax
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

/* put param constant2 */
movl	-16(%rbp), %eax
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
/* constant = -5 */
movl	$-5, -12(%rbp)
/* i = 1000 */
movl	$1000, -24(%rbp)
/* if i >= 10 then goto e31 */
movl	-24(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jle	e31
/* e37: skip */
e37:
/* constant = 4 */
movl	$4, -12(%rbp)
/* if i <= 50 then goto e30 */
movl	-24(%rbp), %eax
movl	$50, %edx
cmpl	%eax, %edx
jge	e30
/* constant2 = 4 */
movl	$4, -16(%rbp)
/* e30: skip */
e30:
/* i = i + 1 */
movl	-24(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -24(%rbp)

/* if i < 10 then goto e37 */
movl	-24(%rbp), %eax
movl	$10, %edx
cmpl	%eax, %edx
jg	e37
/* e31: skip */
e31:
/*  */
subq	$8, %rsp

/* put param constant */
movl	-12(%rbp), %eax
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

/* put param constant2 */
movl	-16(%rbp), %eax
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
/* return */
addq	$16, %rsp
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

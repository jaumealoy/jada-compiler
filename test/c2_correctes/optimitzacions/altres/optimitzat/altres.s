.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e30 */
jmp	e30
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
/* goto e30 */
jmp	e30
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$144, %rsp
lea	-41(%rbp), %rax
movq	%rax, -20(%rbp)

lea	-72(%rbp), %rax
movq	%rax, -49(%rbp)

lea	-146(%rbp), %rax
movq	%rax, -80(%rbp)

/*  */
subq	$8, %rsp

/* put param 28 */
movl	$28, %eax
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
/* goto e21 */
jmp	e21
/* e21: skip */
e21:
/* goto e24 */
jmp	e24
/* e31: skip */
e31:
/* e24: skip */
e24:
/*  */
subq	$8, %rsp

/* t55[0] = 1 */
movl	$1, %ecx
movq	-49(%rbp), %rax
movq	$0, %rbx
movl	%ecx, 0(%rax)
/* t55[4] = 67 */
movb	$67, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 4(%rax)
/* t55[5] = 84 */
movb	$84, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 5(%rax)
/* t55[6] = 82 */
movb	$82, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 6(%rax)
/* t55[7] = 76 */
movb	$76, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 7(%rax)
/* t55[8] = 43 */
movb	$43, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 8(%rax)
/* t55[9] = 67 */
movb	$67, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 9(%rax)
/* t55[10] = 32 */
movb	$32, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 10(%rax)
/* t55[11] = 112 */
movb	$112, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 11(%rax)
/* t55[12] = 101 */
movb	$101, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 12(%rax)
/* t55[13] = 114 */
movb	$114, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 13(%rax)
/* t55[14] = 32 */
movb	$32, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 14(%rax)
/* t55[15] = 97 */
movb	$97, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 15(%rax)
/* t55[16] = 116 */
movb	$116, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 16(%rax)
/* t55[17] = 117 */
movb	$117, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 17(%rax)
/* t55[18] = 114 */
movb	$114, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 18(%rax)
/* t55[19] = 97 */
movb	$97, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 19(%rax)
/* t55[20] = 114 */
movb	$114, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 20(%rax)
/* t55[21] = 10 */
movb	$10, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 21(%rax)
/* t55[22] = 0 */
movb	$0, %cl
movq	-49(%rbp), %rax
movq	$0, %rbx
movb	%cl, 22(%rax)
/* put param t55 */
movq	-49(%rbp), %rax
movq	%rax, 0(%rsp)
/* increment t55 */
movq	-49(%rbp), %rax
push	%rax
call	jada_reference_add
addq	$8, %rsp

/* call print */
call 	print
addq	$8, %rsp
/* decrement t55 */
movq	-49(%rbp), %rax
push	%rax
call	jada_reference_decrement
addq	$8, %rsp

/* goto e31 */
jmp	e31
/* e30: skip */
e30:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

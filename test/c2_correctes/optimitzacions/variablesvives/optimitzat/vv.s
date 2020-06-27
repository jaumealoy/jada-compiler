.global _start
.bss
.data
.text
_start:
call	jada_init
/* goto e20 */
jmp	e20
/* main: skip */
main:
/* preamble main */
push	%rbp
movq	%rsp, %rbp
addq	$8, %rbp
subq	$48, %rsp
/* i = 0 */
movl	$0, -24(%rbp)
/* if i >= 2147483647 then goto e19 */
movl	-24(%rbp), %eax
movl	$2147483647, %edx
cmpl	%eax, %edx
jle	e19
/* e21: skip */
e21:
/* i = i + 1 */
movl	-24(%rbp), %eax
movl	$1, %edx
addl	%edx, %eax
movl	%eax, -24(%rbp)

/* if i >= 2147483647 then goto e19 */
movl	-24(%rbp), %eax
movl	$2147483647, %edx
cmpl	%eax, %edx
jle	e19
/* goto e21 */
jmp	e21
/* e19: skip */
e19:
/* return */
addq	$48, %rsp
pop	%rbp
ret
/* e20: skip */
e20:
/* call main */
call 	main
addq	$0, %rsp
movq	$1, %rax
movq	$0, %rbx
int	$0x80

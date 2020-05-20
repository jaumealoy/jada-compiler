.data
	intArray:	.ascii "Hola món"

.text
.global main

main:
	call	jada_init
	push	$32
	push	$0
	call	jada_malloc
	pop		%r8
	addq	$4, %rsp

	push	$intArray
	push	%r8
	push	$32
	call 	memcpy

	addq	$0, %rsp
	movq	$1, %rax
	movq	$0, %rbx
	int	$0x80


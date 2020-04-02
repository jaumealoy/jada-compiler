printInt:
	/* 
		reservar un espai de 32 bytes per representar el dígit
		la longitud màxima serà de 20 caràcters (inclòs el signe)
	*/
	push	%rbp
	movq	%rsp, %rbp
	addq	$8, %rbp
	subq	$0, %rsp

	movq	$0, %rax
	movl	8(%rbp), %eax 	/* depèn de la mida d'un integer */
	movq	%rsp, %rdi		/* allà on s'ha de posar el següent caràcter */
	/*decq	%rdi*/
	subq	$32, %rsp
	movb	$0, 1(%rsp)		/* longitud de l'string final */
	movb	$0, 0(%rsp)
	movq	$0, %rdx
	testl	%eax, %eax
	jnz		1f

	/* és zero el número */
	decq	%rdi
	movb	$0x30, (%rdi)
	incb	1(%rsp)
	jmp		3f

1:	jns		0f				/* jump if not sign */
	/* guardar el signe a qualque lloc */
	movb	$0xFF, 0(%rsp)
	negl	%eax
	
0:	testq	%rax, %rax
	jz		2f				/* jump if zero */

	movq	$10, %r8
	idivq	%r8

	decq	%rdi
	addb	$0x30, %dl
	movb	%dl, (%rdi)
	incb	1(%rsp)

	movq	$0, %rdx
	jmp		0b

2:	cmpb	$0, 0(%rsp)
	je		3f
	/* posar signe - */
	decq	%rdi
	movb	$0x2D, (%rdi)
	incb	1(%rsp)

3:	movq	$1, %rax		/* write */
	movq	%rdi, %rsi		/* allà on comença l'string */
	movq	$0, %rdi		/* stdout */
	movb	1(%rsp), %dl	/* longitud string */
	andq	$0xFF, %rdx
	syscall

	addq	$32, %rsp
	pop		%rbp
	ret
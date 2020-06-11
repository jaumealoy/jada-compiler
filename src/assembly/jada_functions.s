.global read
.global readInt
.global readChar
.global print
.global printInt
.global printChar
.global memcpy
.global randInt

/**
 * Funció que imprimeix per stdout una cadena de text acabat amb
 * el caràcter NULL
 *
 * Paràmetres:
 * 1) str: string (8 bytes)
 */
print:
	/* guardar els registres per evitar efectes colaterals */
	push	%rax
	push	%rdi
	push	%rsi
	push	%rdx

	/* carregar l'inici de la cadena al registre SI */
	/* s'ha de tenir en compte que el punter té 4 bytes per indicar la dimensió */
	movq	4*8+8(%rsp), %rsi
	lea		4(%rsi), %rsi

	/* comptar quants de caràcters té la cadena */
	xorq	%rdx, %rdx

1:	/* inici del bucle de comptar */
	movb	(%rsi, %rdx), %al
	testb	%al, %al
	je	2f

	incq	%rdx
	jmp	1b

2:	/* final del bucle de comptar*/
	movq	$0x01, %rax			/* sys_write */
	movq	$1, %rdi			/* stdout */
	syscall

	/* recuperar els registres */
	pop		%rdx
	pop		%rsi
	pop		%rdi
	pop		%rax
	ret

/**
 * Funció que llegeix una línia de teclat fins el salt de línia
 * Aquesta línia pot ser mida il·limitada 
 *
 * Paràmetres:
 * 1) [out] string (8 bytes)
 */
read:
.equ buffer_size, 256
	push	%rax
	push	%rdi
	push	%rsi
	push	%rdx
	push	%r8		/* buffer actual */
	push	%r9		/* mida màxima del buffer actual */
	push	%r10	/* ocupació del buffer actual */

	/* reservar memòria pel buffer */
	push	$buffer_size
	push	%rax
	call	jada_malloc
	pop		%r8
	addq	$8, %rsp

	/* inicialitzar mides i espais ocupats */
	movq	$buffer_size, %r9

	movl	$1, (%r8)
	movq	$4, %r10	

	/* reservar espai per un buffer temporal i estàtic */
	subq	$buffer_size, %rsp
	movq	%rsp, %rsi			/* buffer de lectura */

1:	
	movq	$0x00, %rax			/* sys_read */
	movq	$0,	%rdi			/* stdin */
	movq	$buffer_size, %rdx			/* read size */
	syscall

	movq	%rax, %rdi
	addq	%r10, %rdi
	cmpq	%rdi, %r9
	jge		2f

	/* if readyBytes + currentSize > maxSize */
	movq	%r9, %rdx
	addq	$buffer_size * 2, %rdx
	push	%rdx
	push	%rdx
	call	jada_malloc
	pop		%rdx				/* adreça del nou buffer amb més espai */
	addq	$8, %rsp			/* malloc del nou buffer */

	movq	%rdx, %r9			/* actualitzar la mida màxima del buffer */

	push	%r8
	push	%rdx
	push	%r10
	call	memcpy
	addq	$3*8, %rsp			/* memcpy */

	push	%r8
	call	jada_free
	addq	$8, %rsp			/* free buffer anterior */

	movq	%rdx, %r8

2:
	push	%rsi				/* origen */
	lea		(%r8, %r10), %rdi
	push	%rdi				/* desti */
	push	%rax				/* nbytes */
	call	memcpy
	addq	$3*8, %rsp

	addq	%rax, %r10

	cmpq	$buffer_size, %rax
	jne		3f

	cmpb	$'\n', buffer_size-1(%rsi)
	jne		1b

3:
	/* alliberar buffer temporal */
	addq	$buffer_size, %rsp

	/* indicar el valor de retorn */
	movq	%r8, 7*8+8(%rsp)

	/* indicar final de string */
	movb	$0, -1(%r8, %r10)

	pop		%r10
	pop		%r9
	pop 	%r8
	pop		%rdx
	pop		%rsi
	pop		%rdi
	pop		%rax
	ret

/**
 * Funció que imprimeix per stdout un únic caràcter
 *
 * Paràmetres:
 * 1) caràcter a imprimir
 */
printChar:
	/* guardar els registres que s'utilitzaran */
	push	%rax
	push	%rdx
	push	%rsi
	push	%rdi

	movq	$0x01, %rax			/* sys_write */
	movq	$1, %rdi			/* stdout */
	movq	$1, %rdx			/* buffer size */
	lea		4*8+8(%rsp), %rsi
	syscall

	/* recuperar els registres */
	pop		%rdi
	pop		%rsi
	pop		%rdx
	pop		%rax
	ret


/**
 * Copia N bytes del buffer origen al buffer destí
 *
 * Paràmetres:
 * 1) buffer origen (8 bytes)
 * 2) buffer desti (8 bytes)
 * 3) número de bytes (8 bytes)
 */
memcpy:
	push	%rsi
	push	%rdi
	push	%rdx
	push	%r8

	movq	4*8+8(%rsp), %rdx
	decq	%rdx

	movq	4*8+8+8+8(%rsp), %rsi
	movq	4*8+8+8(%rsp), %rdi

1:	cmpq	$8, %rdx
	jl		2f

	movq	(%rsi), %r8
	movq	%r8, (%rdi)
	addq	$8, %rsi
	addq	$8, %rdi
	subq	$8, %rdx
	jmp		1b

2:	/* pot quedar una quantitat inferior a 8 bytes */
	testq	%rdx, %rdx
	js		4f

	movb	(%rsi), %r8b
	movb	%r8b, (%rdi)
	incq	%rsi
	incq	%rdi
	decq	%rdx
	jmp		2b

4:	
	pop		%r8
	pop		%rdx
	pop		%rdi
	pop		%rsi
	ret


/**
 * Llegeix un número enter i el retorna el seu valor numèric
 * 
 * Paràmetres:
 * 1) [out] valor numèric llegit (4 bytes)
 */
readInt:
	push	%rsi			/* string que conté el número */
	push	%r8				/* comptador de caràcters */
	push	%rdx			
	push	%rax
	push	%r9				/* valor final */
	push	%rcx			/* potència actual */

	/* llegir una cadena de caràcters */
	push	%rsi
	call	read
	pop		%rsi

	/* comptador de caràcters: no n'hi ha cap inicialment */
	xorq	%r8, %r8

1:	movb	4(%rsi, %r8), %dl
	testb	%dl, %dl
	je		2f

	incq	%r8
	jmp		1b

2:	xorq	%r9, %r9		/* reiniciar l'acumulador */
	xorq	%rdx, %rdx
	decq	%r8
	movq	$1, %rcx

3:	cmpq	$0, %r8
	jl		4f

	xorq	%rax, %rax
	movb	4(%rsi, %r8), %al
	cmpb	$'-', %al
	je		5f
	subb	$'0', %al
	imul	%rcx
	addq	%rax, %r9

	movq	%rcx, %rax
	movq	$10, %rcx
	imul	%rcx
	movq	%rax, %rcx

	decq	%r8
	
	jmp		3b

5:	/* cas trobar signe negatiu */
	negq	%r9
4:
	/* alliberar l'string reservat amb memòria dinàmica */
	push	%rsi
	call	jada_free
	pop		%rsi

	movl	%r9d, 6*8+8(%rsp)

	pop		%rcx
	pop		%r9
	pop		%rax
	pop		%rdx
	pop		%r8
	pop		%rsi
	ret


/**
 * Llegeix un caràcter de teclat
 *
 * Paràmetres:
 * 1) [out] caràcter (1 byte)
 */
readChar:
	push	%rax
	push	%rdx
	push	%rsi
	push	%rdi

	movq	$0x00, %rax			/* sys_read */
	movq	$0, %rdi			/* stdin */
	movq	$1, %rdx			/* buffer size */
	lea		4*8+8(%rsp), %rsi	/* buffer */
	syscall

	pop		%rdi
	pop		%rsi
	pop		%rdx
	pop		%rax
	ret

/**
 * Procediment que pinta un enter per consola
 * 
 * Paràmetres:
 * 1) int number
 */
printInt:
	push	%rax
	push	%rdx	/* comptador de caràcters */
	push	%rsi	/* punter al buffer */
	push	%rdi
	push	%r8		/* index del caràcter actual */

	/* obtenir el número que es vol mostrar */
	xorq	%rax, %rax
	movl	5*8+8(%rsp), %eax
	cdqe	/* extensió de signe a 64 bits */

	/* reservar espai per un array de caràcters */
	subq	$32, %rsp
	movq	%rsp, %rsi
	movq	$31, %r8

	testq	%rax, %rax
	jne		2f		/* if number > 0 goto 2f */

	/* guardar un zero al vector de caràcters */
	movb	$'0', (%rsi, %r8)
	decq	%r8
	jmp		1f

2:	/* comprovar si és un valor negatiu */
	movb	$0, (%rsi)
	testq	%rax, %rax
	jns		5f		/* if number >= 0 goto 3f */

	/* guardar que es tracta d'un valor negatiu */
	movb	$0xFF, (%rsi)
	negq	%rax

5:	movq	$10, %rdi
	xorq	%rdx, %rdx
3:	/* successives divisions entre 10 */
	testq	%rax, %rax
	je		4f

	idiv	%rdi
	addb	$'0', %dl
	movb	%dl, (%rsi, %r8)
	decq	%r8
	xorq	%rdx, %rdx

	jmp		3b

4:	/* afegir el signe negatiu si correspon */
	movb	(%rsi), %al
	testb	%al, %al
	je		1f

	/* és un valor negatiu */
	movb	$'-', (%rsi, %r8)
	decq	%r8

1:	/* fer la crida al sistema */
	lea		1(%rsi, %r8), %rsi		/* buffer */
	movq	$1, %rax				/* sys_write */
	movq	$0, %rdi				/* stdout */
	movq	$31, %rdx
	subq	%r8, %rdx
	syscall

	/* alliberar l'espai del buffer */
	addq	$32, %rsp

	pop		%r8
	pop		%rdi
	pop		%rsi
	pop		%rdx
	pop		%rax
	ret

/**
 * Genera un enter aleatori entre els valors establers
 * Paràmetres:
 * 1) In - mínim (4 bytes, int)
 * 2) In - màxim (4 bytes, int)
 * 3) Out - valor generat (4 bytes, int)
 */
randInt:
	push	%rax
	push	%rdi
	push	%rsi
	push	%rdx

	/* char __user *buf, size_t count, unsigned int flags	*/
	movq	$318, %rax				/* sys_getrandom */
	leaq	4*8+8+2*4(%rsp), %rdi	/* registres, @retorn, paràmetres in */
	movq	$4, %rsi				/* bytes que volem generar */
	movq	$0, %rdx				/* flags */
	syscall

	xorq	%rax, %rax
	xorq	%rdx, %rdx
	movl	4*8+8+4(%rsp), %eax		/* màxim */
	movl	4*8+8(%rsp), %edx		/* mínim */
	subl	%edx, %eax
	jne		3f

	movl	%edx, 4*8+8+2*4(%rsp)
	jmp		2f

3:	xorq	%rdi, %rdi
	movl	4*8+8+2*4(%rsp), %edi
	jns		1f
	negl	%edi

1:	movq	%rax, %rdx
	movq	%rdi, %rax
	movq	%rdx, %rsi
	xorq	%rdx, %rdx
	incq	%rsi
	idiv	%rsi
	addl	4*8+8(%rsp), %edx	

	movl	%edx, 4*8+8+2*4(%rsp)

2:	pop		%rax
	pop		%rdi
	pop		%rsi
	pop		%rdx
	ret

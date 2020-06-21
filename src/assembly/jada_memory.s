/**
 * La memòria dinàmica de JADA permet crear vectors de múltiples
 * dimensions de mida variable, és el seu únic ús.
 * Els blocs de memòria dinàmica són necessàriament de mida variable
 * i es poden dividir en una capçalera i les dades.
 * La capçalera conté:
 * 1) Les dimensions del vector
 * 2) Dades sobre el propi bloc (estat, comptador, següent bloc)
 *
 * Referències: 
 * - https://baptiste-wicht.com/posts/2012/08/memory-manager-intel-assembly-64-linux.html
 * - https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
 */

.global jada_init
.global jada_free
.global jada_malloc
.global jada_reference_add
.global jada_reference_decrement

.equ BLOCK_HEADER, 29
.equ BLOCK_STATE_OFFSET, 0
.equ BLOCK_COUNTER_OFFSET, BLOCK_STATE_OFFSET + 1
.equ BLOCK_PREV_OFFSET, 5
.equ BLOCK_NEXT_OFFSET, BLOCK_PREV_OFFSET + 8
.equ BLOCK_SIZE_OFFSET, 21
.equ BLOCK_DATA_OFFSET, BLOCK_SIZE_OFFSET + 8

.bss
.data
jada_memory_free:	.quad	0		/* indica quin és el primer bloc lliure */
jada_memory_start:	.quad 	0	/* adreça de l'inici del heap */
jada_memory_end:	.quad	0	/* adreça de final del heap */

.text

call	jada_init

push	$8
push	$0
call	jada_malloc
pop		%r10
addq	$8, %rsp

movq	$0xF00F1234, %rax
movq	%rax, (%r10)

push	$8
push	$0
call	jada_malloc
pop		%r10
addq	$8, %rsp
movq	$0xE00E5678, %rax
movq	%rax, (%r10)

push	%r10
call	jada_free
addq	$8, %rsp

push	$4
push	$0
call	jada_malloc
pop		%r10
addq	$8, %rsp

push	%r10
call	jada_free
addq	$8, %rsp

push	$4
push	$0
call	jada_malloc
pop		%r10
addq	$8, %rsp

movq $1, %rax
movq $0, %rbx
int	$0x80


jada_init:
	/* s'encarrega d'inicialitzar el sistema de memòria dinàmica */

	/* obtenir l'adreça del final del bloc del programa */
	movq	$12, %rax	/* sys_brk system call */
	xorq	%rdi, %rdi	/* indica que es vol obtenir l'adreça */
	syscall

	/* inicialment l'inici i el final coincideixen */
	movq	%rax, jada_memory_start
	movq	%rax, jada_memory_end

	ret

/**
 * Realitza una reserva d'un nou bloc 
 * Paràmetres: 
 * 1) in - Mida de l'espai que es vol reservar en bytes (8 bytes)
 * 2) out - adreça on comença el bloc de dades (8 bytes)
 */
jada_malloc:
.equ malloc_local, 8 * 4	/* mida de les variables locals */
	push	%rbp
	push 	%r8
	push 	%r9
	push 	%rax

	movq	8+8+malloc_local(%rsp), %r8

	/* trobar el primer bloc lliure que s'adapta bé */
	movq	jada_memory_free, %rbp

.loop:
	testq	%rbp, %rbp	/* comprova si esteim dins el rang de blocs */
	je		.alloc		/* if %rbp = 0 goto .alloc */

	cmpq	BLOCK_SIZE_OFFSET(%rbp), %r8	/* compara la mida del bloc amb la mida de la petició */
	jle		.trobat		/* if %r8 <= mida bloc goto trobat */

	/* no s'ha trobat, s'ha de mirar el seguent bloc */
	movq	BLOCK_NEXT_OFFSET(%rbp), %rbp
	jmp		.loop

.trobat:
	/* s'ha trobat un bloc suficientment gran */
	/* eliminar el bloc de la llista de lliures */
	cmpq	jada_memory_free, %rbp
	je		.bloc_start

	/* actualitzar els punters anteriors i seguent del bloc */
	movq	BLOCK_PREV_OFFSET(%rbp), %rax	/* bloc.anterior.next = bloc.next */
	movq	BLOCK_NEXT_OFFSET(%rbp), %r9
	movq	%r9, BLOCK_NEXT_OFFSET(%rax)

	movq	BLOCK_NEXT_OFFSET(%rbp), %rax
	je		.bloc_update					/* if bloc.next = 0 goto bloc_update (no hi ha més blocs) */

	movq	BLOCK_PREV_OFFSET(%rbp), %r9	/* bloc.next.prev = bloc.prev */
	movq	%r9, BLOCK_PREV_OFFSET(%rax)

	jmp		.bloc_update

.bloc_start:
	/* el bloc trobat és la capçalera de la llista */
	movq	jada_memory_free, %rax
	lea		BLOCK_HEADER(%rax), %rax
	movq	%rax, 8+malloc_local(%rsp) /* guardar adreça bloc retorn */
	movq	%rax, %r9

	movq	BLOCK_NEXT_OFFSET(%rbp),%rax
	movq	%rax, jada_memory_free
	jne		1f

	/* la capçalera actual no és 0 */
	movq	$0, jada_memory_free + BLOCK_PREV_OFFSET

1:
	movq	%r9, %rbp
	movb	$0xFF, BLOCK_STATE_OFFSET(%rbp)

.bloc_update:

	jmp		.end

.alloc:
	/* comprovar que hi ha realment espai */
	lea		BLOCK_HEADER(%r8), %rdi		/* mida del bloc que es vol reservar + header */
	addq	jada_memory_end, %rdi

	cmpq	%rdi, %rsp
	js		.not_enough_memory			/* if %rsp - %rdi < 0 goto not_enough_memory */

	movq	$12, %rax					/* sys_brk system call */
	syscall

	/* indicar l'adreça de l'inici de les dades */
	movq	jada_memory_end, %r9
	addq	$BLOCK_HEADER, %r9
	movq	%r9, 8+malloc_local(%rsp)

	/* incialitzar la informació del bloc */
	movq	jada_memory_end, %rbp
	movq	8+8+malloc_local(%rsp), %r8		/* indica la mida del bloc al bloc */
	movq	%r8, BLOCK_SIZE_OFFSET(%rbp)

	movb	$0xFF, BLOCK_STATE_OFFSET(%rbp)
	movw	$0, BLOCK_COUNTER_OFFSET(%rbp)	/* indicar que no hi ha cap referència al bloc */

	/* actualitzar l'end del heap */
	movq	%rdi, jada_memory_end

.not_enough_memory:


.end:
	pop		%rax
	pop		%r9
	pop		%r8
	pop		%rbp
	ret

/**
 * Les adreces vàlides, assignades per jada_malloc, es troben
 * a la regió [jada_memory_start, jada_memory_end]
 * Paràmetres:
 * 1) adreça del bloc que es vol alliberar, que indica l'inici de les dades
 */
jada_free:
.equ free_local, 8* 2 
	push	%rbp
	push	%r8

	/* obtenir el prinicipi del bloc (no dades) */
	movq	8+free_local(%rsp), %rbp
	subq	$BLOCK_HEADER, %rbp

	/* només es pot alliberar el bloc si el seu comptador és 0 */
	cmpw	$0, BLOCK_COUNTER_OFFSET(%rbp)
	jne		1f		/* el bloc està referenciat per algú */

.free_block:
	/* marcar el bloc com a lliure */
	movb	$0, BLOCK_STATE_OFFSET(%rbp)
	
	/* enllaçar-lo a la llista de lliures */
	movq	$0, BLOCK_PREV_OFFSET(%rbp)
	movq	jada_memory_free, %r8
	movq	%r8, BLOCK_NEXT_OFFSET(%rbp)
	movq	%rbp, jada_memory_free

1:
	pop		%r8
	pop		%rbp
	ret

/**
 * Incrementa el valor del comptador
 * Paràmetres:
 * 1) Adreça del bloc, retornada pel jada_malloc
 */
jada_reference_add:
.equ reference_add_local, 8
	push	%rbp

	/* recuperar l'adreça passada per paràmetre */
	movq	8+reference_add_local(%rsp), %rbp
	subq	$BLOCK_HEADER, %rbp		/* inici del bloc de memòria */

	/* comprovar que l'adreça es troba entre les adreces d'inici i final */
	cmpq	jada_memory_start, %rbp
	js		1f

	cmpq	jada_memory_end, %rbp
	jns		1f

	incw	BLOCK_COUNTER_OFFSET(%rbp)

1:	pop		%rbp
	ret


/**
 * Decrementa el valor del comptador
 * Paràmetres:
 * 1) Adreça del bloc, retornada pel jada_malloc
 */
jada_reference_decrement:
.equ reference_decrement_local, 8
	push	%rbp

	/* recuperar l'adreça passada per paràmetre */
	movq	8+reference_add_local(%rsp), %rbp
	subq	$BLOCK_HEADER, %rbp		/* inici del bloc de memòria */

	/* comprovar que l'adreça es troba entre les adreces d'inici i final */
	cmpq	jada_memory_start, %rbp
	js		1f

	cmpq	jada_memory_end, %rbp
	jns		1f

	decw	BLOCK_COUNTER_OFFSET(%rbp)
	jne		1f

	/* alliberar la memòria, té 0 referències */
	push	8+reference_add_local(%rsp)
	call	jada_free
	addq	$8, %rsp

1:	pop		%rbp
	ret

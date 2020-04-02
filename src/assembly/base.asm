/**
  * as <filename.asm> -o <filename.out>
  * ld <filename.out> -o <filename.exe>
  * ./<filename>.exe (.exe pel .gitignore)
  */

.global _start

.data
	/* variables inicialitzades */
testStr:	.ascii "Hola Jaume com estas?\n"
			.byte 0

a:			.int	5
b:			.int	7

.bss
	/* variables no inicialitzades */

prova:		.fill 1, 4

.text
	/* codi del programa */

/* system calls: http://shell-storm.org/shellcode/files/syscalls.html */
/* 64 bits sys calls: https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/ */

print:
	movq	8(%rsp), %rax

loop:
	cmpb	$0, (%rax)
	jz		end

	pushq	%rax

	movq	%rax, %rcx 
	movl	$4, %eax
	movl	$0, %ebx	/* file descriptor */
	movl	$1, %edx
	int		$0x80

	popq	%rax
	incq	%rax

	jmp		loop
end:
	ret

/* https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_5.html local labels */

printInt:
	/* 
		reservar un espai de 32 bytes per representar el dígit
		la longitud màxima serà de 20 caràcters (inclòs el signe)
	*/
	movq	$0, %rax
	movl	8(%rsp), %eax 	/* depèn de la mida d'un integer */
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
	ret

_start:
	/*leaq	testStr, %rax*/

	/* quan es fa un push sp decreix, és a dir, la pila creix cap amunt */

	pushq	$testStr
	call	print
	addq	$8, %rsp

	pushq	$-245655555
	call	printInt
	addq	$4, %rsp

	/* cridar el final del programa */
	movq $1, %rax
	movq $0, %rbx
	int	$0x80

/* Manual: https://www.amd.com/system/files/TechDocs/24592.pdf */
/* https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax#Operation_Suffixes */
/* $<valor> mode immediat */
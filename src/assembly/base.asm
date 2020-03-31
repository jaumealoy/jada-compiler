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

.bss
	/* variables no inicialitzades */

prova:		.fill 1, 4

.text
	/* codi del programa */

/* system calls: http://shell-storm.org/shellcode/files/syscalls.html */

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

_start:
	/*leaq	testStr, %rax*/

	/* quan es fa un push sp decreix, és a dir, la pila creix cap amunt */

	pushq	$testStr
	call	print
	addq	$8, %rsp

	/* cridar el final del programa */
	movq $1, %rax
	movq $0, %rbx
	int	$0x80

/* Manual: https://www.amd.com/system/files/TechDocs/24592.pdf */
/* https://en.wikibooks.org/wiki/X86_Assembly/GAS_Syntax#Operation_Suffixes */
/* $<valor> mode immediat */

    .text
G_.str.0:
	.asciz	"ABCD\347\232\204\345\274\200\345\217\221\350\264\267\346\254\276"
    .global _main
    .p2align 4, 0x90
_main:
    pushq   %rbp
    movq    %rsp, %rbp

    leaq    G_.str.0(%rip), %rdi
    callq   _printf

    xorq    %rax, %rax

    popq    %rbp
    retq
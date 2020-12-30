    .section __TEXT, __text
    .globl _main

_main:
    pushq %rbp
    movq %rsp, %rbp

    movq $0x2000004, %rax
    movq $0x1, %rdi         
    leaq L_.str.0(%rip), %rsi
    movq $L_.str.0.length, %rdx
    syscall

    popq %rbp

    movq $0x0, %rax
    retq

L_.str.0:                                 ## @.str
	.asciz	"ABCD\347\232\204\345\274\200\345\217\221\350\264\267\346\254\276"
L_.str.0.length = . - L_.str.0


/*
int main(int argc, char *argv[]) {
    printf("ABCD的开发贷款0");
    return 0;
}
*/


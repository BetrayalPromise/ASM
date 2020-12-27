    
    .text
output:    
    .asciz "output: 0x%x, 0x%x, 0x%x, 0x%x\n"

    .global _main
    .p2align 4, 0x90

_main:
    pushq   %rbp
    movq    %rsp, %rbp

    leaq    output(%rip), %rdi
    movq    $-11, %rsi
    movq    $11, %rdx
    movq    $11.34236, %rcx
    movq    $-11.34236, %r8
    callq    _printf

    popq    %rbp
    retq
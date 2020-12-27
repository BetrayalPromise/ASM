    .global _main
    p2align 4, 0x90

_main:
    pushq   %rbp
    movq    %rsp, %rbp

    popq    %rbp
    retq
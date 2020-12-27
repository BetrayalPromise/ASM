    .global _main

_main:
    pushq   %rbp
    movq    %rsp, %rbp
    movq    $0x2000003, %rax
    syscall
    movq    $0x0, %rax
    popq    %rbp
    retq


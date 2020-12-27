    .global _main
    .p2align 4, 0x90
_main:
    pushq   %rbp
    movq    %rsp, %rbp
    movq    $0x2000003, %rax
    syscall
    movq    $0x0, %rax
    popq    %rbp
    retq


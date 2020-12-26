    .data
path:
    .asciz	"/Users/user0/Desktop/163.txt"

    .global _main

_main:
    pushq   %rbp
    movq    %rsp, %rbp

    movq    $0x2000005, %rax
    movq    path(%rip), %rdi
    movq    $0x01, %rsi
    syscall

    movq    $0, %rax
    popq    %rbp
    retq
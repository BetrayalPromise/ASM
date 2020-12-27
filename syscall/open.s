    .section __DATA, __data
path:
    .asciz	"/Users/user0/Desktop/163.txt"
    .section __TEXT, __text
    .global _main
    .p2align 4, 0x90
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
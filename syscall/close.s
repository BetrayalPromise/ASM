    .section __TEXT, __text
    .global _main
    .p2align 4, 0x90

_main:
    pushq %rbp
    movq %rsp, %rbp
    xorq %rax, %rax
    popq %rbp
    retq
# output.s
    .section    __TEXT, __cstring
output:
    .asciz  "output, %d\n"
    .text
    .globl _main

_main:
    pushq %rbp
    leaq output(%rip), %rdi
    movq $114514, %rsi
    movb $0, %al

    callq _printf
    popq %rbp

    movq $0, %rax
    retq
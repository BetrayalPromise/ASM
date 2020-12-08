# helloworld.s    
    .section    __TEXT, __cstring
helloworld:
    .asciz  "helloworld, %d\n"
    .text
    .globl  _main
_main:
    pushq   %rbp
    leaq    helloworld(%rip), %rdi
    movq    $0x1bf52, %rsi
    movq    $0x0, %rax
    callq   _printf

    popq    %rbp
    movq    $0, %rax
    retq
# 调用C库函数    
    .section    __TEXT, __cstring
helloworld:
    .asciz  "helloworld\n"
    .text
    .globl  _main
_main:
    pushq   %rbp
    movq   %rsp, %rbp
# libcall
    leaq    helloworld(%rip), %rdi
    callq   _printf

    popq    %rbp
    movq    $0x0, %rax
    retq
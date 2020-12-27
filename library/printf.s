# 调用C库函数    
    .section    __TEXT, __cstring
helloworld:
    .asciz  "hello world!\n"
    .text
    .global  _main
_main:
    pushq   %rbp
    movq    %rsp, %rbp
# libcall
    callq   _use_libcall
    popq    %rbp
    movq    $0x0, %rax
    retq

# void libcall(void)
_use_libcall:
    pushq   %rbp
    movq    %rsp, %rbp
    leaq    helloworld(%rip), %rdi
    callq   _printf
    popq    %rbp
    retq

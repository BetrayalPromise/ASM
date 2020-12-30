# 调用C库函数 
    .section __TEXT, __cstring
helloworld:
    .asciz "hello world!\n"
    .section __TEXT, __text
    .global _main
_main:
    pushq %rbp
    movq %rsp, %rbp
    callq   _use_libcall
    movq $0x0, %rax
    popq %rbp
    retq

# void libcall(void)
_use_libcall:
    pushq   %rbp
    movq %rsp, %rbp
    leaq helloworld(%rip), %rdi
    callq   _printf
    popq %rbp
    retq

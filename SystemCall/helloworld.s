# helloworld.s
    .data
message:
    .asciz "hello, world!\n"
length = . - message

    .text
    .globl _main                    # must be declared for linker
_main:
    # 系统调用号，_write
    movl    $0x2000004, %eax
    # 文件描述符      
    movl    $1, %edi
    # 显示的字符数              
    leaq    message(%rip), %rsi  
    # 缓冲区指针   
    movl    $14, %edx
    syscall

    movq    $0x2000001, %rax
    movq    $0x0, %rdi                           
    syscall

#    movq $0x0, %rax
#    retq
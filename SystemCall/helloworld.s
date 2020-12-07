# helloworld.s

    .data
message:
    .ascii "hello world"
length = . - message

    .text
    .global _main           # must be declared for linker
_main:
    movq    $200004, %rax           # 系统调用号，_write  
    movq    $1, %rdi                # 文件描述符  
    movq    message(%rip), %rsi     # 缓冲区指针  
    movq    length(%rip), %rdx      # 显示的字符数  
    syscall

    movq    $2000001, %rax          # 系统调用号，_exit
    movq    $0, %rdi                # 传给_exit的参数
    syscall
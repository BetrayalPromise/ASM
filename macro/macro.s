# __DATA段中，__data节存放所有非const的已经被初始化过的变量，__bss节存放所有未被初始化的static的变量，__common节存放所有未被初始化过的外部全局变量

#.section __DATA, __data # 等同于.data
#   .byte(1B)
#   .short(2B)
#   .long(4B)
#   .quad(8B)

    
    .section    __TEXT, __cstring
output:    .asciz "output: %d\n"

    .data
value:  .quad 0x114514
    .text
    .global _main
    .p2align    4, 0x90

#64位模式不再支持硬编码形式 需要借助rip寄存器的取标签的PIC地址

_main:
    pushq   %rbp
    movq    %rsp, %rbp
    leaq    output(%rip), %rdi
    movq    value(%rip), %rsi
    callq   _printf

    xorq    %rax, %rax
    popq    %rbp
    retq
# label.s
# __DATA段中，__data节存放所有非const的已经被初始化过的变量，__bss节存放所有未被初始化的static的变量，__common节存放所有未被初始化过的外部全局变量

#.section __DATA, __data # 等同于.data
#   .byte(1B)
#   .short(2B)
#   .long(4B)
#   .quad(8B)

    .data
a:  .quad 0x114514  ; 类似C语言的宏, a会被替换为0x114514
    .globol _main

#64位模式不再支持硬编码形式 需要借助rip寄存器的取标签的PIC地址

_main:
    movq    a(%rip), %rax
    xorq    %rax, %rax
    retq
# 使用系统调用处理
    .data
message:
#    .asciz "hello, world!\n"
    .string	"ABCD\347\232\204\345\274\200\345\217\221\350\264\267\346\254\276"
length = . - message

    .text
    .globl _main                    # must be declared for linker
_main:
    #系统调用号，write
    movq    $0x2000004,     %rax
    movq    $0x1,           %rdi         
    leaq    message(%rip),  %rsi
    movq    $length,        %dx
    syscall

    # exit系统调用
    movq    $0x2000001,     %rax        
    movq    $0x0,           %rdi
    syscall

#    movq $0x0, %rax
#    retq
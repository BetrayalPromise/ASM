# exit系统调用
    .section __TEXT, __text
    .global _main

/* 
int main() {
    exit(0);
}
 */

_main:
    movq    $0x2000001, %rax   ;系统调用号
    movq    $0, %rdi           ;传递参数
    syscall
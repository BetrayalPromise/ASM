# 函数模版
    .section __TEXT, __text
    .global _main
/* 
int main(int argc, char * argv[]) {
    return 0;
}
 */

_main:
    pushq   %rbp
    movq    %rsp, %rbp
    movq    $0, %rax
    popq    %rbp
    retq



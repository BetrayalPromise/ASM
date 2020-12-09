# 函数模版
.section __TEXT, __text
.global _main
/* 
int main() {
    return 0;
}
 */

/* 
_main:
    pushq %rbp
    movq %rbp, %rsp
    movq $0, %rax
    popq %rbp
    retq 
*/


/* 
int main() {
    exit(0);
}
 */

_main:
    movq $0x2000001, %rax
    movq $0, %rdi
    syscall
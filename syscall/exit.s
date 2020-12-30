# exit系统调用
    .section __TEXT, __text
    .global _main
    .p2align 4, 0x90

/* 
int main() {
    exit(0);
}
 */

_main:
    pushq %rbp
    movq %rsp, %rbp

# syscall exit(0)
    movq $0x2000001, %rax   # 系统调用号
    movq $0, %rdi           # 传递参数
    syscall

    popq %rbp
    retq
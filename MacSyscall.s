    .globl _mac_syscall

_mac_syscall:
    pushq %rbp
    movq %rbp, %rsp
    movq $0x0000000000000002, %rax
    shlq $0x18, %rax
    addq %rdi, %rax
    popq %rbp
    retq
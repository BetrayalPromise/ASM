    .section __TEXT, __text
    .globol _main

_main:
    movq $0x4, %rdi
    callq _bsdsyscall
    movq $0, %rax
    retq

# return mosOS system call number
# uint bassyscall(uint number) 
_bsdsyscall:
    pushq %rbp
    movq %rsp, %rbp
    movq $0x0000000000000002, %rax
    shlq $0x18, %rax
    addq %rdi, %rax
    popq %rbp
    retq

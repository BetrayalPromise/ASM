    .global _main

_main:
    movq    $0x2000003, %rax
    syscall

    movq    $0x0, %rax
    retq


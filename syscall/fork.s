    .global _main

_main:
    movq    $0x2000003, %rax
    syscall

    xorq    %rax, %rax
    retq


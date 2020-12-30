    .global _main
    .p2align 4, 0x90

_main:
    pushq %rbp
    movq %rsp, %rbp

    popq %rbp
    retq

/* 
    for i in 0..<100 {
        let iValue = String(i)
        print(iValue)
    }
 */
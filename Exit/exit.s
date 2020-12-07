# exit.s
.section __TEXT, __text
.global _main

_main:
#    movq $0, %rax
#    retq

    movq $0x2000001, %rax
    movq $0, %rdi
    syscall

# 等价于
# int main() {
#	return 0;
# }
#
# 函数模版
.section __TEXT, __text
.global _main

_main:
//    return 0
#    movq $0, %rax
#    retq

#   exit(0)
    movq $0x2000001, %rax
    movq $0, %rdi
    syscall

# 等价于
# int main() {
#	return 0;
# }
#
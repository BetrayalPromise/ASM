# Stack.s
	.global _main
	.p2align 4, 0x90
_main:
	pushq %rbp            	# rbp(通常存放函数栈帧基地址)
	movq %rsp, %rbp     		# 清空栈
	subq $0x24, %rsp       	# 栈生长0x24(栈顶正向移动0x24)
	
	movq $0x0, -0x8(%rbp)  	# 0x0入栈
	movq $0x1, -0xf(%rbp)  	# 0x1入栈
	movq $0x2, -0x18(%rbp) 	# 0x2入栈
	
	movq $0, %rax        	# rax(通常存放函数返回值)值修改为0x0
	
	movq %rbp, %rsp      	# 清空栈
	popq %rbp            	# 还原rbp之前存放的值
	retq                    # 返回
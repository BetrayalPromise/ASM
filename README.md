# X86汇编
## 寄存器
### 1.认识寄存器
r开头的是64bit(例如rax,rbx,rcx,rdx...), e开头的32bit(例如eax,ebx,ecx,edx...), h表示高几位(例如ah,bh,ch,dh...), l表示低几位(例如al,bl,cl,dl...)
### 2.寄存器名称
%rax,%rbx,%rcx,%rdx,%esi,%edi,%rbp,%rsp,%r8,%r9,%r10,%r11,%r12,%r13,%r14
### 3.rax(常保存函数返回数据,系统调用时用以保存系统调用号)
### 4.%rbp 栈指针寄存器，指向栈底
### 5.%rsp 栈指针寄存器，指向栈顶
### 6.%rdi，%rsi，%rdx，%rcx，%r8，%r9 用作函数参数，依次对应第1参数，第2参数...,超过6个用栈传递(反汇编swift时候发现,串参数依次为rdi,rsi,rdx,rcx,r8,r9,rax,r10,r11,rbx,r14,r15,r12,r13超过的才使用栈传递,共计14个寄存器穿参数)
Swift代码
```swift
let a0 = 0
let a1 = 1
let a2 = 2
let a3 = 3
let a4 = 4
let a5 = 5
let a6 = 6
let a7 = 7
let a8 = 8
let a9 = 9
let a10 = 10
let a11 = 11
let a12 = 12
let a13 = 13
let a14 = 14
let a15 = 15
let a16 = 16

show(a0: a0, a1: a1, a2: a2, a3: a3, a4: a4, a5: a5, a6: a6, a7: a7, a8: a8, a9: a9, a10: a10, a11: a11, a12: a12, a13: a13, a14: a14, a15: a15, a16: a16)

func show(a0: Int, a1: Int, a2: Int, a3: Int, a4: Int, a5: Int, a6: Int, a7: Int, a8: Int, a9: Int, a10: Int, a11: Int, a12: Int, a13: Int, a14: Int, a15: Int, a16: Int) {
    print(a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10)
}
```
Assembly代码
```Assembly
0x10000258b <+27>:  callq  0x100002550               ; show
0x100002590 <+32>:  movq   $0x0, 0x5bf5(%rip)        ; Swift51Overrides + 180
0x10000259b <+43>:  movq   $0x1, 0x5bf2(%rip)        ; ASM.a0 : Swift.Int + 4
0x1000025a6 <+54>:  movq   $0x2, 0x5bef(%rip)        ; ASM.a1 : Swift.Int + 4
0x1000025b1 <+65>:  movq   $0x3, 0x5bec(%rip)        ; ASM.a2 : Swift.Int + 4
0x1000025bc <+76>:  movq   $0x4, 0x5be9(%rip)        ; ASM.a3 : Swift.Int + 4
0x1000025c7 <+87>:  movq   $0x5, 0x5be6(%rip)        ; ASM.a4 : Swift.Int + 4
0x1000025d2 <+98>:  movq   $0x6, 0x5be3(%rip)        ; ASM.a5 : Swift.Int + 4
0x1000025dd <+109>: movq   $0x7, 0x5be0(%rip)        ; ASM.a6 : Swift.Int + 4
0x1000025e8 <+120>: movq   $0x8, 0x5bdd(%rip)        ; ASM.a7 : Swift.Int + 4
0x1000025f3 <+131>: movq   $0x9, 0x5bda(%rip)        ; ASM.a8 : Swift.Int + 4
0x1000025fe <+142>: movq   $0xa, 0x5bd7(%rip)        ; ASM.a9 : Swift.Int + 4
0x100002609 <+153>: movq   $0xb, 0x5bd4(%rip)        ; ASM.a10 : Swift.Int + 4
0x100002614 <+164>: movq   $0xc, 0x5bd1(%rip)        ; ASM.a11 : Swift.Int + 4
0x10000261f <+175>: movq   $0xd, 0x5bce(%rip)        ; ASM.a12 : Swift.Int + 4
0x10000262a <+186>: movq   $0xe, 0x5bcb(%rip)        ; ASM.a13 : Swift.Int + 4
0x100002635 <+197>: movq   $0xf, 0x5bc8(%rip)        ; ASM.a14 : Swift.Int + 4
0x100002640 <+208>: movq   $0x10, 0x5bc5(%rip)       ; ASM.a15 : Swift.Int + 4
0x10000264b <+219>: movq   0x5b3e(%rip), %rdi        ; ASM.a0 : Swift.Int
0x100002652 <+226>: movq   0x5b3f(%rip), %rsi        ; ASM.a1 : Swift.Int
0x100002659 <+233>: movq   0x5b40(%rip), %rdx        ; ASM.a2 : Swift.Int
0x100002660 <+240>: movq   0x5b41(%rip), %rcx        ; ASM.a3 : Swift.Int
0x100002667 <+247>: movq   0x5b42(%rip), %r8         ; ASM.a4 : Swift.Int
0x10000266e <+254>: movq   0x5b43(%rip), %r9         ; ASM.a5 : Swift.Int
0x100002675 <+261>: movq   0x5b44(%rip), %rax        ; ASM.a6 : Swift.Int
0x10000267c <+268>: movq   0x5b45(%rip), %r10        ; ASM.a7 : Swift.Int
0x100002683 <+275>: movq   0x5b46(%rip), %r11        ; ASM.a8 : Swift.Int
0x10000268a <+282>: movq   0x5b47(%rip), %rbx        ; ASM.a9 : Swift.Int
0x100002691 <+289>: movq   0x5b48(%rip), %r14        ; ASM.a10 : Swift.Int
0x100002698 <+296>: movq   0x5b49(%rip), %r15        ; ASM.a11 : Swift.Int
0x10000269f <+303>: movq   0x5b4a(%rip), %r12        ; ASM.a12 : Swift.Int
0x1000026a6 <+310>: movq   0x5b4b(%rip), %r13        ; ASM.a13 : Swift.Int
0x1000026ad <+317>: movq   %rax, -0x40(%rbp)         ; 将rax存的值放在栈开始地址负向偏移0x40处
0x1000026b1 <+321>: movq   0x5b48(%rip), %rax        ; ASM.a14 : Swift.Int
0x1000026b8 <+328>: movq   %rax, -0x48(%rbp)         ; 将rax存的值放在栈开始地址负向偏移0x48处
0x1000026bc <+332>: movq   0x5b45(%rip), %rax        ; ASM.a15 : Swift.Int
0x1000026c3 <+339>: movq   %rax, -0x50(%rbp)         ; 将rax存的值放在栈开始地址负向偏移0x48处
0x1000026c7 <+343>: movq   0x5b42(%rip), %rax        ; ASM.a16 : Swift.Int

```
### 7.%rbx，%rbp，%r12，%r13，%14，%15 用作数据存储，遵循被调用者使用规则，简单说就是随便用，调用子函数之前要备份它，以防他被修改
### 8.%r10，%r11 用作数据存储，遵循调用者使用规则，简单说就是使用之前要先保存原值
### 9.X86架构中栈是向高地址生长的
### 10.$0x开头为立即数
### 11.0x开头为内存地址
# X86汇编
## 寄存器
### 1.认识寄存器
r开头的是64bit(例如rax,rbx,rcx,rdx...), e开头的32bit(例如eax,ebx,ecx,edx...), h表示高几位(例如ah,bh,ch,dh...), l表示低几位(例如al,bl,cl,dl...)
### 2.寄存器名称
%rax,%rbx,%rcx,%rdx,%esi,%edi,%rbp,%rsp,%r8,%r9,%r10,%r11,%r12,%r13,%r14
### 3.rax(常保存函数返回数据,系统调用时用以保存系统调用号)
### 4.%rbp 栈指针寄存器，指向栈底
### 5.%rsp 栈指针寄存器，指向栈顶
### 6.%rdi，%rsi，%rdx，%rcx，%r8，%r9 用作函数参数，依次对应第1参数，第2参数...,超过6个用栈传递(反汇编swift时候发现,超过)
```swift
show()

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

test1(a0: a0, a1: a1, a2: a2, a3: a3, a4: a4, a5: a5, a6: a6, a7: a7, a8: a8, a9: a9, a10: a10, a11: a11, a12: a12, a13: a13, a14: a14, a15: a15, a16: a16)

func test1(a0: Int, a1: Int, a2: Int, a3: Int, a4: Int, a5: Int, a6: Int, a7: Int, a8: Int, a9: Int, a10: Int, a11: Int, a12: Int, a13: Int, a14: Int, a15: Int, a16: Int) {
    print(a0 + a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10)
}
```
### 7.%rbx，%rbp，%r12，%r13，%14，%15 用作数据存储，遵循被调用者使用规则，简单说就是随便用，调用子函数之前要备份它，以防他被修改
### 8.%r10，%r11 用作数据存储，遵循调用者使用规则，简单说就是使用之前要先保存原值

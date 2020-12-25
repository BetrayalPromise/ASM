# X86汇编
## 汇编知识点
### 1.认识寄存器
r开头的是64bit(例如rax,rbx,rcx,rdx...), e开头的32bit(例如eax,ebx,ecx,edx...), h表示高几位(例如ah,bh,ch,dh...), l表示低几位(例如al,bl,cl,dl...)
### 2.寄存器名称
%rax,%rbx,%rcx,%rdx,%esi,%edi,%rbp,%rsp,%r8,%r9,%r10,%r11,%r12,%r13,%r14
### 3.rax(常保存函数返回数据,系统调用时用以保存系统调用号)
### 4.%rbp 栈指针寄存器，指向栈底
### 5.%rsp 栈指针寄存器，指向栈顶
### 6.%rdi,%rsi,%rdx,%rcx,%r8,%r9用作函数参数，依次对应第1参数，第2参数...,超过6个用栈传递(反汇编swift时候发现,串参数依次为rdi,rsi,rdx,rcx,r8,r9,rax,r10,r11,rbx,r14,r15,r12,r13超过的才使用栈传递,共计14个寄存器穿参数)
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
0x1000026c3 <+339>: movq   %rax, -0x50(%rbp)         ; 将rax存的值放在栈开始地址负向偏移0x50处
0x1000026c7 <+343>: movq   0x5b42(%rip), %rax        ; ASM.a16 : Swift.Int
0x1000026ce <+350>: movq   %rax, -0x58(%rbp)         ; 将rax存的值放在栈开始地址负向偏移0x58处

```
### 7.%rbx，%rbp，%r12，%r13，%14，%15 用作数据存储，遵循被调用者使用规则，简单说就是随便用，调用子函数之前要备份它，以防他被修改
### 8.%r10，%r11 用作数据存储，遵循调用者使用规则，简单说就是使用之前要先保存原值
### 9.X86架构中栈是向高地址生长的
### 10.$0x开头为立即数
### 11.0x开头为内存地址
### 12.a(b,c)这种类型的汇编指令理解因为我b*c+a,且c的值一般为1,2,4较为常见(个人猜测应该和内存对齐有关)
### 13.AT&T汇编赋值是与Intel汇编理解相反的,顺着读,与高级语言读法相反
## 第一个汇编程序(hello world!)程序员都懂得
### 1.新建一个文本文件,文件名随便,后缀为.s
```Assembly   
# 调用C库函数printf

; 定义文本段(我自己这么叫的)
    .section    __TEXT, __cstring
; 定一个字符串为"hello world!"
helloworld:							
    .asciz  "hello world!\n"
    .text
; 声明程序入口为_main
    .globl  _main
; main函数主题
_main:
; 栈底指针入栈
    pushq   %rbp
; 将rsp的值赋值给rbp
    movq    %rsp, %rbp
# libcall
; 调用_use_libcall函数
    callq   _use_libcall
; 栈底指针出栈恢复调用前现场
    popq    %rbp
; 将0x0赋值给rax相当于return 0的作用
    movq    $0x0, %rax
; 函数结束
    retq

# void libcall(void)
_use_libcall:
; 栈底指针入栈
    pushq   %rbp
; 将rsp的值赋值给rbp
    movq    %rsp, %rbp
; 取得helloworld变量的存放位置(简单理解就是指针)
    leaq    helloworld(%rip), %rdi
; 调用 print函数
    callq   _printf
; 栈底指针出栈恢复调用前现场
    popq    %rbp
; 函数结束
    retq
```
### 2.汇编,链接,执行
```Shell
汇编
as asm1.s -o asm1.o
链接
ld asm1.o -o asm1 -lSystem
或者一步到位(个人习惯一步到位方便省事,以后大多使用clang处理)
clang asm1.s -o asm1
执行
cd到asm1所在的目录,输入./asm1回车就可以看到hello world!了
```
### 3.调试
```Shell
//加入调试
clang -g asm1.s -o asm1
//载入程序
lldb asm1 
// main函数处下断点
b mian
// 跑起来
run
大多使用lldb指令自行百度(以后关于lldb会专门开一个章节讲解)
```
### 4.汇编代码如何给Swift用
本人目前能够正常运行的方法是将写好的汇编代码以C函数的方式向上暴露接口,写一个C语言的.h和.c文件将汇编函数用
```Assembly
    .data
message:
#    .asciz "hello, world!\n"
    .asciz    "ABCD\347\232\204\345\274\200\345\217\221\350\264\267\346\254\276"
length = . - message

    .text
    .globl _show

_show:
    movq    $0x2000004,     %rax
    movq    $0x1,           %rdi
    leaq    message(%rip),  %rsi
    movq    $length,        %rdx
    syscall
    retq
```
tool.h
```C
extern void show(void);
```
tool.c
```C
extern void show(void);
```
可以通桥接方式引入工程,SPM暂时未测试,就可以直接调用汇编的show函数了

### 5.系统调用
系统调用在/usr/include/sys/syscall.h中定义
SYS_exit0
```C
#define	SYS_exit 1
```


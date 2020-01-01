# 需要安装的软件
```
apt-get install gcc-multilib
apt-get install gdb
```

# 编译
```
gcc -m32 -fPIC -shared -o lib.so lib.c
gcc -m32 -o program1 program1.c ./lib.so
gcc -m32 -o program2 program1.c ./lib.so
```


# 段

```
  [ 1] .interp           PROGBITS        00000154 000154 000013 00   A  0   0  1
  [ 5] .dynsym           DYNSYM          000001e8 0001e8 0000d0 10   A  6   1  4
  [ 6] .dynstr           STRTAB          000002b8 0002b8 0000ca 00   A  0   0  1
  [ 9] .rel.dyn          REL             000003cc 0003cc 000040 08   A  5   0  4
  [10] .rel.plt          REL             0000040c 00040c 000010 08  AI  5  22  4
  [11] .init             PROGBITS        0000041c 00041c 000023 00  AX  0   0  4
  [12] .plt              PROGBITS        00000440 000440 000030 04  AX  0   0 16
  [13] .plt.got          PROGBITS        00000470 000470 000010 08  AX  0   0  8
  [14] .text             PROGBITS        00000480 000480 0001e2 00  AX  0   0 16
  [21] .dynamic          DYNAMIC         00001ed8 000ed8 000100 08  WA  6   0  4
  [22] .got              PROGBITS        00001fd8 000fd8 000028 04  WA  0   0  4
  [23] .data             PROGBITS        00002000 001000 000008 00  WA  0   0  4
```

# 汇编

```
Disassembly of section .plt:

00000440 <.plt>:
 440:	ff b3 04 00 00 00    	pushl  0x4(%ebx)
 446:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 44c:	00 00                	add    %al,(%eax)
	...

00000450 <foobar@plt>:
 450:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 456:	68 00 00 00 00       	push   $0x0
 45b:	e9 e0 ff ff ff       	jmp    440 <.plt>

00000460 <__libc_start_main@plt>:
 460:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 466:	68 08 00 00 00       	push   $0x8
 46b:	e9 d0 ff ff ff       	jmp    440 <.plt>

Disassembly of section .plt.got:

00000470 <__cxa_finalize@plt>:
 470:	ff a3 18 00 00 00    	jmp    *0x18(%ebx)
 476:	66 90                	xchg   %ax,%ax

00000478 <__gmon_start__@plt>:
 478:	ff a3 1c 00 00 00    	jmp    *0x1c(%ebx)
 47e:	66 90                	xchg   %ax,%ax

000005b9 <__x86.get_pc_thunk.dx>:
 5b9:	8b 14 24             	mov    (%esp),%edx
 5bc:	c3                   	ret

000005bd <main>:
 5bd:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 5c1:	83 e4 f0             	and    $0xfffffff0,%esp
 5c4:	ff 71 fc             	pushl  -0x4(%ecx)
 5c7:	55                   	push   %ebp
 5c8:	89 e5                	mov    %esp,%ebp
 5ca:	53                   	push   %ebx
 5cb:	51                   	push   %ecx
 5cc:	e8 23 00 00 00       	call   5f4 <__x86.get_pc_thunk.ax>
 5d1:	05 07 1a 00 00       	add    $0x1a07,%eax
 5d6:	83 ec 0c             	sub    $0xc,%esp
 5d9:	6a 01                	push   $0x1
 5db:	89 c3                	mov    %eax,%ebx
 5dd:	e8 6e fe ff ff       	call   450 <foobar@plt>
 5e2:	83 c4 10             	add    $0x10,%esp
 5e5:	b8 00 00 00 00       	mov    $0x0,%eax
 5ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
 5ed:	59                   	pop    %ecx
 5ee:	5b                   	pop    %ebx
 5ef:	5d                   	pop    %ebp
 5f0:	8d 61 fc             	lea    -0x4(%ecx),%esp
 5f3:	c3                   	ret

000005f4 <__x86.get_pc_thunk.ax>:
 5f4:	8b 04 24             	mov    (%esp),%eax
 5f7:	c3                   	ret
 5f8:	66 90                	xchg   %ax,%ax
 5fa:	66 90                	xchg   %ax,%ax
 5fc:	66 90                	xchg   %ax,%ax
 5fe:	66 90                	xchg   %ax,%ax
 ```

# PLT

PLT是.text的一部分，每项16个字节，
plt[0]是？？？？？
其余plt项，对应一个共享库函数，如PLT[1]对应foobar函数，



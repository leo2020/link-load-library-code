#!/bin/sh
split(){
	echo "------------------------------------------------------------------------"
}

is_mac(){
	os=`uname  -a`	
	return os =~ "Darwin" 
}

echo "编译 a.c , b.c:"
#gcc -c -m32 -fno-builtin -fno_protect_stack a.c b.c
gcc -c -fno-stack-protector  -m32 a.c b.c

split
echo "链接a.o/b.o:"
# ld -lSystem -m elf_i386 a.o b.o -o ab.o
#ld -m elf_i386 -fno-stack-protector -shared --entry main a.o b.o -o ab.o
#ld -static -m elf_i386 -e main -fno-stack-protector b.o a.o -o ab
ld -static -m elf_i386 -e main b.o a.o -o ab

split
echo "a.o的段属性"
objdump -h a.o

split
echo "b.o的段属性"
objdump -h b.o

split
echo "ab.o的段属性"
objdump -h ab.o

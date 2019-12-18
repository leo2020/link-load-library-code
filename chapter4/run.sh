#!/bin/sh
split(){
	echo "  ---------------------------------------------"
}

split_bold(){
	echo "##############################################################################"
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

####################################

echo "a.o的所有"
split_bold

echo "a.o的段属性"
objdump -h a.o

split
echo "a.c的汇编"
objdump -d a.o

split
echo "a.o的其他信息"
readelf --all a.o

####################################

echo "b.o的所有"
split_bold

echo "b.o的段属性"
objdump -h b.o

split
echo "b.c的汇编"
objdump -d b.o

split
echo "b.o的其他信息"
readelf --all b.o

####################################

echo "ab的所有"
split_bold

echo "ab.o的段属性"
objdump -h ab

split
echo "ab的汇编"
objdump -d ab

split
echo "ab的其他信息"
readelf --all ab
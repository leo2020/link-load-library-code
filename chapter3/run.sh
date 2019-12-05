gcc -c SimpleSection.c

echo "--------------------------------------------------------"
echo "显示各类文件信息："
file SimpleSection.o 
file /bin/bash
file /lib/ld-2.6.1.so 

echo "--------------------------------------------------------"
echo "显示编译后的目标文件结构："
objdump -h SimpleSection.o

echo "--------------------------------------------------------"
echo "查看ELF代码、数据和BSS段长度："
size SimpleSection.o

echo "--------------------------------------------------------"
echo "查看ELF代码段："
objdump -s -d SimpleSection.o

echo "--------------------------------------------------------"
echo "查看ELF字符串常量存放情况："
objdump -x -s -d SimpleSection.o

echo "--------------------------------------------------------"
echo "尝试把jpg图作为目标文件的段："
objcopy -I binary -O elf32-i386 -B i386 piginzoo.jpg image.o
objdump -ht image.o

echo "--------------------------------------------------------"
echo "使用readelf查看ELF文件："
readelf -h SimpleSection.o 

echo "--------------------------------------------------------"
echo "使用readelf查看ELF文件段表结构："
readelf -S SimpleSection.o  

echo "--------------------------------------------------------"
echo "显示符号表："
nm SimpleSection.o 

echo "--------------------------------------------------------"
echo "显示ELF文件的符号"
readelf -s SimpleSection.o

echo "--------------------------------------------------------"
echo "显示一些特殊符号"
gcc SpecialSymbol.c -o SpecialSymbol
./SpecialSymbol
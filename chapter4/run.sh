split(){
	echo "------------------------------------------------------------------------"
}

echo "编译 a.c , b.c:"
gcc -c a.c b.c

split
echo "链接a.o/b.o:"
ld -lSystem a.o b.o -o ab.o

split
echo "a.o的段属性"
objdump -h a.o

split
echo "b.o的段属性"
objdump -h b.o

split
echo "ab.o的段属性"
objdump -h ab.o

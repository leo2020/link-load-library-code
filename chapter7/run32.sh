echo "编译动态链接库"
echo "在64位机器下需要安装32库：apt-get install gcc-multilib"
echo "-----------------------------------------------------------------------------------------------"
gcc -m32 -fPIC -shared -o lib.so lib.c
gcc -m32 -o program1 program1.c ./lib.so
gcc -m32 -o program2 program1.c ./lib.so


echo -e "\n查看动态链接库lib.so的装载属性"
echo -e "-----------------------------------------------------------------------------------------------"
readelf -l lib.so



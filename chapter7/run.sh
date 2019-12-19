echo "编译动态链接库"
echo "-----------------------------------------------------------------------------------------------"
gcc -fPIC -shared -o lib.so lib.c
gcc -o program1 program1.c ./lib.so
gcc -o program2 program1.c ./lib.so


echo -e "\n查看动态链接库lib.so的装载属性"
echo -e "-----------------------------------------------------------------------------------------------"
readelf -l lib.so



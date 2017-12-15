
cd 31_libpng
xz -d -k -f libpng-1.6.8.tar.xz
tar -xf libpng-1.6.8.tar
cd libpng-1.6.8


echo Compile...

./configure --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/31_libpng-make.log
make install 2>&1 | tee ../../logs/31_libpng-makeinstall.log


cd ..
rm -rf libpng-1.6.8
rm -f libpng-1.6.8.tar

cd 21_atk
xz -d -k -f atk-2.10.0.tar.xz
tar -xf atk-2.10.0.tar
cd atk-2.10.0


echo Compile...

./configure --enable-static --enable-shared --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/21_atk-make.log
make install 2>&1 | tee ../../logs/21_atk-makeinstall.log


cd ..
rm -rf atk-2.10.0
rm -f atk-2.10.0.tar
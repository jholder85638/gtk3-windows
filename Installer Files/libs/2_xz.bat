
cd 2_xz
bzip2 -d -k -f xz-5.0.5.tar.bz2
tar -xf xz-5.0.5.tar
cd xz-5.0.5


echo Compile...

./configure --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/2_xz-make.log
make install 2>&1 | tee ../../logs/2_xz-makeinstall.log


cd ..
rm -rf xz-5.0.5
rm -f xz-5.0.5.tar
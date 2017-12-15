
cd 33_libfontconfig
gzip -d -f -c fontconfig-2.10.95.tar.gz > fontconfig-2.10.95.tar
tar -xf fontconfig-2.10.95.tar
cd fontconfig-2.10.95


echo Compile...

./configure --disable-docs --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/33_libfontconfig-make.log
make install 2>&1 | tee ../../logs/33_libfontconfig-makeinstall.log


cd ..
rm -rf fontconfig-2.10.95
rm -f fontconfig-2.10.95.tar
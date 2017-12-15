
cd 34_pixman
gzip -d -f -c pixman-0.32.4.tar.gz > pixman-0.32.4.tar
tar -xf pixman-0.32.4.tar
cd pixman-0.32.4


echo Compile...

./configure --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/34_pixman-make.log
make install 2>&1 | tee ../../logs/34_pixman-makeinstall.log


cd ..
rm -rf pixman-0.32.4
rm -f pixman-0.32.4.tar
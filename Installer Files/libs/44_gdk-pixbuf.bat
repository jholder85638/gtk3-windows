
cd 44_gdk-pixbuf
xz -d -k -f gdk-pixbuf-2.30.3.tar.xz
tar -xf gdk-pixbuf-2.30.3.tar
cd gdk-pixbuf-2.30.3


echo Compile...

./configure --with-included-loaders --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/44_gdk-pixbuf-make.log
make install 2>&1 | tee ../../logs/44_gdk-pixbuf-makeinstall.log


cd ..
rm -rf gdk-pixbuf-2.30.3
rm -f gdk-pixbuf-2.30.3.tar
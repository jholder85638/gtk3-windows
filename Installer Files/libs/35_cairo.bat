
cd 35_cairo
xz -d -k -f cairo-1.12.16.tar.xz
tar -xf cairo-1.12.16.tar
cd cairo-1.12.16


echo Save current CFLAGS var, we will restore it later...

export CFLAGS_SAVE="$CFLAGS"

echo Avoid ssize_t conflict in cairo-missing.h...

export CFLAGS="$CFLAGS -D_SSIZE_T_DEFINED"

echo Compile...

./configure --enable-win32=yes --enable-win32-font=yes --enable-png=yes --enable-ft=yes --enable-fc=yes --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/35_cairo-make.log
make install 2>&1 | tee ../../logs/35_cairo-makeinstall.log

echo Copy cairo.def to its final location...

cp src/cairo.def $PREFIX/lib


export CFLAGS="$CFLAGS_SAVE"
unset CFLAGS_SAVE
cd ..
rm -rf cairo-1.12.16
rm -f cairo-1.12.16.tar
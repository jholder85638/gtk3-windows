
cd 12_glib
xz -d -k -f glib-2.38.2.tar.xz
tar -xf glib-2.38.2.tar
cd glib-2.38.2


echo Patch gdbus-codegen for default import path

cd ..
patch -p0 < glib-2.38.2-gdbus-codegen-win32.patch
cd glib-2.38.2 

echo To avoid using pkg-config...

export LIBFFI_CFLAGS=-I"$PREFIX/lib/libffi-3.0.13/include"
export LIBFFI_LIBS=-lffi

echo save current CFLAGS var, we will regenerate it later...
export CFLAGS_SAVE="$CFLAGS"

echo for configure check problems...

export CFLAGS="$CFLAGS -march=i486"

echo for compilation problems...

export CFLAGS="$CFLAGS -mms-bitfields -mthreads"

echo Compile...

./configure --enable-shared --with-pcre=internal --prefix=$PREFIX
make clean
make 2>&1 | tee ../../logs/12_glib-make.log
make install 2>&1 | tee ../../logs/12_glib-makeinstall.log


export CFLAGS="$CFLAGS_SAVE"
unset CFLAGS_SAVE
unset LIBFFI_CFLAGS
unset LIBFFI_LIBS
cd ..
rm -rf glib-2.38.2
rm -f glib-2.38.2.tar
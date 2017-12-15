
cd 51_gtk3
xz -d -k -f gtk+-3.10.6.tar.xz
tar -xf gtk+-3.10.6.tar
cd gtk+-3.10.6


echo Save current CFLAGS var, we will restore it later...

export CFLAGS_SAVE="$CFLAGS"

echo Default Windows version on MinGW is NT4...
echo Here we need to redefine it to XP, as new GTK code
echo uses Monitor stuff depending on XP ifndefs 

export CFLAGS="$CFLAGS -DWINVER=0x0501"

echo Configure...

./configure --enable-win32-backend --enable-broadway-backend --with-included-immodules --prefix=$PREFIX

echo Patching build to avoid gdk.def and gtk.def...

cd ..
patch -p0 < gtk+-3.10.6-gxkdef-win32.patch
cd gtk+-3.10.6

echo Compile...

make clean
make 2>&1 | tee ../../logs/51_gtk3-make.log
make install 2>&1 | tee ../../logs/51_gtk3-makeinstall.log


export CFLAGS="$CFLAGS_SAVE"
unset CFLAGS_SAVE
cd ..
rm -rf gtk+-3.10.6
rm -f gtk+-3.10.6.tar

cd 74_gnome-icon-theme-symbolic
xz -d -k -f gnome-icon-theme-symbolic-3.10.0.1.tar.xz
tar -xf gnome-icon-theme-symbolic-3.10.0.1.tar
cd gnome-icon-theme-symbolic-3.10.0.1


echo Compile...

./configure --prefix=$PREFIX
make 2>&1 | tee ../../logs/74_gnome-icon-theme-symbolic-make.log
make install 2>&1 | tee ../../logs/74_gnome-icon-theme-symbolic-makeinstall.log


cd ..
rm -rf gnome-icon-theme-symbolic-3.10.0.1
rm -f gnome-icon-theme-symbolic-3.10.0.1.tar
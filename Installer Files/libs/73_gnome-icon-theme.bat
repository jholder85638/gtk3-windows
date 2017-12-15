
cd 73_gnome-icon-theme
xz -d -k -f gnome-icon-theme-3.10.0.tar.xz
tar -xf gnome-icon-theme-3.10.0.tar
cd gnome-icon-theme-3.10.0


echo Compile...

./configure --prefix=$PREFIX
make 2>&1 | tee ../../logs/73_gnome-icon-theme-make.log
make install 2>&1 | tee ../../logs/73_gnome-icon-theme-makeinstall.log


cd ..
rm -rf gnome-icon-theme-3.10.0
rm -f gnome-icon-theme-3.10.0.tar
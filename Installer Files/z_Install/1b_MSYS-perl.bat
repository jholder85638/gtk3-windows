@echo off

copy ..\MSYS\Extension\crypt\crypt-1.1_1-3\*.lzma cache
copy ..\MSYS\Extension\perl\perl-5.8.8-1\*.lzma cache
copy ..\MSYS\Extension\expat\expat-2.0.1-1\*.lzma cache

cd cache
..\Tools\xz -d *.lzma
for %%i in (*.tar) do ..\Tools\tar -xf %%i -C C:\\msys\\1.0
del /q *.tar
cd ..

rem Move development files where they should be...
move c:\msys\1.0\include\crypt.h c:\msys\1.0\mingw\include
move c:\msys\1.0\lib\libcrypt.a c:\msys\1.0\mingw\lib

rem Do not depend on msys-crypt-0.dll when compiling GTK+ Broadway
del C:\msys\1.0\lib\libcrypt.dll.a
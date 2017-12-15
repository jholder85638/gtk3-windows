@echo off

copy ..\MSYS\Extension\crypt\crypt-1.1_1-3\*.lzma cache

cd cache
..\Tools\xz -d *.lzma
for %%i in (*.tar) do ..\Tools\tar -xf %%i -C C:\\msys\\1.0\\mingw
del /q *.tar
cd ..

del /q C:\msys\1.0\mingw\bin\msys-crypt-0.dll
del /q C:\msys\1.0\mingw\lib\libcrypt.dll.a
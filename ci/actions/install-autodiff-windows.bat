echo --- current directory: %cd% ---

REM Ensure ninja actually uses MSVC in Windows instead of GCC
set CC=cl.exe
set CXX=cl.exe

REM Activate the conda environment
set PATH=%CONDA%;%CONDA%\Scripts;%CONDA%\Library\bin;%PATH% || goto :error
call activate autodiff || goto :error

echo === Configuring autodiff...
cmake -S . -B build -G Ninja -DCMAKE_INSTALL_PREFIX=install || goto :error
echo === Configuring autodiff...finished!

echo === Building and installing autodiff...
ninja -C build install || goto :error
echo === Building and installing autodiff...finished!

exit /B 0

:error
echo ERROR!
echo Command exit status: %ERRORLEVEL%

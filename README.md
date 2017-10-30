# dotvim
My vimrc config file.

# TODO

+ Autocompletes
+ Search and replace
+ Augroups for managing language specific settings


# COMPILING VIM
git clone git clone git@github.com:vim/vim.git
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsx86_amd64.bat"
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.11.25503\bin\Hostx64\x64\nmake" -f Make_mvc.mak CPU=AMD64 GUI=yes OLE=yes PYTHON3=C:\Users\Shurberto\Miniconda3\ DYNAMIC_PYTHON3=yes PYTHON3_VER=36 CSCOPE=yes FEATURES=HUGE ARABIC=no FARSI=no NETBEANS=yes OPTIMIZE=SPEED

'''package.bat'''
'''
@set SRC=C:\build\vim
@set DST=C:\build\vim73
xcopy %SRC%\runtime %DST% /D /E /H /I /Y %*
xcopy %SRC%\src\xxd\xxd.exe %DST%\* /D /Y %*
xcopy %SRC%\src\GvimExt\gvimext.dll %DST%\* /D /Y %*
xcopy %SRC%\src\*.exe %DST%\* /D /Y %*
'''

# Cmder utf8
Environment --> chcp utf8

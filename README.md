# dotvim

My vimrc config file, and instructions to get command line vim on Windows with Cmder.

# TODO

+ Augroups for managing language specific settings ??

# Cmder configs

I use the full version of Cmder which you can download [here](http://cmder.net/).

## Aliases

First of all go to cmd --> properties --> options --> use inherited console.

To configure your aliases:  
Edit file ```%CMDER_ROOT%/config/user-aliases.cmd```

## Ssh-agent activation

To activate the ssh-agent on cmder startup, go to ```%CMDER_ROOT/config/user-profile.cmd``` and uncomment the line:  
```call "%GIT_INSTALL_ROOT%/cmd/start-ssh-agent.cmd"```

## Misc.

Enable utf8 fonts --> go to Settings->Environment and add the following line ```chcp utf8```
Fonts without lambda --> edit the file '/Cmder/Vendor/clink.lua' and substitute the line {lambda} = 'symbol you want'
Cmder with admin rights --> go to Settings->Startup

# Vim Manual Installation

These are the instructions for compiling your own vim with Python support.

## Requirements

+ Microsoft Visual Studio. Find your ```vcvars```, (directly the x86_amd64 version or execute ```vcvarsall.bat x86_amd64```) and your ```nmake```. If you are using Microsoft Visual Studio 2017 the paths should be:  
```C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsx86_amd64.bat```  
```C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.11.25503\bin\Hostx64\x64\nmake```.

+ Python, install Python as you wish. I used miniconda Python 3.6.

## Instructions

```cmd
mkdir build
cd build
git clone https://github.com/vim/vim.git
cd vim/src
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Auxiliary\Build\vcvarsx86_amd64.bat"
"C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.11.25503\bin\Hostx64\x64\nmake" -f Make_mvc.mak -DWIN64 CPU=AMD64 GUI=yes OLE=yes PYTHON3=PATH/TO/PYTHON3 DYNAMIC_PYTHON3=yes PYTHON3_VER=36 CSCOPE=yes FEATURES=HUGE ARABIC=no FARSI=no NETBEANS=yes OPTIMIZE=SPEED
```

Notes: GUI option yes or no to create gvim.exe or vim.exe. PYTHON3_VER must match the numbers of your pythonxx.dll, normally the 2 first version numbers of your Python.

Then, create the following batch file inside src and execute:
```batch
@set SRC=C:\build\vim
@set DST=C:\build\vim80
xcopy %SRC%\runtime %DST% /D /E /H /I /Y %*
xcopy %SRC%\src\xxd\xxd.exe %DST%\* /D /Y %*
xcopy %SRC%\src\GvimExt\gvimext.dll %DST%\* /D /Y %*
xcopy %SRC%\src\*.exe %DST%\* /D /Y %*
```

Credits: [solar-blog](http://solar-blogg.blogspot.com.es/p/vim-build.html)

Finally copy the vim80 folder created wherever you want to have your vim installed.

# Vim in Cmder

Cmder comes with its own vim. To use the vim compiled go to your ```/Cmder/Vendor/init.bat``` and add your vim80 folder to the path:
```
batch
:: Enhance Path
set "PATH=C:\Program Files\Vim\vim80;%CMDER_ROOT%\bin;%PATH%;%CMDER_ROOT%\"
```

## Vim basic config

In your home create a _vimrc file and a vimfiles folder.

### Minimum vimrc for Cmder compatibility

```
"Enable true colors
set term=xterm
set termencoding=utf8
set encoding=utf8
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

"Fix Backsapce
inoremap <Char-0x07F> <BS>
nnoremap <Char-0x07F> <BS>

"Cursor fix
let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_te.="\<Esc>[0 q"
```

## Plugins

I user [VimPlug](https://github.com/junegunn/vim-plug) as my plugin manager. To install just copy ```plug.vim``` inside ```vimfiles/autoload/```.
Then in your _vimrc add a plugins section:
```
call plug#begin('~/vimfiles/plugged')

Plug 'group/repo'

call plug#end()
```

Notice that you can specify the plugins directory in ```...begin('path/to/plugins')```.

After adding your plugins in the vimrc you install them by executing ```:PlugInstall``` inside vim.

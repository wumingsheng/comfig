" =========--START--定义command命令--START--=========================
com! FormatJSON %!python3 -m json.tool
com! GitP !git add . && git commit -m i && git push
" =========--END--定义command命令--END--==============================





















" =========--START--插件管理器--START--===================================
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify' " 美化插件 首页
Plug 'vim-airline/vim-airline' " 美化插件 状态栏
Plug 'vim-airline/vim-airline-themes' " 美化插件 状态栏
Plug 'kana/vim-textobj-entire' " 支持文本对象e:整个文本
Plug 'kana/vim-textobj-user' " 支持文本对象e:整个文本
Plug '907th/vim-auto-save' " 自动保存
Plug 'joshdick/onedark.vim' " theme
Plug 'sheerun/vim-polyglot' " 支持语法高亮扩展插件
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " 目录树
Plug 'scrooloose/nerdcommenter' " 注释
Plug 'tpope/vim-fugitive' " git
Plug 'airblade/vim-gitgutter' " git
Plug 'xuyuanp/nerdtree-git-plugin'      " git
Plug 'tpope/vim-surround'    " ys iw "    cs"'  cs(]  ds'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " 安装fzf
Plug 'junegunn/fzf.vim' " vim使用fzf :Files & :Ag
Plug 'ctrlpvim/ctrlp.vim' " <C-p> 文件搜索
Plug 'jiangmiao/auto-pairs' " 自动括号
Plug 'chiel92/vim-autoformat' " 代码格式话 例如golang需要gofmt 使用:Autoformat
Plug 'skywind3000/quickmenu.vim' " 命令提示侧栏
call plug#end()
" ========--START--插件管理器--START--========================================





































" ================插件设置===========================

let g:mapleader = "\<Space>"
let g:maplocalleader = ","
let g:auto_save = 1    " 自动保存·插件：vim-auto-save
let g:lightline = {'colorscheme': 'onedark'} " onedark theme
let g:airline_theme='onedark' " onedark theme
let g:airline_powerline_fonts = 1
let g:NERDSpaceDelims = 1
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$']
let g:NERDTreeQuitOnOpen = 1
let g:quickmenu_options = "LH"
" ================插件设置===========================
























" ==============--START--基础配置--START--======================



syntax on
colorscheme onedark
syntax enable
filetype on
filetype plugin on
filetype plugin indent on
" set list lcs=tab:\|\ 
set completeopt-=preview
set background=dark
set shell=/usr/bin/zsh
set number
set foldmethod=indent
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936    "  打开文件中文乱码
set termencoding=utf-8
set encoding=utf-8
set autoindent
set textwidth=100
set matchtime=2 "短暂跳转到匹配括号的时间
set smartindent                                      "开启新行时使用智能自动缩进 
set expandtab                                         "将Tab键转换为空格
set smarttab
set cursorline                                        " 突出显示当前行
set autoread                                          " 当文件在外部被修改，自动更新该文件
set hlsearch                                          "高亮搜索
set incsearch                                         "搜索实时匹配
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
set laststatus=2                                   "启用状态栏信息
set cmdheight=1                                      "设置命令行的高度为2，默认为1
set wrap                                            "设置自动换行
set shortmess=atI                                     "去掉欢迎界面
" 文件格式，默认 ffs=dos,unix
" set fileformat=unix                                   "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型
set guifont="SauceCodePro Nerd Font Mono:h11"
set mouse=a                    " 在任何模式下启用鼠标
set foldenable                                        "折叠
nnoremap <C-space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
set breakindent
set linebreak
set mousemodel=popup                                   "开启右键快捷方式
" set guioptions+=b                                    "添加水平滚动条
set selection=inclusive                          "选择文本时光标所在的位置也被选中
set selectmode=    "不适用selectmode
set keymodel=   
set wildmenu    
set wildmode=full
set whichwrap=b,s,<,>,[,]
"set spell                                      "拼写检查
set ru
set sm
set backspace=indent,eol,start whichwrap+=<,>,[,]
set fo+=mB
set ambiwidth=double
set nocompatible " 防止进入vi兼容模式
set nobackup
set noswapfile
set history=1024
set autochdir
set clipboard=unnamed          " Vim 的默认寄存器和系统剪贴板共享
set winaltkeys=no         " 设置 alt 键不映射到菜单栏
set showmatch          " 显示括号配对，当键入“]”“)”时，高亮度显示匹配的括号
set showmode           " 处于文本输入方式时加亮按钮条中的模式指示器
set showcmd             " 在状态栏显示目前所执行的指令，未完成的指令片段亦会显示出来
set warn       " 对文本进行了新的修改后，离开shell时系统给出显示(缺省) /nowarn 
set ws            " 在搜索时如到达文件尾则绕回文件头继续搜索 /nows   
set cindent                 " 以C/C++的模式缩进
set ruler                     " 打开状态栏标尺
set scrolloff=5            " 设定光标离窗口上下边界 5 行时窗口自动滚动
" set lines=1000 
" set columns=1000 
set helplang=cn
set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set nobackup                                "设置无备份文件
" set noswapfile                              "设置无临时文件
set vb t_vb=                                "关闭提示音
set softtabstop=4      " 使得按退格键时可以一次删掉 4 个空格,不足 4 个时删掉所有剩下的空格）
set tabstop=4                                        "设置Tab键的宽度
set shiftwidth=4        " 设定 << 和 >> 命令移动时的宽度为 4
set nrformats=
set sidescroll=5
" set listchars+=precedes:<,extends:>
set updatetime=100
set timeoutlen=500
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed





" ==============--END--基础配置--END--======================




" ===============--START--自定义快捷键--START--========================

" NERDTree
map <leader>n :NERDTreeToggle<CR>
" 使vim配置文件生效
nnoremap <leader>r :source $MYVIMRC <CR>
" 命令提示菜单
noremap <silent> <leader>/ :call quickmenu#toggle(0)<CR>

call g:quickmenu#append('# common', '')
call g:quickmenu#append('LastEX', '@:', '重复上一个命令')
call g:quickmenu#append('split |', 'vsp', '垂直分割')
call g:quickmenu#append('split -', 'sp', '水平分割')
call g:quickmenu#append('fzf', 'Files', '搜索文件')
call g:quickmenu#append('tree', 'NERDTreeToggle', '目录')
call g:quickmenu#append('format', 'Autoformat', '格式化文件')
call g:quickmenu#append('# vim', '')
call g:quickmenu#append('Source', 'source $MYVIMRC', 'source $MYVIMRC')
call g:quickmenu#append('Home', 'Startify', 'Startify Home Page')
call g:quickmenu#append('# plugin', '')
call g:quickmenu#append('PlugInstall', 'PlugInstall', '安装插件')
call g:quickmenu#append('PlugClean', 'PlugClean', '清除插件')




" ===============--END--自定义快捷键--END--========================



















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
Plug 'sbdchd/neoformat'   ":Neoformat
Plug 'skywind3000/quickmenu.vim' " 命令提示侧栏
Plug 'liuchengxu/vim-which-key' "快捷键提示
Plug 'ervandew/supertab' " tab补全
Plug 'ryanoasis/vim-devicons' "图标icons
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }  " golang
Plug 'yggdroot/indentline'




" 补全插件--deoplete
" sudo apt-get install python3-setuptools
" sudo apt-get install python3-pip
" sudo pip3 install pynvim

if has('nvim')   "补全插件
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
else
  Plug 'Shougo/deoplete.nvim', { 'do': ':InstallRemotePlugins'  }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif


" sudo apt-get install build-essential libssl-dev libffi-dev python3-dev
" sudo pip3 install ujson
Plug 'deoplete-plugins/deoplete-go',{'do':'make'} "golang 代码补全

" 代码片段补全
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'



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
let g:which_key_hspace = 35
let g:airline_powerline_fonts = 1
" set guifont="SauceCodePro Nerd Font Mono:h11"  "设置terminal的字体即可 
let g:deoplete#enable_at_startup = 1 "补全插件
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode' 
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:neoformat_enabled_go = ['goimports']
let g:UltiSnipsExpandTrigger="<s-tab>"
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
set completeopt+=noinsert
set completeopt+=noselect
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
set nofoldenable                                        "折叠
" nnoremap <C-space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
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
call g:quickmenu#append('Autoformat', 'Autoformat', '格式化文件')
call g:quickmenu#append('Neoformat', 'Neoformat', '格式化文件')
call g:quickmenu#append('terminal', 'terminal', '打开终端')

call g:quickmenu#append('# vim', '')
call g:quickmenu#append('Source', 'source $MYVIMRC', 'source $MYVIMRC')
call g:quickmenu#append('Home', 'Startify', 'Startify Home Page')

call g:quickmenu#append('# plugin', '')
call g:quickmenu#append('PlugInstall', 'PlugInstall', '安装插件')
call g:quickmenu#append('PlugClean', 'PlugClean', '清除插件')


" 快捷键提示 vim-which-key
call which_key#register('<Space>', "g:which_key_leader_map")
call which_key#register(',', "g:which_key_localleader_map")

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
vnoremap <silent> <localleader> :<c-u>WhichKeyVisual  ','<CR>

let g:which_key_leader_map = {}
let g:which_key_localleader_map =  {}


" 已近存在的快捷键
let g:which_key_leader_map.r = 'source vim'
" 还没有存在的快捷键

let g:which_key_leader_map['w'] = {
            \ 'name' : '+windows' ,
            \ 'w' : ['<C-W>w'     , 'other-window']          ,
            \ 'd' : ['<C-W>c'     , 'delete-window']         ,
            \ '-' : ['<C-W>s'     , 'split-window-below']    ,
            \ '|' : ['<C-W>v'     , 'split-window-right']    ,
            \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
            \ 'h' : ['<C-W>h'     , 'window-left']           ,
            \ 'j' : ['<C-W>j'     , 'window-below']          ,
            \ 'l' : ['<C-W>l'     , 'window-right']          ,
            \ 'k' : ['<C-W>k'     , 'window-up']             ,
            \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
            \ 'J' : ['resize +5'  , 'expand-window-below']   ,
            \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
            \ 'K' : ['resize -5'  , 'expand-window-up']      ,
            \ '=' : ['<C-W>='     , 'balance-window']        ,
            \ 's' : ['<C-W>s'     , 'split-window-below']    ,
            \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
            \ '?' : ['Windows'    , 'fzf-window']            ,
            \ }


let g:which_key_leader_map.b = {
            \ 'name' : '+buffer' ,
            \ '1' : ['b1'        , 'buffer 1']        ,
            \ '2' : ['b2'        , 'buffer 2']        ,
            \ 'd' : ['bd'        , 'delete-buffer']   ,
            \ 'f' : ['bfirst'    , 'first-buffer']    ,
            \ 'h' : ['Startify'  , 'home-buffer']     ,
            \ 'l' : ['blast'     , 'last-buffer']     ,
            \ 'n' : ['bnext'     , 'next-buffer']     ,
            \ 'p' : ['bprevious' , 'previous-buffer'] ,
            \ '?' : ['Buffers'   , 'fzf-buffer']      ,
            \ }



let g:which_key_localleader_map.g = {
            \'name':'+git',
            \'d':['Gdiff','git diff'],
            \'p':['GitP','git push'],
            \'s':['Gstatus', 'git status'],
            \}


let g:which_key_localleader_map.c = {
            \ 'name' : '+comment',
            \ 'c' : 'comment current line',
            \ 'u' : 'cancel comment',
            \ ',' : 'change comment status',
            \ 'a' : 'change comment style',
            \ 'y' : 'copy before comment',
            \ 's' : 'sex comment',
            \ 'A' : 'comment and Insert',
            \ }











" ===============--END--自定义快捷键--END--========================







" ==============--START--其他--START--==============================
" 切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" 屏幕行和实际行移动键统一
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" 注释
nmap <localleader>cc <Space>cc
nmap <localleader>cu <Space>cu
nmap <localleader>c, <Space>c,
nmap <localleader>ca <Space>ca
nmap <localleader>c<Space> <Space>c<Space>
nmap <localleader>cy <Space>cy
nmap <localleader>cs <Space>cs
nmap <localleader>cA <Space>cA
" ==============--END--其他--END--==============================











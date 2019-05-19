" 最常用的是逗号和空格nmap、imap、cmap、vmap 非递归映射 nnoremap/inoremap/cnoremap/vnoremap推荐使用非递归映射
" n[ormal] i[nsert] c[ommand] v[isual]
" <Up><Down><Right><Left><End><Space><ESC><CR><C-w><leader> 
" `^代表上次编辑的地方
" <k0> - <k9> 小键盘 0 到 9 
" <S-...> Shift＋键 
" <C-...> Control＋键 
" <M-...> Alt＋键 或 meta＋键 
" <A-...> 同 <M-...> 
" <Esc> Escape 键 
" <Up> 光标上移键 
" <Space> 插入空格 
" <Tab> 插入Tab 
" <CR> 等于<Enter>
" <buffer>，映射将只局限于当前缓冲区（也就是你此时正编辑的文件）
" <silent>是指执行键绑定时不在命令行上回显
" <special>一般用于定义特殊键怕有副作用的场合。比如： :map <special> <F12> /Header<CR>
" <unique>一般用于定义新的键映射或者缩写命令的同时检查是否该键已经被映射，如果该映射或者缩写已经存在，则该命令会失败
let mapleader = "," 
let g:mapleader = ","

" 切换窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up> <C-w>k
nnoremap <C-Right> <C-w>l

" 屏幕行和实际行移动键统一
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j


map <C-Space> :NERDTreeToggle<CR>
nnoremap <leader>g :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.git$']

nmap ss <Plug>(easymotion-s2)


" 定义command命令
com! FormatJSON %!python3 -m json.tool




" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug '907th/vim-auto-save'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'w0ng/vim-hybrid'
Plug 'sbdchd/neoformat'
Plug 'tpope/vim-commentary'         " gc
Plug 'yggdroot/indentline'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'      " ys iw "    cs"'  cs(]  ds'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'             " Ag[PATTREN]模糊搜索字符串   Files[path]模糊搜索目录
Plug 'brooth/far.vim'              " :Far foo bar **/*.py :Fardo
Plug 'majutsushi/tagbar'         " :TagbarToggle
Plug 'vasconcelloslf/vim-interestingwords'    "<lead>k
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', {'do':'make'}
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown', {'rtp': 'after'}
Plug 'elzr/vim-json'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'aquach/vim-http-client'
call plug#end()

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let b:ale_fixers = {'go': ['golint']}

let g:vim_json_syntax_conceal = 0
let g:NERDTreeQuitOnOpen = 1

let g:UltiSnipsExpandTrigger="<tab>"


let g:neoformat_enabled_go = ['goimports']

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 0  "  display the auto-save notification



" let g:tagbar_ctags_bin = '~/.config/nvim/'
" autocmd! User goyo.vim echom 'Goyo is now loaded!'
let g:go_fmt_command = "goimports"

let g:deoplete#enable_at_startup = 1
set completeopt-=preview

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:tagbar_type_markdown = {'ctagstype': 'markdown','ctagsbin' : '~/.vim/bundle/markdown2ctags/markdown2ctags.py','ctagsargs' : '-f - --sort=yes','kinds' : ['s:sections','i:images'],'sro' : '|','kind2scope' : {'s' : 'section',},'sort': 0,}


let g:deoplete#sources#go#gocode_binary = '/home/user/go/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }







" set list lcs=tab:\|\ 
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
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
set cursorline                                        " 突出显示当前行
set autoread                                          " 当文件在外部被修改，自动更新该文件
set hlsearch                                          "高亮搜索
set incsearch                                         "搜索实时匹配
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
set laststatus=2                                   "启用状态栏信息
set cmdheight=1                                      "设置命令行的高度为2，默认为1
" set nowrap                                            "设置不自动换行
set wrap                                            "设置自动换行
set shortmess=atI                                     "去掉欢迎界面
" 文件格式，默认 ffs=dos,unix
" set fileformat=unix                                   "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型
set guifont=Monospace\ 12                 "设置字体:字号（字体名称空格用下划线代替）
set mouse=a                    " 在任何模式下启用鼠标
set nofoldenable                                        "启用折叠
" set foldmethod=indent                                 "indent 折叠方式
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR> " 用空格键来开关折叠
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
set ai " 自动缩进，新行与前面的行保持—致的自动空格
set aw  " 自动写，转入shell或使用：n编辑其他文件时，当前的缓冲区被写入
set ic                          " 在查询及模式匹配时忽赂大小写
set cin
set lbr
set fo+=mB
set ambiwidth=double
set nocp
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
" set noignorecase       " 默认区分大小写
set ruler                     " 打开状态栏标尺
set scrolloff=5            " 设定光标离窗口上下边界 5 行时窗口自动滚动
" set lines=1000 
" set columns=1000 
set helplang=cn
" set nohlsearch "取消高亮显示 （查找字符串是，找到后高亮显示）
set incsearch "在输入搜索的字符串同时就开始搜索已经输入的部分
" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
" au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
set writebackup                             "保存文件前建立备份，保存成功后删除该备份
set nobackup                                "设置无备份文件
" set noswapfile                              "设置无临时文件
set vb t_vb=                                "关闭提示音
set softtabstop=4      " 使得按退格键时可以一次删掉 4 个空格,不足 4 个时删掉所有剩下的空格）
set tabstop=4                                        "设置Tab键的宽度
set shiftwidth=4        " 设定 << 和 >> 命令移动时的宽度为 4
set nrformats=
set nolinebreak
set breakat=
set breakindent
set sidescroll=5
" set listchars+=precedes:<,extends:>
set updatetime=100


colorscheme hybrid
syntax on
syntax enable
filetype on
filetype plugin on
filetype plugin indent on


set clipboard=unnamedplus







set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats








"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_sameids = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END





augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END





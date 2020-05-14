let mapleader=" "
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set foldmethod=indent
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
syntax on
set number
set norelativenumber
set cursorline
set wrap
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap <LEADER><CR> :nohlsearch<CR>

set scrolloff=7

map q :q<CR>
map Q :q!<CR>
map <C-s> :w<CR>
map S :wq<CR>
map ; :
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map <LEADER>l <C-w>l
map <LEADER>j <C-w>h
map ai :tabe<CR>
map ao :-tabnext<CR>
map ap :+tabnext<CR>
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'ycm-core/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'



call plug#end()

color snazzy
let g:SnazzyTransparent = 1



"nerdtree  显示所在目录
map ff :NERDTreeToggle<CR>

"代码补全

set runtimepath+=~/.vim/bundle/YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'
autocmd InsertLeave * if pumvisible() == 0|pclose|endif " 离开插入模式后自动关闭预览窗口
let g:ycm_collect_identifiers_from_tags_files=1         " 开启YCM基于标签引擎
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1         " 语法关键字补全
let g:ycm_confirm_extra_conf = 0                   " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>','<Down>'] " 没有这个会拦截掉tab
let g:ycm_key_list_previous_completion = ['<c-p>','<Up>']
let g:ycm_global_ycm_extra_conf='~/.vim/YouCompleteMe/plugged/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_server_python_interpreter='/usr/bin/python3'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 1       " 语法检查
let g:ycm_use_clangd = 0
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"               " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>       " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion = 2		      " 从第2歌键入字符就开始罗列匹配项

let g:python_highlight_all = 1




"ale  检查代码的错误
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

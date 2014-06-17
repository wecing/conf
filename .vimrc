"vundle init"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let Vundle manage Vundle, required"
"Keep Plugin commands between vundle#begin/end."
Plugin 'gmarik/Vundle.vim'

Plugin 'bling/vim-airline'
Plugin 'wecing/snipmate.vim'
Plugin 'vim-scripts/ScrollColors'
Plugin 'oblitum/rainbow'
Plugin 'flazz/vim-colorschemes'

"All of your Plugins must be added before the following line"
call vundle#end()
filetype plugin indent on    " required

"""""Put your non-Plugin stuff after this line"""""

"Powerline font patch"
let g:airline_powerline_fonts = 1
if has("gui_running") && system("uname") == "Darwin\n"
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
endif

"enable rainbow globally"
let g:rainbow_active = 1

"syntax highlighting"
syntax on

"airline+tabline for replacing the GUI tab bar"
let g:airline#extensions#tabline#enabled = 1

"tab stuff"
set expandtab
autocmd FileType make setlocal noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"copy indention of current line to the next line"
set autoindent

"highlight all search results"
set hlsearch

"cancel searching with ;"
noremap ; :nohlsearch<cr>

"ignore case during searching."
set ic

"remove *bar"
set guioptions-=T "toolbar"
set guioptions-=L
set guioptions-=m "menu bar"
set guioptions-=r "scroll bar"

"shell-like command completion"
set wildmode=longest:list,full

"color scheme and font under linux"
if has('gui_running')
    colorscheme candycode
    if has('gui_gtk2')
        set guifont=Monospace\ 9
    endif
else
    "vibrantink tir_black slate mustang"
    colorscheme vibrantink
endif

"enable usage of mouse"
set mouse=a

"incremental searching. search even when typing has not finished."
set incsearch

"show line number."
set number

"enable code folding. no folding by default"
set foldmethod=syntax
set foldlevel=99

"Highlight current line. This only works for MacVim for the current theme."
set cursorline

"emacs-style macro keybinding"
nmap <F3> qb
nmap <F4> q
nmap <F5> @b

"fold!!!"
set foldmethod=manual

"fix the weird behavior of n/N"
noremap <silent><expr>n v:searchforward ? "n" : "N"
noremap <silent><expr>N v:searchforward ? "N" : "n"

"show powerline even when only one file is being edited"
set laststatus=2

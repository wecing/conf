"install vim-plug"
if !has('nvim')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

"vim-plug init"
if !has('nvim')
  call plug#begin('~/.vim/plugged')
else
  call plug#begin('~/.local/share/nvim/plugged')
endif

"pain in the ass."
"Plug 'Valloric/YouCompleteMe'"
"Plug 'oblitum/rainbow'

Plug 'bling/vim-airline'
Plug 'vim-scripts/ScrollColors'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'embear/vim-localvimrc'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/camelcasemotion'

"Plug 'Shougo/vimproc'
"Plug 'Shougo/vimshell.vim'

Plug 'wting/rust.vim'
Plug 'scala/scala-tool-support', {'rtp': 'tool-support/vim'}
Plug 'solarnz/thrift.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'plasticboy/vim-markdown'
Plug 'andy-morris/alex.vim'
Plug 'vim-scripts/happy.vim'
Plug 'wecing/cup.vim'
Plug 'wecing/vim-fsharp'
Plug 'Superbil/llvm.vim'

call plug#end()

"""""Put your non-Plugin stuff after this line"""""

"Powerline font patch"
let g:airline_powerline_fonts = 0
if g:airline_powerline_fonts
    if system("uname") == "Darwin\n"
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
    else
        set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
    endif
endif

" "enable rainbow globally"
" let g:rainbow_active = 1"

"syntax highlighting"
syntax on

" "airline+tabline for replacing the GUI tab bar"
" let g:airline#extensions#tabline#enabled = 1

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
set wildmode=longest,list

"color scheme under linux"
if has('gui_running')
    "colorscheme candycode
    "colorscheme mustang
    set background=dark
    colorscheme solarized
else
    "vibrantink tir_black slate mustang up"
    "colorscheme mustang
    "let g:solarized_termtrans=1
    set background=dark
    colorscheme solarized
endif

"enable usage of mouse"
set mouse=a

"incremental searching. search even when typing has not finished."
set incsearch

" "show line number."
" set number

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

" "transparency!!!"
" if has("gui_running") && system("uname") == "Darwin\n"
"     set transparency=15
" endif

" "YCM, stop asking"
" let g:ycm_confirm_extra_conf = 0
" "YCM, don't leave the preview window open"
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

" "open NERDTree on vim startup, if no file is specified"
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"close NERDTree if it's the only window open"
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"use F1 to toggle NERDTree"
nmap <F1> :NERDTreeToggle<CR>

"no more than 80 chars each line"
set colorcolumn=80
"if has("gui_running")
"  highlight ColorColumn guibg=#101010
"else
"  highlight ColorColumn ctermbg=DarkGrey
"endif

"show preview window at the bottom."
"set splitbelow
"diable preview window"
set completeopt-=preview

"don't ask, just load local vimrc"
let g:localvimrc_ask = 0

"escape from insert mode instantely"
"see: http://usevim.com/2013/07/24/powerline-escape-fix/"
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"fix backspace behavior"
set backspace=indent,eol,start

"use single \ as leader key for easymotion"
map <Leader> <Plug>(easymotion-prefix)

"llvm IR/tablegen highlighting"
augroup filetype
    au! BufRead,BufNewFile *.ll     set filetype=llvm
    au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

"F# syntax highlighting"
augroup filetype
    au! BufRead,BufNewFile *.fs,*.fsi,*.fsx     set filetype=fsharp
    au! BufRead,BufNewFile *.fsproj             set filetype=xml
augroup END

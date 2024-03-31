"turn off highlighting"
syntax off

"tab stuff"
set expandtab
autocmd FileType make setlocal noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"copy indention of current line to the next line"
set autoindent

"disable usage of mouse"
set mouse=

"highlight all search results"
set hlsearch

"cancel searching with ;"
noremap ; :nohlsearch<cr>

"ignore case during searching."
"set ic

"incremental searching. search even when typing has not finished."
set incsearch

"fix the weird behavior of n/N"
noremap <silent><expr>n v:searchforward ? "n" : "N"
noremap <silent><expr>N v:searchforward ? "N" : "n"

"emacs-style macro keybinding"
nmap <F3> qb
nmap <F4> q
nmap <F5> @b

"qemacs-style macro keybinding"
nmap <C-x>( qb
nmap <C-x>) q
nmap <C-\> @b

"vertical ruler position and color"
set colorcolumn=80
hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=0

"fix backspace behavior"
set backspace=indent,eol,start

"bash-style command line autocomplete"
set wildmode=list:longest

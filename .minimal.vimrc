"syntax highlighting"
syntax on

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
set guioptions-=L "left-hand scrollbar (on vertical splitting)"
set guioptions-=m "menu bar"
set guioptions-=r "scroll bar"

"incremental searching. search even when typing has not finished."
set incsearch

"emacs-style macro keybinding"
nmap <F3> qb
nmap <F4> q
nmap <F5> @b

"qemacs-style macro keybinding"
nmap <C-x>( qb
nmap <C-x>) q
nmap <C-\> @b

"fix the weird behavior of n/N"
noremap <silent><expr>n v:searchforward ? "n" : "N"
noremap <silent><expr>N v:searchforward ? "N" : "n"

"vertical ruler position and color"
"set colorcolumn=80
"highlight ColorColumn ctermbg=236

"fix backspace behavior"
set backspace=indent,eol,start

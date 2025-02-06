"turn off highlighting"
syntax off

"tab stuff"
set expandtab
set tabstop=8       "\t display length"
set shiftwidth=2    "automatic indent depth"
set softtabstop=-1  "<TAB> and <BS> length; -1 means follow shiftwidth"

"language specific tab settings"
autocmd FileType make setlocal noexpandtab
autocmd BufEnter,BufNew *.ha setlocal noexpandtab

"copy indention of current line to the next line"
set autoindent

"disable usage of mouse"
set mouse=

"highlight all search results"
set hlsearch

"reload changed files after executing external commands, e.g. :make"
set autoread

"cancel searching with ;"
"check for changed files when ; is pressed"
noremap ; :nohlsearch \| checktime<cr>

"ignore case during searching."
set ic

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

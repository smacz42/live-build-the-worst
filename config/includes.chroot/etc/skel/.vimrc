" Use vim defaults
" this must be set first as it changes other options as a side effect
set nocompatible

" Have vim load indentation rules and plugins according to the detected filetype
filetype plugin indent on

" Make .md files be recognized as markdown filetypes
au BufRead,BufNewFile *.md set filetype=markdown

" Remap leader key
let mapleader=','

" Audoindent
set autoindent
" Indent - 'smartindent' is deprecated in favor of cindent
set cindent
" Backspace
set backspace=indent,eol,start
" Smarttab
set smarttab

" Make window movement easier
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Change the functions of the ';' key
map ; :
noremap ;; ;

" Proper indentaton spacing
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Insert space characters whenever the tab key is pressed
set expandtab

" Show numbers on the left hand side as an incremental measurement of the space away from the present position
set number
set relativenumber

" Set how much history to save
set history=100

" Show the cursor position all the time
set ruler

" Show partial command in status line
set showcmd

" Set line length per filetype
autocmd FileType python set textwidth=79
autocmd FileType rust set textwidth=99
autocmd FileType markdown set fo-=t
autocmd FileType text set textwidth=72

" Search and Highlighting
set hlsearch
" shortcut to clear highlighting of hlsearch
nnoremap <Leader>s :nohlsearch<CR>
" Make hlsearch show stuff up on a nice medium dark bg
hi Search term=reverse ctermbg=darkgray ctermfg=white
" Enable syntax highlighting
syntax on

" Do case insensitive matching
set ignorecase
" Do smart case matching
set smartcase
" Incremental search
set incsearch
" Have line color match normal text
highlight LineNr ctermfg=white
highlight CursorLineNR ctermfg=white

" Disable the beeping
set noerrorbells

" Show TAB, Trailing whitespace
set list
set listchars=tab:>.,trail:.

" Disable arrow keys in Insert mode in exchange for quicker 'O' in normal mode
set noesckeys

" Implement a fold on the source text by indent
set foldmethod=indent

set nocompatible

" Start custom settings
execute pathogen#infect()
filetype indent plugin on
syntax on
set background=dark

"Set Color Scheme and Font Options
colorscheme kolor
set guifont=Consolas:h12

" Reload .vimrc
map <C-p> :source ~/.vimrc

" Multiline tab map
:vmap <TAB> >
:vmap <S-TAB> <

" Invoke omnicomplete with superTab
let g:SuperTabDefaultCompletionType = "<C-x><C-o>"

"Jedi autocomplete
let g:jedi#popup_select_first = 0
autocmd FileType python setlocal completeopt-=preview

"Setup default execution interpreter as python
map <F4> :!python %<CR> 

"Custom mappings to move through tabs
map <C-Tab> :tabn<CR> 
map <C-n> :tabnew<CR>

"Set the status line options.  Make it show more information.
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\[POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

"Python specific configuration options
set modeline
set tabstop=8 expandtab shiftwidth=4 softtabstop=4

"Set line no, buffer, search, highlight, autoindent and more.
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set showcmd
set history=1000
set undolevels=1000

"NERDTreee : File Browser
map <C-o> :NERDTreeToggle ~/ws/jking_linux_ws <CR>

"Deletes trailing whitespace on save
" leave out for now ... autocmd BufWritePre * :%s/\s\+$//e

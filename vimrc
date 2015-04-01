set nocompatible
" source $VIMRUNTIME/vimrc_example.vim
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Start custom settings
execute pathogen#infect()
filetype indent plugin on
syntax on
set background=dark

"Set Color Scheme and Font Options
" colorscheme kolor
colorscheme solarized
" Set the font based on gui type
if has("gui_gtk2")
    set guifont=Consolas\ 11
  " Shift + special movement key (<S-Left>, etc.) and mouse starts insert mode
  " Duplicate macvim_hig_shift_movement mac key selection style on linux
  set selectmode=mouse,key
  set keymodel=startsel,stopsel
  
  " HIG related shift + special movement key mappings
  nn   <S-D-Left>     <S-Home>
  vn   <S-D-Left>     <S-Home>
  ino  <S-D-Left>     <S-Home>
  nn   <S-M-Left>     <S-C-Left>
  vn   <S-M-Left>     <S-C-Left>
  ino  <S-M-Left>     <S-C-Left>

  nn   <S-D-Right>    <S-End>
  vn   <S-D-Right>    <S-End>
  ino  <S-D-Right>    <S-End>
  nn   <S-M-Right>    <S-C-Right>
  vn   <S-M-Right>    <S-C-Right>
  ino  <S-M-Right>    <S-C-Right>

  nn   <S-D-Up>       <S-C-Home>
  vn   <S-D-Up>       <S-C-Home>
  ino  <S-D-Up>       <S-C-Home>
 
  nn   <S-D-Down>     <S-C-End>
  vn   <S-D-Down>     <S-C-End>
  ino  <S-D-Down>     <S-C-End>

elseif has("gui_macvim")
    set guifont=Consolas:h12
    let macvim_hig_shift_movement = 1
elseif has("gui_win32")
    set guifont=Consolas:h11
end
set guifont=Consolas\ 11

" set guifont=Consolas\ 12
" set guifont=Neep\ 12

" Shift highlighting
" nmap <S-Up> v<Up>
" nmap <S-Down> v<Down>
" nmap <S-Left> v<Left>
" nmap <S-Right> v<Right>
" vmap <S-Up> <Up>
" vmap <S-Down> <Down>
" vmap <S-Left> <Left>
" vmap <S-Right> <Right>

" Reload .vimrc
map <C-p> :source ~/.vimrc

" CNTL-s Save
" Make sure to disable <C-s> in .bashrc
nnoremap <silent> <C-S> :update<CR>

" Multiline tab map
:vmap <TAB> >
:vmap <S-TAB> <

" DISABLE pymode - rope plugin.  It was causing autocomplete to freeze
let g:pymode_rope = 0

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
" set viminfo+=n$VIM/_viminfo
set showcmd
set history=1000
set undolevels=1000

"NERDTreee : File Browser
map <C-o> :NERDTreeToggle ~/ws/jking_linux_ws <CR>

"Deletes trailing whitespace on save
" leave out for now ... autocmd BufWritePre * :%s/\s\+$//e

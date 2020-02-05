" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

" For websites and xtml
" " add this line to your .vimrc file
Plug 'mattn/emmet-vim'

" For auto-completing pairs
Plug 'jiangmiao/auto-pairs'

" Latex Plugin - courtesy of Gilles Castel
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" ############### PERSONAL JAZZ ############
set number

" For setting tab spaces
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab



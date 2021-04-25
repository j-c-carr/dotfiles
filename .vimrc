""""""""""""
"  Vundle  "
""""""""""""
set nocompatible              " be improved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'   " required

Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-sensible'
Plugin 'junegunn/seoul256.vim'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dylanaraps/wal'
Plugin 'dense-analysis/ale'
let g:ale_enabled=0
Plugin 'davidhalter/jedi-vim'
let g:jedi#auto_initialization=0
"""""""""""
"  Latex  "
"""""""""""
Plugin 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_toc_enabled=1
let g:vimtex_imaps_enabled=1
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_method='zathura'

Plugin 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'

""""""""""""""
"  Snippets  "
""""""""""""""
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


call vundle#end()            " required
filetype plugin indent on    " required

" Inkscape figures -- Gille Castel Github
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>


"""""""""""""""""""""
"  Personal Config  "
"""""""""""""""""""""
set number
set hlsearch
set expandtab
set wrap

set tabstop=4
set shiftwidth=4
set tw=0
" Enable mouse in normal and visual modes
set mouse=nv

""""""""""""""""""""""
"  Vim Highlighting  "
""""""""""""""""""""""
colorscheme wal
set background=dark

hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red
hi SpellLocal term=bold ctermbg=8 guifg=LightGrey


"""""""""""""""""""""""""""""""
"  Window / Buffer Switching  "
"""""""""""""""""""""""""""""""
nnoremap ,e :Vex<CR>
nnoremap ;e :vertical resize 30<CR>
inoremap  <Esc>a &
inoremap  <Esc>t ^
inoremap <C-d> <Del>
inoremap  <Esc>i <Leader>item 
nnoremap <C-l> :ls<CR>
nnoremap <C-j> :bprevious<CR>
nnoremap <C-k> :bnext<CR>
inoremap <C-a> <Esc>A
nnoremap <C-w> <C-w><C-w>
            

""""""""""""""""""""""
"  Quick navigation  "
""""""""""""""""""""""
nnoremap j gj
nnoremap k gk
nnoremap - dd
nnoremap = d$
noremap <space> viW
noremap <Leader>s <Esc>:w<CR>
noremap <Leader>x <Esc>:x<CR>
inoremap jk <esc>
inoremap <F12> <Esc>:w<CR>


"""""""""""""""""""
"  File Explorer  "
"""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 12 
let g:netrw_browse_split = 4


"""""""""""""""""
"  Spell Check  "
"""""""""""""""""
setlocal spell
set spelllang=en_ca
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" Spelling
iab lenght lenght
iab wiht with 
iab teh the
iab SO So 
iab adn and 
iab ofr for 
iab ie. i.e.\
iab Ie. I.e.\
iab forall for all 
iab ot to


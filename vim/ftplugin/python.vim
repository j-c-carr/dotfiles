"""" Python (Pep 8) Indention """" " 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix
set foldmethod=indent

let b:ale_linters = ['pylint', 'flake8']

""""""""""
"  Jedi  "
""""""""""
let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_stubs_command = ""
let g:jedi#show_call_signatures = 0

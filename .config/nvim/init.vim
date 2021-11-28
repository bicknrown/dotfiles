set number
set nowrap
syntax on
set title
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set mouse=a
set undofile
set undodir=~/.config/nvim/undodir
set splitright
map <F3> :Explore<CR>
map <C-A-t> :vnew<CR>:term<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
filetype plugin on
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets', {'branch': 'master'}
call plug#end()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

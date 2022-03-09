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
set spell
set spelllang=en

map <F3> :Explore<CR>
map <C-A-t> :vnew<CR>:term<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <leader>t <cmd>!kitty %:p:h&<CR><CR>

nnoremap <leader>sc <cmd>set spell!<CR>

nnoremap <leader>nt <cmd>NERDTreeToggle<CR>
nnoremap <leader>nf <cmd>NERDTreeFind<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>filetype plugin on
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets', {'branch': 'master'}
Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

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

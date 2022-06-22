set number
set nowrap
syntax on
set title
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set binary
set expandtab
set clipboard=unnamedplus
set mouse=a
set undofile
set undodir=~/.config/nvim/undodir
set splitright
set spell
set spelllang=en
map <F3> :Explore<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <leader>t <cmd>!kitty %:p:h&<CR><CR>

nnoremap <leader>dw <cmd>windo diffthis<CR>
nnoremap <leader>do <cmd>diffoff!<CR>
nnoremap <leader>cc <cmd>set colorcolumn=100<CR>

nnoremap <leader>sc <cmd>set spell!<CR>

nnoremap <leader>nt <cmd>NERDTreeToggle<CR>
nnoremap <leader>nf <cmd>NERDTreeFind<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

filetype plugin on
call plug#begin()
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

let g:coq_settings = { 'auto_start': v:true }


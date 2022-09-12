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
set spelllang=en
set scrolloff=5
set ruler
set display=truncate


" Put these in an autocmd group, so that you can revert them with:
" ":augroup vimStartup | exe 'au!' | augroup END"
augroup vimStartup
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid, when inside an event handler
  " (happens when dropping a file on gvim) and for a commit message (it's
  " likely a different one than last time).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

augroup END

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
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

let g:coq_settings = { 'auto_start': 'shut-up' }


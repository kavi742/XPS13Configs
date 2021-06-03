syntax on
filetype plugin on
filetype indent on 

set noerrorbells
set tabstop=4 softtabstop=4
set guicursor=
set smartindent
set number relativenumber
set nowrap
set smartcase
set nohlsearch
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set encoding=utf8
set nocompatible
set scrolloff=8
set ignorecase
set updatetime=300
set signcolumn=number
set shortmess+=c


"autoinstall vimplug 
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/gruvbox-material'
Plug 'tpope/vim-fugitive'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'neoclide/coc.nvim'
Plug 'itchyny/lightline.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
call plug#end()

"Theme
colorscheme gruvbox-material
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_statusline_style = 'original'
set background=dark


"Lightline bar
let g:lightline = {
						\ 'colorscheme': 'gruvbox_material',
						\ }
set laststatus=2
set noshowmode

"Colours
if !has('gui_running')
		set t_Co=256
endif

"Python
au BufNewFile,BufRead *.py
						\ set expandtab       |" replace tabs with spaces
						\ set autoindent      |" copy indent when starting a new line
						\ set tabstop=4
						\ set softtabstop=4
						\ set shiftwidth=4
						\ set foldmethod=indent
						\ let python_highlight_all=1
						

"leader
let mapleader = " "

"latex
autocmd Filetype tex setl updatetime=500
let g:livepreview_previewer = 'zathura'
nnoremap <leader>pr :LLPStartPreview<CR>
nnoremap <leader>la :! latexmk %; latexmk -c<CR>

"autocompletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"window movement
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"other windows
nnoremap <leader>u :UndotreeShow <bar> :wincmd h <CR>
nnoremap <leader>ff :wincmd v<bar> :Ex <bar> :vertical resize 30 <bar> :wincmd h <CR>
nnoremap <leader>t :below term<CR>

"saving and exitting
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>wq :wq<CR>

"resizing
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"fix indentation
map <leader>f gg=G<C-o><C-o>

"escape remap
imap ii <Esc>
vmap ii <Esc>

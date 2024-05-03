let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
  " silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'morhetz/gruvbox'
    Plug 'airblade/vim-gitgutter'
    Plug 'preservim/nerdcommenter'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'https://github.com/machakann/vim-highlightedyank'
    Plug 'adrienverge/vim-python-logging'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme gruvbox

" Nerdtree configuration
map <F12> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules', '__pycache__']


set number
set relativenumber
set cursorline
set cc=80,120
set mouse=
set hlsearch
set scrolloff=3
set foldmethod=indent
set nofoldenable
set nocompatible

" sudo write this
cmap W! silent w !sudo tee % >/dev/null

" Change yank highlight timeout
let g:highlightedyank_highlight_duration = 500

" Make yank to clipboard
set clipboard+=unnamedplus

highlight Comment cterm=italic

" Nerdcommenter configuration
let g:NERDSpaceDelims = 1

" Make tabs visible
set list
set listchars=tab:>-

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Jedi configuration
let g:jedi#use_tabs_not_buffers = 1

" map \[[ to run the code
nnoremap <silent> <leader>[[ :%w ! python3<CR>

" autocomplete chars
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>
inoremap < <><left>
inoremap ' ''<left>
inoremap " ""<left>
" # If you close a bracket that is already closed, it overwrites
inoremap <expr> ) strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> } strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
inoremap <expr> ] strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "'" ? "\<Right>" : "''<left>"
inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"<left>"


let g:indent_blankline_show_first_indent_level = v:false

set clipboard+=unnamedplus
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

lua require('init')

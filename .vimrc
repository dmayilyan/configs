if &diff
    colorscheme darkblue
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
  " silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  " autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

call plug#begin('~/.vim/plugged')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'morhetz/gruvbox'
    Plug 'airblade/vim-gitgutter'
    Plug 'preservim/nerdcommenter'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'https://github.com/machakann/vim-highlightedyank'
    Plug 'adrienverge/vim-python-logging'
    Plug 'VonHeikemen/lsp-zero.nvim'
    " Autocompletion
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp'

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'mbbill/undotree'
    " Snippets
    Plug 'rafamadriz/friendly-snippets'
call plug#end()

colorscheme gruvbox

" Nerdtree configuration
map <F12> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules', '__pycache__']

" Undotree toggle
nnoremap <F5> :UndotreeToggle<CR>

" Run Git
nnoremap <F10> :Git<CR>

"Set up persistent undo
if has("persistent_undo")
   let target_path = expand('/tmp')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif

set number
set relativenumber
set cursorline
set cc=80,120
set mouse=
set nohlsearch
set incsearch
set scrolloff=5
set foldmethod=indent
set nofoldenable
set nocompatible
set updatetime=50

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

"Map F1 to Escape
map <F1> <Esc>
imap <F1> <Esc>

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

" To map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >vim
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

let g:indent_blankline_show_first_indent_level = v:false

set clipboard+=unnamedplus
let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }

lua require('init')

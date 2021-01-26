call plug#begin('~/.vim/plugged')

Plug 'simnalamburt/vim-mundo'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'https://github.com/kien/ctrlp.vim.git'
Plug 'https://github.com/preservim/tagbar.git'
" Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'jiangmiao/auto-pairs'
Plug 'psf/black', { 'branch': 'stable'  }
Plug 'https://github.com/tpope/vim-surround.git'
" Plug 'andviro/flake8-vim'
" Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/machakann/vim-highlightedyank.git'
" Plug 'fisadev/vim-isort'
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'https://github.com/honza/vim-snippets.git'
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'davidhalter/jedi-vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'lambdalisue/doctest.vim'

if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy'  }
endif

call plug#end()

"let g:python3_host_prog="$HOME/.pyenv/versions/nvim/bin/python3.8"

if !exists("autocommands_loaded")
      let autocommands_loaded = 1
        autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python.vim
    endif

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Keymapping for Nerdtree
map <F12> :NERDTreeToggle<CR>


set paste

" Airline config
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline#extensions#xkblayout#enabled = 1
"let g:airlinesection_a = airline@sections#
let g:airline_symbols.paste = 'P'
let g:airline#extensions#default#section_truncate_width = {
    \ 'warning': 100,
    \ 'error': 100,
    \ }
let g:airline_section_y = ''

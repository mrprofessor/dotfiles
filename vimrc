"
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"
"
" This config supports both vim and neovim.
set nocompatible                      " Disable compatibility to old-time vi
set showmatch                         " Show matching brackets.
set ignorecase                        " Do case insensitive matching
set mouse=v                           " middle-click paste with mouse
set hlsearch                          " highlight search results
set tabstop=2                         " number of columns occupied by a tab character
set softtabstop=2                     " see multiple spaces as tabstops so <BS> does the right thing
set expandtab                         " converts tabs to white space
set shiftwidth=2                      " width for autoindents
set autoindent                        " indent a new line the same amount as the line just typed
set number                            " add line numbers
set wildmode=longest,list             " get bash-like tab completions
set cc=80                             " set an 80 column border for good coding style
set clipboard=unnamed                 " This makes yanking work with default Terminal
set shell=/bin/zsh                    " set default shell to zsh
set splitbelow                        " default horizontal split below
set splitright                        " default vertical split right
set cursorline
" set mouse=a                         " mouse support on
set guioptions=                       " remove both side scrollbars from macvim 
" Ture color for neovim
set autoread
set encoding=UTF-8                    " Set Encoding(not needed for neovim)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
hi Normal guibg=NONE ctermbg=NONE     " Transparent vim

" PEP 8(python 3)
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \  softtabstop=4
    \  shiftwidth=4
    \  textwidth=79
    \  expandtab
    \  autoindent
    \  fileformat=unix

" Font for gui
set guifont=Operator\ Mono\ Book\ Nerd\ Font:h18

" To use fzf in Vim
set rtp+=/usr/local/opt/fzf

" toggle spelling
nnoremap <leader>s :set invspell<CR>


"===========================================================
" BEGIN  PLUGINS
"===========================================================

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'zivyangll/git-blame.vim'
Plugin 'scrooloose/nerdcommenter'

Plugin 'dense-analysis/ale'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-startify'
Plugin 'prettier/vim-prettier'

Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jeetsukumaran/vim-pythonsense'
Plugin 'ambv/black'
Plugin 'heavenshell/vim-pydocstring'
Plugin 'vim-airline/vim-airline'

" Languages
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plugin 'plasticboy/vim-markdown'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'l04m33/vlime'
Plugin 'kylef/apiblueprint.vim'
Plugin 'jceb/vim-orgmode'
Plugin 'kaarmu/typst.vim'
Plugin 'chomosuke/typst-preview.nvim'

" Colors
Plugin 'vim-airline/vim-airline-themes'
Plugin 'srcery-colors/srcery-vim'

" Search and file browser
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Auto completion

" vim8/neovim specific
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" Float baby float
Plugin 'voldikss/vim-floaterm'
Plugin 'liuchengxu/vim-clap'

" Tags
Plugin 'majutsushi/tagbar'

" Devicons
Plugin 'ryanoasis/vim-devicons'

call vundle#end()
filetype plugin indent on   " allows auto-indenting depending on file type

"===========================================================
" END  PLUGINS
"===========================================================

" Airline stuff
let g:airline_powerline_fonts = 1

" Git stuff
set diffopt+=vertical

" Markdown
let g:vim_markdown_folding_disabled = 1

" Rust
let g:rustfmt_autosave = 1

" Ale linters
" let g:ale_lint_on_save = 1
let g:black_linelength = 80
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'haskell': ['hls']
  \}


" Ale fixers
"\ 'python': ['black'],
let g:ale_fixers = {
  \ 'python': ['autopep8'],
  \ 'go': ['gofmt'],
  \ 'javascript': ['prettier', 'eslint']
  \ }

" Custom error signs
let g:ale_sign_error = '🚨'



" Run Black on save 
"autocmd BufWritePre *.py execute ':Black'
nmap <leader>d <Plug>(ale_fix)

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Map keys
nmap <leader>l :nohl<CR>
nmap <leader>v :GitBlame<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <F5> :10split term://zsh<CR>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$|env\|myenv\|htmlcov/',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

"" Match tag always setup
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'jsx' : 1
    \}

" Quicker window movement
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Quicker tab movement
nmap <S-l> gt
nmap <S-h> gT

nmap <silent> <leader>o :!open %<CR>

" Python syntax support!
let python_highlight_all=1
let g:pymode_python = 'python3'
let g:pymode_lint = 0 " Disable pymode_lint
let g:pymode_lint_on_write = 0
let g:pymode_lint_message = 1
let g:pymode_rope = 0

" https://vi.stackexchange.com/questions/7932/sourcing-vimrc-file-put-square-brackets-around-file-icons/7974
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
  endif


" Floating stuff
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<leader>t'

" PydocString
nmap <silent> <leader>e <Plug>(pydocstring)

" Tagbar
nmap <leader>g :TagbarToggle<CR>


" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


"===========================================================
" BEGIN COLORS
"===========================================================

" Color solarized(dark)
set termguicolors     " enable true colors support
set background=dark
colorscheme srcery
let g:solarized_bold=1
let g:solarized_italic=1

" Transparent Vim  
hi Normal guibg=NONE ctermbg=NONE "Transparent Vim

"===========================================================
" END COLORS
"===========================================================


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
" This config works for both vim and nvim.
set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=2               " number of columns occupied by a tab character
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set clipboard=unnamed       " This makes yanking work with default Terminal
set shell=/bin/zsh          " set default shell to zsh
set splitbelow              " default horizontal split below
set splitright              " default vertical split right
set cursorline
" set mouse=a               " mouse support on
set guioptions=             " remove both side scrollbars from macvim 
" Ture color for neovim
set autoread
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" set leader key
let mapleader=" "
nnoremap <SPACE> <Nop>



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
Plugin 'airblade/vim-gitgutter'
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
"Plugin 'vim-syntastic/syntastic'
"Plugin 'lucapette/vim-textobj-underscore'

" Languages
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'fatih/vim-go'
Plugin 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plugin 'plasticboy/vim-markdown'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'l04m33/vlime'
Plugin 'kylef/apiblueprint.vim'

" Colors
Plugin 'phanviet/vim-monokai-pro'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'ayu-theme/ayu-vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nanotech/jellybeans.vim'
Plugin 'srcery-colors/srcery-vim'
"Plugin 'dracula/vim'
"Plugin 'rakr/vim-one'
"Plugin 'joshdick/onedark.vim'
"Plugin 'liuchengxu/space-vim-dark'
"Plugin 'sjl/badwolf'
"Plugin 'gruvbox-material/vim', {'as': 'gruvbox-material'}

" Devicons
Plugin 'ryanoasis/vim-devicons'

" Search and file browser
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'takac/vim-hardtime'

" Auto completion
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'zchee/deoplete-jedi'
Plugin 'deoplete-plugins/deoplete-go', { 'do': 'make'}

" vim8 specific
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" Float baby float
Plugin 'voldikss/vim-floaterm'
Plugin 'liuchengxu/vim-clap'

" Distraction free vim
Plugin 'junegunn/goyo.vim'

" Tags
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on   " allows auto-indenting depending on file type

"===========================================================
" END  PLUGINS
"===========================================================

" Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
"let g:airline_theme='onehalfdark'
"let g:airline_theme='gruvbox'
let g:airline_theme='srcery'

" Git stuff
set diffopt+=vertical

" Markdown
let g:vim_markdown_folding_disabled = 1

" Ale linters
" let g:ale_lint_on_save = 1
let g:black_linelength = 80
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'javascript': ['prettier', 'eslint']
  \}


" Ale fixers
"\ 'python': ['black'],
let g:ale_fixers = {
  \ 'python': ['autopep8'],
  \ 'go': ['gofmt'],
  \ 'javascript': ['prettier', 'eslint']
  \ }

let g:black_linelength = 80

" Custom error signs
" Less aggressive than the default '>>'
" let g:ale_sign_error = '●' 
"let g:ale_sign_error = '💩'
let g:ale_sign_error = '🚨'



" Run Black on save 
"autocmd BufWritePre *.py execute ':Black'
nmap <leader>d <Plug>(ale_fix)

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Map keys
nmap <leader>l :nohl<CR>
nmap <leader>s :GitBlame<CR>
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
"let g:pymode_python = 'disable'
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


" --------------------- Vim hardtime
"let g:hardtime_default_on = 1


"===========================================================
" BEGIN COLORS
"===========================================================

" Color gruvvox "
let g:gruvbox_italic=1
colo gruvbox
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark='medium'

" Color srcery-vim
let g:srcery_italic=1
let g:srcery_bold=1
colorscheme srcery

" Color jellybeans
"let g:jellybeans_use_term_italics = 1
"colorscheme jellybeans

" space-vim-dark
"colo space-vim-dark
"set termguicolors
"hi LineNr ctermbg=NONE guibg=NONE
"hi Comment cterm=italic
" Python specific
"hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold
"   Range:   233 (darkest) ~ 238 (lightest)
"   Default: 235
"let g:space_vim_dark_background = 234

" /Favourites "

 "Color onedark "
"colo onedark
"let g:onedark_terminal_italics=1

"...
"set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of them
"colorscheme ayu
"

"===========================================================
" END COLORS
"===========================================================

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
"   You are about to experience a potent dosage of Vim. Watch your steps.
"
"                ╔══════════════════════════════════════════╗
"                ║           ⎋ HERE BE VIMPIRES ⎋           ║
"                ╚══════════════════════════════════════════╝

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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

 
" Font for macvim
set guifont=Operator\ Mono\ Medium\ Nerd\ Font\ Complete:h16

" To use fzf in Vim
set rtp+=/usr/local/opt/fzf

" toggle spelling
nnoremap <leader>s :set invspell<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'zivyangll/git-blame.vim'

Plugin 'w0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'mhinz/vim-startify'
Plugin 'prettier/vim-prettier'

Plugin 'mxw/vim-jsx'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/nerdcommenter'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'gorodinskiy/vim-coloresque'

" Colors
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'joshdick/onedark.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-one'
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" Devicons
Plugin 'ryanoasis/vim-devicons'

" Search and file browser
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'takac/vim-hardtime'

" Games
Plugin 'johngrib/vim-game-snake'

" Auto completion
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call vundle#end()
filetype plugin indent on   " allows auto-indenting depending on file type

" Color scheme after vim-colorschemes are loaded
" Dark themes: onedark, ayu(dark)
" Light themes: peachpuff, PaperColor, ayu(light)
" set termguicolors 

" Color onehalflight
" colo onehalflight

" Color one
" colorscheme one
" set background=light

" Color papercolor
"set background=light
"colorscheme PaperColor
"let g:PaperColor_Theme_Options = {
  "\   'theme': {
  "\        'allow_italic': 1
  "\   }
  "\ }

" /Favourites "

" Color onedark "
"colo onedark
"let g:onedark_terminal_italics=1

" Color gruvvox "
let g:gruvbox_italic=1
colo gruvbox
set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark='medium'

" Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
"let g:airline_theme='onedark'

" Git stuff
set diffopt+=vertical

" Vim hardtime
" let g:hardtime_default_on = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'

" Ale fixers
" let g:ale_fixers = ['prettier', 'eslint']
" let g:ale_lint_on_save = 1
" let g:ale_linters = {
"   \ 'javascript': ['prettier', 'eslint']
"   \}

let g:ale_fixers = {
  \ 'javascript': ['prettier', 'eslint']
  \ }
" let g:ale_fix_on_save = 1
" Less aggressive than the default '>>'
" let g:ale_sign_error = '●' 
nmap <leader>d <Plug>(ale_fix)

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Map keys
nmap <leader>l :nohl<CR>
nmap <leader>s :GitBlame<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <F5> :10split term://zsh<CR>

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
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

"" Hybrid numbers
"augroup numbertoggle
  "autocmd!
  "autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set rnu   | endif
  "autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set nornu | endif
"augroup END

" Quicker window movement
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Quicker tab movement
nmap <S-l> gt
nmap <S-h> gT

nmap <silent> <leader>o :!open %<CR>

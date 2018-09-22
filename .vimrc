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
"                Source : mhinz/dotfiles/.vim/vimrc

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
" set mouse=a                 " mouse support on

 
" Font for macvim
set guifont=Operator\ Mono\ Book:h18

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
Plugin 'kchmck/vim-coffee-script'
Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'sonph/onehalf'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'rking/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

"Plugin 'elzr/vim-json'
"Plugin 'Valloric/MatchTagAlways'

call vundle#end()
filetype plugin indent on   " allows auto-indenting depending on file type

" Color scheme after vim-colorschemes are loaded
colo onedark
let g:onedark_terminal_italics=1

" Airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

" Git stuff
set diffopt+=vertical

" Markdown
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'

" Ale fixers
" let g:ale_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
  \ 'javascript': ['prettier', 'eslint']
  \ }
" Less aggressive than the default '>>'
let g:ale_sign_error = '●' 
nmap <leader>d <Plug>(ale_fix)

" Map keys
nnoremap <C-L> :nohl<CR><C-L>
nmap <F6> :NERDTreeToggle<CR>

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

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

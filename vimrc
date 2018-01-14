set nocompatible              " be iMproved, required

" Restrict from using arrown keys
nnoremap <Left> :echo "Idiot !!"<CR>
vnoremap <Left> :<C-u>echo "Idiot !!"<CR>
inoremap <Left> <C-o>:echo "Idiot !!"<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Clear whitespaces
autocmd BufWritePre * %s/\s\+$//e

"Indent
"" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

filetype off                  " required
" ****** Vundle configuration *****
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" Plugin Name : NerdTree
" Plugin repo : https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
" Plugin Name : nerdtree-git-plugin
" Plugin repo : https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin Name : vim-coffee-script
" Plugin repo : https://github.com/kchmck/vim-coffee-script
Plugin 'kchmck/vim-coffee-script'
" Plugin Name : vim-airline & vim-airline-themes
" Plugin repo : https://github.com/vim-airline/vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin Name : vim-colorschemes
" Plugin Repo : colorschemes
Plugin 'flazz/vim-colorschemes'
" Plugin Name : majutsushi/tagbar
" Plugin repo : https://github.com/majutsushi/tagbar
" Plugin 'majutsushi/tagbar'
" Plugin Name : tpope/vim-fugitive
" Plugin repo : https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'
"
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" ****** Vundle cofiguration ends ******
syntax enable
set cursorline
colorscheme onehalfdark
" Personal setup
" ******NERDTREE******
" NerdTree auto open
" autocmd vimenter * NERDTree  " F6 key has been added already
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Auto refresh NerdTree on new write
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
"
" NERDTree show hidden files
let NERDTreeShowHidden=1
"
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" ****** Vim-airline ******
"set t_Co=256
set termguicolors
let g:airline_theme='onehalflight'
" Make airline more like powerline
" let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"
"
"  Map keys
" Tagbar Toggle
" nmap <F8> :TagbarToggle<CR>
" NerdTree Toggle
nmap <F6> :NERDTreeToggle<CR>
" VIM
"
set hlsearch			" Highlight search items
set incsearch			" Find as you type search
set ignorecase		" Case insensitive
set smartcase			" Case sensitive when uc present
"set wildmenu			" Show menu for completion
"set showmatch			" Show matching brackets

set tabstop=2			" Indentation double space
set shiftwidth=2
set expandtab
set smartindent

set ruler
set number



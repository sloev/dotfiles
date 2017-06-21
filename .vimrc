set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nvie/vim-flake8'

call vundle#end()
filetype plugin indent on

imap jj <esc>

set tabstop=2
set shiftwidth=2
set expandtab

syntax on


au FileType py set autoindent 
au FileType py set smartindent
au FileType py set textwidth=79 "PEP-8 Friendly"


colorscheme gruvbox
set background=dark
set number

map <silent> <C-n> :NERDTreeToggle<CR>
highlight ExtraWhitespace ctermbg=red
set mouse=a

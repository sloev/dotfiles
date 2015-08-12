execute pathogen#infect()

imap jj <esc>

set tabstop=4
set shiftwidth=4
set expandtab

syntax on

filetype plugin indent on

au FileType py set autoindent 
au FileType py set smartindent
au FileType py set textwidth=79 "PEP-8 Friendly"


map <silent> <C-n> :NERDTreeToggle<CR>
colorscheme gruvbox
set background=dark
set number

highlight ExtraWhitespace ctermbg=red
set mouse=a

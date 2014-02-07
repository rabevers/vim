filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
execute pathogen#infect()

Bundle 'gmarik/vundle'
Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'

filetype plugin indent on

syntax on
:set hlsearch

:nmap <C-L> :set invnumber<CR> " Create a mapping to show/hide line numbers by pressing <CTRL>+L
:nmap <C-n> :NERDTreeToggle<CR> " Open and close the NERD tree file browser
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

colorscheme candystripe

" Syntastic options
set statusline+=%#warningmsg#

let g:NERDTreeDirArrows=0

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

"make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

" http://joncairns.com/2012/05/using-vim-as-a-php-ide/#highlighting
" https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
" https://github.com/shawncplus/phpcomplete.vim

filetype off
set rtp+=~/.vim/bundle/vundle/
set nocp    " 'compatible' is not set
call vundle#rc()
execute pathogen#infect()

Bundle 'gmarik/vundle'
Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'shawncplus/phpcomplete.vim'

filetype plugin indent on

syntax on
:set hlsearch
:set tags=./php.tags,php.tags

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

:nmap <C-L> :set invnumber<CR> " Create a mapping to show/hide line numbers by pressing <CTRL>+L
:nmap <C-n> :NERDTreeToggle<CR> " Open and close the NERD tree file browser
":nmap <A-Right> :bn<CR> " Move to next buffer
":nmap <A-Left> :bp<CR> " Move to previous buffer
inoremap <C-Space> <C-x><C-o> " remap CTRL-x CTRL-o to CTRL-SPACE for auto complete
inoremap <C-@> <C-Space>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

colorscheme candystripe

" Syntastic options
set statusline+=%#warningmsg#

let g:NERDTreeDirArrows=0
"let g:SuperTabDefaultCompletionType = ""

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

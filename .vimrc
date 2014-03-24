filetype off
set rtp+=~/.vim/bundle/vundle/
set nocp    " 'compatible' is not set
call vundle#rc()
execute pathogen#infect()

Bundle 'gmarik/vundle'
Bundle 'https://github.com/scrooloose/syntastic.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
"Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'https://github.com/wavded/vim-stylus.git'
Bundle 'https://github.com/xolox/vim-misc.git'
Bundle 'https://github.com/xolox/vim-easytags.git'
Bundle 'https://github.com/gerw/vim-HiLinkTrace.git'
Bundle 'mustache/vim-mustache-handlebars'

filetype plugin indent on

syntax on
:set hlsearch
:set tags=./.php.tags,php.tags

"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

function! ToggleLineNumbering()
    if v:version < 703
        set invnumber
    else
        if &nu == 1
            set rnu
        elseif &rnu == 1
            set nornu
        else
            set nu
        endif
    endif
endfunction

:nmap <C-L> :call ToggleLineNumbering()<CR> " Create a mapping to show/hide line numbers by pressing <CTRL>+L
":nmap <C-L> :set invnumber<CR> " Create a mapping to show/hide line numbers by pressing <CTRL>+L
:nmap <C-n> :NERDTreeToggle<CR> " Open and close the NERD tree file browser
":nmap <A-Right> :bn<CR> " Move to next buffer
":nmap <A-Left> :bp<CR> " Move to previous buffer
inoremap <C-Space> <C-x><C-o> " remap CTRL-x CTRL-o to CTRL-SPACE for auto complete
inoremap <C-@> <C-Space>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Syntastic options
set statusline+=%#warningmsg#

let g:NERDTreeDirArrows=0
"let g:SuperTabDefaultCompletionType = ""

set tabstop=4               " size of a hard tabstop
set shiftwidth=4            " size of an "indent"
set softtabstop =4          " a combination of spaces and tabs are used to simulate tab stops at a width
                            " other than the (hard)tabstop
set smarttab                "make "tab" insert indents instead of tabs at the beginning of a line
set expandtab               " always uses spaces instead of tab characters

:set pastetoggle=<f5>

set t_Co=256
colorscheme candystripe

" Function to create parent directories on saving a file
" http://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END


" http://joncairns.com/2012/05/using-vim-as-a-php-ide/#highlighting
" https://github.com/scrooloose/syntastic/blob/master/doc/syntastic.txt
" https://github.com/shawncplus/phpcomplete.vim

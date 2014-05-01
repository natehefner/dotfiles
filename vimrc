"" Personal Vim Config
"" Created By Nathan Hefner
"" <hefner.nathan@gmail.com>
"""""""""""""""""""""""""""""""
set nocompatible  " First, Use Vim Settings

" GENERAL SETTINGS
"""""""""""""""""""""
set encoding=utf-8           " UTF-8 Encoding of course
set mouse=a                  " Enable the Mouse
set pastetoggle=<F2>         " Paste From Clipboard
set wildignore=*.pyc,*.class " Files To Ignore
set fileformats=unix         " Format files for NIX
filetype off                 " Need For Vundle
set autoread                 " Auto Reload Files
set history=125              " More Command History
set tw=72                    " Wrap Text At 72 Chars

" VISUAL SETTINGS
""""""""""""""""""""""
set showmatch          " Show Matching Brackets
set background=dark    " Dark Background
syntax on              " Syntax Highlighting
set number             " Line Numbers
set showcmd            " Shows Commands

if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" INDENT SETTINGS
""""""""""""""""""""""
set autoindent      " Automatically Indent
set smartindent
set smarttab        " Tabs are Spaces
set backspace=2     " Backspace
set tabstop=2       " 2 Space Tab
set shiftwidth=2    " Same as TabStop
set expandtab       " Spaces insted of tabs
set wrap            " Wrap Long Lines

" BACKUP SETTINGS
"""""""""""""""""""""
set noswapfile      " No Swap Files
set nobackup        " No Backups
set nowb            " No Backups

" FOLD SETTINGS
""""""""""""""""""""
set nofoldenable    " Don't Fold By Default

" SEARCH SETTINGS
""""""""""""""""""""
set incsearch       " Find next match as we search
set hlsearch        " Highlight searches
set viminfo='100,f1 " Save up to 100 marks

" MISC SETTINGS
""""""""""""""""""""
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" STATUSLINE CONFIG
""""""""""""""""""""
if has('statusline')
 set laststatus=2
 set statusline=%<%f\                     " Filename
 set statusline+=%w%h%m%r                 " Options
 set statusline+=%{fugitive#statusline()} " Git Hotness
 set statusline+=\ [%{&ff}/%Y]            " Filetype
 set statusline+=\ [%{getcwd()}]          " File Path
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
 let g:syntastic_enable_signs=1
 set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Nav Infor
endif

" VUNDLE SETTINGS
""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" SYNTAX "
Bundle 'othree/html5.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'lepture/vim-css'
Bundle 'groenewege/vim-less'
Bundle 'lepture/vim-jinja'
Bundle 'tpope/vim-haml'

" IDE "
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

" VC "
Bundle 'tpope/vim-fugitive'

" MISC "
Bundle 'suan/vim-instant-markdown'

filetype plugin indent on
filetype plugin on
filetype on

" COFFEESCRIPT FIX
"""""""""""""""""""
autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" LESSCSS FIX
""""""""""""""
autocmd BufNewFile,BufRead *.less set filetype=less
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" SYNTASTIC SETTINGS
"""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_args = '--ignore="F401"'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_jshint_exec = 'usr/local/bin/jshint'
let g:syntastic_coffee_checkers = ['coffeelint', 'coffee']
let g:syntastic_disabled_filetypes=['html']

" TASKLIST SETTINGS
"""""""""""""""""""""
map <leader>td <Plug>TaskList

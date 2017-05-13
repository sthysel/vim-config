" sthysel's .vimrc
" Maintained by sthysel@gmail.com
"
"" To start vim without using this .vimrc file, use:
"     vim -u NORC
" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE
"
" This vimrc is both good and original - the original bits are not good
" and the good bits are not original.


" Autoinstall Plug pluginmanager {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.config/nvim/plugged')

" Plug plugin manager {{{
call plug#begin("~/.config/nvim/plugged")
Plug 'w0rp/ale'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'szw/vim-maximizer'
Plug 'airblade/vim-gitgutter'
Plug 'ekalinin/Dockerfile.vim'
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree'
Plug 'rking/ag.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'davidhalter/jedi-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'rstacruz/sparkup'
Plug 'vim-scripts/closetag.vim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tmhedberg/SimpylFold'
Plug 'chrisbra/csv.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sickill/vim-monokai'
Plug 'tweekmonster/braceless.vim'
Plug 'pearofducks/ansible-vim'
" Unite
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make'}
Plug 'sthysel/vim-spacemacs'

Plug 'dhruvasagar/vim-table-mode'
call plug#end()
" }}}

" Settings {{{
scriptencoding utf-8
filetype off

" Use :help 'option' to see the documentation for the given option.
let mapleader=' '               " space for mapleader
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set relativenumber              
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                " case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                " shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)
set nrformats=                  " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)
set nrformats-=octal
set shortmess+=I                " hide the launch screen
set clipboard=unnamed           " normal OS clipboard interaction
set autoread                    " automatically reload files changed outside of Vim
set hidden                      " hide buffers instead of closing them this
                                "    means that the current buffer can be put
                                "    to background without being written; and
                                "    that marks and undo history are preserved
set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set undofile                    " keep a persistent backup file
set undodir=~/.vim/.undo,~/tmp,/tmp
set nobackup                    " do not keep backup files, it's 70's style bullshit
set directory=~/.vim/.tmp,~/tmp,/tmp
                                " store swap files in one of these directories
                                "    (in case swapfile is ever turned on)
set viminfo='20,\"80            " read/write a .viminfo file, don't store more
                                "    than 80 lines of registers
set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
set cursorline                  " underline the current line, for quick orientation
set complete-=i
set completeopt=menuone,longest,preview
set ttimeout
set ttimeoutlen=50              " mapped key sequence timeouts
set laststatus=2                " always have status line on last window
set ruler
set cmdheight=2
set autoread
set encoding=utf-8
inoremap <C-U> <C-G>u<C-U>
set fileformats=unix,dos,mac
set viminfo='20,\"50
nmap F !}fmt^M
inoremap <C-c> <Esc> " exit insert mode

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
"}}}


" Folding rules {{{
set foldenable                  " enable folding
set foldcolumn=2                " add a fold column
set foldmethod=marker           " detect triple-{ style fold markers
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
                                " which commands trigger auto-unfold

" this is nicer than the default foldtext, I think
function! MyFoldText()
    let line=getline(v:foldstart)

    let nucolwidth=&fdc + &number * &numberwidth
    let windowwidth=winwidth(0) - nucolwidth - 3
    let foldedlinecount=v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab=strpart('          ', 0, &tabstop)
    let line=substitute(line, '\t', onetab, 'g')

    let line=strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount=windowwidth - len(line) - len(foldedlinecount) - 4
    return line . ' …' . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" Mappings to easily toggle fold levels
nnoremap z0 :set foldlevel=0<cr>
nnoremap z1 :set foldlevel=1<cr>
nnoremap z2 :set foldlevel=2<cr>
nnoremap z3 :set foldlevel=3<cr>
nnoremap z4 :set foldlevel=4<cr>
nnoremap z5 :set foldlevel=5<cr>

" SimplyFold setup for python
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" }}}

" vim-airline {{{
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:Powerline_symbols='unicode'
let g:airline_theme='badwolf'
" }}}

" buffergator {{{
let g:buffergator_viewport_split_policy = 'R' " Use the right side of the screen
let g:buffergator_suppress_keymaps = 1
let g:buffergator_mru_cycle_loop = 1
nmap <LEADER>jj :BuffergatorMruCyclePrev<cr> " Go to the previous buffer open
nmap <LEADER>kk :BuffergatorMruCycleNext<cr> " Go to the next buffer open
nmap <LEADER>bl :BuffergatorOpen<cr> " View the entire list of buffers open
" }}}

" NERDTree {{{
nnoremap <LEADER>n :NERDTreeFocus<CR>
nnoremap <LEADER>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <LEADER>N :NERDTreeClose<CR>

let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")  " Store the bookmarks file
let NERDTreeShowBookmarks=1 " Show the bookmarks table on startup
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1 " Quit on opening files from the tree
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=2 " Use a single click to fold/unfold directories and a double click to open files
" Don't display these kinds of files
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
" }}}


filetype plugin indent on
colorscheme Monokai

" use python/perl regex, not vim build-in
nnoremap / /\v
vnoremap / /\v

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" non patronising positive enforcement
nnoremap <Left> :echoe "No sunshine, use h"<CR>
nnoremap <Right> :echoe "*head pat* no cutie, use l"<CR>
nnoremap <Up> :echoe "Use k noob"<CR>
nnoremap <Down> :echoe "Bitch please, just use j"<CR>

" Use The Silver Searcher (ag) over grep, if possible
if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor
   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif

" Basic shortcuts definitions
" most in visual mode / selection (v or ⇧ v)
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S

set guifont=Sauce\ Code\ Powerline\ Light\ 11

" html
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" indent file
map <F7> mzgg=G`z<CR>

" Explore mode
let g:netrw_liststyle=3

" pasting text into vim
set pastetoggle=<F2>

" Switch from block-cursor to vertical-line-cursor when going into/out of
" insert mode
let &t_SI="\<Esc>]50;CursorShape=1\x7"
let &t_EI="\<Esc>]50;CursorShape=0\x7"


" Windows, splits
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

autocmd FileType python,yaml BracelessEnable +indent +highlight

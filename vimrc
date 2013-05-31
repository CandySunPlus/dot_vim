set nocompatible               " be iMproved
set mouse=a

filetype off                   " required!

let mapleader = ','

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tsaleh/vim-matchit'
Bundle 'chriskempson/tomorrow-theme.git', {'rtp': 'vim/'}
Bundle 'tomasr/molokai'
Bundle 'digitaltoad/vim-jade'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/syntastic.git' 
Bundle 'scrooloose/nerdtree'
Bundle 'Yggdroot/indentLine'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jeetsukumaran/vim-buffergator.git'
Bundle 'tomtom/tcomment_vim.git'
Bundle 'Valloric/YouCompleteMe.git'
Bundle "pangloss/vim-javascript"
Bundle 'mattn/zencoding-vim.git'
Bundle 'xolox/vim-misc.git'
Bundle 'xolox/vim-session.git'
" snipMate dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
" snipMate
Bundle 'garbas/vim-snipmate'

Bundle 'mikehaertl/pdv-standalone.git'
Bundle 'jiangmiao/auto-pairs.git'
Bundle 'kien/ctrlp.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-surround.git'
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
" ...

filetype plugin indent on     " required!

autocmd FileType * set shiftwidth=4 | set expandtab | set tabstop=4
autocmd FileType javascript,html set shiftwidth=2 | set expandtab | set tabstop=2
colorscheme Tomorrow

set noswapfile
set nobackup
set encoding=utf-8
set autoread
set autowrite
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set hlsearch
set incsearch
set laststatus=2
set noerrorbells
set showcmd
set showmode
syntax on
set nu


if has('gui_macvim')
    colorscheme Tomorrow
    " set guifont=Consolas\ for\ Powerline:h12
    set guifont=Source\ Code\ Pro:h12
    " set guifont=Anonymous\ Pro:h12
    set guioptions-=m  "no menu
    set guioptions-=T  "no toolbar
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set transparency=8

    let g:ctrlp_working_path_mode = 'ra'
endif


let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<D-d>'
let g:multi_cursor_prev_key = '<D-u>'
let g:multi_cursor_skip_key = '<D-k>' "until we got multiple keys support
let g:multi_cursor_quit_key = '<Esc>'

map <D-/> :TComment<cr>
vmap <D-/> :TComment<cr>gv

map <D-p> :CtrlPBuffer<cr>
imap <D-p> <esc>:CtrlPBuffer<cr>

" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

nmap <A-Tab> :MBEbn<cr>
nmap <A-S-Tab> :MBEbp<cr>

nmap <leader>k :NERDTreeToggle<cr>
nmap <leader>/ :TComment<cr>
nmap <leader>t :MiniBufExplorer<cr>
nmap <leader>b :BuffergatorToggle<cr>

let g:session_directory = '~/.session'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
" clear color after search

nnoremap <C-K> :call PhpDocSingle()<cr>
vnoremap <C-K> :call PhpDocRange()<cr>
let g:pdv_cfg_Author = 'Fengming Sun <s@sfmblog.cn>'

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion =
  \ get( g:, 'ycm_key_list_select_completion', ['<Down>'] )

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$|\v[\/](node_modules)$',
  \ 'file': '\v\.(exe|so|dll|tmp|temp|cache|pyc)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }
let g:Powerline_symbols = 'fancy'

" syntasic
let g:syntastic_javascrit_checkers = ['gjslint']
" let g:syntastic_javascript_gjslint_conf = '--disable 0110'

" indent line
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_indentLevel = 20
let g:syntastic_html_tidy_ignore_errors = ['trimming empty']

" for scss
au BufRead,BufNewFile *.scss set filetype=scss

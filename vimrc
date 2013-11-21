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
Bundle 'marijnh/tern_for_vim'
Bundle 'joonty/vdebug.git'
Bundle 'gmarik/sudo-gui.vim'
Bundle 'mhinz/vim-signify'
Bundle 'vim-scripts/nginx.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'mileszs/ack.vim.git'
Bundle 'chriskempson/vim-tomorrow-theme.git'
Bundle 'digitaltoad/vim-jade'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'scrooloose/syntastic.git'
Bundle 'scrooloose/nerdtree'
Bundle 'nathanaelkane/vim-indent-guides.git'
Bundle 'bling/vim-airline'
Bundle 'jeetsukumaran/vim-buffergator.git'
Bundle 'tomtom/tcomment_vim.git'
" Bundle 'majutsushi/tagbar.git'
Bundle 'esukram/vim-taglist'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'ervandew/supertab'
Bundle 'shawncplus/phpcomplete.vim'
" for javascript indent
Bundle 'jelera/vim-javascript-syntax.git'
Bundle 'guileen/simple-javascript-indenter.git'
Bundle 'mattn/emmet-vim'
Bundle 'xolox/vim-misc.git'
Bundle 'xolox/vim-session.git'
" for php5.4
Bundle 'donnut/vim-php54-syntax'
Bundle '2072/PHP-Indenting-for-VIm.git'
" snipMate dependencies
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
" snipMate
Bundle 'garbas/vim-snipmate'

Bundle 'stephpy/vim-phpdoc.git'
Bundle 'jiangmiao/auto-pairs.git'
Bundle 'kien/ctrlp.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'groenewege/vim-less'
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

set noswapfile
set nobackup
set encoding=utf-8
set autoread
set autowrite
set fileformats=unix,dos,mac
set backspace=indent,eol,start
" set hlsearch
set incsearch
set laststatus=2
set noerrorbells
set showcmd
set showmode
set cursorline
set completeopt-=preview
set nu
set rnu
set numberwidth=2
syntax on
set listchars=trail:·,tab:>-
set list


if has('gui_macvim')
    colorscheme Tomorrow
    " set fuoptions=maxvert
    " set guifont=Source\ Code\ Pro:h12
    set guifont=Andale\ Mono:h12
    " set guifont=TheMixMono-Regular:h12
    set linespace=2
    " set guioptions-=T  "no toolbar
    " set guioptions-=l
    " set guioptions-=L
    " set guioptions-=r
    " set guioptions-=R
    let g:ctrlp_working_path_mode = 'ra'
else
    colorscheme Tomorrow-Night
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8
endif

let g:colors_name = ''

let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<D-d>'
let g:multi_cursor_prev_key = '<D-u>'
let g:multi_cursor_skip_key = '<D-k>' "until we got multiple keys support
let g:multi_cursor_quit_key = '<Esc>'

map <D-/> :TComment<cr>
vmap <D-/> :TComment<cr>gv
map <D-r> :CtrlPBufTag<cr>
imap <D-r> <esc>:CtrlPBufTag<cr>
map <D-R> :CtrlPBufTagAll<cr>
imap <D-R> <esc>:CtrlPBufTagAll<cr>
map <D-p> :CtrlPBuffer<cr>
imap <D-p> <esc>:CtrlPBuffer<cr>
" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv
" switch buffer
map <C-Tab> :b#<cr>
" leader keys
nmap <leader>k :NERDTreeToggle<cr>
nmap <leader>/ :TComment<cr>
nmap <leader>r :CtrlPBufTag<cr>
nmap <leader>R :CtrlPBufTagAll<cr>
nmap <leader>o :TlistToggle<cr>
" ctrl keys
nnoremap <C-K> :call PhpDocSingle()<cr>
vnoremap <C-K> :call PhpDocRange()<cr>

" session setting
let g:session_directory = '~/.session'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

let g:pdv_cfg_Author = 'Fengming Sun <s@sfmblog.cn>'
let g:SimpleJsIndenter_BriefMode = 1
let g:jscomplete_use = ['dom', 'moz']

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|build)$|\v[\/](node_modules)$',
  \ 'file': '\v\.(exe|so|dll|tmp|temp|cache|pyc)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
  \ }

let g:ctrlp_buftag_types = {
  \ 'go'         : '--language-force=go --golang-types=ftv',
  \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
  \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
  \ 'objc'       : '--language-force=objc --objc-types=mpci',
  \ 'rc'         : '--language-force=rust --rust-types=fTm'
  \ }

let g:tagbar_type_javascript = {
  \ 'ctagstype' : 'javascript',
  \ 'kinds'     : [
      \ 'o:objects',
      \ 'm:members',
      \ 'f:functions',
      \ 'a:arraies',
      \ 's:strings',
    \ ]
\ }


" syntasic
let g:syntastic_javascript_checkers = ['gjslint']

" indent line
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:syntastic_html_tidy_ignore_errors = ['trimming empty']

" for scss
au BufRead,BufNewFile *.scss set filetype=scss

" for nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif

" neocomplacache and superTab setting
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_disable_auto_complete = 1
"let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLeadingSpaceCompletion = 0
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType ="<C-X><C-U>"
let g:airline_theme = 'bubblegum'
" unicode symbols
let g:airline_linecolumn_prefix = '␊ '
let g:airline_linecolumn_prefix = '␤ '
let g:airline_linecolumn_prefix = '¶ '
let g:airline_branch_prefix = '⎇ '
let g:airline_paste_symbol = 'ρ'
let g:airline_paste_symbol = 'Þ'
let g:airline_paste_symbol = '∥'
let g:airline_whitespace_symbol = 'Ξ'
let g:airline_enable_branch = 1
let g:airline_enable_syntasic = 1

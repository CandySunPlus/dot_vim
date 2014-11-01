set shell=bash
set nocompatible               " be iMproved
set mouse=a
set ts=4
set expandtab
set autoindent
set cindent
let base16colorspace=256

filetype off                   " required!

let mapleader = ','

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
" Plugin 'plasticboy/vim-markdown'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'benmills/vimux'
Plugin 'aliva/vim-fish'
Plugin 'Raimondi/delimitMate'
Plugin 'CandySunPlus/python-vim-instant-markdown'
Plugin 'chriskempson/base16-vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'aklt/plantuml-syntax'
Plugin 'toyamarinyon/vim-swift'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mbbill/undotree'
" For dash
Plugin 'rizzatti/funcoo.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'gmarik/sudo-gui.vim'
Plugin 'mhinz/vim-signify'
Plugin 'vim-scripts/nginx.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'mileszs/ack.vim.git'
Plugin 'digitaltoad/vim-jade'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/syntastic.git'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides.git'
Plugin 'bling/vim-airline'
Plugin 'jeetsukumaran/vim-buffergator.git'
Plugin 'tomtom/tcomment_vim.git'
Plugin 'esukram/vim-taglist'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'ervandew/supertab'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'davidhalter/jedi-vim'
" for clang
Plugin 'Rip-Rip/clang_complete'
" for go
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fsouza/go.vim'
" for python indent
Plugin 'hynek/vim-python-pep8-indent'
" for javascript indent
Plugin 'jelera/vim-javascript-syntax.git'
" Plugin 'CandySunPlus/simple-javascript-indenter.git'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
Plugin 'xolox/vim-misc.git'
Plugin 'xolox/vim-session.git'
" for php5.4
Plugin 'donnut/vim-php54-syntax'
Plugin '2072/PHP-Indenting-for-VIm.git'
" snipMate dependencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
" snipMate
Plugin 'garbas/vim-snipmate'

Plugin 'stephpy/vim-phpdoc.git'
" Plugin 'jiangmiao/auto-pairs.git'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-haml'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround.git'
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" non github repos

call vundle#end()

filetype plugin indent on     " required!

autocmd FileType * set shiftwidth=4 | set expandtab | set tabstop=4
autocmd FileType javascript,html,fish,json set shiftwidth=2 | set expandtab | set tabstop=2

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
set completeopt-=preview
set nu
set rnu
set numberwidth=2
syntax on
set listchars=tab:>-,trail:·
set list
set cursorline


if has('gui_macvim') || has('gui')
    set background=light
    colorscheme base16-tomorrow
    " set fuoptions=maxvert
    " set guifont=Luxi\ Mono:h12
    set guifont=Fira\ Mono:h12
    " set guifont=M+\ 1m:h13
    " set guifont=Source\ Code\ Pro:h12
    " set guifont=Luxi\ Mono:h12
    " set guifont=Andale\ Mono:h12
    " set guifont=TheSansMonoCondensed-Plain:h13
    set linespace=2
    let g:ctrlp_working_path_mode = 'ra'
else
    set background=dark
    colorscheme base16-tomorrow
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
vmap <leader>/ :TComment<cr>gv
nmap <leader>p :CtrlPBuffer<cr>
nmap <leader>o :TlistToggle<cr>
nmap <leader>u :UndotreeToggle<cr>
nmap <leader>b :BuffergatorToggle<cr>
" ctrl keys
nnoremap <C-K> :call PhpDocSingle()<cr>
vnoremap <C-K> :call PhpDocRange()<cr>
" dash keys
nmap <leader>d <Plug>DashSearch

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
let g:syntastic_sass_checkers = []
let g:syntastic_scss_checkers = []

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
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLeadingSpaceCompletion = 0
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabDefaultCompletionType = '<c-x><c-u>'
let g:SuperTabContextDefaultCompletionType ="<c-x><c-o>"
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
let g:AutoPairsMapBS = 0
" clang complete config
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:clang_complete_copen = 1
let g:clang_auto_select = 1
let g:clang_complete_macros = 1

autocmd FileType *
            \ if &omnifunc != '' |
            \   call SuperTabChain(&omnifunc, "<c-p>") |
            \   call SuperTabSetDefaultCompletionType("<c-x><c-u>") |
            \ endif
set fileencodings=utf-8,gbk,gb2312,big5
let g:vim_markdown_folding_disabled = 1
let g:buffergator_suppress_keymaps = 1
autocmd FileType python setlocal completeopt-=preview
" let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 1
" let g:jedi#show_call_signatures = 0

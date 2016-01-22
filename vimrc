syntax on
set shell=/usr/local/bin/zsh
if !has('nvim')
    set nocompatible               " be iMproved
endif
set mouse=a
set ts=4
set expandtab
set autoindent
set cindent
set magic
let base16colorspace=256
let mapleader = ','

call plug#begin('~/.vim/plugged')

" My Plugins here:
Plug 'Valloric/YouCompleteMe'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'Shougo/deoplete.nvim'
Plug 'vhdirk/vim-cmake'
Plug 'junegunn/limelight.vim'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'benmills/vimux'
Plug 'aliva/vim-fish'
Plug 'Raimondi/delimitMate'
Plug 'chriskempson/base16-vim'
Plug 'kyledoherty/espresso-colors-vim'
Plug 'aklt/plantuml-syntax'
Plug 'toyamarinyon/vim-swift'
Plug 'mbbill/undotree'
" Input Method
Plug 'vim-scripts/VimIM'
" TypeScript
Plug 'leafgarland/typescript-vim'
" For dash
Plug 'rizzatti/funcoo.vim'
Plug 'rizzatti/dash.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/nginx.vim'
Plug 'vim-scripts/matchit.zip'
Plug 'mileszs/ack.vim'
Plug 'digitaltoad/vim-jade'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'bling/vim-airline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tomtom/tcomment_vim'
Plug 'esukram/vim-taglist'
Plug 'shawncplus/phpcomplete.vim'
" for Java
Plug 'artur-shaik/vim-javacomplete2'
" for go
Plug 'fsouza/go.vim'
" for python indent
Plug 'hynek/vim-python-pep8-indent'
Plug 'heavenshell/vim-pydocstring'
" for javascript indent
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
" for php5.4
Plug 'donnut/vim-php54-syntax'
Plug '2072/PHP-Indenting-for-VIm'
" snipMate dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
" snipMate
Plug 'garbas/vim-snipmate'
Plug 'kien/ctrlp.vim'

Plug 'groenewege/vim-less'
Plug 'tpope/vim-surround'
" original repos on github
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
" vim-scripts repos
Plug 'L9'
Plug 'FuzzyFinder'
" non github repos

call plug#end()

autocmd FileType * set shiftwidth=4 | set expandtab | set tabstop=4
autocmd FileType javascript,html,fish,json set shiftwidth=2 | set expandtab | set tabstop=2
autocmd FileType java set omnifunc=javacomplete#Complete

set noswapfile
set nobackup
if !has('nvim')
    set encoding=utf-8
endif
set autoread
set autowrite
set fileformats=unix,dos,mac
set backspace=indent,eol,start
" set hlsearch
" set incsearch
set laststatus=2
set noerrorbells
set showcmd
set showmode
set completeopt-=preview
set nu
set rnu
set numberwidth=2
set listchars=tab:>-,trail:·
set list
set cursorline


if has('gui_macvim') || has('gui') || has('gui_running')
    set background=dark
    colorscheme Tomorrow-Night
    " set guifont=Fira\ Mono:h12
    set guifont=M+\ 1m\ light:h12
    set linespace=2
    let g:ctrlp_working_path_mode = 'ra'
else
    set background=dark
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
vmap <leader>/ :TComment<cr>gv
nmap <leader>p :CtrlPBuffer<cr>
nmap <leader>o :TlistToggle<cr>
nmap <leader>u :UndotreeToggle<cr>
nmap <leader>b :BuffergatorToggle<cr>
nmap <leader>tm :TableModeToggle<cr>
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
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
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_args = "--harmony --esnext"
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--rcfile=/usr/local/etc/pylint.rc"
let g:syntastic_sass_checkers = []
let g:syntastic_scss_checkers = []
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_objc_compiler_options = ' -fobjc-arc'

" indent line
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:syntastic_html_tidy_ignore_errors = ['trimming empty']

" for scss
au BufRead,BufNewFile *.scss set filetype=scss

" for objective c
au BufRead,BufNewFile *.m set filetype=objc

" for nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif

let g:airline_theme = 'bubblegum'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Input Method
let g:Vimim_cloud=-1
let g:Vimim_toggle='erbi'

" TypeScript
let g:typescript_compiler_options = '-sourcemap'

set fileencodings=utf-8,gbk,gb2312,big5
let g:vim_markdown_folding_disabled = 1
let g:buffergator_suppress_keymaps = 1
let g:jsx_ext_required = 0
set nospell

if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

if has('nvim')
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif


syntax on
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
" Plug 'Valloric/YouCompleteMe'

Plug 'Shougo/deoplete.nvim'
Plug 'Rip-Rip/clang_complete'
Plug 'carlitux/deoplete-ternjs'
Plug 'zchee/deoplete-jedi'
Plug 'mhartington/deoplete-typescript'

Plug 'joshdick/onedark.vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'vhdirk/vim-cmake'
Plug 'junegunn/limelight.vim'
Plug 'benmills/vimux'
Plug 'aliva/vim-fish'
Plug 'Raimondi/delimitMate'
Plug 'chriskempson/base16-vim'
Plug 'kyledoherty/espresso-colors-vim'
Plug 'aklt/plantuml-syntax'
Plug 'toyamarinyon/vim-swift'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
" Input Method
Plug 'CandySunPlus/CY_erbi'
" For all language
Plug 'sheerun/vim-polyglot'
" TypeScript
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
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tomtom/tcomment_vim'
Plug 'esukram/vim-taglist'
Plug 'shawncplus/phpcomplete.vim'
" for Java
Plug 'artur-shaik/vim-javacomplete2'
" for go
" for python indent
Plug 'jmcantrell/vim-virtualenv'
Plug 'hynek/vim-python-pep8-indent'
Plug 'heavenshell/vim-pydocstring'
" for javascript indent
Plug 'bigfish/vim-js-context-coloring'
Plug 'heavenshell/vim-jsdoc'

Plug 'mattn/emmet-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'kien/ctrlp.vim'
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
autocmd FileType html,less,sass,scss,css set shiftwidth=2 | set expandtab | set tabstop=2
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType less set omnifunc=csscomplete#CompleteCSS
au FileType c,cpp,objc,objcpp setl omnifunc=clang_complete#ClangComplete
" for scss
au BufRead,BufNewFile *.scss set filetype=scss
" for objective c
au BufRead,BufNewFile *.m set filetype=objc
" for tern project file
au BufRead,BufNewFile *.tern-project set filetype=json
" for nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif


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
" set completeopt-=preview
set nu
set rnu
set numberwidth=2
set listchars=tab:>-,trail:·
set list
set cursorline

if has('gui_macvim')
    set macligatures
endif

if has('gui_macvim') || has('gui') || has('gui_running') || exists('neovim_dot_app') || exists('g:nyaovim_version')
    colorscheme base16-monokai
    set background=dark
    " set guifont=Fira\ Code:h12
    " set guifont=Hasklig:h12
    " set guifont=menlo:h12
    " set guifont=CamingoCode:h12
    set guifont=Source\ Han\ Sans\ HW\ SC:h12
    " set guifont=Letter\ Gothic\ for\ Powerline:h14
    " set guifont=NanumGothicCoding:h12
    " set guifont=M+\ 1m:h12
    " exec 'set guifontwide=PingFangSC-Light:h12'
    " set guifontwide=PingFangSC-Ultralight:h12
    " set guifont=Letter\ Gothic\ for\ Powerline:h12 中文字体使用
    set linespace=2
    let g:ctrlp_working_path_mode = 'ra'
else
    colorscheme base16-monokai
    set background=dark
endif

if exists('neovim_dot_app')
    call MacSetFont('Source Han Sans HW SC', 12)
    call MacMenu("File.Print", "")
endif


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
nmap <leader>da <Plug>DashSearch
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" session setting
let g:session_directory = '~/.session'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

let g:pdv_cfg_Author = 'Fengming Sun <s@sfmblog.cn>'
let g:SimpleJsIndenter_BriefMode = 1
let g:jscomplete_use = ['dom', 'moz']

let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--config /Users/niksun/.eslintrc.json'
" let g:syntastic_javascript_checkers = ['jsxhint', 'eslint']
" let g:syntastic_javascript_jsxhint_args = '--harmony --esnext'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = "--rcfile=/usr/local/etc/pylint.rc"
let g:syntastic_typescript_checkers = ['tsc', 'tslint']
let g:syntastic_typescript_tsc_fname = ''
let g:syntastic_sass_checkers = []
let g:syntastic_scss_checkers = []
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_objc_compiler_options = ' -fobjc-arc'

" indent line
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_guide_size = 1
let g:syntastic_html_tidy_ignore_errors = ['trimming empty']
let g:airline_theme = 'base16_monokai'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 0

" Input Method
let g:Vimim_cloud = -1
let g:Vimim_toggle = 'erbi'

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
    let g:ycm_auto_trigger = 0
    let g:ycm_min_num_of_chars_for_completion = 99
    let g:python_host_prog = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_completion_start_length = 1
    let g:deoplete#enable_smart_case = 1
    let g:deoplete#max_list=6
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_omnicppcomplete_compliance = 0
    let g:clang_make_default_keymappings = 0
endif

let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"

" let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
" let g:ycm_semantic_triggers = {}
" let g:ycm_semantic_triggers.css = [':' ]
" let g:ycm_semantic_triggers.less = [':']
" let g:ycm_semantic_triggers.scss = [':']
" let g:ycm_key_detailed_diagnostics = '<leader>d'
" let g:ycm_key_invoke_completion = '<S-Space>'
" let g:ycm_autoclose_preview_window_after_insertion = 1

" let g:virtualenv_directory = '/Users/niksun/development/study/python/virtualenvs'

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:javascript_enable_domhtmlcss = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:jsdoc_enable_es6 = 1


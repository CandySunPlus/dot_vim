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
set ignorecase smartcase
set hidden
set noswapfile
set nobackup
if !has('nvim')
    set encoding=utf-8
endif
set autoread
set autowrite
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set nohlsearch
" set incsearch
set laststatus=2
set shortmess+=c
set noerrorbells
set showcmd
set showmode
set completeopt=noinsert,menuone,noselect
set nu
set rnu
set numberwidth=2
set listchars=tab:>-,trail:·
set list
set cursorline
let mapleader = ','

call plug#begin('~/.vim/plugged')

" My Plugins here:

" Auto Complete
" Plug 'Valloric/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
if has('nvim')
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    " Complete Source
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
    Plug 'ncm2/ncm2-ultisnips'

    au TextChangedI * call ncm2#auto_trigger()
    autocmd BufEnter * call ncm2#enable_for_buffer()

    Plug 'autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'bash install.sh',
                \ }

    let g:LanguageClient_serverCommands = {
                \ 'vue': ['vls'],
                \ 'rust': ['rls'],
                \ 'typescript': ['typescript-language-server', '--stdio'],
                \ 'javascript': ['typescript-language-server', '--stdio'],
                \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
                \ 'python': ['pyls'],
                \ 'go': ['go-langserver', '-diagnostics', '-gocodecompletion'],
                \ 'css': ['css-languageserver', '--stdio'],
                \ 'less': ['css-languageserver', '--stdio'],
                \ 'sass': ['css-languageserver', '--stdio'],
                \ }

    let g:LanguageClient_completionPreferTextEdit = 1
    let g:LanguageClient_diagnosticsSignsMax = 0
endif

Plug 'godlygeek/tabular'
Plug 'wellle/targets.vim'
Plug 'qpkorr/vim-bufkill'
Plug 'kylef/apiblueprint.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'sbdchd/neoformat'
Plug 'junegunn/limelight.vim'
Plug 'benmills/vimux'
Plug 'jiangmiao/auto-pairs'
Plug 'chriskempson/base16-vim'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
" Input Method
Plug 'CandySunPlus/CY_erbi'
" For all language
Plug 'sheerun/vim-polyglot'
Plug 'posva/vim-vue'
" Addition
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/matchit.zip'
Plug 'w0rp/ale'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tomtom/tcomment_vim'

Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" for session
Plug 'tpope/vim-obsession'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-surround'
" original repos on github
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/vim-easymotion'
" non github repos

call plug#end()


autocmd FileType * set shiftwidth=4 | set expandtab | set tabstop=4
autocmd FileType less,sass,scss,css set shiftwidth=2 | set expandtab | set tabstop=2
autocmd FileType make setlocal noexpandtab
autocmd FileType vue syntax sync fromstart

au BufRead,BufNewFile *.wxml set filetype=html
au BufRead,BufNewFile *.mina set filetype=vue
" for scss
au BufRead,BufNewFile *.scss set filetype=scss
" for objective c
au BufRead,BufNewFile *.m set filetype=objc
" for tern project file
au BufRead,BufNewFile *.tern-project,*.tern-config set filetype=json
" for nasm
au BufRead,BufNewFile *.asm set filetype=nasm
" for nginx
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/*,/usr/local/etc/nginx/* if &ft == '' | setfiletype nginx | endif



if has('gui_macvim')
    set macligatures
endif

if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif

if has('gui_macvim')
    set guifont=Operator\ Mono:h12
    " set guifontwide=Inziu\ IosevkaCC\ Slab\ SC:h12
    " set guifontwide=Hei:h12
    let g:airline_powerline_fonts = 1
else
    let g:airline_powerline_fonts = 1
endif

if exists('neovim_dot_app')
    " call MacSetFont('Source Han Sans HW SC', 12)
    " call MacSetFont('mononoki', 12)
    call MacSetFont('Fira Code', 12)
    " call MacSetFont('Inziu IosevkaCC Slab SC', 12)
    call MacMenu("File.Print", "")
endif

let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<D-d>'
let g:multi_cursor_prev_key = '<D-u>'
let g:multi_cursor_skip_key = '<D-k>' "until we got multiple keys support
let g:multi_cursor_quit_key = '<Esc>'

vmap <C-c> "+y

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
nmap <leader>o :TlistToggle<cr>
nmap <leader>u :UndotreeToggle<cr>
nmap <leader>b :BuffergatorToggle<cr>
nmap <leader>tm :TableModeToggle<cr>
nmap <leader>il :IndentLinesReset<cr>
let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <leader>jd :call LanguageClient#textDocument_definition()<CR>
nmap <leader>jr :call LanguageClient#textDocument_rename()<CR>
nmap <leader>jh :call LanguageClient#textDocument_hover()<CR>
nmap <leader>fi :YcmCompleter OrganizeImports<CR>:ALEFix<CR>
nmap <leader>ff :Neoformat<CR>
"Use 'm/M' to move among buffers
noremap m :bn<CR>
noremap M :bp<CR>

let g:pdv_cfg_Author = 'Fengming Sun <s@sfmblog.cn>'

" Denite
" Option 1 : Set colors yourself
hi deniteMatchedChar ctermbg=NONE ctermfg=154
" Option 2 : link to other Highlight Group
hi link deniteMatchedChar Identifier
call denite#custom#option('default', 'prompt', '»')
" call denite#custom#option('default', 'highlight_mode_insert', 'CursorLine')
" call denite#custom#option('default', 'highlight_matched_range', 'None')
" call denite#custom#option('default', 'highlight_matched_char', 'None')

call denite#custom#map(
            \ 'insert',
            \ '<Down>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-n>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<Up>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-p>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', ['.git/'])
call denite#custom#source('file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
" Use ag for search
if executable('ag')
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])

endif

nmap <space> [denite]
nnoremap <silent> [denite]p :<C-U>Denite -auto-resize file_rec<CR>
nnoremap <silent> [denite]b :<C-U>Denite -auto-resize buffer<CR>


" autocmd FileType c,cpp,objc,objcpp setl omnifunc=clang_complete#ClangComplete
let g:JavaComplete_Home = $HOME . '/.vim/plugged/vim-javacomplete2'
let g:neoformat_html_htmlbeautify = {
            \ 'exe': 'html-beautify',
            \'args':['-A force','-w 100','-U a,abbr,area,audio,b,bdi,bdo,br,button,canvas,cite,code,data,datalist,del,dfn,em,embed,i,iframe,img,input,ins,kbd,keygen,label,map,mark,math,meter,noscript,object,output,progress,q,ruby,s,samp,select,small,span,strong,sub,sup,svg,textarea,time,u,var,video,wbr,text,acronym,address,big,dt,ins,strike,tt']
            \ }
let g:neoformat_typescript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote', '--parser typescript', '--trailing-comma none', '--tab-width 4', '--print-width 100'],
            \ 'stdin': 1,
            \ }

let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote', '--trailing-comma none', '--tab-width 4', '--print-width 100'],
            \ 'stdin': 1,
            \ }

let g:neoformat_enabled_html = ['htmlbeautify']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_python = ['yapf']


let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'typescript': ['tslint'],
            \ 'less': ['lessc'],
            \ 'go': [],
            \ 'html': [],
            \ 'cpp': [],
            \ 'c': [],
            \ 'java': ['javac']
            \}

let g:ale_fixers = {
            \ 'javascript': ['eslint'],
            \ 'typescript': ['tslint']
            \}

let g:ale_less_lessc_use_global = 1
let g:ale_javascript_eslint_options = '-c ~/.eslintrc.json'
let g:ale_less_lessc_options = '--npm-import="prefix=~"'
let g:ale_typescript_tslint_options = '--project ./'

let g:airline_theme = 'base16'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 0
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

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
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

" let g:ycm_log_level = 'debug'
" let g:ycm_server_python_interpreter = '/usr/local/bin/python3'
" let g:ycm_rust_src_path = '~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
" let g:ycm_semantic_triggers = {}
" if !exists("g:ycm_semantic_triggers")
"     let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers['typescript'] = ['.']
" let g:ycm_semantic_triggers['css'] = [':']
" let g:ycm_semantic_triggers['less'] = [':']
" let g:ycm_semantic_triggers['scss'] = [':']
" let g:ycm_semantic_triggers['vue'] = ['.',':','/','@','*']
" let g:ycm_key_detailed_diagnostics = '<leader>d'
" let g:ycm_key_invoke_completion = '<S-Space>'
" let g:ycm_global_ycm_extra_conf = '/Users/niksun/.ycm_extra_conf.py'
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:virtualenv_directory = '/Users/niksun/development/study/python/virtualenvs'
"

let g:airline_exclude_preview = 1
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-n>"
let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsSnippetDirectories = ["UltiSnips", $HOME."/.snips"]

let g:javascript_enable_domhtmlcss = 1
let g:ackprg = 'ag --nogroup --nocolor --column --hidden'

let g:indentLine_char = "┆"
let g:indentLine_first_char = "┆"

let g:JavaComplete_GradleExecutable = "/usr/local/bin/gradle"
let g:vue_disable_pre_processors=1


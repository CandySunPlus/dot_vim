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
set fileencodings=utf-8,gbk,gb2312,big5
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
set completeopt=noinsert,menuone,noselect,preview
set nu
set rnu
set numberwidth=2
set listchars=tab:>-,trail:·
set list
set cursorline
let mapleader = ' '

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

    set completefunc=LanguageClient#complete
    set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

    let g:LanguageClient_serverCommands = {
                \ 'vue': ['vls'],
                \ 'rust': ['rls'],
                \ 'typescript': ['typescript-language-server', '--stdio'],
                \ 'javascript': ['typescript-language-server', '--stdio'],
                \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
                \ 'python': ['pyls'],
                \ 'cpp': ['clangd'],
                \ 'c': ['clangd'],
                \ 'go': ['go-langserver', '-diagnostics', '-gocodecompletion'],
                \ 'css': ['css-languageserver', '--stdio'],
                \ 'less': ['css-languageserver', '--stdio'],
                \ 'sass': ['css-languageserver', '--stdio'],
                \ 'java': ['jdtls'],
                \ }

    let g:LanguageClient_rootMarkers = {
                \ 'javascript': ['project.json'],
                \ 'typescript': ['tsconfig.json'],
                \ 'rust': ['Cargo.toml'],
                \ 'go': ['Gopkg.toml'],
                \ }

    let g:LanguageClient_diagnosticsEnable = 0
    let g:LanguageClient_completionPreferTextEdit = 1
    let g:LanguageClient_diagnosticsSignsMax = 0
    let g:LanguageClient_hoverPreview = 'Always'
endif

Plug 'godlygeek/tabular'
Plug 'wellle/targets.vim'
Plug 'kylef/apiblueprint.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neomru.vim'
Plug 'chemzqm/denite-git'
Plug 'sbdchd/neoformat'
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
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/matchit.zip'
Plug 'w0rp/ale'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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



vmap <C-c> "+y
" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv
" switch buffer
map <C-Tab> :b#<cr>
" leader keys
nmap <leader>/ :TComment<cr>
vmap <leader>/ :TComment<cr>gv
nmap <leader>k :<C-U>NERDTreeToggle<cr>
nmap <leader>o :<C-U>TlistToggle<cr>
nmap <leader>u :<C-U>UndotreeToggle<cr>
nmap <leader>il :<C-U>IndentLinesReset<cr>
nmap <leader>tm :TableModeToggle<cr>
nmap <leader>ff :Neoformat<CR>

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


if !exists('*SetLSPShortcuts')
    function SetLSPShortcuts()
        nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
        nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
        nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>:ALEFix<CR>
        nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
        nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
        nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
        nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
    endfunction()
endif

augroup LSP
    autocmd!
    autocmd FileType * call SetLSPShortcuts()
augroup END

let g:pdv_cfg_Author = 'Fengming Sun <s@sfmblog.cn>'

" Denite
" Option 1 : Set colors yourself
hi deniteMatchedChar ctermbg=NONE ctermfg=154
" Option 2 : link to other Highlight Group
hi link deniteMatchedChar Identifier
call denite#custom#option('default', 'prompt', '»')

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

nnoremap <silent> <leader>p :<C-U>Denite -auto-resize file_rec<CR>
nnoremap <silent> <leader>b :<C-U>Denite -auto-resize buffer<CR>
" denite git plugin
nnoremap <silent> <leader>gl :<C-U>Denite gitlog<CR>
nnoremap <silent> <leader>gs :<C-U>Denite gitstatus<CR>
nnoremap <silent> <leader>gc :<C-U>Denite gitchanged<CR>
nnoremap <silent> <leader>gb :<C-U>Denite gitbranch<CR>
" denite language client
nnoremap <silent> <leader>lo :<C-U>Denite documentSymbol<CR>
nnoremap <silent> <leader>lr :<C-U>Denite references<CR>
nnoremap <silent> <leader>lm :Denite contextMenu<CR>


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
" Enable alignment globally
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion globally
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace globally
let g:neoformat_basic_format_trim = 1


let g:ale_linters = {
            \ 'javascript': ['eslint'],
            \ 'typescript': ['tsserver', 'tslint'],
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
let g:ale_proto_protoc_gen_lint_options = '--proto_path=${GOPATH}/src'

let g:airline_theme = 'base16'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Input Method
let g:Vimim_cloud = -1
let g:Vimim_toggle = 'erbi'

" TypeScript
let g:typescript_compiler_options = '-sourcemap'

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

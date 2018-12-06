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
set completeopt=noinsert,menuone
set nu
set rnu
set numberwidth=2
set showtabline=2
set listchars=tab:>-,trail:·
set list
set cursorline
set updatetime=300
set signcolumn=yes

let mapleader = ' '

call plug#begin('~/.vim/plugged')

" My Plugins here:

" Auto Complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

Plug 'vimlab/split-term.vim'
Plug 'Konfekt/FastFold'
Plug '0x84/vim-coderunner'
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
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'mgee/lightline-bufferline'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
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


hi ALEError ctermbg=none cterm=undercurl

vmap <C-c> "+y
" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv
" leader keys
nmap <leader>/ :TComment<cr>
vmap <leader>/ :TComment<cr>gv
nmap <leader>k :<C-U>NERDTreeToggle<cr>
nmap <leader>o :<C-U>TlistToggle<cr>
nmap <leader>u :<C-U>UndotreeToggle<cr>
nmap <leader>il :<C-U>IndentLinesReset<cr>
nmap <leader>tm :TableModeToggle<cr>
nmap <leader>ff :Neoformat<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" auto close preview window when complete done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>ld <Plug>(coc-definition)
nmap <leader>lr <Plug>(coc-references)
nmap <leader>ln <Plug>(coc-rename)
nmap <leader>lf <Plug>(coc-format):ALEFix<cr>
vmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>li <Plug>(coc-implementation)
nmap <leader>lt <Plug>(coc-type-definition)
nmap <leader>la <Plug>(coc-codeaction)
nmap <leader>lh :call CocAction('doHover')<CR>

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

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
nnoremap <silent> <leader>lo :<C-U>Denite coc-symbols<CR>
nnoremap <silent> <leader>le :<C-U>Denite coc-extension<CR>


" autocmd FileType c,cpp,objc,objcpp setl omnifunc=clang_complete#ClangComplete
let g:JavaComplete_Home = $HOME . '/.vim/plugged/vim-javacomplete2'
let g:neoformat_html_htmlbeautify = {
            \ 'exe': 'html-beautify',
            \'args':['-A force','-w 100','-U a,abbr,area,audio,b,bdi,bdo,br,button,canvas,cite,code,data,datalist,del,dfn,em,embed,i,iframe,img,input,ins,kbd,keygen,label,map,mark,math,meter,noscript,object,output,progress,q,ruby,s,samp,select,small,span,strong,sub,sup,svg,textarea,time,u,var,video,wbr,text,acronym,address,big,dt,ins,strike,tt']
            \ }
let g:neoformat_typescript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--parser typescript'],
            \ 'stdin': 1,
            \ }

let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin', '--stdin-filepath', '%:p'],
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
            \ 'go': ['gobuild'],
            \ 'html': [],
            \ 'cpp': [],
            \ 'c': [],
            \ 'java': ['javac']
            \}

let g:ale_fixers = {
            \ 'javascript': ['eslint'],
            \ 'rust': ['rustfmt'],
            \ 'typescript': ['tslint'],
            \ 'go': ['goimports'],
            \}

let g:ale_less_lessc_use_global = 1
let g:ale_javascript_eslint_options = '-c ~/.eslintrc.json'
let g:ale_less_lessc_options = '--npm-import="prefix=~"'
let g:ale_typescript_tslint_options = '--project ./'
let g:ale_proto_protoc_gen_lint_options = '--proto_path=${GOPATH}/src'

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#number_map = {
            \ 0: '⁰', 1: '¹', 2: '²', 3: '³', 4: '⁴',
            \ 5: '⁵', 6: '⁶', 7: '⁷', 8: '⁸', 9: '⁹'}
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

let g:lightline = { }
let g:lightline.colorscheme = 'powerline'
let g:lightline = {
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ }
let g:lightline.component_function = {
            \   'gitbranch': 'fugitive#head',
            \   'cocstatus': 'coc#status'
            \ }
let g:lightline.tabline = {
            \   'left': [['buffers']],
            \   'right': [['close']],
            \ }
let g:lightline.component_type = {
            \   'linter_checking': 'left',
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'left',
            \   'buffers': 'tabsel',
            \ }
let g:lightline.component_expand = {
            \   'linter_checking': 'lightline#ale#checking',
            \   'linter_warnings': 'lightline#ale#warnings',
            \   'linter_errors': 'lightline#ale#errors',
            \   'linter_ok': 'lightline#ale#ok',
            \   'buffers': 'lightline#bufferline#buffers',
            \ }
let g:lightline.active = {
            \   'left':[[ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
            \   'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
            \       ['lineinfo', 'percent', 'charvaluehex'], [ 'fileformat', 'fileencoding', 'filetype']],
            \ }

let g:lightline.component = {
            \   'charvaluehex': '0x%B',
            \ }

" Vim Run Code
let g:vcr_languages = {}
let g:vcr_languages["typescript"] = {
            \ "cmd": "deno",
            \ "ext": "ts",
            \ }

let g:vcr_languages["javascript"] = {
            \ "cmd": "node",
            \ "ext": "js",
            \ }

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

let g:UltiSnipsSnippetDirectories = ["UltiSnips", $HOME."/.snips"]
let g:UltiSnipsExpandTrigger = "<c-j>"

let g:javascript_enable_domhtmlcss = 1
let g:ackprg = 'ag --nogroup --nocolor --column --hidden'

let g:indentLine_char = "┆"
let g:indentLine_first_char = "┆"

let g:JavaComplete_GradleExecutable = "/usr/local/bin/gradle"
let g:vue_disable_pre_processors=1



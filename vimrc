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

Plug 'tpope/vim-scriptease'
" Auto Complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

Plug 'vimlab/split-term.vim'
Plug 'Konfekt/FastFold'
Plug '0x84/vim-coderunner'
Plug 'godlygeek/tabular'
Plug 'wellle/targets.vim'
Plug 'kylef/apiblueprint.vim'

Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/neomru.vim'
Plug 'sbdchd/neoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'editorconfig/editorconfig-vim'
" Input Method
Plug 'CandySunPlus/CY_erbi'
" Flutter
Plug 'reisub0/hot-reload.vim'
" Addition
Plug 'mhinz/vim-signify'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/matchit.zip'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'tomtom/tcomment_vim'
Plug 'mattn/emmet-vim'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" for session
Plug 'tpope/vim-obsession'
Plug 'wakatime/vim-wakatime'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
" original repos on github
Plug 'Lokaltog/vim-easymotion'
" non github repos
" Plug 'danielwe/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ryanoasis/vim-devicons'
" For all language
Plug 'sheerun/vim-polyglot'

call plug#end()


" autocmd FileType * set shiftwidth=4 | set expandtab | set tabstop=4
" autocmd FileType make setlocal noexpandtab
autocmd FileType vue syntax sync fromstart
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" if (has('termguicolors'))
"   set termguicolors
" endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:webdevicons_conceal_nerdtree_brackets = 0
let g:nord_cursor_line_number_background = 1
let g:nord_uniform_status_lines = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

colorscheme nord

vmap <C-c> "+y
" Indent lines with cmd+[ and cmd+]
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv
" leader keys
nmap <leader>/ :<C-U>TComment<cr>
vmap <leader>/ :<C-U>TComment<cr>gv
nmap <leader>k :<C-U>NERDTreeToggle<cr>
nmap <leader>u :<C-U>UndotreeToggle<cr>
nmap <leader>il :<C-U>IndentLinesReset<cr>
nmap <leader>tm :<C-U>TableModeToggle<cr>
nmap <leader>ff :<C-U>Neoformat<CR>

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
autocmd User VimagitEnterCommit startinsert


nmap <leader>g :<C-U>call magit#show_magit('h')<CR>
nmap <leader>p :<C-U>CocList files<CR>
nmap <leader>o :<C-U>CocList mru<CR>
nmap <leader>b :<C-U>CocList buffers<CR>
nmap <leader>f :<C-U>CocList grep<CR>
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>lr <Plug>(coc-references)
nmap <leader>ln <Plug>(coc-rename)
nmap <leader>lf <Plug>(coc-format)
vmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>li <Plug>(coc-implementation)
nmap <leader>lt <Plug>(coc-type-definition)
nmap <leader>la <Plug>(coc-codeaction)
vmap <leader>la <Plug>(coc-codeaction-selected)
nmap <leader>ls :<C-U>call CocAction('doHover')<CR>
nmap <leader>lo :<C-U>CocList outline<CR>
nmap <leader>le :<C-U>CocList diagnostics<CR>
nmap <leader>gb :<C-U>CocList branches<CR>
nmap <leader>gc :<C-U>CocList commits<CR>

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="


let g:pdv_cfg_Author = 'Fengming Sun <s@sfmblog.cn>'

" autocmd FileType c,cpp,objc,objcpp setl omnifunc=clang_complete#ClangComplete
let g:JavaComplete_Home = $HOME . '/.vim/plugged/vim-javacomplete2'

" let g:neoformat_less_prettier = {
"             \ 'exe': 'prettier',
"             \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--tab-width 2'],
"             \ 'stdin': 1,
"             \ }

let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_less = ['prettier']
let g:neoformat_enabled_scss = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']
let g:neoformat_enabled_yaml = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_python = ['yapf']
" Enable alignment globally
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion globally
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace globally
let g:neoformat_basic_format_trim = 1

let g:lightline#bufferline#show_number  = 2
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#number_map = {
            \ 0: '', 1: '', 2: '', 3: '', 4: '',
            \ 5: '', 6: '', 7: '', 8: '', 9: ''}
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

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

function! LightlineCocWarnings() abort
    let l:info = get(b:, 'coc_diagnostic_info', {})
    return get(info, 'warning', 0) == 0 ? '' : printf(' %d', info['warning'])
endfunction

function! LightlineCocErrors() abort
    let l:info = get(b:, 'coc_diagnostic_info', {})
    return get(info, 'error', 0) == 0 ? '' : printf(' %d', info['error'])
endfunction

function! LightlineCocOk() abort
    let l:info = get(b:, 'coc_diagnostic_info', {})
    return (get(info, 'error', 0) == 0 && get(info, 'warning', 0) == 0) ? '' : ''
endfunction

function! GitBranch() abort
    return "" != fugitive#head() ? ' '.fugitive#head() : ''
endfunction

let g:lightline = { }
let g:lightline = {
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'colorscheme': 'nord',
            \ }
let g:lightline.component_function = {
            \   'gitbranch': 'GitBranch',
            \ }
let g:lightline.tabline = {
            \   'left': [['buffers']],
            \   'right': [['close']],
            \ }
let g:lightline.component_type = {
            \   'linter_warnings': 'warning',
            \   'linter_errors': 'error',
            \   'linter_ok': 'left',
            \   'buffers': 'tabsel',
            \ }
let g:lightline.component_expand = {
            \   'buffers': 'lightline#bufferline#buffers',
            \   'linter_warnings': 'LightlineCocWarnings',
            \   'linter_errors': 'LightlineCocErrors',
            \   'linter_ok': 'LightlineCocOk',
            \ }
let g:lightline.active = {
            \   'left':[[ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
            \   'right': [[ 'linter_errors', 'linter_warnings', 'linter_ok' ],
            \       ['ffsymbol', 'ftsymbol', 'lineinfo']],
            \ }

let g:lightline.component = {
            \   'ffsymbol': '%{WebDevIconsGetFileFormatSymbol()} %{&fenc!=#""?&fenc:&enc}',
            \   'ftsymbol': '%{WebDevIconsGetFileTypeSymbol()}',
            \   'lineinfo': ' %l:%c %p%%'
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

let g:indentLine_char = "┆"
let g:indentLine_first_char = "┆"

let g:JavaComplete_GradleExecutable = "/usr/local/bin/gradle"
let g:vue_disable_pre_processors=1



syntax on
if !has('nvim')
    set nocompatible               " be iMproved
    set encoding=utf-8
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
set fileencodings=utf-8,gbk,gb2312,big5
set autoread
set autowrite
set fileformats=unix,dos,mac
set backspace=indent,eol,start
set nohlsearch
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
Plug 'qpkorr/vim-bufkill'
" Auto Complete
Plug 'neoclide/coc.nvim', {'do': 'yarn install'}

Plug 'vimlab/split-term.vim'
" Plug '0x84/vim-coderunner'
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
Plug 'honza/vim-snippets'
" for session
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
" original repos on github
Plug 'Lokaltog/vim-easymotion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" non github repos
" Plug 'danielwe/base16-vim'
" Plug 'arcticicestudio/nord-vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'ryanoasis/vim-devicons'
" For all language
Plug 'sheerun/vim-polyglot'
Plug 'briancollins/vim-jst'
Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()


" autocmd FileType * set shiftwidth=4 | set expandtab | set tabstop=4
" autocmd FileType make setlocal noexpandtab
autocmd FileType vue syntax sync fromstart
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

au BufRead,BufNewFile *.wxml set filetype=html
au BufRead,BufNewFile *.wxss set filetype=less
au BufRead,BufNewFile *.wxs set filetype=javascript
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

if (has('termguicolors'))
  " fix bug for vim
  set t_8f=[38;2;%lu;%lu;%lum
  set t_8b=[48;2;%lu;%lu;%lum

  set termguicolors
endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

let g:webdevicons_conceal_nerdtree_brackets = 0
" let g:nord_cursor_line_number_background = 1
" let g:nord_uniform_status_lines = 1
" let g:nord_italic = 1
" let g:nord_italic_comments = 1

" let ayucolor="mirage"
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

vnoremap <silent> <C-c> "+y
" Indent lines with cmd+[ and cmd+]
nnoremap <silent> <D-]> >>
nnoremap <silent> <D-[> <<
vnoremap <silent> <D-[> <gv
vnoremap <silent> <D-]> >gv
" leader keys
nmap <silent> <leader>/ :<C-U>TComment<cr>
vmap <silent> <leader>/ :TComment<cr>gv
nmap <silent> <leader>k :<C-U>NERDTreeToggle<cr>
nmap <silent> <leader>u :<C-U>UndotreeToggle<cr>
nmap <silent> <leader>il :<C-U>IndentLinesReset<cr>
nmap <silent> <leader>tm :<C-U>TableModeToggle<cr>
nmap <silent> <leader>ff :<C-U>Neoformat<CR>

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" " <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>""

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" auto close preview window when complete done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd BufWritePre *.go silent call CocActionAsync('runCommand', 'editor.action.organizeImport')
autocmd User CocJumpPlaceholder silent call CocActionAsync('showSignatureHelp')
autocmd User VimagitEnterCommit startinsert


nmap <silent> <leader>g :<C-U>call magit#show_magit('h')<CR>
nmap <silent> <leader>p :<C-U>CocList files<CR>
nmap <silent> <leader>o :<C-U>CocList mru<CR>
nmap <silent> <leader>b :<C-U>CocList buffers<CR>
nmap <silent> <leader>f :<C-U>CocList --auto-preview --interactive grep<CR>
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <silent> <leader>ln <Plug>(coc-rename)
nmap <silent> <leader>lf <Plug>(coc-format)
vmap <silent> <leader>lf <Plug>(coc-format-selected)
nmap <silent> <leader>li <Plug>(coc-implementation)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>la <Plug>(coc-codeaction)
vmap <silent> <leader>la <Plug>(coc-codeaction-selected)
nmap <silent> <leader>ls :<C-U>call CocAction('doHover')<CR>
nmap <silent> <leader>lc :<C-U>CocList commands<CR>
nmap <silent> <leader>lo :<C-U>CocList outline<CR>
nmap <silent> <leader>le :<C-U>CocList diagnostics<CR>
nmap <silent> <leader>gb :<C-U>CocList branches<CR>
nmap <silent> <leader>gc :<C-U>CocList commits<CR>


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
nmap <silent> <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <silent> <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <silent> <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <silent> <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <silent> <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <silent> <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <silent> <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <silent> <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <silent> <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <silent> <Leader>0 <Plug>lightline#bufferline#go(10)

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
    return "" != FugitiveHead() ? ' '.FugitiveHead() : ''
endfunction

let g:lightline = { }
let g:lightline = {
            \ 'separator': { 'left': '', 'right': '' },
            \ 'subseparator': { 'left': '', 'right': '' },
            \ 'colorscheme': 'tokyonight',
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

let g:buffergator_suppress_keymaps = 1
let g:jsx_ext_required = 0
set nospell

if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" if has('nvim')
"     let g:python3_host_prog = '/usr/bin/python3'
" endif

let g:UltiSnipsSnippetDirectories = ["UltiSnips", $HOME."/.snips"]
let g:UltiSnipsExpandTrigger = "<c-j>"

let g:javascript_enable_domhtmlcss = 1

let g:indentLine_char = "┆"
let g:indentLine_first_char = "┆"

let g:JavaComplete_GradleExecutable = "/usr/local/bin/gradle"
let g:vue_disable_pre_processors=1
let g:jst_default_subtype = "javascript"

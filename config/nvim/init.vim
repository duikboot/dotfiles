scriptencoding utf-8

source ~/.config/nvim/plug-list.vim

" Basic Settings {{{
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
syntax on                     " syntax highlighting
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set hidden
set title                     " show title in console title bar
set wildmenu
set wildmode=full             " <Tab> cycles between all matching choices.
set undolevels=1000           " use many levels of undo
set display=lastline
set nojoinspaces " Use only 1 space after "." when joining lines, not 2"
set showfulltag               " Show full tags when doing search completion
set relativenumber            " show linenumber relative to line cursor is on
setlocal keywordprg=:help     " Use K to show help on subject under cursor
set backupdir=~/.tmp//
set directory=~/.tmp//  "set directory for swapfiles
set conceallevel=0

set splitright
set splitbelow

set formatoptions=
set formatoptions+=c
set formatoptions+=q
set formatoptions+=r
set formatoptions+=n
set formatoptions+=j

let g:vimsyn_embed = 'lP'

" Very cool transparant completion menu, but it's distracting me.
" set pumblend=10

" shows preview of the changes
" "nosplit": Shows the effects of a command incrementally, as you type.
" "split" : Also shows partial off-screen results in a preview window.
set inccommand=nosplit

" set dictionary=/usr/share/dict/words

if has("persistent_undo")
    " Keep a persistend backupfile
    set undofile
    set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif


set suffixesadd=.tex,.latex,.java,.js,.hrl,.erl,.lisp,.asd,.lua

let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'

" set guifont=Inconsolata\ 10
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
" set guifont=DejaVu\ Sans\ Mono\ Book\ 8
" i1g
" 0O
" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc,*.pyo,*.class,.hg
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit

set wildignore+=*.luac                           " Lua byte code

set wildignore+=migrations                       " Django migrations

set wildignore+=*.orig                           " Merge resolution files

" Set working directory
" nnoremap <leader>. :lcd %:p:h<CR>

""" Insert completion
" don't select first item, follow typing in autocomplete
" set complete=.,w,b,u,t
" set complete=.,b,u,kspell
set complete=.,b,u
" set completeopt=menuone,longest
set completeopt=menuone,noinsert,noselect
" set completeopt=menu,menuone,preview,noselect,noinsert
set pumheight=8             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
" autocmd BufEnter * setlocal cursorcolumn
" autocmd BufLeave * setlocal nocursorcolumn
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set foldcolumn=0            " show the fold column
set foldlevel=666            " don't fold by default
" set foldlevel=0            " fold by default
set foldmethod=indent       " allow us to fold on indents
set linebreak               " don't wrap textin the middle of a word
set matchpairs+=<:>         " show matching <> (html mainly) as well
set nostartofline           " Avoid moving cursor to BOL when jumping around
"set nowrap                  " don't wrap text
set ruler                   " show the cursor position all the time
set scrolloff=3             " Keep 3 context lines above and below the cursor
set shiftround              " rounds indent to a multiple of shiftwidth
set shiftwidth=4            " but an indent level is 2 spaces wide.
set showmatch               " Briefly jump to a paren once it's balanced
set noshowmode
set cmdheight=2

set shortmess+=c
"set smartindent             " use smart indent if there is no indent file
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set tabstop=4               " <tab> inserts 4 spaces
set virtualedit=block       " Let cursor move past the last char in <C-v> mode

set breakindent
set breakindentopt=shift:4
let &showbreak='↳ '
"
" set cpoptions=n
" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
" set noautowrite             " Never write a file unless I request it.
" set noautowriteall          " NEVER.
set autowrite
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
" set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})
" set encoding=utf-8          " Necessary to show unicode glyphs

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,trail:-,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
" autocmd BufNewFile,BufRead *.js set nosmarttab  " If  don't use smarttab"
" Very cool transparant completion menu, but it's distracting me.
" set pumblend=10

" shows preview of the changes
" "nosplit": Shows the effects of a command incrementally, as you type.
" "split" : Also shows partial off-screen results in a preview window.
set inccommand=nosplit

set t_Co=256
set termguicolors
" set background=light           " We are using dark background in vim
" colorscheme NeoSolarized
" colorscheme xcodelighthc

" let g:srcery_italic = 1
" let g:srcery_transparent_background = 1
" let g:srcery_inverse_match_paren = 1
" colorscheme srcery
" colorscheme oceanic-primal

" configure nvcode-color-schemes
let g:nvcode_termcolors=256

syntax on
colorscheme gruvbox
" colorscheme nvcode " Or whatever colorscheme you make


" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


let g:hostname=hostname()

set clipboard+=unnamedplus

set path+=**

" }}}

let g:python3_host_prog=$HOME . '/.dotfiles/.venv/bin/python'

let g:python3_host_prog_bin=$HOME . '/.dotfiles/.venv/bin/'

" {{{ Mappings

let g:mapleader="\<space>"             " change the leader to be a comma vs slash
let g:maplocalleader="\\"       " map localleader to \\


" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Q :quitall
command! WQ :wqall
command! Wq :wq

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

"vv selects til end of line (not incl newline)
vnoremap v $h

" use ,gf to go to file in a vertical split
nnoremap <silent> <leader>gf :vertical botright wincmd f<CR>
nnoremap <silent> <Leader>/ :nohlsearch<CR>

nnoremap <Leader>SS :source Session.vim<cr>

" open/close the quickfix window
nnoremap <leader>c :copen<CR>
nnoremap <leader>cc :cclose<CR>

" open/close the location window
nnoremap <leader>l :lopen<CR>
nnoremap <leader>ll :lclose<CR>
nnoremap  <leader>cc :wincmd z<Bar>cclose<Bar>lclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" replace snippet
nnoremap R :%s//g<left><left>


" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
" nnoremap <leader>v :sp ~/.config/nvim/init.vim<CR><C-W>_
nnoremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

nnoremap <leader>e :edit<cr>
nnoremap <c-e> :Explore %:p:h<cr>
" nnoremap <leader>F :Fern . -reveal=% -drawer -toggle<cr>
" nnoremap <c-e> :Fern . -reveal=% -drawer -toggle<cr>
autocmd FileType netrw setlocal bufhidden=wipe

" in command mode expand directory with current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'


" save file
noremap <Leader>w :w<cr>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

nnoremap <Leader>f :find<space>

" Delete buffer from buffelist and open previous buffer in split.
noremap <leader>bq :bp <BAR> bd #<CR>
" Delete buffer from buffelist and close split
noremap <leader>bd :bd<CR>

" let Y be more consistent
nmap Y y$

" Split line (sister to [J]oin lines)
" " The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
nnoremap <localleader>j :%!python -m json.tool<cr>

" "uppercase word" mapping.
" from: https://github.com/sjl/dotfiles/blob/master/vim/vimrc
" "
" " This mapping allows you to press <c-u> in insert mode to convert the
" current
" " word to uppercase. It's handy when you're writing names of constants and
" " don't want to use Capslock.
" "
" " To use it you type the name of the constant in lowercase. While your
" " cursor is at the end of the word, press <c-u> to uppercase it, and then
" " continue happily on your way:
" "
" " cursor
" " laststatus
" " max_connections_allowed|
" " <c-u>
" " MAX_CONNECTIONS_ALLOWED|
" " ^
" " cursor
" "
" " It works by exiting out of insert mode, recording the current cursor
" location
" " in the z mark, using gUiw to uppercase inside the current word, moving
" back to
" " the z mark, and entering insert mode again.
" "
" " Note that this will overwrite the contents of the z mark. I never use it,
" but
" " if you do you'll probably want to use another mark.

inoremap <C-u> <esc>mzgUiw`za
noremap <C-u> mzgUiw`za

" Panic Button
nnoremap <f9> mzggg?G`z


" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

command! Vs :vs

" search for selection
vnoremap // y/<C-R>"<CR>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S mz:%s/\s\+$//<cr>:let @/=''<CR>`z

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" }}}


autocmd VimResized * silent! :wincmd =

autocmd FileType vim setlocal foldmarker={{{,}}}
autocmd FileType vim setlocal foldmethod=marker
autocmd FileType vim setlocal foldlevel=1
autocmd BufNewFile * silent! 0r ~/Templates/%:e.tpl

let g:csv_no_conceal=1
let g:md_no_conceal=0

" {{{ Goyo

nnoremap <Leader>0 :Goyo<cr>
let g:goyo_height=100

" }}}

" {{{ Highlight Yank

let g:highlightedyank_highlight_duration = 100

" }}}

" {{{ FZF
set runtimepath+=~/.fzf
" nnoremap <Leader>o :Files<CR>
nnoremap <Leader>b :Buffers<CR>

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
function! s:change_branch(e)
    let res = system("git checkout " . a:e)
    :e!
    :AirlineRefresh
    echom "Changed branch to " . a:e
endfunction

command! Gbranch call fzf#run(
    \ {
    \ 'source': 'git branch',
    \ 'sink': function('<sid>change_branch'),
    \ 'options': '-m',
    \ 'down': '20%'
    \ })

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 8
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 4,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

" https://github.com/junegunn/fzf.vim/issues/647#issuecomment-520259307
function! s:get_registers() abort
  redir => l:regs
  silent registers
  redir END

  return split(l:regs, '\n')[1:]
endfunction

function! s:registers(...) abort
  let l:opts = {
        \ 'source': s:get_registers(),
        \ 'sink': {x -> feedkeys(matchstr(x, '\v^\S+\ze.*') . (a:1 ? 'P' : 'p'), 'x')},
        \ 'options': '--prompt="Reg> "'
        \ }
  call fzf#run(fzf#wrap(l:opts))
endfunction

command! -bang Registers call s:registers('<bang>' ==# '!')

nnoremap <leader>y :Registers<cr>
nnoremap <leader>o :Files<cr>

" }}}

" {{{ Grepper
" nnoremap <leader>a <Esc>:Ack!<Space>
let g:grepper = {}
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
nnoremap <leader>r :Grepper -tool rg<cr>
nnoremap <leader>A :Ag<cr>
let g:grepper.rg = { 'grepprg': 'rg --vimgrep --smart-case'}
nnoremap <leader>a :Grepper -tool ag<cr>
let g:grepper.ag = { 'grepprg': 'ag --path-to-ignore ~/.ignore'}
nnoremap <leader>g :Grepper -tool git<cr>

nmap go <plug>(GrepperOperator)
xmap go <plug>(GrepperOperator)

" }}}

" {{{ LSP

lua require('init')

autocmd FileType lua setlocal includeexpr=substitute(v:fname,'\\.','/','g')

autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_enable_snippet = 'vim-vsnip'

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']


let g:completion_chain_complete_list = {
            \   'default': [
            \      {'complete_items': ['lsp', 'buffer', 'snippet', 'path']},
            \      {'complete_items': ['path'], 'triggered_only': ['/']},
            \      {'mode': 'dict'},
            \      {'mode': '<c-p>'},
            \      {'mode': '<c-n>'}
            \   ],
            \   'string': [
            \      {'complete_items': ['path', 'buffer']},
            \      {'mode': 'dict'},
            \   ],
            \   'comment': [
            \      {'complete_items': ['path', 'buffer']},
            \      {'mode': 'dict'},
            \   ],
            \ 'markdown' : {
            \   'default': [
            \      {'mode': 'dict'},
            \      {'mode': 'spel'}
            \   ],
            \   'comment': []
            \   }
            \ }

\let g:completion_items_priority = {
        \ 'Field': 8,
        \ 'Function': 8,
        \ 'Variables': 7,
        \ 'Method': 10,
        \ 'Interfaces': 6,
        \ 'Constant': 6,
        \ 'Class': 6,
        \ 'Struct': 6,
        \ 'Keyword': 5,
        \ 'Treesitter': 4,
        \ 'vim-vsnip' : 0,
        \ 'Buffers' : 0,
        \ 'Buffer' : 0,
        \ 'TabNine' : 1,
        \ 'File' : 2,
        \ }

" let g:completion_chain_complete_list = [
"     \{'complete_items': ['lsp', 'snippet', 'path']},
"     \{'mode': '<c-p>'},
"     \{'mode': '<c-n>'}
" \]
" " Configure the completion chains
" let g:completion_chain_complete_list = {
" 			\'default' : {
" 			\	'default' : [
" 			\		{'complete_items' : ['lsp', 'snippet']},
" 			\		{'mode' : 'file'}
" 			\	],
" 			\	'comment' : [],
" 			\	'string' : []
" 			\	},
" 			\'vim' : [
" 			\	{'complete_items': ['snippet']},
" 			\	{'mode' : 'cmd'}
" 			\	],
" 			\'c' : [
" 			\	{'complete_items': ['ts']}
" 			\	],
" 			\'python' : [
" 			\	{'complete_items': ['lsp', 'ts']}
" 			\	],
" 			\'lua' : [
" 			\	{'complete_items': ['ts']}
" 			\	],
" 			\}

let g:completion_auto_change_source = 1

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
set signcolumn=yes
" use <c-j> to switch to previous completion
" imap <c-j> <Plug>(completion_next_source)
" imap <c-k> <Plug>(completion_prev_source)

" Expand
imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'

" Expand or jump
imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'


" Jump forward or backward
imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
" nmap s <Plug>(vsnip-select-text)
xmap s <Plug>(vsnip-select-text)
" nmap S <Plug>(vsnip-cut-text)
xmap S <Plug>(vsnip-cut-text)

let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
let g:vsnip_snippet_dir = expand('~/.vim/plugged/vs-snippets/snippets/')


" }}}

" {{{ Tags

set tags=./tags,tags

" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <leader><cr> :silent !ctags -R --links=no --exclude=.buildozer --languages=-javascript --languages=-css >/dev/null 2>&1 &<cr>:redraw!<cr>

" open tag on the top of the screen
nnoremap <C-]> <C-]>zt

" Toggle tag
nnoremap <leader>t <Esc>:Tags<cr>
nnoremap <leader>ts <Esc>:tselect<Space>

" Open in vertical split the tag under the cursur.
nnoremap  <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:exec("tag ". word)<cr>zt


" }}}

" {{{ Deoplete

let g:deoplete#enable_at_startup = 0
call g:deoplete#custom#option('ignore_sources', {'_': ['tag']})
let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#complete_method='omnifunc'

let g:deoplete#sources#jedi#ignore_errors = v:true
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0  "Show call signatures in the command line instead of a popup window.
let g:jedi#smart_auto_mappings = 1  "Automatic add `import` statement to from <modulename> import
autocmd FileType lisp let b:deoplete_disable_auto_complete = 1
" }}}

" {{{ autocmd BufEnter *.lisp   Supertab

" select from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

 " {{{ Airline

let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse = 0

let g:airline#extensions#tagbar#enabled = 0

let g:airline#extensions#tabline#formatter = 'short_path'

" }}}

" {{{ Ale

let g:ale_completion_enabled=0
let g:ale_completion_delay=50

" let g:ale_lint_on_text_changed='never'
" let g:ale_lint_on_insert_leave=1
" let g:ale_virtualtext_cursor=1
let b:ale_python_flake8_use_global=1
let b:ale_python_pylint_use_global=1
let b:ale_python_pycodestyle_use_global=1
" let b:ale_python_vulture_use_global=1
" let g:ale_linters = {
"             \ 'python' : ['prospector', 'pycodestyle', 'mypy', 'pyflakes', 'pylint'],
" \ }
let g:ale_linters = {
            \ 'python' : ['prospector', 'mypy'],
\ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black', 'isort', 'add_blank_lines_for_python_control_statements'],
\   'tex': ['latexindent', 'textlint', 'remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
nmap <localleader>a8 <Plug>(ale_fix)

" let g:ale_python_flake8_executable = g:python3_host_prog_bin . 'flake8'
let g:ale_python_pycodestyle_executable = g:python3_host_prog_bin . 'pycodestyle'
let g:ale_python_pylint_executable = g:python3_host_prog_bin . 'pyflakes'
let g:ale_python_vulture_executable = g:python3_host_prog_bin . 'vulture'
" let g:ale_python_mypy_executable = g:python3_host_prog_bin . 'mypy'
let g:ale_python_isort_executable = g:python3_host_prog_bin . 'isort'
let g:ale_python_yapf_executable = g:python3_host_prog_bin . 'yapf'
let g:ale_python_black_executable = g:python3_host_prog_bin . 'black'
let g:ale_python_autopep8_executable = g:python3_host_prog_bin . 'autopep8'
" let g:ale_python_prospector_executable = g:python3_host_prog_bin . 'prospector'
" TEMPORARY!!
" let g:ale_python_pylint_options = "--load-plugins pylint_django"
" let g:ale_python_autopep8_options = '--aggressive'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_pylint_options='--disable=C0111,R0903 --load-plugins pylint_django'
let g:ale_python_flake8_options='--ignore=H301 --max-complexity=10'
let g:ale_python_mypy_options = '--ignore-missing-imports'
let g:ale_python_prospector_options = '--strictness veryhigh --member-warnings'

let b:ale_virtualenv_dir_names=['ENV', '.env', '.venv']
" let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXXX breakpoint'



" }}}

" {{{ Add filename to register

function! s:AddFilenameToRegister(from)
    if a:from==#'absolute'
        let @+ = expand('%:p')
    endif
    if a:from==#'relative'
        let @+ = expand('%')
    endif
    echom expand('%')
endfunction

nnoremap <leader>cf :call <SID>AddFilenameToRegister('absolute')<CR>
nnoremap <leader>cr :call <SID>AddFilenameToRegister('relative')<CR>
nnoremap <leader>cs :call <SID>AddFilenameToRegister('show')<CR>

" }}}

" {{{ Neoterm

" let g:neoterm_fixedsize = 0
let g:neoterm_default_mod = 'vertical'
" nnoremap <leader>ot :vs \| term<space>
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1

" Send paragraph
nnoremap <silent> ,ts mzvip:TREPLSendSelection<cr>`z

" Send (lisp)form
nnoremap <silent> ,tf mzva(:TREPLSendSelection<cr>`z

" Send (lisp)atom
nnoremap <silent> ,ta mzvaw:TREPLSendSelection<cr>`z

" Send selection
vnoremap  ,tv :TREPLSendSelection<cr>
nnoremap ,tl :TREPLSendLine<cr>

" hide/close terminal
nnoremap <silent> ,t :Tnew<cr>
nnoremap <silent> ,tt :Ttoggle<cr>
" clear terminal
nnoremap <silent> ,tr :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" }}}

" {{{ Vlime

let g:vlime_cl_use_terminal = 1
let g:vlime_window_settings = {
            \ 'repl': {'vertical': v:true, 'pos': 'belowright'},
            \ 'server': {'vertical': v:true, 'pos': 'belowright'}
    \ }

function! s:ConnectVlimeToStumpwm()
    call vlime#plugin#ConnectREPL('127.0.0.1', 4005)
endfunction

let g:vlime_compiler_policy = {"DEBUG": 3}

let g:vlime_contribs = ['SWANK-ASDF', 'SWANK-PACKAGE-FU',
                      \ 'SWANK-PRESENTATIONS', 'SWANK-FANCY-INSPECTOR',
                      \ 'SWANK-C-P-C', 'SWANK-ARGLISTS', 'SWANK-REPL',
                      \ 'SWANK-FUZZY', 'SWANK-TRACE-DIALOG']

let g:vlime_enable_autodoc = 1
nnoremap <localleader>c :call <SID>ConnectVlimeToStumpwm()<CR>

" }}}

" {{{ Signify

let g:signify_vcs_list = ['git', 'hg']

" }}}

" {{{ Abbreviations

iabbrev @@ dijkstra.arjen@gmail.com
" iabbrev /\ (lambda )
" }}}

" {{{ Tmux

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
inoremap <c-h><c-h> <Esc>:TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

let g:tmux_navigator_save_on_switch = 1
" }}}

" {{{ Mundo

" Load the Mundo window
nnoremap <leader>G :MundoToggle<CR>
" nnoremap <leader>G :UndotreeToggle<CR>
" }}}

" {{{ Markdown

autocmd BufRead,BufNewFile *.md set ft=markdown

" }}}

" {{{ Delimitmate

autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
let g:delimitMate_excluded_ft = 'clojure,lisp'

" }}}

" {{{ Tagbar

" Toggle Tagbar
nnoremap <leader>tl :TagbarToggle<CR>

" }}}

" {{{ vim-cool

let g:CoolTotalMatches = 0

" }}}

" {{{ Python

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent

autocmd FileType python setlocal path+=.venv/**
autocmd FileType python setlocal colorcolumn=79

autocmd FileType python nnoremap <localleader>b Oimport ipdb; ipdb.set_trace()<esc>:w<CR>

function! s:OpenDocs(word)
    let document_urls = {'lisp': 'http://www.lispworks.com/cgi-bin/search.cgi\?t=-D--HB-\&\q\=',
                      \ 'python': 'https://docs.python.org/3/search.html\?q\='}
    execute '!xdg-open ' . document_urls[&filetype] . a:word
endfunction

nnoremap <localleader>d :call <SID>OpenDocs(expand('<cword>'))<CR>
nnoremap <localleader>sd :call <SID>OpenDocs(input('enter search query: '))<CR>

" }}}

" {{{ common lisp

augroup ft_lisp
    let g:delimitMate_excluded_ft = 'clojure,lisp'
    autocmd BufRead,BufNewFile *.asd set filetype=lisp
    autocmd BufRead,BufNewFile *.ros set filetype=lisp

    autocmd FileType lisp setlocal colorcolumn=79

    autocmd FileType lisp setlocal tabstop=2
    autocmd FileType lisp setlocal shiftwidth=2            " but an indent level is 2 spaces wide.
    autocmd FileType lisp set softtabstop=2           " <BS> over an autoindent deletes both spaces.
    autocmd BufRead *.lisp set makeprg=sblint
    " let g:syntastic_lisp_checkers = ['sblint']
    " autocmd FileType lisp let b:deoplete_disable_auto_complete = 1
    let g:parinfer_force_balance = 1
    let g:parinfer_enabled = 1
    let g:parinfer_enabled = 1
    let g:parinfer_mode = 'paren'
    autocmd FileType User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#vlime#get_source_options({ 'priority': 10 }))

    " autocmd FileType lisp setlocal path+=/home/arjen/quicklisp/dists/quicklisp/installed/system/
augroup END

augroup set_lisp_repl
    autocmd FileType lisp
          \ if executable('lisp') |
          \   call neoterm#repl#set('lisp') |
          \ end
augroup END

" }}}

"{{{ quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

highlight QuickScopePrimary guifg=purple guibg=lightgray gui=underline ctermfg=5 cterm=underline
highlight QuickScopeSecondary guifg=purple guibg=lightgray gui=underline ctermfg=2 cterm=underline

"}}}

autocmd BufEnter *.lisp call ncm2#enable_for_buffer()
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


" {{{ comments


autocmd FileType kivy set commentstring=#\ %s
autocmd FileType spec set commentstring=#\ %s
autocmd FileType tmux set commentstring=#\ %s
autocmd FileType tex set commentstring=%\ %s

"}}}

" sml
" autocmd FileType sml setlocal shiftwidth=4
autocmd FileType sml set commentstring=(*%s*)

autocmd FileType xml setlocal commentstring={#%s#}


" {{{ telescope
set report=2
" nnoremap <Leader>o  <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <silent>gr <cmd>lua require'telescope.builtin'.lsp_references{ shorten_path = true }<CR>
nnoremap <leader>gc <cmd>lua require'telescope.builtin'.git_commits{}<CR>
nnoremap <leader>gs <cmd>lua require'telescope.builtin'.git_status{}<CR>
nnoremap <leader>lg <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" }}}

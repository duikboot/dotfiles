scriptencoding utf-8

"source ~/.config/nvim/plug-list.vim

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
" set relativenumber            " show linenumber relative to line cursor is on
setlocal keywordprg=:help     " Use K to show help on subject under cursor
set backupdir=~/.tmp//
set directory=~/.tmp//  "set directory for swapfiles
"set conceallevel=0
set updatetime=500

set splitright
set splitbelow

set formatoptions=
set formatoptions+=c
set formatoptions+=q
set formatoptions+=r
set formatoptions+=n
set formatoptions+=j
set formatoptions-=o

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

if has('nvim') && executable('nvr')
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif


" set guifont=Inconsolata\ 10
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
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
" set completeopt=menuone,noinsert,noselect
" set completeopt=menu,menuone,preview,noselect,noinsert
set completeopt=menu,menuone,noselect
set pumheight=18             " Keep a small completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn
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
set nowrap                  " don't wrap text
set ruler                   " show the cursor position all the time
set scrolloff=3             " Keep 3 context lines above and below the cursor
set shiftround              " rounds indent to a multiple of shiftwidth
set shiftwidth=4            " but an indent level is 2 spaces wide.
set showmatch               " Briefly jump to a paren once it's balanced
set noshowmode
set cmdheight=2
set selection=exclusive     " Dont select newline in selection mode v$

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
set laststatus=3            " Always show statusline, even if only 1 window.
set winbar=%f%m             " Show winbar with filename and modified flag
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
set background=dark           " We are using dark background in vim
" colorscheme NeoSolarized
" colorscheme xcodelighthc

" let g:srcery_italic = 1
" let g:srcery_transparent_background = 1
" let g:srcery_inverse_match_paren = 1
" colorscheme srcery
" colorscheme oceanic-primal

" configure nvcode-color-schemes
let g:nvcode_termcolors=256


lua pcall(require, 'plugins')

  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
" colorscheme edge
" lua require('colorbuddy').colorscheme('gruvbuddy')
"" colorscheme nvcode " Or whatever colorscheme you make
""
" colorscheme material
" let g:material_style = 'palenight'
" let g:material_italic_comments=1
" colorscheme one-nvim
colorscheme everforest

"Vim-Script:

" nnoremap <C-m> :lua require('material').toggle_style()<CR>

    " darker
    " lighter
    " default
    " oceanic
    " palenight
    " deep ocean



" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif


let g:hostname=hostname()

set clipboard+=unnamedplus

set path+=**

" }}}

let g:loaded_python_provider = 0 " DISABLE Python 2
let g:python3_host_prog=$HOME . '/.dotfiles/.venv/bin/python'

let g:python3_host_prog_bin=$HOME . '/.dotfiles/.venv/bin/'

" {{{ Mappings

let g:mapleader="\<space>"             " change the leader to be a comma vs slash
let g:maplocalleader="\\"       " map localleader to \\

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
" nnoremap <leader>v :sp ~/.config/nvim/init.vim<CR><C-W>_

nnoremap <leader>V :source ~/.config/nvim/init.vim<CR>:lua package.loaded.duikboot = nil <cr>:filetype detect<CR>

nnoremap <leader>e :edit<cr>
nnoremap <c-e> :Explore %:p:h<cr>

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
xnoremap R :s/\%V/g<Left><Left>

nnoremap gx :call netrw#BrowseX(expand("<cfile>"), netrw#CheckIfRemote())<CR>

" nnoremap <leader>F :Fern . -reveal=% -drawer -toggle<cr>
" nnoremap <c-e> :Fern . -reveal=% -drawer -toggle<cr>
autocmd FileType netrw setlocal bufhidden=wipe

augroup gitcommitSpell
    autocmd!
    autocmd FileType gitcommit setlocal spell
augroup END

augroup markdownSpell
    autocmd!
    autocmd FileType markdown setlocal spell
    autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

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
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" nnoremap <leader>k :move .-2<cr>==
" nnoremap <leader>j :move .+1<cr>==
" vnoremap <leader>J :move '>+1<cr>gv=gv
" vnoremap <leader>K :move '<-2<cr>gv=gv

" Split line (sister to [J]oin lines)
" " The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap J mzJ`z
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

"let g:csv_no_conceal=1
"let g:md_no_conceal=1

" {{{ Highlight Yank

let g:highlightedyank_highlight_duration = 100

" }}}

" {{{ FZF
set runtimepath+=~/.fzf
" nnoremap <Leader>o :Files<CR>
" nnoremap <Leader>b :Buffers<CR>

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" https://github.com/junegunn/fzf.vim/issues/647#issuecomment-520259307

" nnoremap <leader>y :Registers<cr>
nnoremap <leader>y :Telescope yank_history<cr>
" nnoremap <leader>y :YankyRingHistory<cr>

" }}}

" {{{ Grepper
" nnoremap <leader>a <Esc>:Ack!<Space>
" let g:grepper = {}
" nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
" nnoremap <leader>r :Grepper -tool rg<cr>
" let g:grepper.rg = { 'grepprg': 'rg --vimgrep --smart-case'}
" nnoremap <leader>a :Grepper -tool ag<cr>
" let g:grepper.ag = { 'grepprg': 'ag --path-to-ignore ~/.ignore'}
" nnoremap <leader>g :Grepper -tool git<cr>

" nmap go <plug>(GrepperOperator)
" xmap go <plug>(GrepperOperator)

" }}}

" {{{ LSP


lua pcall(require, 'duikboot')
autocmd FileType lua setlocal includeexpr=substitute(v:fname,'\\.','/','g')


set signcolumn=yes

" }}}

" {{{ Tags

set tags=./tags,tags

" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <leader><cr> :silent !ctags -R --links=no --exclude=.buildozer --languages=-javascript --languages=-css >/dev/null 2>&1 &<cr>:redraw!<cr>

" open tag on the top of the screen
" nnoremap <C-]> <C-]>zt

" Toggle tag
nnoremap <leader>t <Esc>:tag<Space>
nnoremap <leader>ts <Esc>:tselect<Space>

" Open in vertical split the tag under the cursur.
nnoremap  <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:exec("tag ". word)<cr>zt
nnoremap  <Leader>T :vs<CR><c-]>zz


" }}}

" {{{ Supertab

" select from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

 " " {{{ Airline

" let g:airline_powerline_fonts = 1

" " Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'short_path'

" let g:airline_inactive_collapse = 0

" let g:airline#extensions#tagbar#enabled = 0


" " }}}

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

let g:vlime_cl_use_terminal = v:true
" nnoremap <silent> <LocalLeader>rr :call VlimeStart()<CR>
" let g:vlime_cl_impl = "mondo"
" let g:vlime_cl_use_terminal = v:true

" function! VlimeBuildServerCommandFor_mondo(vlime_loader, vlime_eval)
"     return ["mondo", "--server", "vlime"]
" endfunction

" function! VlimeStart()
"     call vlime#server#New(v:true, get(g:, "vlime_cl_use_terminal", v:false))
" endfunction

" let g:vlime_window_settings = {
"             \ 'repl': {'vertical': v:true, 'pos': 'topright'},
"             \ 'server': {'vertical': v:true, 'pos': 'botright'}
"     \ }

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

" let g:signify_vcs_list = ['git', 'hg']

" }}}

" {{{ Abbreviations

iabbrev @@ dijkstra.arjen@gmail.com
iabbrev teh the

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

" autocmd FileType lisp let b:lexima_disabled = 1

" }}}


" {{{ vim-cool

let g:CoolTotalMatches = 0

" }}}

" {{{ Python

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent

autocmd FileType python setlocal path+=.venv/**
autocmd FileType python setlocal colorcolumn=89

" autocmd FileType python nnoremap <localleader>b Obreakpoint()<esc>:w<CR>
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
nnoremap cg      <cmd>lua require'duikboot.telescope'.grep_prompt()<CR>
nnoremap <Leader>o      <cmd>lua require'telescope.builtin'.find_files{}<CR>
nnoremap <Leader>fb     :Telescope file_browser<CR>
nnoremap         gr     <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
nnoremap <leader>gc     <cmd>lua require'telescope.builtin'.git_commits{}<CR>
nnoremap <leader>gs     <cmd>lua require'telescope.builtin'.git_status{}<CR>
nnoremap <leader>lg     <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <leader>b      <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <localleader>d      <cmd>lua require'telescope.builtin'.diagnostics{}<CR>
nnoremap <leader>t      <cmd>lua require'telescope.builtin'.tags{only_sort_tags=true}<CR>
nnoremap <leader>*      <cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <localleader>f <cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>

nnoremap <leader>fv     <cmd>lua require'duikboot.telescope'.find_virtual_env()<cr>

" }}

" lua <<EOF
" local sidebar = require("sidebar-nvim")
" local opts = {open = true}
" sidebar.setup(opts)

" EOF

" {{{ lsp-trouble

" nnoremap <leader>xx <cmd>TroubleToggle document_diagnostics<cr>
" Vim Script
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xx <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

autocmd FileType python let b:lsp_current_function = ''
" autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
" autocmd CursorHold,CursorHoldI * lua require'lsp-status'.update_current_function()

" }}} lsp-trouble


" {{{ symbols-outline

" lua <<EOF

" require('symbols-outline')

" vim.g.symbols_outline = {
"     highlight_hovered_item = true,
"     show_guides = true,
"     auto_preview = false, -- experimental
"     position = 'right',
"     keymaps = {
"         close = "<Esc>",
"         goto_location = "<Cr>",
"         focus_location = "o",
"         hover_symbol = "<C-space>",
"         rename_symbol = "r",
"         code_actions = "a",
"     },
"     lsp_blacklist = {"pylsp"},
" }

" EOF

" nnoremap <leader>O <cmd>lua require'symbols-outline'.toggle_outline{}<cr>

" }}} symbols-outline

" {{{ Wilder

call wilder#setup({'modes': [':', '/', '?']})

" }}}

autocmd BufWinEnter,BufEnter * set laststatus=3

" " {{{ ALE
" let g:ale_python_flake8_executable = g:python3_host_prog_bin . 'flake8'
" let g:ale_python_pycodestyle_executable = g:python3_host_prog_bin . 'pycodestyle'
" let g:ale_python_pylint_executable = g:python3_host_prog_bin . 'pylint'
" let g:ale_python_vulture_executable = g:python3_host_prog_bin . 'vulture'
" let g:ale_python_mypy_executable = g:python3_host_prog_bin . 'mypy'
" let g:ale_python_isort_executable = g:python3_host_prog_bin . 'isort'
" let g:ale_python_yapf_executable = g:python3_host_prog_bin . 'yapf'
" let g:ale_python_autopep8_executable = g:python3_host_prog_bin . 'autopep8'
" let g:ale_python_prospector_executable = g:python3_host_prog_bin . 'prospector'
" " let g:pymode_rope_autoimport = 1
" " TEMPORARY!!
" " let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
" " let g:ale_python_pylint_options = "--load-plugins pylint_django"
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" let g:ale_python_pylint_options='--load-plugins=pylint_django'
" let g:ale_python_flake8_options='--ignore=H301 --max-complexity=10'
" let g:ale_python_mypy_options = '--ignore-missing-imports'

" let b:ale_virtualenv_dir_names=['ENV', '.env', '.venv']

"  " let g:ale_linters = {
"  "            \ 'python' : ['prospector', 'mypy'],
"  " \ }
"  let g:ale_linters = {
"             \ 'python' : ['prospector'],
"  \ }

 " nnoremap <localleader>a8 :Black<cr>


" }}}



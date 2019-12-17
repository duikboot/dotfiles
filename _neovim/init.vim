scriptencoding utf-8
" Pathogen - Allows us to organize our vim plugins
" Load pathogen with docs for all plugins
filetype off
" call pathogen#incubate()
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" pathogen#incubate() to pathogen#infect('bundle/{}')

" So neovim will work in a VirtualEnv
let g:python_host_prog='/home/arjen/config/dotfiles/_neovim/ENV2/bin/python'
let g:python3_host_prog='/home/arjen/config/dotfiles/_neovim/ENV/bin/python'


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
set conceallevel=0

set splitright
set splitbelow

autocmd User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['pyls']},
    \ 'whitelist': ['python'],
    \ 'workspace_config': {
    \   'pyls': {
    \     'plugins': {'pydocstyle': {'enabled': v:true},
    \                 'pycodestyle' : {'maxLineLength': 100},
    \                 'jedi_completion': {'include_params': v:true},
    \                 'pyls_mypy': {'enabled': v:true},
    \                 'pyls_black': {'enabled': v:true},
    \     }
    \   }
    \ }
    \ })

" autocmd Filetype python setl omnifunc=v:lua.vim.lsp.omnifunc
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
" }}}

" ==========================================================
" Shortcuts
" ==========================================================
let g:mapleader="\<space>"             " change the leader to be a comma vs slash
let g:maplocalleader="\\"       " map localleader to \\


" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Q :quitall
command! WQ :wqall
command! Wq :wq

nnoremap <leader>e :edit<cr>

" save file
noremap <Leader>w :w<cr>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Open :CtrlP
" nnoremap <Leader>o :CtrlP<CR>
" nnoremap <Leader>ot :CtrlPTag<CR>
" let g:ctrlp_extensions = ['tag', 'buffertag']
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/](\.git|\.hg|\.svn|build-image|build)$',
"   \ 'file': '\v\.(css|js)$',
"   \ }

nnoremap <Leader>f :find<space>

let g:csv_no_conceal=1

" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" " fzf plugin
set runtimepath+=~/.fzf
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>b :Buffers<CR>

function! s:change_branch(e)
    let res = system("git checkout " . a:e)
    :e!
    :AirlineRefresh
    echom "Changed branch to " . a:e
endfunction



" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
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

function! s:Only()
    :mksession!
    :only
endfunction

nnoremap <Leader>0 :call <SID>Only()<cr>

nnoremap <Leader>SS :source Session.vim<cr>

let intrusive = 1

function! s:ToggleIntrusive()
    set number!
    ALEToggle
    SignifyToggle
endfunction

nnoremap <Leader>ti :call <SID>ToggleIntrusive()<cr>

command! Gbranch call fzf#run(
    \ {
    \ 'source': 'git branch',
    \ 'sink': function('<sid>change_branch'),
    \ 'options': '-m',
    \ 'down': '20%'
    \ })

command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Just to seen if it works
" command! -nargs=1 -bang HGrep call fzf#run(fzf#wrap(
"       \ {'source': 'hgrep <q-args>', 'options': '-m'}, <bang>0))

" }}}


" Make Vim able to edit crontab files again.
"set backupskip=/tmp/*,/private/tmp/*"

" Save when losing focus
"
" autocmd FocusLost * :wa

" Load templates file
autocmd BufNewFile * silent! 0r ~/Templates/%:e.tpl

" Abbreviations
iabbrev @@ dijkstra.arjen@gmail.com
iabbrev /\ (lambda )


" silence search string
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" let Y be more consistent
nmap Y y$

" open tag on the top of the screen
nnoremap <C-]> <C-]>zt

" " open next toplevel thingie to top of the screen.
nnoremap ]] ]]zt
nnoremap [[ [[zt


" Snippets from:
" https://github.com/mattboehm/dotfiles/blob/master/vim/vimrc

"vv selects til end of line (not incl newline)
vnoremap v $h

"swap highlighted text with last deleted text
xnoremap <C-x> <Esc>`.``gvP``P

" nnoremap <silent> n nzt
" nnoremap <silent> N Nzt
" nnoremap <silent> * *zt
" nnoremap <silent> # #zt
" nnoremap <silent> g* g*tz
" nnoremap <silent> g# g#tz
" nnoremap <silent> <C-o> <C-o>zt
" nnoremap <silent> <C-i> <C-i>zt


" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
" nnoremap <leader>v :sp ~/.config/nvim/init.vim<CR><C-W>_
nnoremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

" open/close the quickfix window
nnoremap <leader>c :copen<CR>
nnoremap <leader>cc :cclose<CR>

" open/close the location window
nnoremap <leader>l :lopen<CR>
nnoremap <leader>ll :lclose<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" replace snippet
nnoremap R :%s//g<left><left>

" open link in browser
let g:netrw_browsex_viewer= 'firefox'
let g:netrw_list_hide= '.*\.pyc$'
let g:netrw_liststyle=0

" let g:BASH_Ctrl_j = 'off'
" " ctrl-jklm  changes to that split
" nnoremap <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h

" Terminal
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
nnoremap <silent> ,tt :Ttoggle<cr>
" clear terminal
nnoremap <silent> ,tr :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
inoremap <c-h><c-h> <Esc>:TmuxNavigateLeft<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

let g:tmux_navigator_save_on_switch = 1

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
" imap <C-W> <C-O><C-W>

" -------------------------
" Select within underscores
" -------------------------

xnoremap i_ :<C-u>call <SID>UnderscoreTextObject('i')<cr>
onoremap i_ :<C-u>call <SID>UnderscoreTextObject('i')<cr>
xnoremap a_ :<C-u>call <SID>UnderscoreTextObject('a')<cr>
onoremap a_ :<C-u>call <SID>UnderscoreTextObject('a')<cr>

" Select [i]nner or [a]ugmented word; if we're in an underscore_word segment, treat
" underscores as word boundaries.
"
" Here is the behaviour of `va_` for several
"
"     asdf_asdf_asdf seen here.
"     ^C^^^
"          ^C^^^
"              ^C^^^
"                    ^C^^^
"                        ^C^^^
function! s:UnderscoreTextObject(whole)
    let l:saved_keyword = &iskeyword
    setlocal iskeyword-=_

    normal! viw

    " We want the outer underscore_word segment
    if a:whole ==# 'a'
        " Alternative 1 of 3: select a trailing underscore, if any
        "     asdf_asdf_asdf
        "     ^^^^^
        if getline('.')[col('.')] ==# '_'
            normal! l
        " Alternative 2 of 3: no trailing underscore, so select leading
        " underscore, if any
        "     asdf_asdf_asdf
        "              ^^^^^
        " `else` instead of `elif` because we need to hit o first.
        else
            normal! o
            if getline('.')[col('.') - 2] ==# '_'
                normal! h
                normal! o
        " Alternative 3 of 3: no underscores, default to normal outer word selection.
        " Turn off selection, and hit vaw.
            else
                normal! v
                normal! vaw
            endif
        endif
    endif
    let &iskeyword = l:saved_keyword
endfunction

nnoremap <silent> <C-W>z :wincmd z<Bar>cclose<Bar>lclose<CR>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k

" vmap <BS> <Plug>(expand_region_shrink)
" vmap - <Plug>(expand_region_shrink)

"  " use ,gf to go to file in a vertical split
nnoremap <silent> <leader>gf :vertical botright wincmd f<CR>
"
" see more at http://skwp.github.com/dotfiles

" Slimux
" nnoremap <Leader>sc :SlimuxREPLConfigure<CR>
" nnoremap <Leader>sl :SlimuxREPLSendLine<CR>
" vmap <Leader>ss :SlimuxREPLSendSelection<CR>


" nnoremap <leader>a <Esc>:Ack!<Space>
let g:grepper = {}
nnoremap <leader>* :Grepper -tool rg -cword -noprompt<cr>
nnoremap <leader>r :Grepper -tool rg<cr>
nnoremap <leader>A :Rg<cr>
let g:grepper.rg = { 'grepprg': 'rg --vimgrep --smart-case'}
nnoremap <leader>a :Grepper -tool ag<cr>
let g:grepper.ag = { 'grepprg': 'ag --path-to-ignore ~/.ignore'}
nnoremap <leader>g :Grepper -tool git<cr>

nmap go <plug>(GrepperOperator)
xmap go <plug>(GrepperOperator)

" let g:ack_use_dispatch = 0
" let g:ackprg = 'ag --smart-case --nogroup --nocolor --column --ignore=tags --ignore=Session.vim --ignore==root/ --ignore=build-image/'

" Toggle tag
nnoremap <leader>t <Esc>:tag<Space>
nnoremap <leader>ts <Esc>:tselect<Space>

" use ,T to jump to tag in a vertical split
" nnoremap <silent> <Leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tselect ". word)<cr>

" Open in vertical split the tag under the cursur.
nnoremap  <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:exec("tag ". word)<cr>zt

" nnoremap  <Leader>TS :let word=expand("<cword>")<CR>:vsp<CR>:exec("tselect ". word)<cr>zt

" Toggle Tagbar
nnoremap <leader>tl :TagbarToggle<CR>

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

let g:vlime_cl_use_terminal = 1
let g:vlime_window_settings = {'repl': {'vertical': v:false, 'pos': 'botright'}}

function! s:ConnectVlimeToStumpwm()
    call vlime#plugin#ConnectREPL('127.0.0.1', 4005)
endfunction

let g:vlime_compiler_policy = {"DEBUG": 3}

let g:vlime_enable_autodoc = 1
nnoremap <localleader>c :call <SID>ConnectVlimeToStumpwm()<CR>

" Show yankring
" nnoremap <silent> <leader>y :Denite neoyank<CR>
nnoremap <silent> <leader>y :YRShow<CR>

" Please do check if the system clipboad has changed if we're running vim in
" console
set clipboard+=unnamedplus
" let g:loaded_clipboard_provider="xsel"

" vim-exchange

" " swap word with next word
" nmap <localleader>sw cxiWEwcxiW

let g:echodoc#enable_at_startup = 1

let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse = 0

let g:airline#extensions#tagbar#enabled = 0
" let g:airline#extensions#tagbar#flags = 'f'
" let g:airline#extensions#tagbar#flags = 's'
" let g:airline#extensions#tagbar#flags = 'p'

" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':~'"
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#branch#use_vcscommand = 1
let g:airline#extensions#tabline#formatter = 'short_path'

" Delete buffer from buffelist and open previous buffer in split.
noremap <leader>bq :bp <BAR> bd #<CR>
" Delete buffer from buffelist and close split
noremap <leader>bd :bd<CR>

" Load the Gundo window
" let g:gundo_prefer_python3 = 1
" nnoremap <leader>G :GundoToggle<CR>
nnoremap <leader>G :UndotreeToggle<CR>

" in command mode expand directory with current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <c-e> :Explore %:p:h<cr>
autocmd FileType netrw setlocal bufhidden=wipe

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

" Split line (sister to [J]oin lines)
" " The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
nnoremap <localleader>j :%!python -m json.tool<cr>


 let g:indentLine_fileType = ['python']


let g:ale_completion_enabled=0
let g:ale_completion_delay=50

" autocmd FileType python :iabbrev <buffer> .. self


" let g:ale_lint_on_text_changed='never'
" let g:ale_lint_on_insert_leave=1
" let g:ale_virtualtext_cursor=1
let b:ale_python_flake8_use_global=1
let b:ale_python_pylint_use_global=1
let b:ale_python_pycodestyle_use_global=1
" let b:ale_python_vulture_use_global=1
let g:ale_linters = {
            \ 'python' : ['pycodestyle', 'mypy', 'pyflakes', 'pylint'],
\ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['black', 'isort'],
\   'tex': ['latexindent', 'textlint', 'remove_trailing_lines', 'trim_whitespace'],
\}

let g:ale_python_autopep8_options = '--aggressive'
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
" nnoremap <localleader>a8 :call ale#fix#Fix()
nmap <localleader>a8 <Plug>(ale_fix)

" let g:ale_python_flake8_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/flake8'
let g:ale_python_pycodestyle_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/pycodestyle'
let g:ale_python_pylint_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/pyflakes'
let g:ale_python_vulture_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/vulture'
let g:ale_python_mypy_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/mypy'
let g:ale_python_isort_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/isort'
let g:ale_python_yapf_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/yapf'
let g:ale_python_autopep8_executable = $HOME . '/config/dotfiles/_neovim/ENV/bin/autopep8'
" let g:pymode_rope_autoimport = 1
" TEMPORARY!!
" let g:ale_python_pylint_options = "--init-hook='import sys; sys.path.append(\".\")'"
" let g:ale_python_pylint_options = "--load-plugins pylint_django"
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_pylint_options='--disable=C0111,R0903 --load-plugins pylint_django'
let g:ale_python_flake8_options='--ignore=H301 --max-complexity=10'
let g:ale_python_mypy_options = '--ignore-missing-imports'

let b:ale_virtualenv_dir_names=['ENV', '.env', '.venv']
" let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()  # XXXX breakpoint'
autocmd FileType python nnoremap <localleader>b Oimport ipdb; ipdb.set_trace()<esc>:w<CR>


"let g:pymode_python = 'python3'
" yet let it open on toggle.
" map <leader>l :PyLintToggle<CR>

" Rename whatever the cursor is on (including references to it)
" map <leader>r :RopeRename<CR>

" Resize splits when the window is resized
autocmd VimResized * silent! :wincmd =


set suffixesadd=.tex,.latex,.java,.js,.hrl,.erl,.lisp,.asd

" set guifont=Andale\ Mono\ 10\ for\ Powerline
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

" autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
" set cursorcolumn              " have a bar indicate the cursor location
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
"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
" autocmd BufNewFile,BufRead *.js set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
" autocmd BufNewFile,BufRead *.coffee set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)

" search for selection
vnoremap // y/<C-R>"<CR>


if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

"""" Display
if has("gui_running")
    " colorscheme solarized
    set background=dark           " We are using dark background in vim
    set guioptions-=egimrLtT
else
    " set nocursorline
    set t_Co=256
    set termguicolors
    set background=light           " We are using dark background in vim
    " colorscheme NeoSolarized
     colorscheme PaperColor
     " colorscheme gruvbox
endif

if has('nvim')
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

let g:hostname=hostname()

" Paste from clipboard
" map <leader>p "+gP


" RainbowParentheses

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
" autocmd Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]


" Remove trailing whitespace on <leader>S
nnoremap <leader>S mz:%s/\s\+$//<cr>:let @/=''<CR>`z

" Select the item in the list with enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"
" ==========================================================
" Zcml
" ==========================================================
autocmd BufRead,BufNewFile *.zcml set ft=xml
"
" ==========================================================
" Markdown
" ==========================================================
autocmd BufRead,BufNewFile *.md set ft=markdown

" ==========================================================
" Main
" ==========================================================
autocmd FileType mail setlocal spell
autocmd FileType mail setlocal spelllang=nl


" ==========================================================
" Javascript
" ==========================================================
autocmd BufRead *.js set makeprg=jslint\ %
" let g:syntastic_javascript_checkers = ['jslint', 'jshint']

" Don't allow snipmate to take over tab
"TODO remap, so you don't override the movement keys
" autocmd VimEnter * ino <c-j> <c-r>=TriggerSnippet()<cr>
" Use tab to scroll through autocomplete menus
" autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
" autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
" ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <c-k>     <Plug>(neosnippet_expand_or_jump)
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <c-k>     <Plug>(neosnippet_expand_or_jump)

xmap <c-k>     <Plug>(neosnippet_expand_target)


" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.

" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" " For conceal markers.
" if has('conceal')
"   set conceallevel=0 concealcursor=niv
"   autocmd FileType roamer setlocal conceallevel=0
" endif

" nnoremap <localleader>o :<C-u>Denite  -buffer-name=outline outline<cr>

" let g:deoplete#enable_at_startup = 1
" " let g:deoplete#sources#jedi#show_docstring = 0
" " let g:deoplete#complete_method='omnifunc'
" let g:deoplete#sources#jedi#ignore_errors = v:true

" let g:jedi#popup_select_first = 0
" let g:jedi#completions_enabled = 0

" let g:jedi#smart_auto_mappings = 1

" " select from top to bottom
" let g:SuperTabDefaultCompletionType = "<c-n>"


" " let g:deoplete#ignore_sources = {'': ['tags']}
" let g:deoplete#ignore_sources = {'_': ['tag']}
set tags=./tags,tags


" vim-highlightedyank plugin
let g:highlightedyank_highlight_duration = 100

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufRead,BufNewFile *.kv set filetype=kivy
autocmd BufNewFile,BufRead *.t set filetype=cram
autocmd FileType kivy set commentstring=#\ %s
autocmd FileType spec set commentstring=#\ %s
autocmd FileType tmux set commentstring=#\ %s

autocmd BufNewFile,BufRead *.j2 setlocal filetype=htmldjango

" sml
" autocmd FileType sml setlocal shiftwidth=4
autocmd FileType sml set commentstring=(*%s*)

autocmd FileType xml setlocal commentstring={#%s#}

let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax


autocmd FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
" racket {{{
" autocmd FileType racket setlocal shiftwidth=4
autocmd FileType racket set commentstring=;%s
" "}}}
"
"
"
augroup ft_tree
    autocmd!
    autocmd FileType tree setlocal foldmethod=expr
    autocmd FileType tree setlocal foldlevel=1
augroup END

" common lisp {{{
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
augroup END


" lisp
augroup set_lisp_repl
    autocmd FileType lisp
          \ if executable('lisp') |
          \   call neoterm#repl#set('lisp') |
          \ end
augroup END

augroup ft_prolog
    autocmd BufRead,BufNewFile *.pl set filetype=prolog
augroup END

" let g:slimv_repl_split = 4
" }}}
" Haskellmode {{{

" let $PATH = $PATH . ':' . expand("~/.cabal/bin")
" set path+=~/.cabal/bin


let g:haddock_browser = "firefox"
let g:haddock_browser_callformat = "%s %s"
let g:ghc = "/usr/bin/env ghc"
let g:necoghc_enable_detailed_browse = 1

" }}}
"

" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <leader><cr> :silent !ctags -R --links=no --exclude=.buildozer --exclude=.tox --languages=-javascript --languages=-css >/dev/null 2>&1 &<cr>:redraw!<cr>

autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent
" autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"

autocmd FileType python setlocal path+=.venv/**
autocmd FileType python setlocal colorcolumn=79


function! s:OpenTestFile(split)
    let l:test_file = '**/*[tT]est*' . expand('%:t')
    let l:test_file = expand('%:h') . '**/*[tT]est_' . expand('%:t')
    if a:split ==# 'vertical'
        vsplit
    elseif a:split ==# 'horizontal'
        split
    endif
    try
        execute 'find' . ' ' . l:test_file
    catch
        if a:split ==# 'horizontal' || a:split ==# 'vertical'
            quit
        endif
        echom 'No test file found, with name: ' . l:test_file
    endtry
endfunc

nnoremap <localleader>ovt :call <SID>OpenTestFile("vertical")<cr>
nnoremap <localleader>oht :call <SID>OpenTestFile("horizontal")<cr>
nnoremap <localleader>ot :call <SID>OpenTestFile("")<cr>

" Latex support
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'


let g:vimtex_latexmk_progname= '/home/arjen/config/dotfiles/_neovim/ENV/bin/nvr'


let g:vimtex_quickfix_mode=1
let g:tex_conceal='abdmg'

autocmd FileType tex setlocal spell
set spelllang=nl,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
let g:vimtex_compiler_progname = 'nvr'


" let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
" execute "set rtp+=".s:ocamlmerlin."/vim"
" execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
" let g:syntastic_ocaml_checkers = ['merlin']


set path+=**
" set path+=.,,**

augroup ft_java
    autocmd!
    autocmd Filetype java set makeprg=javac\ %
    autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
augroup END

" let g:dbext_default_profile_survey = 'type=PGSQL:user=arjend:@askg:host=localhost:dbname=survey'

" let g:signify_update_on_bufenter = 1
" let g:signify_update_on_focusgained = 1
let g:signify_vcs_list = ['git', 'hg']

" noremap <Leader>C :Copen<cr>

" let g:dispatch_compilers = {
"     \'python': 'nosetests'
"     \}

" if has("python") && filereadable($HOME . '/.vimrc_python2')
"     source $HOME/.vimrc_python2
" elseif has("python3") && filereadable($HOME . '/.vimrc_default')
"     source $HOME/.vimrc_default
" endif

if filereadable('.local.vim')
  source .local.vim
endif

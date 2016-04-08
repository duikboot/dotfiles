" vim:foldmethod=marker
"" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" Load pathogen with docs for all plugins
filetype off
" call pathogen#incubate()
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" pathogen#incubate() to pathogen#infect('bundle/{}')

" So neovim will work in a VirtualEnv
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" Basic Settings {{{
syntax on                     " syntax highlighting
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set hidden
" set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
" set wildmode=full             " <Tab> cycles between all matching choices.
set history=1000              " Set history to 1000 commands
set undolevels=1000           " use many levels of undo
set display=lastline
set formatoptions+=j " Delete comment char when joining commented lines"
set nojoinspaces " Use only 1 space after "." when joining lines, not 2"
set showfulltag               " Show full tags when doing search completion
" set relativenumber            " show linenumber relative to line cursor is on
setlocal keywordprg=:help     " Use K to show help on subject under cursor
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp  "set directory for swapfiles
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set splitright
set splitbelow

set dictionary=/usr/share/dict/words

" Don't select everything if the is a point(.) in it
" eg. select.dontselect selects now select with gd or *
set iskeyword-=.

if v:version >= 703
    " Keep a persistend backupfile
    set undofile
    set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif
" }}}

" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let g:mapleader="\<space>"             " change the leader to be a comma vs slash
let g:maplocalleader="\\"       " map localleader to \\
" noremap - ,


" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Q :quitall
command! WQ :wqall
command! Wq :wq

nnoremap <leader>e :edit<cr>
" nnoremap ; :
" nnoremap : ;
" inoremap jj <Esc>

" save file
noremap <Leader>w :w<cr>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Open :CtrlP
nnoremap <Leader>o :CtrlP<CR>
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|build-image|build)$',
  \ }
" Make Vim able to edit crontab files again.
"set backupskip=/tmp/*,/private/tmp/*"

" Save when losing focus
"
autocmd FocusLost * :wa

" Load templates file
autocmd BufNewFile * silent! 0r ~/Templates/%:e.tpl

" Abbreviations
iabbrev @@ dijkstra.arjen@gmail.com

" Toggle the tasklist
" nnoremap <leader>td <Plug>TaskList


" silence search string
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" let Y be more consistent
nnoremap Y y$

" nnoremap <silent> n nzz
" nnoremap <silent> N Nzz
" nnoremap <silent> * *zz
" nnoremap <silent> # #zz
" nnoremap <silent> g* g*zz
" nnoremap <silent> g# g#zz
" nnoremap <silent> <C-o> <C-o>zz
" nnoremap <silent> <C-i> <C-i>zz

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
nnoremap <leader>v :sp ~/.config/nvim/init.vim<CR><C-W>_
nnoremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nnoremap <leader>c :copen<CR>
nnoremap <leader>cc :cclose<CR>

" open/close the location window
nnoremap <leader>l :lopen<CR>
nnoremap <leader>ll :lclose<CR>

" Matchmaker toggle
" nmap <leader>m :MatchmakerToggle<CR>
nnoremap <Leader>m :<C-u>MatchmakerToggle<CR>

nnoremap <Leader>SS :source Session.vim<cr>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

nnoremap R :%s//g<left><left>

" open link in browser
let g:netrw_browsex_viewer= "firefox"

" let g:BASH_Ctrl_j = 'off'
" " ctrl-jklm  changes to that split
" nnoremap <c-j> <c-w>j
" map <c-k> <c-w>k
" map <c-l> <c-w>l
" map <c-h> <c-w>h


" Terminal
tnoremap <Esc> <C-\><C-n>
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l
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
    let saved_keyword = &iskeyword
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
    let &iskeyword = saved_keyword
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
vmap - <Plug>(expand_region_shrink)

"  " use ,gf to go to file in a vertical split
nnoremap <silent> <leader>gf :vertical botright wincmd f<CR>
"
" see more at http://skwp.github.com/dotfiles

" Slimux
nnoremap <Leader>sc :SlimuxREPLConfigure<CR>
nnoremap <Leader>sl :SlimuxREPLSendLine<CR>
vmap <Leader>ss :SlimuxREPLSendSelection<CR>


let $PATH = $PATH . ':' . expand("~/.cabal/bin")
set path+=~/.cabal/bin


" nnoremap <leader>a <Esc>:Ack!<Space>

let g:ack_use_dispatch = 0
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column --ignore=tags --ignore=Session.vim'

" Toggle tag
nnoremap <leader>t <Esc>:tselect<Space>

" use ,T to jump to tag in a vertical split
" nnoremap <silent> <Leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tselect ". word)<cr>
nnoremap <silent> <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:exec("tag ". word)<cr>zt

" Toggle Tagbar
nnoremap <leader>tl :TagbarToggle<CR>

function! s:AddFilenameToRegister(from)
    if a:from==#'absolute'
        let @* = expand("%:p")
    else
        let @* = expand("%")
    endif
endfunction

nnoremap <leader>cf :call <SID>AddFilenameToRegister('absolute')<CR>
nnoremap <leader>cr :call <SID>AddFilenameToRegister('relative')<CR>

" Show yankring
nnoremap <silent> <leader>y :YRShow<CR>

" Please do check if the system clipboad has changed if we're running vim in
" console
let g:yankring_manual_clipboard_check = 1
set clipboard^=unnamed

" install in other place
" python from powerline.bindings.vim import source_plugin; source_plugin()
" Fancy powerline
" let g:Powerline_symbols = 'unicode'
" let g:Powerline_stl_path_style = 'relative'

let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_inactive_collapse = 0
"
" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':~'"
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" let g:airline#extensions#branch#use_vcscommand = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

noremap <leader>bq :bp <BAR> bd #<CR>

" Load the Gundo window
let g:gundo_prefer_python3 = 1
nnoremap <leader>g :GundoToggle<CR>

" in command mode expand directory with current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" nnoremap <silent> <Leader>T :let word=expand("<cword>")<CR>:vsp<CR>:exec("tag ". word)<cr>zt
noremap <BS> :Explore<cr>

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

" Split line (sister to [J]oin lines)
" " The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w


" Don't open quickfix window on save...
let g:pymode_lint_message = 1
let g:pymode_lint = 1
let g:pymode_lint_on_write = 0

" let g:pymode_trim_whitespaces = 1

let g:pymode_lint_ignore = "C0110,C0111,C0301,C0325"
let g:pymode_lint_signs = 1
let g:pymode_lint_unmodified = 0

" Temporary disable rope, because there is a bug in RopeRename
let g:pymode_rope = 0
let g:pymode_syntax_space_errors = 0

let g:pymode_rope_complete_on_dot = 0

" function! s:Autopep8()
"     " redir => message
"     mz:%!autopep8 %<cr>`z:w<cr>
"     " echom message
"     " redir END
" endfunction

" Run PymodeLint
" autocmd FileType python noremap <LocalLeader>8 :PymodeLint<cr>:lopen<cr>
" autocmd FileType python noremap <LocalLeader>a8 call s:Autopep8()
autocmd FileType python noremap <LocalLeader>a8 mz:%!autopep8 %<cr>`z:w<cr>

nnoremap <localleader>j :%!python -m json.tool<cr>

" let g:pymode_rope_autoimport = 1
let g:pymode_lint_checkers = ['pep8', 'pylint', 'mccabe', 'pyflakes']


"let g:pymode_python = 'python3'
" yet let it open on toggle.
" map <leader>l :PyLintToggle<CR>

" Rename whatever the cursor is on (including references to it)
" map <leader>r :RopeRename<CR>

" Resize splits when the window is resized
autocmd VimResized * silent! :wincmd =


set suffixesadd=.tex,.latex,.java,.js,.hrl,.erl

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
set grepprg=ack          " replace the default grep program with ack
" search for tag under cursor and open in new split
" nnoremap <c-\> <c-w>v<c-]>zvzz
" map backspace for searching for word under cursor using ack
" nnoremap <bs> :Ack! '\b<c-r><c-w>\b'<cr>

" Set working directory
" nnoremap <leader>. :lcd %:p:h<CR>

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
autocmd FileType python setlocal colorcolumn=79

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=8             " Keep a small completion window


""" Moving Around/Editing
set autoindent              " always set autoindenting on
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set cursorline              " have a line indicate the cursor location
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
"set smartindent             " use smart indent if there is no indent file
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set tabstop=4               " <tab> inserts 4 spaces
set virtualedit=block       " Let cursor move past the last char in <C-v> mode

set breakindent
set breakindentopt=shift:4
let &showbreak='↳ '
"
" set cpo=n
" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
" set noautowrite             " Never write a file unless I request it.
" set noautowriteall          " NEVER.
set autowrite
set autoread                " automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set laststatus=2                    " allways show status line
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
set smarttab                " Handle tabs more intelligently
" autocmd BufNewFile,BufRead *.js set nosmarttab  " If Javascript, don't use smarttab"
" autocmd BufNewFile,BufRead *.js set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
" autocmd BufNewFile,BufRead *.coffee set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)


if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

"""" Display
if has("gui_running")
    colorscheme solarized
    set background=dark           " We are using dark background in vim
    set guioptions-=egimrLtT
else
    " set nocursorline
    set t_Co=256
endif

let g:hostname=hostname()

" Try Apprenctice sometime
" colorscheme apprenctice

colorscheme PaperColor
set background=light

" Paste from clipboard
" map <leader>p "+gP

"
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
let g:syntastic_javascript_checkers = ['jslint', 'jshint']

" Don't allow snipmate to take over tab
"TODO remap, so you don't override the movement keys
" autocmd VimEnter * ino <c-j> <c-r>=TriggerSnippet()<cr>
" Use tab to scroll through autocomplete menus
" autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
" autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
" ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-t>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"

" Unite keybindings

" nnoremap [unite] <Nop>
" nnoremap \\\ [unite]
" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <localleader>r :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <localleader>c :<C-u>UniteWithBufferDir -no-split -buffer-name=files -start-insert file<cr>
nnoremap <localleader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <localleader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert -auto-preview outline<cr>
nnoremap <localleader>o :<C-u>Unite  -buffer-name=outline -start-insert outline<cr>
" nnoremap <localleader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <localleader>b :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap <localleader>l :<C-u>Unite -no-split -buffer-name=line -start-insert line<cr>
nnoremap <localleader>g :<C-u>Unite -no-split -no-empty -buffer-name=grep  grep:.<cr>
nnoremap <localleader>qb :<C-u>Unite -no-split -quick-match buffer<cr>
" nnoremap <localleader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)

  " Quit unite on backspace from normal mode, or using leader-q
  nnoremap <buffer> <BS> :UniteClose<CR>
  nnoremap <buffer> <leader>q :UniteClose<CR>
endfunction

function! UltiSnipsCallUnite()
    Unite -start-insert -immediately -no-empty ultisnips
    return ''
endfunction

inoremap <silent> <F12> <C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>
nnoremap <silent> <F12> a<C-R>=(pumvisible()? "\<LT>C-E>":"")<CR><C-R>=UltiSnipsCallUnite()<CR>


" " let g:acp_completeoptPreview=1
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 2

let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1
" let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
" " let g:neocomplete#sources#syntax#min_keyword_length = 2
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" let g:neocomplete#min_keyword_length = 2


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

" common lisp {{{
let delimitMate_excluded_ft = "clojure,lisp"
autocmd BufRead,BufNewFile *.asd set filetype=lisp
let g:lisp_rainbow=1

let g:slimv_repl_split = 4
" }}}
" Haskellmode {{{

let g:haddock_browser = "firefox"
let g:haddock_browser_callformat = "%s %s"
let g:ghc = "/usr/bin/env ghc"
let g:necoghc_enable_detailed_browse = 1

" }}}
"
" Haskell {{{

" augroup ft_haskell
"     autocmd!
"     autocmd BufEnter *.hs compiler ghc
"     " setlocal iskeyword=a-z,A-Z,_,.,39
"     " let &makeprg='hdevtools check %'
"     " let g:hdevtools_options = '-g -isrc -g -Wall -g -hide-package -g transformers'
"     "let g:neocomplete#ctags_command = 'hasktags'
"     " let g:haskell_conceal_wide = 1
"     let g:neocomplcache_force_overwrite_completefunc = 1
" augroup END

" }}}

" {{{

" haskellmode-vim and ghcmod-vim support for cabal sandboxes.
" http://lpaste.net/92928

" function! s:find_basedir() "{{{
" " search Cabal file
"   if !exists('b:ghcmod_basedir')
"     let l:ghcmod_basedir = expand('%:p:h')
"     let l:dir = l:ghcmod_basedir
"     for _ in range(6)
"       if !empty(glob(l:dir . '/*.cabal', 0))
"         let l:ghcmod_basedir = l:dir
"         break
"       endif
"       let l:dir = fnamemodify(l:dir, ':h')
"     endfor
"     let b:ghcmod_basedir = l:ghcmod_basedir
"   endif
"   return b:ghcmod_basedir
" endfunction "}}}

" " use ghc functionality for haskell files
" let sandbox_dir = '/.cabal-sandbox/x86_64-linux-ghc-7.6.3-packages.conf.d'
" let g:ghc="/usr/bin/ghc"
" augroup filetype_hs
"     autocmd!
"     autocmd Bufenter *.hs let dir = s:find_basedir() . sandbox_dir
"     " autocmd Bufenter *.hs compiler ghc
"     autocmd Bufenter *.hs let b:ghc_staticoptions = '-package-db ' . dir
"     autocmd Bufenter *.hs let g:ghcmod_ghc_options = ['-package-db ' . dir]
"     autocmd FileType haskell let b:start = 'ghci "%:p"'
" augroup END

" let g:syntastic_haskell_checkers = ['']
" " }}}


" Rebuild Ctags (mnemonic RC -> CR -> <cr>)
nnoremap <leader><cr> :silent !ctags -R --exclude=ENV/lib64 --exclude=node_modules --exclude=.buildozer >/dev/null 2>&1 &<cr>:redraw!<cr>

" Python
" ==========================================================
"autocmd BufRead *.py compiler nose
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
set completeopt-=preview
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType tex setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell setlocal ai sw=4 ts=4 sta et fo=croql
" autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with,from,import
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent
" autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m


autocmd FileType python noremap <LocalLeader>8 :Neomake<cr>
let g:neomake_python_enabled_makers = ['pep8', 'pylint']
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_python_checkers = ['']
" autocmd FileType python let b:dispatch = 'python %'
au FileType python call SetupPython()

function! SetupPython()
    compiler nosetests
    set makeprg=nosetests
endfunction
autocmd FileType qf call ParseNosetestsQuickFix()

let g:dispatch_compilers = {'nosetests': 'nosetests'}
let test#strategy = "neovim"

function! ParseNosetestsQuickFix()
  " only will work for vim 7.4.718+ as an autocommand
  if !exists( "w:quickfix_title" )
      set nofoldenable
      return
  endif
  if match( w:quickfix_title, '.*nosetests.*') != 0
      set nofoldenable
      return
  endif
  set foldexpr=getline(v:lnum)=~'^\|\|.===='?'>1':1
  set foldmethod=expr
  set foldtext=NosetestsFoldtextMaker()
  set foldenable
endfunction

function! NosetestsFoldtextMaker()
  let line = getline(v:foldstart)
  let linenum = v:foldstart + 1
  let found = 0
  while linenum < v:foldend
    if match( getline( linenum ), '^||.*' ) == 0
      if found == 1
        let line = getline( linenum )
        break
      endif
    else
      let found = 1
    endif
    let linenum = linenum + 1
  endwhile
  let n = v:foldend - v:foldstart + 1
  let info = " " . n . " lines "
  return "+" . v:folddashes . info . line
endfunction

function! s:OpenTestFile(split)
    let l:test_file = '**/[tT]est*' . expand('%:t')
    if a:split ==# 'vertical'
        vsplit
    elseif a:split ==# 'horizontal'
        split
    endif
    try
        execute "find" . ' ' . l:test_file
    catch
        if a:split ==# "horizontal" || a:split ==# "vertical"
            quit
        endif
        echom "No test file found, with name: " . l:test_file
    endtry
endfunc

nnoremap <Leader>ovt :call <SID>OpenTestFile("vertical")<cr>
nnoremap <Leader>oht :call <SID>OpenTestFile("horizontal")<cr>
nnoremap <Leader>ot :call <SID>OpenTestFile("")<cr>

" Latex support
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'


" let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','''') .  "/ocamlmerlin"
" execute "set rtp+=".s:ocamlmerlin."/vim"
" execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
" let g:syntastic_ocaml_checkers = ['merlin']


set path+=.,,**

augroup ft_java
    autocmd!
    autocmd Filetype java set makeprg=javac\ %
    autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
augroup END

" let g:dbext_default_profile_survey = 'type=PGSQL:user=arjend:@askg:host=localhost:dbname=survey'

" let g:signify_update_on_bufenter = 1
" let g:signify_update_on_focusgained = 1

noremap <f5> :Start<cr>
noremap <f6> :Dispatch<cr>
" noremap <Leader>C :Copen<cr>

" let g:dispatch_compilers = {
"     \'python': 'nosetests'
"     \}

if has("python") && filereadable($HOME . '/.vimrc_python2')
    source $HOME/.vimrc_python2
elseif has("python3") && filereadable($HOME . '/.vimrc_default')
    source $HOME/.vimrc_default
endif

if filereadable('.local.vim')
  source .local.vim
endif

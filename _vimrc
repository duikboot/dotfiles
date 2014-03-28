"" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
" call pathogen#incubate()
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" pathogen#incubate() to pathogen#infect('bundle/{}')


" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let mapleader="\<space>"             " change the leader to be a comma vs slash
let maplocalleader="\\"       " map localleader to \\
" noremap - ,

set rtp +=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set rtp +=/usr/lib/python2.7/site-packages/powerline/bindings/vim/

" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w
command! Q :quitall
command! WQ :wqall
command! Wq :wq

inoremap jj <Esc>

" save file
noremap <Leader>w :w<cr>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Open :CtrlP
nnoremap <Leader>o :CtrlP<CR>

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
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
set showfulltag               " Show full tags when doing search completion
" set relativenumber            " show linenumber relative to line cursor is on
setlocal keywordprg=:help     " Use K to show help on subject under cursor
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp  "set directory for swapfiles
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

if v:version >= 703
    " Keep a persistend backupfile
    set undofile
    set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
endif

" Don't select everything if the is a point(.) in it
" eg. select.dontselect selects now select with gd or *
set iskeyword-=.

" Make Vim able to edit crontab files again.
"set backupskip=/tmp/*,/private/tmp/*"


" Save when losing focus
"
au FocusLost * :wa

" Load templates file
autocmd BufNewFile * silent! 0r ~/Templates/%:e.tpl

augroup ft_hgcommit
    au!
    autocmd FileType hgcommit silent! execute ":0read !hg branch"
    autocmd FileType hgcommit silent! execute ":1s/_.*/ /g"
    autocmd FileType hgcommit set spell
    " autocmd FileType hgcommit execute ":normal A"
augroup END

" Abbreviations
abbreviate pudb    import pudb; pudb.set_trace()
abbreviate pdb    import pdb; pdb.set_trace()

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Run pep8
let g:pep8_map='<leader>8'

" silence search string
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" let Y be more consistent
nnoremap Y y$

nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

" ,v brings up my .vimrc
" ,V reloads it -- making all changes active (have to save first)
map <leader>v :sp ~/.vimrc<CR><C-W>_
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" open/close the location window
nnoremap <leader>l :lopen<CR>
nnoremap <leader>ll :lclose<CR>

" Matchmaker toggle
" nmap <leader>m :MatchmakerToggle<CR>
nnoremap <Leader>m :<C-u>MatchmakerToggle<CR>

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" open link in browser
let g:netrw_browsex_viewer= "firefox"


let g:BASH_Ctrl_j = 'off'
" ctrl-jklm  changes to that split
nnoremap <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

vmap <BS> <Plug>(expand_region_shrink)

" use ,F to jump to tag in a vertical split
nnoremap <silent> <Leader>F :let word=expand("<cword>")<CR>:vsp<CR>:wincmd w<cr>:exec("tselect ". word)<cr>
"
"  " use ,gf to go to file in a vertical split
nnoremap <silent> <leader>gf :vertical botright wincmd f<CR>
"
" see more at http://skwp.github.com/dotfiles

" Slimux
map <Leader>sc :SlimuxREPLConfigure<CR>
map <Leader>sl :SlimuxREPLSendLine<CR>
vmap <Leader>ss :SlimuxREPLSendSelection<CR>

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

let $PATH = $PATH . ':' . expand("~/.cabal/bin")
let g:necoghc_enable_detailed_browse = 1
set path+=~/.cabal/bin


nmap <leader>a <Esc>:Ack! 

" Toggle tag
nmap <leader>t <Esc>:tselect 

" Toggle Tagbar
nmap <leader>tl :TagbarToggle<CR>

" Show yankring
nnoremap <silent> <leader>y :YRShow<CR>
let g:yankring_manual_clipboard_check = 0

" install in other place
" python from powerline.bindings.vim import source_plugin; source_plugin()
" Fancy powerline
let g:Powerline_symbols = 'unicode'
let g:Powerline_stl_path_style = 'relative'

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" function! NumberToggle()
"   if(&relativenumber == 1)
"     set number
"   else
"     set relativenumber
"   endif
" endfunc

" nnoremap <C-n> :call NumberToggle()<cr>

" in command mode expand directory with current directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

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
" " v
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

" Temporary!!!!!
let g:pymode_utils_whitespaces = 1

let g:pymode_lint_ignore = "C0110,E501,C0111"
let g:pymode_lint_signs = 0
let g:pymode_lint_unmodified = 0
" let g:pymode_lint_checkers = ['pep8', 'pylint']

" yet let it open on toggle.
" map <leader>l :PyLintToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" Resize splits when the window is resized
au VimResized * :wincmd =


set suffixesadd=.tex,.latex,.java,.js

" set guifont=Andale\ Mono\ 10\ for\ Powerline
set guifont=Inconsolata\ 10
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
set pumheight=6             " Keep a small completion window


""" Moving Around/Editing
set autoindent              " always set autoindenting on
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set cursorline              " have a line indicate the cursor location
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set foldcolumn=0            " show the fold column
set foldlevel=666            " don't fold by default
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

" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff}) 
set encoding=utf-8          " Necessary to show unicode glyphs

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
set nolist
nmap <silent> <leader>s :set nolist!<CR>

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
" au BufNewFile,BufRead *.js set nosmarttab  " If Javascript, don't use smarttab"
au BufNewFile,BufRead *.js set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
au BufNewFile,BufRead *.coffee set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
if has("gui_running")
    " colorscheme vividchalk
    colorscheme badwolf
    " colorscheme inkpot
    "colorscheme vibrantink "scheme doesn't exist yet"
    " colorscheme desert
    " colorscheme solarized
    set background=dark           " We are using dark background in vim
    set guioptions-=egimrLtT
else
    " colorscheme vividchalk
    " colorscheme peaksea
    set background=dark           " We are using dark background in vim
    set nocursorline
     " hi CursorLine ctermbg=Red guibg=#771c1c
    " colorscheme jellybeans
    colorscheme molokai
    " set t_Co=256
endif

function! BackgroundToggle()
  if(&background == "dark")
    set background=light
  else
    set background=dark
  endif
endfunc

nnoremap <Leader>bg :call BackgroundToggle()<cr>

" Paste from clipboard
" map <leader>p "+gP

"
" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

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
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %

" Don't allow snipmate to take over tab
"TODO remap, so you don't override the movement keys
" autocmd VimEnter * ino <c-j> <c-r>=TriggerSnippet()<cr>
" Use tab to scroll through autocomplete menus
" autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
" autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
" ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
"

" let g:acp_completeoptPreview=1
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" sml
" autocmd FileType sml setlocal shiftwidth=4
autocmd FileType sml set commentstring=(*%s*)

autocmd FileType xml setlocal commentstring={#%s#}

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax


" racket
" autocmd FileType racket setlocal shiftwidth=4
autocmd FileType racket set commentstring=;%s

" Haskellmode {{{

let g:haddock_browser = "firefox"
let g:haddock_browser_callformat = "%s %s"
let g:ghc = "/usr/bin/ghc"
let g:necoghc_enable_detailed_browse = 1

" }}}
"
" Haskell {{{

augroup ft_haskell
    au!
    au BufEnter *.hs compiler ghc
    " setlocal iskeyword=a-z,A-Z,_,.,39
    " let &makeprg='hdevtools check %'
    " let g:hdevtools_options = '-g -isrc -g -Wall -g -hide-package -g transformers'
    "let g:neocomplete#ctags_command = 'hasktags'
    " let g:haskell_conceal_wide = 1
    let g:neocomplcache_force_overwrite_completefunc = 1
augroup END

" }}}

" {{{

" haskellmode-vim and ghcmod-vim support for cabal sandboxes.
" http://lpaste.net/92928

function! s:find_basedir() "{{{
" search Cabal file
  if !exists('b:ghcmod_basedir')
    let l:ghcmod_basedir = expand('%:p:h')
    let l:dir = l:ghcmod_basedir
    for _ in range(6)
      if !empty(glob(l:dir . '/*.cabal', 0))
        let l:ghcmod_basedir = l:dir
        break
      endif
      let l:dir = fnamemodify(l:dir, ':h')
    endfor
    let b:ghcmod_basedir = l:ghcmod_basedir
  endif
  return b:ghcmod_basedir
endfunction "}}}

" use ghc functionality for haskell files
let sandbox_dir = '/.cabal-sandbox/x86_64-linux-ghc-7.6.2-packages.conf.d'
let g:ghc="/usr/bin/ghc"
augroup filetype_hs
    autocmd!
    autocmd Bufenter *.hs let dir = s:find_basedir() . sandbox_dir
    autocmd Bufenter *.hs compiler ghc
    autocmd Bufenter *.hs let b:ghc_staticoptions = '-package-db ' . dir
    autocmd Bufenter *.hs let g:ghcmod_ghc_options = ['-package-db ' . dir]
augroup END

" }}}

" {{{
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-c>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" }}}


" Python
" ==========================================================
"au BufRead *.py compiler nose
autocmd FileType python set omnifunc=pythoncomplete#Complete
set completeopt-=preview
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType tex set omnifunc=csscomplete#CompleteCSS
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
autocmd FileType haskell set ai sw=4 ts=4 sta et fo=croql
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 cindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with,from,import
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Latex support
" let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
" let tlist_make_settings  = 'make;m:makros;t:targets'

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0



""" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
EOF

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

" python << EOF
" import os
" import sys
" import vim

" for p in sys.path:
"     # Add each directory in sys.path, if it exists.
"     if os.path.isdir(p):
"         # Command 'set' needs backslash before each space.
"         vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
" EOF


set path+=.,,**
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

==== BASE ====
scriptencoding utf-8
" Pathogen - Allows us to organize our vim plugins
" Load pathogen with docs for all plugins
filetype off
" call pathogen#incubate()
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" pathogen#incubate() to pathogen#infect('bundle/{}')



" Basic Settings {{{
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
syntax on                     " syntax highlighting
set nonumber                    " Display line numbers
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


"swap highlighted text with last deleted text
xnoremap <C-x> <Esc>`.``gvP``P


" open link in browser
let g:netrw_browsex_viewer= 'firefox'
let g:netrw_list_hide= '.*\.pyc$'
let g:netrw_liststyle=0



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


"
" see more at http://skwp.github.com/dotfiles

" Slimux
" nnoremap <Leader>sc :SlimuxREPLConfigure<CR>
" nnoremap <Leader>sl :SlimuxREPLSendLine<CR>
" vmap <Leader>ss :SlimuxREPLSendSelection<CR>


" Show yankring
" nnoremap <silent> <leader>y :Denite neoyank<CR>
nnoremap <silent> <leader>y :YRShow<CR>

" Please do check if the system clipboad has changed if we're running vim in
" console
" let g:loaded_clipboard_provider="xsel"








 let g:indentLine_fileType = ['python']



"let g:pymode_python = 'python3'
" yet let it open on toggle.
" map <leader>l :PyLintToggle<CR>

" Rename whatever the cursor is on (including references to it)
" map <leader>r :RopeRename<CR>

" Resize splits when the window is resized
" autocmd BufNewFile,BufRead *.js set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
" autocmd BufNewFile,BufRead *.coffee set noexpandtab " Use tabs, not spaces, for autoindent/tab key.
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)


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


let g:haddock_browser = "firefox"
let g:haddock_browser_callformat = "%s %s"
let g:ghc = "/usr/bin/env ghc"
let g:necoghc_enable_detailed_browse = 1

" }}}
"

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


" set path+=.,,**



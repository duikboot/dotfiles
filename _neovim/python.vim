" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
autocmd FileType python setlocal colorcolumn=79

" Don't open quickfix window on save...flake8
let g:pymode_lint_cwindow = 0
let g:pymode_lint_message = 0
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0

" let g:pymode_trim_whitespaces = 1

" let g:pymode_lint_checkers = ['flake8', 'pep8', 'pylint', 'mccabe', 'pyflakes']
" let g:pymode_lint_ignore = "C0110,C0111,C0301,C0325,C1001"
" let g:pymode_lint_signs = 1
" let g:pymode_lint_unmodified = 1

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
" " autocmd FileType python noremap <LocalLeader>a8 call s:Autopep8()

function! Pep8()
    " silent write!
    let l:winview = winsaveview()
    execute 'silent %!autopep8 %'
    silent edit!
    execute 'silent %!isort %'
    silent edit!
    " autocmd FileType python noremap <LocalLeader>a8 mz:%!autopep8 %<cr>`z:w<cr>
    " autocmd FileType python noremap <LocalLeader>a8 mz:%!isort %<cr>`z:w<cr>
    write!
    call winrestview(l:winview)
endfunction



" autocmd FileType python noremap <LocalLeader>8 :Neomake<cr>
" let g:neomake_python_enabled_makers = ['flake8', 'pep8', 'pylint', 'pyflakes']
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_python_checkers = ['']
" autocmd FileType python let b:dispatch = 'python %'
autocmd FileType python call SetupPython()

function! SetupPython()
    compiler nosetests
    set makeprg=nosetests
    " Don't select everything if the is a point(.) in it
    " eg. select.dontselect selects now select with gd or *
    set iskeyword-=.

endfunction
autocmd FileType qf call ParseNosetestsQuickFix()

let g:dispatch_compilers = {'nosetests': 'nosetests'}
let g:test#strategy = 'neovim'

function! ParseNosetestsQuickFix()
  " only will work for vim 7.4.718+ as an autocommand
  if !exists( 'w:quickfix_title' )
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
  let l:line = getline(v:foldstart)
  let l:linenum = v:foldstart + 1
  let l:found = 0
  while l:linenum < v:foldend
    if match( getline( l:linenum ), '^||.*' ) == 0
      if l:found == 1
        let l:line = getline( l:linenum )
        break
      endif
    else
      let l:found = 1
    endif
    let l:linenum = l:linenum + 1
  endwhile
  let l:n = v:foldend - v:foldstart + 1
  let l:info = ' ' . l:n . ' l:lines '
  return '+' . v:folddashes . l:info . l:line
endfunction


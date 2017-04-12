function! BranchName()
    silent! execute ":0read !hg branch"
    silent! execute ":1s/_.*/ /g"
    execute ":normal I#\<Esc>$"
endfunc

augroup ft_hgcommit
    autocmd!
    nnoremap <LocalLeader>b :call BranchName()<CR>
    setlocal spell
augroup END

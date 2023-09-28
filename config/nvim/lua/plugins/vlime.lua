-- Send paragraph
local option = vim.opt
local g = vim.g

g.vlime_cl_use_terminal = true
vim.keymap.set('n', "<LocalLeader>rr", ":call VlimeStart()<CR>")

vim.cmd([[
function! VlimeStart()
    call vlime#server#New(v:true, get(g:, "vlime_cl_use_terminal", v:false))
endfunction
]])

-- vim.cmd([[let g:vlime_window_settings = {
--              \ 'repl': {'vertical': v:true, 'pos': 'topright'},
--              \ 'server': {'vertical': v:true, 'pos': 'botright'}
--      \ }]])

vim.cmd([[let g:vlime_compiler_policy = {"DEBUG": 3}]])

vim.cmd([[let g:vlime_contribs = ['SWANK-ASDF', 'SWANK-PACKAGE-FU',
                      \ 'SWANK-PRESENTATIONS', 'SWANK-FANCY-INSPECTOR',
                      \ 'SWANK-C-P-C', 'SWANK-ARGLISTS', 'SWANK-REPL',
                      \ 'SWANK-FUZZY', 'SWANK-TRACE-DIALOG']
    ]])

g.vlime_enable_autodoc = 1

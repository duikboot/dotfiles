
vim.cmd( [[nnoremap <localleader>b Oimport ipdb; ipdb.set_trace()<esc>:w<CR>]] )

vim.cmd( [[setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 cindent]] )

vim.cmd([[setlocal path+=.venv/**]])
vim.cmd( [[setlocal colorcolumn=89]] )

vim.api.nvim_set_keymap('n', 'vu', ':lua require"treesitter-unit".select()<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', 'du', ':lua require"treesitter-unit".delete()<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', 'cu', ':lua require"treesitter-unit".change()<CR>', {noremap=true})

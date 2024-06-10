local vim = vim

-- nvim.keymap.set('n',<leader>xx <cmd>TroubleToggle document_diagnostics<cr>
-- Vim Script
vim.keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<cr>')
vim.keymap.set(
    'n',
    '<leader>xx',
    '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    {desc='document_diagnostics<cr>'})
-- vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
-- vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
vim.keymap.set('n', 'gR', '<cmd>Trouble lsp toggle<cr>')
-- jump to the next item, skipping the groups
-- vim.keymap.set("n", "<leader>xn", function() trouble.next(trouble_opts) end)


-- jump to the first item, skipping the groups
vim.keymap.set("n", "<leader>x0", "<cmd>lua require('trouble').first({skip_groups = true, jump = true})<cr>" )

-- jump to the previous item, skipping the groups

vim.keymap.set("n", "[d", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>" )
vim.keymap.set("n", "]d", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>" )
-- jump to the last item, skipping the groups
-- vim.keymap.set("n", "]d", "<cmd>lua require('trouble').last({skip_groups = true, jump = true})<cr>" )

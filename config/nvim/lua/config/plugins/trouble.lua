-- return {
--     "https://github.com/folke/trouble.nvim",
--     -- branch = "fix/decoration-provider-api",
--     config = function()
--         require("trouble").setup({
--             -- your configuration comes here
--         })
--     end,
--     -- nvim.keymap.set('n',<leader>xx <cmd>TroubleToggle document_diagnostics<cr>
--     -- Vim Script
--     vim.keymap.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<cr>'),
--     vim.keymap.set(
--         'n',
--         '<leader>xx',
--         '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
--         { desc = 'document_diagnostics<cr>' }),
--     -- vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>')
--     -- vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>')
--     vim.keymap.set('n', 'gR', '<cmd>Trouble lsp toggle<cr>'),
--     -- jump to the next item, skipping the groups
--     -- vim.keymap.set("n", "<leader>xn", function() trouble.next(trouble_opts) end)
--
--
--     -- jump to the first item, skipping the groups
--     vim.keymap.set("n", "<leader>x0", "<cmd>lua require('trouble').first({skip_groups = true, jump = true})<cr>"),
--
--     -- jump to the previous item, skipping the groups
--
--     vim.keymap.set("n", "[d", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true})<cr>"),
--     vim.keymap.set("n", "]d", "<cmd>lua require('trouble').next({skip_groups = true, jump = true})<cr>")
--     -- jump to the last item, skipping the groups
--     -- vim.keymap.set("n", "]d", "<cmd>lua require('trouble').last({skip_groups = true, jump = true})<cr>" )
-- }

return {
    "https://github.com/folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>xw",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        -- {
        --     "<leader>cs",
        --     "<cmd>Trouble symbols toggle focus=false<cr>",
        --     desc = "Symbols (Trouble)",
        -- },
        -- {
        --     "<leader>cl",
        --     "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        --     desc = "LSP Definitions / references / ... (Trouble)",
        -- },
        -- {
        --     "<leader>xl",
        --     "<cmd>Trouble loclist toggle<cr>",
        --     desc = "Location List (Trouble)",
        -- },
        -- {
        --     "<leader>xq",
        --     "<cmd>Trouble qflist toggle<cr>",
        --     desc = "Quickfix List (Trouble)",
        -- },
    },
}

return {
    {
        "http://github.com/supermaven-inc/supermaven-nvim",
        enabled = true,
        config = function()
            require("supermaven-nvim").setup({
                -- disable_inline_completion = true
            })
        end,
    },
    {
        "https://github.com/sourcegraph/sg.nvim",
        enabled = false,
        event = "InsertEnter",
        dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
        config = function()
            require("sg").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    },
    {
        "https://github.com/zbirenbaum/copilot.lua",
        enabled = true,
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = { enabled = false },
                panel = {
                    enabled = false,
                    -- auto_refresh = true,
                },
            })
        end,
    }
}

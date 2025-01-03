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
        enabled = true,
        event = "InsertEnter",
        dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
        config = function()
            require("sg").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    }
}

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
    },
    -- {
    --     'Exafunction/windsurf.vim',
    --     event = 'BufEnter'
    -- }
}

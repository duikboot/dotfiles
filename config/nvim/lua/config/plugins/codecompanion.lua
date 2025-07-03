return {
    "https://github.com/olimorris/codecompanion.nvim",
    enable = false,
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    -- config = function()
    --     require("codecompanion").setup({
    --         strategies = {
    --             chat = {
    --                 adapter = "ollama",
    --             },
    --         },
    --
    --         adapters = {
    --             ollama = function()
    --                 print("TEST")
    --                 return require("codecompanion.adapters").extend("openai_compatible", {
    --                     env = {
    --                         url = "http://localhost:11434",
    --                     },
    --                 })
    --             end,
    --         },
    --     })
    -- end,
}

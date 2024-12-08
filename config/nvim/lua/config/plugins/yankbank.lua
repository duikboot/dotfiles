return {
    "https://github.com/ptdewey/yankbank-nvim",
    dependencies = "kkharji/sqlite.lua",
    config = function()
        require('yankbank').setup({
            persist_type = "sqlite",
        })
    end,
    keys = {
        { "<leader>y", "<cmd>YankBank<CR>", desc = "Yank Bank" }
    }
}


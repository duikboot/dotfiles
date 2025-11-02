return {
    "https://github.com/retran/meow.yarn.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    enabled = true,
    config = function()
        require("meow.yarn").setup({
            -- Your custom configuration goes here
        })
    end,
}

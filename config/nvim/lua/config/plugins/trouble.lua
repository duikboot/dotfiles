return {
    "https://github.com/h-michael/trouble.nvim",
    branch = "fix/decoration-provider-api",
    config = function()
        require("trouble").setup({
            -- your configuration comes here
        })
    end,
}

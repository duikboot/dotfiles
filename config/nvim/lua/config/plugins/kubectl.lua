return {
    {
        "https://github.com/Ramilito/kubectl.nvim",
        enable = true,
        config = function()
            require("kubectl").setup()
        end,
        keys = {
            { "<leader>k", "<cmd>lua require('kubectl').toggle()<cr>", desc = "Open kubectl" },
        },
    },
}

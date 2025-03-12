return {
    {
        "https://github.com/Ramilito/kubectl.nvim",
        enable = false,
        config = function()
            require("kubectl").setup()
        end,
        keys = {
            { "<leader>k", "<cmd>lua require('kubectl').toggle()<cr>", desc = "Open kubectl" },
        },
    },
}

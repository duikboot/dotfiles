return {
    {
        "https://github.com/Ramilito/kubectl.nvim",
        enabled = true,
        dependencies = "saghen/blink.download",
        build = 'cargo build --release',
        version = '2.*',
        config = function()
            require("kubectl").setup()
        end,
        keys = {
            { "<leader>k", "<cmd>lua require('kubectl').toggle()<cr>", desc = "Open kubectl" },
        },
    },
}

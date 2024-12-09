return {
    {
        "https://github.com/ThePrimeagen/refactoring.nvim",
        keys = {
            {
                "<leader>rr",
                function() require('refactoring').select_refactor() end,
                mode = { "n", "x" },
            }
        }
    }
}

return
{
    {
        "https://github.com/leath-dub/snipe.nvim",
        enabled = true,
        keys = {
            { "gb", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" }
        },
        opts = {}
    },
    {
        "https://github.com/kungfusheep/snipe-lsp.nvim",
        enabled = false,
        event = "VeryLazy",
        dependencies = "leath-dub/snipe.nvim",
        opts = {},
        keys = {
            { "<leader>sl", "<cmd>SnipeLspSymbols<cr>", desc = "Lsp Symbols" },
        }
    },

    {
        "https://github.com/nicholasxjy/snipe-marks.nvim",
        enabled = false,
        dependencies = { "leath-dub/snipe.nvim" },
        keys = {
            { "<leader>ml", function() require("snipe-marks").open_marks_menu() end,      desc = "Find local marks" },
            { "<leader>ma", function() require("snipe-marks").open_marks_menu("all") end, desc = "Find all marks" },
        }
    }
}

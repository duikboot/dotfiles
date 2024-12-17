return {
    "aaronik/treewalker.nvim",
    enabled = true,
    opts = {
        highlight = true -- default is false
    },
    keys = {
        { "]]", "<cmd>Treewalker Down<CR>" },
        { "[[", "<cmd>Treewalker Up<CR>" },
        -- { "]h", "<cmd>Treewalker Left<CR>" },
        -- { "]l", "<cmd>Treewalker Right<CR>" },
    },
}

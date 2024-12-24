return {
    "aaronik/treewalker.nvim",
    enabled = true,
    opts = {
        highlight = true -- default is false
    },
    keys = {
        { "<localleader>[", "<cmd>Treewalker Up<CR>" },
        { "<localleader>]", "<cmd>Treewalker Down<CR>" },
        { "<localleader>;", "<cmd>Treewalker Left<CR>" },
        { "<localleader>'", "<cmd>Treewalker Right<CR>" },
    },
}

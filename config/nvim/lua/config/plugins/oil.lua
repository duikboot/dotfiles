return {
    'https://github.com/stevearc/oil.nvim',
    config = function()
        require('oil').setup(
            {
                columns = { "icon" },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<C-l>"] = false,
                    ["<C-k>"] = false,
                    ["<C-j>"] = false,
                },
            }
        )
    end,
    keys = {
        { '-',
            function()
                require("oil").open()
            end, { desc = "Open Oil" }
        }
    }
}

return {
    'https://github.com/stevearc/oil.nvim',
    config = function()
        require('oil').setup()
    end,
    keys = {
        { '-',
            function()
                require("oil").open()
            end, { desc = "Open Oil" }
        }
    }
}

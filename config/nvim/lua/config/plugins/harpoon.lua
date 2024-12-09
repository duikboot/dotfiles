return {
    "https://github.com/ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "https://github.com/samharju/yeet.nvim",
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
            yeet = {
                select = function(list_item, _, _)
                    require("yeet").execute(list_item.value)
                end,
            },
        })

            vim.keymap.set( "n", "<leader><BS>",
                function() harpoon.ui:toggle_quick_menu(harpoon:list("yeet")) end
            )
            vim.keymap.set( "n", "<localleader><localleader>",
                function()
                    require("yeet").execute(nil, {clear_before_yeet = false})
                end
            )


        -- other harpoon keymaps etc
        -- ...
    end,
}

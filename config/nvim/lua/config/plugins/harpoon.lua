local vim = vim

return {
    "https://github.com/ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "https://github.com/nvim-lua/plenary.nvim",
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

        vim.keymap.set(
            "n",
            "<leader>a",
            function() harpoon:list():add() end,
            { desc = "Add to harpoon" }
        )
        vim.keymap.set(
            "n",
            "<leader>h",
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Toggle harpoon menu" }
        )

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })
            end,
        })
        vim.keymap.set("n", "<leader><BS>",
            function()
                harpoon.ui:toggle_quick_menu(harpoon:list("yeet"))
            end
        )
        vim.keymap.set("n", "<localleader><localleader>",
            function()
                require("yeet").execute(nil, { clear_before_yeet = false })
            end
        )
        for i = 1, 9 do
            vim.keymap.set("n", "<leader>" .. i,
                function()
                    harpoon:list():select(i)
                end, { desc = "Got to harpoon: " .. i })
        end

        -- other harpoon keymaps etc
        -- ...
    end,
}

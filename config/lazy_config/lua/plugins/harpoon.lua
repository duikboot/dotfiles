local vim = vim

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("harpoon").setup({
    nav_first_in_list = true,
    global_settings = {
        enter_on_sendcmd = true,
    }
})

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

for i=1,9 do
    vim.keymap.set("n", "<leader>"..i , function() ui.nav_file(i) end, {desc="Got to harpoon: "..i})
end

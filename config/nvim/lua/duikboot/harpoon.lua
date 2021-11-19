
require("harpoon").setup({
    nav_first_in_list = true,
    global_settings = {
        enter_on_sendcmd = true,
    }
})

vim.cmd [[
    nnoremap <silent><leader>a :lua require("harpoon.mark").add_file()<cr>
    nnoremap <silent><c-e> :lua require("harpoon.ui").toggle_quick_menu()<cr>
    nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<cr>

    nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<cr>
    nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<cr>
    nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<cr>
    nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<cr>
    nnoremap <silent><leader>tu :lua require("harpoon.term").gotoTerminal(1)<cr>
    nnoremap <silent><leader>te :lua require("harpoon.term").gotoTerminal(2)<cr>
    nnoremap <silent><leader>cu :lua require("harpoon.term").sendCommand(1, 1)<cr>
    nnoremap <silent><leader>ce :lua require("harpoon.term").sendCommand(1, 2)<cr>
]]

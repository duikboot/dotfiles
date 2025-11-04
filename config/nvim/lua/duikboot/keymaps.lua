local vim = vim

-- vim.keymap.set(
--     'n',
--     '<leader>qf',
--     function ()
--         require('duikboot.utils').jumps_to_qf()
--     end,
--     { desc="Jump to [Q]uickfix" }
-- )

-- vim.keymap.set('n', 'yob',
--     function ()
--         if vim.o.background=="light" then
--             vim.o.background = "dark"
--             vim.cmd([[colorscheme tokyonight-storm]])
--         else
--             vim.o.background = "light"
--             vim.cmd([[colorscheme tokyonight]])
--         end
--     end,
--     { desc="Toggle background" }
-- )
--
vim.keymap.set('n', "<leader>q", ":q<cr>", {noremap = true, desc = "[Q]quit buffer"})
vim.keymap.set('n', "<leader>w", ":w<cr>", {noremap = true, desc = "[W]write buffer"})
vim.api.nvim_create_user_command('Q', ':quitall', {})
vim.api.nvim_create_user_command('Vs', ':vs', {})

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('v', 'k', 'gk')
vim.keymap.set('v', 'j', 'gj')

vim.keymap.set('n', 'gj', 'j')
vim.keymap.set('n', 'gk', 'k')
vim.keymap.set('v', 'gj', 'j')
vim.keymap.set('v', 'gk', 'k')

vim.keymap.set('i', '<C-u>', "<esc>mzgUiw`za", {desc = "Uppercase previous word"})

vim.keymap.set('n', "<C-u>", "mzgUiw`za", {desc = "Uppercase word"})

-- Rebuild Ctags (mnemonic RC -> CR -> <cr>)
vim.keymap.set('n', '<leader><cr>',
               ':silent !ctags -R --links=no --exclude=.buildozer --languages=-javascript --languages=-css >/dev/null 2>&1 &<cr>:redraw!<cr>')

-- open tag on the top of the screen
-- vim.keymap.set('n', <C-]> <C-]>zt

-- Toggle tag
-- vim.keymap.set('n', '<leader>t', '<Esc>:tag<Space>')
vim.keymap.set('n', '<leader>ts', '<Esc>:tselect<Space>')

-- Open in vertical split the tag under the cursur.
vim.keymap.set('n', '<Leader>T', ':vs<CR><c-]>zz')

vim.keymap.set('n', "<c-h>", ":TmuxNavigateLeft<cr>")
vim.keymap.set('n', "<c-j>", ":TmuxNavigateDown<cr>")
vim.keymap.set('n', "<c-k>", ":TmuxNavigateUp<cr>")
vim.keymap.set('n', "<c-l>", ":TmuxNavigateRight<cr>")

vim.keymap.set('n', '<leader>n', ":Telekasten<cr>", {desc = "Open [T]telekasten"})

vim.keymap.set('n', '<localleader>d',
               function() require'telescope.builtin'.diagnostics {} end,
               {desc = "[D]iagnostics"})
vim.keymap.set('n', '<leader>*', function()
    require('telescope.builtin').grep_string {search = vim.fn.expand("<cword>")}
end, {desc = "Search word"})

vim.keymap.set('x', '<leader>*', "<cmd> Telescope grep_string <cr>", {desc = "Search word"})

-- vim.keymap.set('n', '<leader>T', function()
--     require('telescope.builtin').tags {search = vim.fn.expand("<cword>")}
-- end, {desc = "Search word"})

-- vim.keymap.set('n','<leader>t', function()
--     require'telescope.builtin'.tags{only_sort_tags=true}
--     end)

vim.keymap.set('n', '<leader>t', ":Tags<CR>", {desc = "[T]tags"})

-- Remove trailing whitespace on <leader>S
vim.keymap.set('n', "<leader>S", "mz:%s/\\s\\+$//<cr>:let @/=''<CR>`z")

-- Delete buffer from buffelist and open previous buffer in split.
vim.keymap.set('n', '<leader>bq', ':bp <BAR> bd #<CR>')
-- Delete buffer from buffelist and close split
vim.keymap.set('n', '<leader>bd', ':bd<CR>')

-- let Y be more consistent
vim.keymap.set('n', 'Y', 'y$')
-- vim.keymap.set('n','n', 'nzzzv')
-- vim.keymap.set('n','N', 'Nzzzv')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- use ,gf to go to file in a vertical split
vim.keymap.set('n', '<leader>gf', ':vertical botright wincmd f<cr>')

vim.keymap.set('n', '<Leader>SS', ":source Session.vim<cr>")

-- open/close the quickfix window
vim.keymap.set('n', '<leader>c', ':copen<cr>')

-- open/close the location window

vim.keymap.set('n', '<leader>l', ':lopen<cr>')
vim.keymap.set('n', '<leader>cc', ':wincmd z<Bar>cclose<Bar>lclose<cr>')
vim.keymap.set('n', '<leader>ll', ':lclose<cr>')

vim.keymap.set('n', '<leader>e', ":edit<cr>")
vim.keymap.set('n', '<c-e>', ":Explore %:p:h<cr>")

vim.keymap.set('n', 'J', "mzJ`z")
vim.keymap.set('n', 'S', "i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w")

vim.keymap.set('n', "<localleader>j", ":%!python -m json.tool<cr>",
               {desc = "Format [J]son"})

vim.keymap.set('c', "<c-a>", "<home>")
vim.keymap.set('c', "<c-e>", "<end>")

vim.keymap.set('n', ",ts", 'mzvip:TREPLSendSelection<cr>`z')

-- Send (lisp)form
vim.keymap.set('n', ",tf", "mzva(:TREPLSendSelection<cr>`z")

-- Send (lisp)atom
vim.keymap.set('n', ",ta", "mzvaw:TREPLSendSelection<cr>`z")

-- Send selection
vim.keymap.set('v', ',tv', ":TREPLSendSelection<cr>")
vim.keymap.set('n', ",tl", ':TREPLSendLine<cr>')

-- hide/close terminal
vim.keymap.set('n', ',t', ":Tnew<cr>")
-- vim.keymap.set('n', ',tt', ":Ttoggle<cr>")
-- clear terminal
vim.keymap.set('n', ',tr', ':call neoterm#clear()<cr>')
-- kills the current job (send a <c-c>)
vim.keymap.set('n', ',tc', ':call neoterm#kill()<cr>')

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')

vim.api.nvim_create_user_command('G', ':vertical Git', {})

vim.keymap.set("n", "<leader>dw",
               function() require('diaglist').open_all_diagnostics() end,
               {desc = "[D]iagnostics quickfix [W]orkspace"})
vim.keymap.set("n", "<leader>df",
               function() require('diaglist').open_buffer_diagnostics() end,
               {desc = "[D]iagnostics locationlist [F]ile"})
vim.keymap.set('n', '<localleader>c', function()
    vim.cmd("call vlime#plugin#ConnectREPL('127.0.0.1', 4005)")
end)

for i=0,9 do
    vim.keymap.set('n', '<localleader>'.. i,
        function ()
            if i == 9 then
                i = 666
            end
            vim.wo.foldlevel = i
            print("foldlevel = " .. vim.wo.foldlevel)
        end,
        {desc = "Set foldlevel to " .. i}
    )
end


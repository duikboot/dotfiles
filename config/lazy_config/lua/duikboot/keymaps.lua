local vim = vim

vim.keymap.set('n', "<leader>q", ":q<cr>", { noremap = true })
vim.keymap.set('n', "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_create_user_command('Q', ':quitall', {})


-- Rebuild Ctags (mnemonic RC -> CR -> <cr>)
vim.keymap.set('n', '<leader><cr>', ':silent !ctags -R --links=no --exclude=.buildozer --languages=-javascript --languages=-css >/dev/null 2>&1 &<cr>:redraw!<cr>')

-- open tag on the top of the screen
-- vim.keymap.set('n', <C-]> <C-]>zt

-- Toggle tag
vim.keymap.set('n', '<leader>t', '<Esc>:tag<Space>')
vim.keymap.set('n', '<leader>ts', '<Esc>:tselect<Space>')

-- Open in vertical split the tag under the cursur.
vim.keymap.set('n',  '<Leader>T', ':vs<CR><c-]>zz')


vim.keymap.set('n', "<c-h>", ":TmuxNavigateLeft<cr>")
vim.keymap.set('n', "<c-j>", ":TmuxNavigateDown<cr>")
vim.keymap.set('n', "<c-k>", ":TmuxNavigateUp<cr>")
vim.keymap.set('n', "<c-l>", ":TmuxNavigateRight<cr>")

vim.keymap.set('n', 'cg', function() require('plugins.telescope').grep_prompt() end)
vim.keymap.set('n', '<Leader>o', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<Leader>fb', ":Telescope file_browser<CR>")
vim.keymap.set('n', 'gr', function() require 'telescope.builtin'.lsp_references() end)
vim.keymap.set('n', '<leader>gc', function() require 'telescope.builtin'.git_commits() end)
vim.keymap.set('n', '<leader>gs', function() require 'telescope.builtin'.git_status {} end)
vim.keymap.set('n', '<leader>lg', function() require 'telescope.builtin'.live_grep {} end)
vim.keymap.set('n', '<leader>bb', function() require 'telescope.builtin'.buffers {} end)
vim.keymap.set('n', '<localleader>d', function() require 'telescope.builtin'.diagnostics {} end)
--" vim.keymap.set('n',<leader>t      <cmd>lua require'telescope.builtin'.tags{only_sort_tags=true}<CR>
vim.keymap.set('n', '<leader>t', ":Tags<CR>")
vim.keymap.set('n', '<leader>*',
    function() require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") } end)
vim.keymap.set('n', '<localleader>f', function() require 'telescope.builtin'.current_buffer_fuzzy_find {} end)
vim.keymap.set('n', '<leader>fv', function() require 'duikboot.telescope'.find_virtual_env() end)
----let g:tmux_navigator_save_on_switch = 1

-- Delete buffer from buffelist and open previous buffer in split.
vim.keymap.set('n','<leader>bq', ':bp <BAR> bd #<CR>')
-- Delete buffer from buffelist and close split
vim.keymap.set('n','<leader>bd', ':bd<CR>')

-- let Y be more consistent
vim.keymap.set('n','Y', 'y$')
-- vim.keymap.set('n','n', 'nzzzv')
-- vim.keymap.set('n','N', 'Nzzzv')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- use ,gf to go to file in a vertical split
vim.keymap.set('n', '<leader>gf', ':vertical botright wincmd f<cr>')

vim.keymap.set('n', '<Leader>SS', ":source Session.vim<cr>")

-- open/close the quickfix window
vim.keymap.set('n', '<leader>c', ':copen<cr>')
vim.keymap.set('n', '<leader>cc', ':cclose<cr>')

-- open/close the location window

vim.keymap.set('n', '<leader>l', ':lopen<cr>')
vim.keymap.set('n', '<leader>cc', ':wincmd z<Bar>cclose<Bar>lclose<cr>')
vim.keymap.set('n', '<leader>ll', ':lclose<cr>')

vim.keymap.set('n', '<leader>e', ":edit<cr>")
vim.keymap.set('n', '<c-e>', ":Explore %:p:h<cr>")

vim.keymap.set('n', 'J', "mzJ`z")
vim.keymap.set('n', 'S', "i<cr><esc>^mwgk:silent! s/\\v +$//<cr>:noh<cr>`w")

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


vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>dw", function() require('diaglist').open_all_diagnostics() end)
vim.keymap.set("n", "<leader>dl", function() require('diaglist').open_buffer_diagnostics() end)

vim.keymap.set('n', '<localleader>c',
    function()
        vim.cmd("call vlime#plugin#ConnectREPL('127.0.0.1', 4005)")
    end
)

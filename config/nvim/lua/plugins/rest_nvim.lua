local map = vim.keymap

map.set("n", "<leader>RR", "<cmd>Rest run<cr>", { desc = "Send current line or selection to REST client." })
map.set("n", "<leader>Rl", "<cmd>Rest run last<cr>", { desc = "Repeat last request." })
map.set("n", "<leader>Rb", "<Plug>RestNvimBrowse", { desc = "Browse request history." })
map.set("n", "<leader>Re", ":RestSelectEnv ", { desc = "Select environment." })

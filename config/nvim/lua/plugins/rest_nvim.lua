local map = vim.keymap

map.set("n", "<leader>RR", "<Plug>RestNvim", { desc = "Send current line or selection to REST client." })
map.set("n", "<leader>Rp", "<Plug>RestNvimPreview", { desc = "Preview request." })
map.set("n", "<leader>Rl", "<Plug>RestNvimLast", { desc = "Repeat last request." })
map.set("n", "<leader>Rb", "<Plug>RestNvimBrowse", { desc = "Browse request history." })
map.set("n", "<leader>Re", ":RestSelectEnv ", { desc = "Select environment." })

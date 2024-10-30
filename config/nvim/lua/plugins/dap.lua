local vim = vim
require('dap-python').setup('~/.dotfiles/.venv/bin/python')
require("nvim-dap-virtual-text").setup()


local dap, dapui = require("dap"), require("dapui")
-- require('dap.ext.vscode').load_launchjs(".vscode/launch.json")
-- require('dap').set_log_level('TRACE')
dapui.setup({
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.50 },
        "breakpoints",
        "stacks",
        "repl",
      },
      size = 60, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "watches",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
})


dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end


vim.keymap.set("n", "<F5>", ":lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<F6>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<F7>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>")
-- vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")



local vim = vim
local utils = require("duikboot.utils")

_G.P = function(v)
    print(vim.inspect(v))
    return v
end

local modules = {
    "duikboot.startify",
    "duikboot.colors",
    "duikboot.cmp",
    "duikboot.trouble",
    "duikboot.lsp",
    -- 'duikboot.zero',
    "duikboot.treesitter",
    "duikboot.yanky",
    -- 'duikboot.neoclip',
    -- 'duikboot.saga',
    -- 'duikboot.refactoring',
    "duikboot.treesitter_unit",
    "duikboot.treesitter_context",
    -- 'duikboot.neogit',
    -- 'duikboot.neorg',
    "duikboot.gitsigns",
    -- 'duikboot.luasnip',
    "duikboot.vsnip",
    "duikboot.hop",
    -- 'duikboot.tokyonight',
    "duikboot.harpoon",
    "duikboot.telekasten",
    "duikboot.autopairs",
    "duikboot.null_ls",
    "duikboot.aerial",
    "duikboot.dap",
    "duikboot.hlslens",
    "duikboot.oil",
    "duikboot.comment",
    -- 'duikboot.sidebar'
    -- 'duikboot.buftabline',
    -- 'duikboot.orgmode'
    -- 'duikboot.efm'
}

for _, name in ipairs(modules) do
    package.loaded[name] = nil
    pcall(require, name)
end

-- Test code

local highlight_on_enter = function()
    local lineNum, _ = unpack(vim.api.nvim_win_get_cursor(0))
    -- local bufnr = vim.api.nvim_get_current_buf()
    local ns = vim.api.nvim_create_namespace("range-highlight")
    vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    vim.api.nvim_buf_add_highlight(0, ns, "IncSearch", lineNum - 1, 0, 220)
    vim.defer_fn(function()
        vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
    end, 150)
end

local highlightOnEnter = vim.api.nvim_create_augroup("HighlightOnEnter", { clear = true })
vim.api.nvim_create_autocmd({
    "BufEnter",
    "BufRead",
    "BufWinEnter",
}, {
    callback = highlight_on_enter,
    group = highlightOnEnter,
})

local buffers_no_numbers = { "neoterm", "terminal", "help" }

local set_relative_number = function()
    if not utils.has_value(buffers_no_numbers, vim.bo.filetype) then
        vim.cmd([[
        set cursorline cursorcolumn relativenumber
        ]])
    end
end

local RelNumber = vim.api.nvim_create_augroup("RelNumber", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter" }, {
    callback = set_relative_number,
    group = RelNumber,
})

local set_absolute_number = function()
    if not utils.has_value(buffers_no_numbers, vim.bo.filetype) then
        vim.cmd([[
        set nocursorline nocursorcolumn norelativenumber
        ]])
    end
end

local AbsNumber = vim.api.nvim_create_augroup("AbsNumber", { clear = true })

vim.api.nvim_create_autocmd({ "WinLeave" }, {
    callback = set_absolute_number,
    group = AbsNumber,
})

-- Test plugins and remaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

require("nvim-surround").setup()

require("neo-zoom").setup()
vim.keymap.set("n", "<localleader>z", function()
    vim.cmd("NeoZoomToggle")
end, { silent = true, nowait = true })

-- Populate loclist with the current buffer diagnostics
-- local DiagnosticCLocation = vim.api.nvim_create_augroup("DiagnosticCLocation", { clear = true })

-- vim.api.nvim_create_autocmd({"DiagnosticChanged"}, {
--   callback = function()
--     vim.diagnostic.setloclist({open = false})
--   end,
--   group = DiagnosticCLocation,
-- })
--

-- Populates qflist with diangostics
vim.api.nvim_create_augroup("diagnostics", { clear = true })
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = "diagnostics",
  callback = function()
    vim.diagnostic.setqflist({ open = false })
    end,
})


require('muren').setup()
require("flash").setup()

require('neogit').setup()

-- require("symbols-outline").setup()

-- require("lspsaga").setup()

-- reload fucks up lualine.

pcall(require, "duikboot.lualine")

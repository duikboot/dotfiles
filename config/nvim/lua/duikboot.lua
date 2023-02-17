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
    "duikboot.utils",
    -- 'duikboot.luasnip',
    "duikboot.vsnip",
    "duikboot.hop",
    -- 'duikboot.tokyonight',
    "duikboot.harpoon",
    "duikboot.telekasten",
    "duikboot.autopairs",
    "duikboot.null_ls",
    "duikboot.aerial",
    "duikboot.telescope",
    "duikboot.dap",
    "duikboot.hlslens",
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
    end, 200)
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

local noNumbers = { "neoterm", "terminal", "help" }

local set_relative_number = function()
    if not utils.has_value(noNumbers, vim.bo.filetype) then
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
    if not utils.has_value(noNumbers, vim.bo.filetype) then
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

-- Test plugins

require("neo-zoom").setup()
vim.keymap.set("n", "<localleader>z", function()
    vim.cmd("NeoZoomToggle")
end, { silent = true, nowait = true })

require("statusline-action-hints").setup()
-- vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]
-- vim.keymap.set("n", "<leader>o", require("portal").jump_backward, {})
-- vim.keymap.set("n", "<leader>i", require("portal").jump_forward, {})

-- reload fucks up lualine.

pcall(require, "duikboot.lualine")

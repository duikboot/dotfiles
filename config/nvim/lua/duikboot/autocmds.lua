local utils = require("duikboot.utils")


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

-- -- -- Populate loclist with the current buffer diagnostics
-- local DiagnosticCLocation = vim.api.nvim_create_augroup("DiagnosticCLocation", { clear = true })
--
-- vim.api.nvim_create_autocmd({
--     "BufEnter",
--     "TextChanged",
--     "BufWinEnter",
-- }, {
--     callback = function()
--         vim.diagnostic.setloclist({ open = false })
--     end,
--     group = DiagnosticCLocation,
-- })

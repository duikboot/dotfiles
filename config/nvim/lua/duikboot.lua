local modules = {
    "plugins.startify",
    "plugins.treesitter",
    "plugins.treesitter_context",
    "plugins.telescope",
    "plugins.cmp",
    "plugins.null_ls",
    "plugins.lsp",
    -- "plugins.lsp_saga",
    "plugins.gitsigns",
    "plugins.harpoon",
    -- "plugins.yeet",
    "plugins.vlime",
    "plugins.neoterm",
    "plugins.trouble",
    "plugins.rest_nvim",
    "plugins.hlslens",
    "plugins.telekasten",
    -- "plugins.neotree",
    "duikboot.keymaps",
    "duikboot.utils",
    "duikboot.autocmds",
}

for _, name in ipairs(modules) do
    package.loaded[name] = nil
    require(name)
end

pcall(require, "plugins.lualine")

-- Populate loclist with the current buffer diagnostics
-- local DiagnosticCLocation = vim.api.nvim_create_augroup("DiagnosticCLocation", { clear = true })
--
-- vim.api.nvim_create_autocmd({"DiagnosticChanged"}, {
--   callback = function()
--     vim.diagnostic.setloclist({open = false})
--   end,
--   group = DiagnosticCLocation,
-- })
--

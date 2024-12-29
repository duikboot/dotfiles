local modules = {
    "plugins.treesitter",
    "plugins.treesitter_context",
    "plugins.null_ls",
    "plugins.gitsigns",
    "plugins.vlime",
    "plugins.neoterm",
    "plugins.trouble",
    "plugins.hlslens",
    "plugins.telekasten",

    "plugins.dap",

    -- "plugins.neotree",
    "duikboot.keymaps",
    "duikboot.utils",
    "duikboot.autocmds",
}

for _, name in ipairs(modules) do
    package.loaded[name] = nil
    require(name)
end


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

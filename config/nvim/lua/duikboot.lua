local modules = {
    -- "plugins.treesitter",
    -- "plugins.treesitter_context",
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
--     print("Updating loclist with current buffer diagnostics")
--     vim.diagnostic.setloclist({open = false})
--   end,
--   group = DiagnosticCLocation,
-- })
--
--
-- namespace for the extmarks. It will make it easier to clean up later
local EASYMOTION_NS = vim.api.nvim_create_namespace('EASYMOTION_NS')
-- Characters to use as labels. Note how we only use the letters from lower
-- to upper case in ascending order of how easy to type them in qwerty layout
local EM_CHARS = vim.split('fjdkslgha;rueiwotyqpvbcnxmzFJDKSLGHARUEIWOTYQPVBCNXMZ', '')

local function easy_motion()
    print("Easy motion triggered")
    local char1 = vim.fn.nr2char(vim.fn.getchar())
    local char2 = vim.fn.nr2char(vim.fn.getchar())
    print("Characters entered: " .. char1 .. char2)
    -- implementation will go here
end

-- vim.keymap.set(
--     { 'n', 'x' }, -- trigger it in normal and visual modes
--     'S', -- trigger search on
--     easy_motion,
--     { desc = 'Jump to 2 characters' }
-- )

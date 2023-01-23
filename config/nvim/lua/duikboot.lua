local vim = vim
P = function(v)
    print(vim.inspect(v))
    return v
end

local modules = {
    'duikboot.startify',
    'duikboot.colors',
    'duikboot.cmp',
    'duikboot.lsp',
    -- 'duikboot.zero',
    'duikboot.treesitter',
    'duikboot.yanky',
    -- 'duikboot.neoclip',
    -- 'duikboot.saga',
    -- 'duikboot.refactoring',
    'duikboot.treesitter_unit',
    'duikboot.treesitter_context',
    -- 'duikboot.neogit',
    -- 'duikboot.neorg',
    'duikboot.gitsigns',
    'duikboot.utils',
    -- 'duikboot.luasnip',
    'duikboot.vsnip',
    'duikboot.hop',
    -- 'duikboot.tokyonight',
    'duikboot.harpoon',
    'duikboot.telekasten',
    'duikboot.autopairs',
    'duikboot.null_ls',
    'duikboot.aerial',
    'duikboot.telescope',
    'duikboot.dap',
    'duikboot.hlslens',
    -- 'duikboot.sidebar'
    -- 'duikboot.buftabline',
    -- 'duikboot.orgmode'
    -- 'duikboot.efm'
}

for _, name in ipairs(modules) do
    package.loaded[name] = nil
    pcall(require, name)
end

-- Test plugins

-- reload fucks up lualine.
pcall(require, 'duikboot.lualine')

vim.keymap.set("n", "<leader>o", require("portal").jump_backward, {})
vim.keymap.set("n", "<leader>i", require("portal").jump_forward, {})

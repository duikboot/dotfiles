local vim = vim
P = function(v)
    print(vim.inspect(v))
    return v
end

local modules = {
    'duikboot.startify',
    'duikboot.lsp',
    'duikboot.treesitter',
    'duikboot.yanky',
    -- 'duikboot.neoclip',
    -- 'duikboot.saga',
    -- 'duikboot.compe',
    'duikboot.cmp',
    -- 'duikboot.refactoring',
    'duikboot.treesitter_unit',
    'duikboot.neogit',
    -- 'duikboot.neorg',
    'duikboot.gitsigns',
    'duikboot.utils',
    'duikboot.luasnip',
    'duikboot.hop',
    -- 'duikboot.tokyonight',
    'duikboot.harpoon',
    'duikboot.telekasten',
    'duikboot.autopairs',
    'duikboot.null_ls',
    'duikboot.aerial',
    'duikboot.telescope',
    'duikboot.dap',
    -- 'duikboot.sidebar'
    -- 'duikboot.buftabline',
    -- 'duikboot.orgmode'
    -- 'duikboot.efm'
}

for _, name in ipairs(modules) do
    package.loaded[name] = nil
    pcall(require, name)
end

-- reload fucks up lualine.
pcall(require, 'duikboot.lualine')

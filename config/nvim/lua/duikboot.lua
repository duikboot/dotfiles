P = function(v)
    print(vim.inspect(v))
    return v
end

-- require('duikboot.saga')

local modules = {
    'duikboot.lsp',
    'duikboot.treesitter',
    'duikboot.telescope',
    'duikboot.neoclip',
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
    -- 'duikboot.biscuits',
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

Mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local M = {}

-- require('duikboot.saga')

local modules = {
    'duikboot.lsp',
    'duikboot.treesitter',
    'duikboot.telescope',
    'duikboot.saga',
    'duikboot.compe',
    'duikboot.refactoring',
    'duikboot.treesitter_unit',
    'duikboot.neogit',
    'duikboot.neorg',
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

return M

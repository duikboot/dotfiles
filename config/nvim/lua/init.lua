
-- require('duikboot.saga')
pcall(require, 'duikboot.lsp')
pcall(require, 'duikboot.treesitter')
-- require('duikboot.snippets')
pcall(require, 'duikboot.telescope')
-- pcall(require, 'duikboot.buftabline')
pcall(require, 'duikboot.lualine')
pcall(require, 'duikboot.saga')

Mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

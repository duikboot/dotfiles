local vim = vim

local function lsp_function ()
    local b = vim.b.lsp_current_function
    return b
end

local config = {
    sections = {
        lualine_c = {
      {'filename'},
      lsp_function,
    },}
}

require('lualine').setup(config)
-- require('lualine').setup(config)

local vim = vim

local current_treesitter_context = function()
  local f = require'nvim-treesitter'.statusline({
    indicator_size = 300,
    type_patterns = {"class", "function", "method"}
  })
  local fun_name = string.format("%s", f) -- convert to string, it may be a empty ts node
  if fun_name == "vim.NIL" then
    return " "
  end
  return " " .. fun_name
end

local function lsp_function ()
    local b = vim.b.lsp_current_function
    return b
end

local function branchname ()
    local branch = vim.fn.FugitiveHead()
    if branch and #branch > 0 then
        branch = ' '..branch
    end
    if branch:len() >= 30 then
        return branch:sub(1, 27) .. "..."
    end
    return branch
end

local config = {
    sections = {
        lualine_b = {
            branchname,
            -- lsp_function,
            -- current_treesitter_context,
        },
        lualine_c = {
            {'filename'},
            lsp_function,
            current_treesitter_context,
        },
    },
}
require('lualine').setup(config)

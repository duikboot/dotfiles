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

-- local config = {
--     sections = {
--         lualine_c = {
--             {'filename'},
--             -- lsp_function,
--             -- current_treesitter_context,
--         },
--     },
-- }

local config = {
    sections = {
        lualine_b = {
            {'branch'},
            lsp_function,
            current_treesitter_context,
        },
    },
}
require('lualine').setup(config)

-- local fn, cmd = vim.fn, vim.cmd

-- function My_statusline()
--   local branch = fn.FugitiveHead()

--   if branch and #branch > 0 then
--     branch = '   '..branch
--   end

--   return branch..'  %f%m%=%y %l:%c  %p%% '
-- end

-- cmd[[ set statusline=%!luaeval('My_statusline()') ]]

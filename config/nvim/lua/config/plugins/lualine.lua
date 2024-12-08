local vim = vim

-- local current_treesitter_context = function()
--   local f = require'nvim-treesitter'.statusline({
--     indicator_size = 300,
--     type_patterns = {"class", "function", "method"}
--   })
--   local fun_name = string.format("%s", f) -- convert to string, it may be a empty ts node
--   if fun_name == "vim.NIL" then
--     return " "
--   end
--   return " " .. fun_name
-- end
--
local function branchname()
    local branch = vim.fn.FugitiveHead()
    branch = branch:gsub("feature/EMO.", "")
    if branch and #branch > 0 then
        branch = ' ' .. branch
    end
    if branch:len() >= 50 then
        return branch:sub(1, 50) .. "..."
    end
    return branch
end
--
-- local config = {
--     sections = {
--         lualine_b = {
--             branchname,
--             -- current_treesitter_context,
--         },
--         lualine_c = {
--             {'filename'},
--             -- current_treesitter_context,
--         },
--     },
-- }

return {
    "https://github.com/hoob3rt/lualine.nvim",
    config = function()
        require('lualine').setup({
            sections = {
                lualine_b = { branchname, 'diff',
                    {
                        'diagnostics',
                        symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' }
                    }
                },
            }
        }
        )
    end,
}

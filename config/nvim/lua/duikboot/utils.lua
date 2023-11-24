local vim = vim
function _G.copy_module_path()
    local path = vim.fn.expand('%')
    local filetype = vim.fn.expand('%:e')

    path = string.gsub(path, "/", ".")
    path = string.gsub(path, string.format("%%.%s", filetype), "")

    vim.cmd('let @+="' .. path .. '""')
end

function _G.echo_filename()
    local path = vim.fn.expand('%')
    vim.api.nvim_echo({ { path, 'None' }, { '', 'None' } }, false, {})
end

vim.api.nvim_set_keymap(
    'n',
    'cpp',
    '<Cmd>lua copy_module_path()<CR>',
    { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
    'n',
    '<localleader>sf',
    '<Cmd>lua echo_filename()<CR>',
    { noremap = true, silent = true }
)
-- autocmd BufRead,BufNewFile *.md set ft=markdown
-- vim.cmd[[autocmd BufWinEnter * echo_filename()]]
local M = {}

function M.has_value(tab, val)
    for _, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end

-- M.jumps_to_qf = function()
--     local jumplist, _ = unpack(vim.fn.getjumplist())
--     local qf_list = {}
--     for _, v in pairs(jumplist) do
--         if vim.fn.bufloaded(v.bufnr) == 1 then
--             table.insert(qf_list, {
--                 bufnr = v.bufnr,
--                 lnum = v.lnum,
--                 col = v.col,
--                 text = vim.api.nvim_buf_get_lines(v.bufnr, v.lnum - 1, v.lnum, false)[1],
--             })
--         end
--     end
--     vim.fn.setqflist(qf_list, " ")
--     vim.cmd("copen")
-- end

return M

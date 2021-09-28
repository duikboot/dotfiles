function _G.copy_module_path ()
    local path = vim.fn.expand('%')
    local filetype = vim.fn.expand('%:e')

    path = string.gsub(path, "/", ".")
    path = string.gsub( path, string.format("%%.%s", filetype), "")

    vim.cmd('let @+="' .. path .. '""')
end

vim.api.nvim_set_keymap(
    'n',
    'cpp',
    '<Cmd>lua copy_module_path()<CR>',
    {noremap = true, silent = true}
)

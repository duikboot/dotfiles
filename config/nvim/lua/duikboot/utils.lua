function _G.copy_python_module ()
    local path = vim.fn.expand('%')
    local filetype = vim.fn.expand('%:e')

    path = string.gsub(path, "/", ".")
    path = string.gsub(
        path,
        string.format("%%.%s", filetype),
        ""
    )

    vim.cmd('let @+="' .. path .. '""')
end

vim.api.nvim_set_keymap(
    'n',
    'cpp',
    'v:lua.copy_python_module()',
    {expr = true, noremap = false, silent = true}
)

function _G.copy_python_module ()
    -- local path = vim.api.nvim_command("expand('%:p')")
    local path = vim.fn.expand('%')
    local filetype = vim.fn.expand('%:e')
    print(filetype)

    path = string.gsub(path, "/", ".")
    print(path)
    path = string.gsub(
        path,
        string.format("%%.%s", filetype),
        ""
    )
    print(path)

    vim.cmd('let @+="' .. path .. '""')
end
vim.api.nvim_set_keymap(
    'n',
    'cpp',
    'v:lua.copy_python_module()',
    {expr = true, noremap = false, silent = true}
)

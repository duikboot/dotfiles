require('neoclip').setup{
    enable_persistant_history = true,
    db_path = vim.fn.stdpath "data" .. "/neoclip.sqlite3",
    default_register = {'"', '+', '*'}
}


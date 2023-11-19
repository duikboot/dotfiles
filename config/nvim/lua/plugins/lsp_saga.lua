local lspsaga = require('lspsaga')

lspsaga.setup( {
    ui = {
        code_action = ' ',
        border_style = "round",
        max_preview_lines = 10,
        max_preview_width = 50,
        max_preview_height = 50,
        default_mappings = false,
        -- default_mappings = true,
        -- default_mapping = true,
        -- default_action_keys = {quit = {'q', '<esc>'}},
        -- default_action_keys = {quit = {'<esc>'}},
    },
    symbol_in_winbar = {
        enable = false
    }
})


require('gitsigns').setup {
    signs = {
        add = {
            hl = 'GitSignsAdd',
            text = '+',
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn',
        },
        delete = {
            hl = 'GitSignsDelete',
            text = '-',
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn',
        },
    },
    diff_opts = {internal = false},
}



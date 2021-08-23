require'compe'.setup{
    enabled = true,
    autocomplete = true,
    debug = true,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,

    source = {
        path = true,
        omni = false,
        treesitter = {
            priority = 1000
        },
        buffer = {
            priority = 200
        },
        calc = true,
        vsnip = false,
        nvim_lsp = {
            priority = 900
        },
        nvim_lua = {
            priority = 900
        },
        spell = {
            priority = 100
        },
        tags = false,
        snippets_nvim = true,
        neorg = true,
    }
}

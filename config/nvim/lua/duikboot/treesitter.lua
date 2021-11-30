local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/vhyrro/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",     -- one of "all", "language", or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
    },
    indent = {
        enable = true,
        disable = { "python" }
    },
    incremental_selection = {
        enable = true,
        -- keymaps = {
        --     init_selection = "<localleaderv>", -- maps in normal mode to init the node/scope selection
        --     node_incremental = "+", -- increment to the upper named parent
        --     node_decremental = "-", -- decrement to the previous node
        --     scope_incremental = "-", -- increment to the upper scope (as defined in locals.scm)
        -- },
    },
    textobjects = {
        move = {
            enable = true,
            set_jumps = true,
        },
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["<leader>pf"] = "@function.outer",
                ["<leader>pc"] = "@class.outer"
            }
        },

        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",
            --   ["af"] = "@function.outer",
            --   ["if"] = "@function.inner",

            --   ["ac"] = "@conditional.outer",
            --   ["ic"] = "@conditional.inner",

            --   ["aa"] = "@parameter.outer",
            --   ["ia"] = "@parameter.inner",

            }
        },
    },
    refactor = {
        highlight_definitions = {enable = true},
        highlight_current_scope = {enable = true},
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                -- goto_next_usage = "<a-*>",
                -- goto_previous_usage = "<a-#>",
            },
        },
        smart_rename = {
            enable = true,
            keymaps = {
                -- mapping to rename reference under cursor
                smart_rename = "grr",
            },
        },
    },
    -- context_commentstring = {
    --     enable = true
    -- },
}

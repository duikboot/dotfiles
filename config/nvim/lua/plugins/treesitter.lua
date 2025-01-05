require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "bash",
        "cmake",
        "comment",
        "commonlisp",
        "dockerfile",
        "http",
        "json",
        -- "latex",
        "lua",
        "make",
        "python",
        "rust",
        "vim",
        "vimdoc",
        "query"
    },

    auto_install = true,

    highlight = {
        enable = true, -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
    },
    matchup = {
        enable = true,
    },
    indent = {
        enable = true,
        disable = { "python" },
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

            goto_next_start = {
                ["]p"] = "@parameter.inner",
                ["]m"] = "@function.outer",
                ["]c"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[p"] = "@parameter.inner",
                ["[m"] = "@function.outer",
                ["[c"] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
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
            },
        },
    },
    refactor = {
        highlight_definitions = { enable = true },
        -- highlight_current_scope = { enable = true },
    },
    -- context_commentstring = {
    --     enable = true
    -- },
})


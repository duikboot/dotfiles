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

        select = {
            enable = true,
            lookahead = true,
            -- keymaps = {
            --   ["af"] = "@function.outer",
            --   ["if"] = "@function.inner",

            --   ["ac"] = "@conditional.outer",
            --   ["ic"] = "@conditional.inner",

            --   ["aa"] = "@parameter.outer",
            --   ["ia"] = "@parameter.inner",
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ai"] = "@conditional.outer",
                ["ii"] = "@conditional.inner",

            }
        },
    },
    -- textobjects = {
    --     enable = true,
    --     -- Automatically jump forward to textobj, similar to targets.vim
    --     lookahead = true,

    -- },
    refactor = {
        highlight_definitions = {enable = true},
        highlight_current_scope = {enable = false},
    },
    -- context_commentstring = {
    --     enable = true
    -- },
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main", -- New rewritten branch
        build = ":TSUpdate",
        lazy = false,
        opts = {
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
            },
            refactor = {
                highlight_definitions = { enable = true },
                -- highlight_current_scope = { enable = true },
            },
        },
        config = function()
            local ts = require("nvim-treesitter")
            local parsers = {
                "lua",
                "vim",
                "vimdoc",
                "bash",
                "markdown",
                "rust",
                "python",
            }

            for _, parser in ipairs(parsers) do
                pcall(ts.install, parser)
            end

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
    {
        'andymass/vim-matchup',
        init = function()
            -- modify your configuration vars here
            vim.g.matchup_treesitter_stopline = 500

            -- or call the setup function provided as a helper. It defines the
            -- configuration vars for you
            require('match-up').setup({
                treesitter = {
                    stopline = 500
                }
            })
        end,
        -- or use the `opts` mechanism built into `lazy.nvim`. It calls
        -- `require('match-up').setup` under the hood
        opts = {
            treesitter = {
                stopline = 500,
            }
        }
    },

    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    "https://github.com/nvim-treesitter/nvim-treesitter-locals",

    {
        "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        config = function()
            -- configuration
            require("nvim-treesitter-textobjects").setup {
                select = {
                    -- Automatically jump forward to textobj, similar to targets.vim
                    lookahead = true,
                    -- You can choose the select mode (default is charwise 'v')
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * method: eg 'v' or 'o'
                    -- and should return the mode ('v', 'V', or '<c-v>') or a table
                    -- mapping query_strings to modes.
                    selection_modes = {
                        ['@parameter.outer'] = 'v', -- charwise
                        ['@function.outer'] = 'V', -- linewise
                        -- ['@class.outer'] = '<c-v>', -- blockwise
                    },
                    -- If you set this to `true` (default is `false`) then any textobject is
                    -- extended to include preceding or succeeding whitespace. Succeeding
                    -- whitespace has priority in order to act similarly to eg the built-in
                    -- `ap`.
                    --
                    -- Can also be a function which gets passed a table with the keys
                    -- * query_string: eg '@function.inner'
                    -- * selection_mode: eg 'v'
                    -- and should return true of false
                    include_surrounding_whitespace = false,
                },
            }

            -- keymaps
            -- You can use the capture groups defined in `textobjects.scm`
            vim.keymap.set({ "x", "o" }, "am", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "im", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ac", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
            end)
            vim.keymap.set({ "x", "o" }, "ic", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
            end)
            -- You can also use captures from other query groups like `locals.scm`
            vim.keymap.set({ "x", "o" }, "as", function()
                require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
            end)
            -- put your config here
        end,
    },
    {
        'MeanderingProgrammer/treesitter-modules.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            fold = { enable = true },
            highlight = { enable = true },
            indent = { enable = true },
            incremental_selection = { enable = true },
        },
    }
}

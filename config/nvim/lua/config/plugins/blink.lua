-- vim.api.nvim_create_autocmd("CmdlineEnter", {
--   callback = function()
--     vim.api.nvim_set_keymap('c', '<CR>', '<CR>', { noremap = true, silent = true })
--   end,
-- })

return {
    {
        "https://github.com/Saghen/blink.compat",
        version = "*",
        lazy = true,
        opts = {}
    },
    {
        "https://github.com/mikavilpas/blink-ripgrep.nvim"
        -- "niuiic/blink-cmp-rg.nvim",
    },
    -- {
    --     "giuxtaposition/blink-cmp-copilot",
    -- },
    {
        "https://github.com/fang2hou/blink-copilot",
    },
    {
        enabled = true,
        'http://github.com/saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = 'http://github.com/rafamadriz/friendly-snippets',

        -- use a release tag to download pre-built binaries
        version = '*',
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = {
                preset = 'enter',
            },

            appearance = {
                -- Sets the fallback highlight groups to nvim-cmp's highlight groups
                -- Useful for when your theme doesn't support blink.cmp
                -- Will be removed in a future release
                -- use_nvim_cmp_as_default = true,
                -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = 'normal'
            },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            -- sources = {
            --     default = { 'lsp', 'path', 'snippets', 'buffer' },
            -- },

            sources = {
                default = {
                    -- "supermaven",
                    'copilot',
                    "vlime",
                    "lsp",
                    "cody",
                    "path",
                    "snippets",
                    "buffer",
                    "ripgrep",
                    -- "cmdline",
                },
                per_filetype = {
                    codecompanion = { "codecompanion" },
                },
                providers = {
                    lsp = {
                        name = "[LSP]",
                        score_offset = 90,
                        min_keyword_length = 2
                    },
                    path = {
                        name = "[PATH]",
                        fallbacks = { "lsp", "buffer" },
                        -- min_keyword_length = 2,
                        opts = {
                            show_hidden_files_by_default = true,
                        },
                    },
                    ripgrep = {
                        name = "[RG]",
                        module = "blink-ripgrep",
                        min_keyword_length = 2,
                        opts = {
                            context_size = 8,
                        },
                    },
                    snippets = {
                        name = "[SNIPPETS]",
                        -- min_keyword_length = 2,
                    },
                    vlime = {

                        name = "vlime",
                        module = "blink.compat.source",
                        score_offset = 70,
                    },
                    supermaven = {
                        name = 'supermaven',
                        module = 'blink.compat.source',
                        async = true,
                        opts = {}
                    },
                    cody = {
                        name = "cody",
                        module = "blink.compat.source",
                        enabled = true,
                        async = true,
                    },
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                    -- copilot = {
                    --     name = "copilot",
                    --     module = "blink-cmp-copilot",
                    --     score_offset = 100,
                    --     async = true,
                    -- },
                },
                -- cmdline = {},
            },
            cmdline = {
                sources = {},
                -- keymap = {
                --     preset = 'default',
                -- }
            },
            term = {
                sources = {},
                -- keymap = {
                --     preset = 'default',
                -- }
            },

            completion = {
                menu = {
                    draw = {
                        columns = {
                            { "label",      "label_description", gap = 1 },
                            { "kind_icon",  "kind" },
                            { "source_name" },
                        },
                    }
                },
                documentation = {
                    auto_show = true,
                },
            },

            signature = {
                enabled = true,
            },
        },
        opts_extend = { "sources.default" },
    },
}

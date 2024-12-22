return {
    {
        enabled = true,
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = 'rafamadriz/friendly-snippets',

        -- use a release tag to download pre-built binaries
        version = '*',
        opts = {
            -- 'default' for mappings similar to built-in completion
            -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
            -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
            -- See the full "keymap" documentation for information on defining your own keymap.
            keymap = { preset = 'default' },

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
                    "lsp",
                    "path",
                    "snippets",
                    "buffer",
                    "ripgrep",
                    -- "cmdline",
                },
                providers = {
                    ripgrep = {
                        name = "Ripgrep",
                        module = "blink-cmp-rg",
                    },
                },
                -- cmdline = {},
            },

        -- completion = {
        --         menu = {
        --             draw = {
        --             -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
        --             }
        --         }
        --     },

            signature = {
                enabled = true,
            },
        },
        opts_extend = { "sources.default" },
    },
    {
        "niuiic/blink-cmp-rg.nvim",
    }
}

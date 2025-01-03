return {
    {
        "https://github.com/hrsh7th/nvim-cmp",
        config = function()
            local cmp = require 'cmp'
            cmp.setup()
        end
    },

    {"https://github.com/hrsh7th/cmp-buffer"},
    {"https://github.com/hrsh7th/cmp-path"},

    {"https://github.com/hrsh7th/cmp-cmdline",
    config = function()
        local cmp = require 'cmp'
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end
    }
}

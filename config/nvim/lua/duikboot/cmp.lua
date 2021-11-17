local cmp = require'cmp'
local types = require'cmp.types'
local lspkind = require('lspkind')

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    -- mapping = {
    --     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    --     ['<C-f>'] = cmp.mapping.scroll_docs(4),
    --     ['<C-Space>'] = cmp.mapping.complete(),
    --     ['<C-e>'] = cmp.mapping.close(),
    --     ['<CR>'] = cmp.mapping.confirm({ select = true }),
    -- },
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<enter>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        -- ["<c-"] = cmp.mapping.complete()
    },
    sources = {
        { name = 'treesitter' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        -- For luasnip user.
        -- { name = 'look', keyword_length = 5}
    },
    -- preselect = types.cmp.PreselectMode.Item,
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            menu = {
                treesitter = "[TS]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                buffer = "[BUF]",
                path = "[PATH]",
                luasnip = "[snip]",
            }
        })
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})

-- Setup lspconfig.

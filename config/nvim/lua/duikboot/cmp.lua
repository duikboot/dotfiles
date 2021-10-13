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
        ["<c-y>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
    },
    sources = {
        { name = 'treesitter' },
        { name = 'nvim_lsp' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        -- For luasnip user.
        { name = 'luasnip' },
        -- { name = 'look', keyword_length = 5}
    },
    preselect = types.cmp.PreselectMode.None,
    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    }
})

-- Setup lspconfig.

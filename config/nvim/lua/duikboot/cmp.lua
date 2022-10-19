local cmp = require'cmp'
local types = require'cmp.types'
local lspkind = require('lspkind')

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

cmp.setup({
    snippet = {
        expand = function(args)
            -- For `luasnip` user.
            require('luasnip').lsp_expand(args.body)
            -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    window = {
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<enter>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item()
        -- ["<c-"] = cmp.mapping.complete()
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'treesitter' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        -- For luasnip user.
        -- { name = 'look', keyword_length = 5}
    }, {
      { name = 'buffer' },
    }),
    -- preselect = types.cmp.PreselectMode.Item,
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
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
    -- experimental = {
    --     -- native_menu = false,
    --     ghost_text = true,
    -- },
})

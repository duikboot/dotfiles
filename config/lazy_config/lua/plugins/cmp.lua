local vim = vim
local cmp = require'cmp'
-- local types = require'cmp.types'
local lspkind = require('lspkind')

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

cmp.setup({
    snippet = {
    --   -- REQUIRED - you must specify a snippet engine
      expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    --     -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    --     require('snippy').expand_snippet(args.body) -- For `snippy` users.
    --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
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
        { name = 'nvim_lsp_signature_help'},
        { name = 'vsnip' },
        { name = 'nvim_lua' },
        { name = 'buffer', keyword_length = 5 },
        { name = 'path' },
        { name = 'vlime'}
        -- For luasnip user.
        -- { name = 'look', keyword_length = 5}
    }, {
      { name = 'buffer' },
    }),

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
        { name = 'buffer' }
        }
    }),

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
                { name = 'cmdline' }
            })
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
                vlime = "[vlime]"
            }
        })
    },
    -- experimental = {
    --     -- native_menu = false,
    --     ghost_text = true,
    -- },
})

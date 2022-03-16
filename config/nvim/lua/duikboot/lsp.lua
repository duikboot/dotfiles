local vim = vim
-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()

local lspconfig = require'lspconfig'

vim.diagnostic.config {
  underline = false,
  virtual_text = {
    severity = nil,
    source = "if_many",
    format = nil,
  },
  signs = true,

  -- options for floating windows:
  float = {
    show_header = true,
  },

  -- general purpose
  severity_sort = true,
  update_in_insert = false,
}


local on_init = function()
    print("LSP Started")
end

local default_handler = vim.lsp.handlers["textDocument/definition"]
vim.lsp.handlers["textDocument/definition"] = function(_, method, result)
    if result ~= nil then
        default_handler(nil, method, result)
    else
        -- there's a literal "ctrl-]" after `normal!`, might be able to craft
        -- something with `execute "normal! \<C-]>"` instead for something more
        -- readable.
        vim.cmd("normal! ")
    end
end


local on_attach_vim_plus_keymaps = function(client)
    Mapper(
        'n',
        '<leader>dn',
        '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'
    )

    Mapper(
        'n',
        '<leader>dp',
        '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'
    )
    -- Mapper(
    --     'n',
    --     '<leader>sl',
    --     '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>'
    -- )
    Mapper('n', '<leader>dl', '<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>')
    Mapper('n', '<leader>td', '<cmd> lua vim.lsp.buf.type_definition()<CR>')
    Mapper('n', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    Mapper('v', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    Mapper('n', '<c-K>',      '<cmd> lua vim.lsp.buf.signature_help()<CR>')
    Mapper('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>')
    Mapper('n', '<leader>K',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    -- mapper('n', 'lh',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    -- mapper('n','gr',          '<cmd>lua vim.lsp.buf.references()<CR>')
    Mapper('n', 'g0',         '<cmd> lua vim.lsp.buf.document_symbol()<CR>')
    Mapper('n', 'gD',         '<cmd> lua vim.lsp.buf.implementation()<CR>')
    Mapper('n', 'gW',         '<cmd> lua vim.lsp.buf.workspace_symbol()<CR>')
    Mapper('n', '<leader>gd', '<cmd> lua vim.lsp.buf.declaration()<CR>')
    Mapper('n', '<c-]>',      '<cmd> lua vim.lsp.buf.definition()<CR>')
    Mapper('n', '<localleader>a8',      '<cmd> lua vim.lsp.buf.formatting()<CR>')
end

local signature = function(client, bufnr)
    require("lsp_signature").on_attach()
end

local attach = function(client, bufnr)
    on_attach_vim_plus_keymaps(client)
    signature(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
end



-- From the lspconfig repo

-- set the path to the sumneko installation; if you ereviously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = "/bin/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    on_attach = attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_init=on_init,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

lspconfig['pylsp'].setup{
    -- on_init=on_init,
    on_attach = attach,
    -- capabilities=lsp_status.capabilities
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true,
                },
            },
        },
    },
}

lspconfig['vimls'].setup{
    -- on_init=on_init,
    on_attach = attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    -- capabilities=lsp_status.capabilities
}

lspconfig['bashls'].setup{
    -- on_init=on_init,
    on_attach = attach,
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    -- capabilities=lsp_status.capabilities
}


require("trouble").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
    -- refer to the configuration section below
}

require'nvim-web-devicons'.setup()

-- require'lsp_signature'.on_attach()
-- lspconfig.pylsp.setup({
--      on_attach=on_attach_vim_plus_keymaps,
--      on_init=on_init,
--     plugins = {
--         pydocstyle = { enabled = true }}
-- })

-- lspconfig.jedi_language_server.setup( {
--         on_attach=on_attach_vim_plus_keymaps,
--         on_init=on_init
--     })
-- -- lspconfig.pyls.setup( {
-- --   on_attach=on_attach_vim_plus_keymaps ,
-- --   plugins = {
-- --       jedi_completion = { fuzzy = true },
-- --       pyls_black = { enabled = true },
-- --       yapf = { enabled = true },
-- --       pylint = { enabled = true },
-- --       pydocstyle = { enabled = true },
-- --       }})
-- lspconfig.vimls.setup( {
--     on_attach=on_attach_vim_plus_keymaps,
--     on_init=on_init
-- })
-- lspconfig.bashls.setup( {
--     on_attach=on_attach_vim_plus_keymaps,
--     on_init=on_init
-- })

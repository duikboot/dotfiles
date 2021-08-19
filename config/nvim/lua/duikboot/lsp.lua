local vim = vim
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require'lspconfig'

-- vim.lsp.set_log_level("info")


-- local on_attach_vim = function(client, bufnr)
--     require'completion'.on_attach(client, bufnr)
-- end

vim.b.lsp_diagnostics_enabled = true

local function disable()
  vim.b.lsp_diagnostics_enabled = false

  -- Clear existing diagnostics
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    vim.lsp.diagnostic.clear(vim.fn.bufnr(), client.id, nil, nil)
  end
end

local function enable()
  vim.b.lsp_diagnostics_enabled = true

  -- Cheat and reload the file to trigger a `publishDiagnostics` event.
  -- TODO: Find a way to actually reload the thing :(
  vim.cmd('edit')
end

function Toggle_diagnostics()
  if vim.b.lsp_diagnostics_enabled then
    disable()
  else
    enable()
  end
end


vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = false
  }
)

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
    lsp_status.on_attach(client)
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
    Mapper("n", "<leader>ta", '<cmd>lua Toggle_diagnostics()<cr>')
    Mapper('n', '<leader>dl', '<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>')
    Mapper('n', '<leader>td', '<cmd> lua vim.lsp.buf.type_definition()<CR>')
    Mapper('n', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    Mapper('v', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    Mapper('n', '<c-k>',      '<cmd> lua vim.lsp.buf.signature_help()<CR>')
    Mapper('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>')
    Mapper('n', '<leader>K',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    -- mapper('n', 'lh',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    -- mapper('n','gr',          '<cmd>lua vim.lsp.buf.references()<CR>')
    Mapper('n', 'g0',         '<cmd> lua vim.lsp.buf.document_symbol()<CR>')
    Mapper('n', 'gD',         '<cmd> lua vim.lsp.buf.implementation()<CR>')
    Mapper('n', 'gW',         '<cmd> lua vim.lsp.buf.workspace_symbol()<CR>')
    Mapper('n', '<leader>gd', '<cmd> lua vim.lsp.buf.declaration()<CR>')
    Mapper('n', '<c-]>',      '<cmd> lua vim.lsp.buf.definition()<CR>')
    print('Lsp attached.')
end

-- From the lspconfig repo

-- set the path to the sumneko installation; if you ereviously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = "/bin/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  on_attach=on_attach_vim_plus_keymaps ,
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

local local_lsps = {
    'pylsp',
    -- 'pyright',
    -- 'jedi_language_server',
    'vimls',
    'bashls'
}

for _, lsp in ipairs(local_lsps) do
    lspconfig[lsp].setup{
        -- on_init=on_init,
        on_attach=on_attach_vim_plus_keymaps,
        capabilities=lsp_status.capabilities
    }
end

require("trouble").setup {
-- your configuration comes here
-- or leave it empty to use the default settings
-- refer to the configuration section below
}

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

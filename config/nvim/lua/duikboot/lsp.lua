local vim = vim
local lspconfig = require'lspconfig'

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end


-- local on_attach_vim = function(client, bufnr)
--     require'completion'.on_attach(client, bufnr)
-- end
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

function Toggle()
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



local on_attach_vim_plus_keymaps = function()
    -- on_attach_vim(client)
    mapper(
        'n',
        '<leader>dn',
        '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>'
        )

    mapper(
        'n',
        '<leader>dp',
        '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>'
        )
    mapper("n", "<leader>at", '<cmd>lua Toggle()<cr>')
    mapper('n', '<leader>dl', '<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>')
    mapper('n', '<leader>td', '<cmd> lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    mapper('v', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    mapper('n', '<c-k>',      '<cmd> lua vim.lsp.buf.signature_help()<CR>')
    mapper('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>')
    mapper('n', '<leader>K',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    -- mapper('n', 'lh',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    mapper('n','gr',          '<cmd>lua vim.lsp.buf.references()<CR>')
    mapper('n', 'g0',         '<cmd> lua vim.lsp.buf.document_symbol()<CR>')
    mapper('n', 'gD',         '<cmd> lua vim.lsp.buf.implementation()<CR>')
    mapper('n', 'gW',         '<cmd> lua vim.lsp.buf.workspace_symbol()<CR>')
    mapper('n', '<leader>gd', '<cmd> lua vim.lsp.buf.declaration()<CR>')
    mapper('n', '<c-]>',      '<cmd> lua vim.lsp.buf.definition()<CR>')
end

-- From the lspconfig repo

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end
-- set the path to the sumneko installation; if you ereviously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"
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

local local_lsps = {'pyls', 'vimls', 'bashls'}

for _, lsp in ipairs(local_lsps) do
    lspconfig[lsp].setup{
        on_attach=on_attach_vim_plus_keymaps,
        on_init=on_init
    }
end

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

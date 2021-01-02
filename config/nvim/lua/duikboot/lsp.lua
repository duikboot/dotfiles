local vim = vim
local lspconfig = require'lspconfig'

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end


local on_attach_vim = function(client, bufnr)
    require'completion'.on_attach(client, bufnr)
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = false
  }
)


local on_attach_vim_plus_keymaps = function(client)
    on_attach_vim(client)
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
    mapper('n', '<leader>dl', '<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>')
    mapper('n', '1gD',        '<cmd> lua vim.lsp.buf.type_definition()<CR>')
    mapper('n', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    mapper('v', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>')
    mapper('n', '<c-k>',      '<cmd> lua vim.lsp.buf.signature_help()<CR>')
    mapper('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>')
    mapper('n', '<leader>K',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    -- mapper('n', 'lh',          '<cmd> lua vim.lsp.buf.hover()<CR>')
    mapper('n', 'g0',         '<cmd> lua vim.lsp.buf.document_symbol()<CR>')
    mapper('n', 'gD',         '<cmd> lua vim.lsp.buf.implementation()<CR>')
    mapper('n', 'gW',         '<cmd> lua vim.lsp.buf.workspace_symbol()<CR>')
    mapper('n', '<leader>gd', '<cmd> lua vim.lsp.buf.declaration()<CR>')
    mapper('n', '<c-]>',      '<cmd> lua vim.lsp.buf.definition()<CR>')
end

lspconfig.jedi_language_server.setup( {on_attach=on_attach_vim_plus_keymaps })
lspconfig.sumneko_lua.setup(
    { on_attach=on_attach_vim_plus_keymaps },
    {settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim'}}}}})
lspconfig.vimls.setup( { on_attach=on_attach_vim_plus_keymaps })
local vim = vim
-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()

local lspconfig = require 'lspconfig'

require("mason").setup()

local opts = { noremap = true, silent = true }

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
    -- print("LSP Started")
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


local on_attach_vim_plus_keymaps = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>dl', '<cmd> lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>td', '<cmd> lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd> lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-K>', '<cmd> lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>K', '<cmd> lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'g0', '<cmd> lua vim.lsp.buf.document_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd> lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gW', '<cmd> lua vim.lsp.buf.workspace_symbol()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>gd', '<cmd> lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<c-]>', '<cmd> lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>a8', '<cmd> lua vim.lsp.buf.formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'v', '<localleader>a8', '<cmd> lua vim.lsp.buf.range_formatting()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>a8', '<cmd> lua vim.lsp.buf.format { async = true }<CR>', opts)
end

local signature = function()
    require("lsp_signature").on_attach()
end

local attach = function(client, bufnr)
    on_attach_vim_plus_keymaps(client, bufnr)
    -- signature()
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
end


function PrintDiagnostics(opts, bufnr, line_nr, client_id)
    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
    opts = opts or { ['lnum'] = line_nr }

    local line_diagnostics = vim.diagnostic.get(bufnr, opts)
    if vim.tbl_isempty(line_diagnostics) then return end

    local diagnostic_message = ""
    for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
        print(diagnostic_message)
        if i ~= #line_diagnostics then
            diagnostic_message = diagnostic_message .. ' '
        end
    end
    vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]
-- From the lspconfig repo

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig['lua_ls'].setup {
    settings = {
        Lua = {
            diagnostics = {
                 globals = { 'vim' }
            }
        }
    }
}

lspconfig['pylsp'].setup {
    -- on_init=on_init,
    on_attach = attach,
    -- capabilities=lsp_status.capabilities
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = { include_params = true, },
                pylsp_mypy = { enabled = true, },
                pylsp_flake8 = { enabled = true }
            },
        },
    },
}

lspconfig['vimls'].setup {
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
}


lspconfig['gopls'].setup {
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
}


lspconfig['tsserver'].setup {
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
}


lspconfig['bashls'].setup {
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
}

require("trouble").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

require 'nvim-web-devicons'.setup()

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

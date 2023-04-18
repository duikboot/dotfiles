local vim = vim

local M = {}
-- local lsp_status = require('lsp-status')
-- lsp_status.register_progress()

local lspconfig = require("lspconfig")

require("mason").setup()
local navbuddy = require("nvim-navbuddy")

local opts = { noremap = true, silent = true }

vim.diagnostic.config({
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
})

-- local on_init = function()
--     -- print("LSP Started")
-- end

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
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts)
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "<c-K>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, opts)

    if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "<Localleader>a8", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            print("Formatted...")
        end, { buffer = bufnr, desc = "[lsp] format" })
    end

    if client.supports_method("textDocument/rangeFormatting") then
        vim.keymap.set("x", "<Localleader>a8", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            print("Formatted...")
        end, { buffer = bufnr, desc = "[lsp] format" })
    end
end

local attach = function(client, bufnr)
    on_attach_vim_plus_keymaps(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    navbuddy.attach(client, bufnr)
end

function _G.PrintDiagnostics(options, bufnr, line_nr)
    bufnr = bufnr or 0
    line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
    options = options or { ["lnum"] = line_nr }

    local line_diagnostics = vim.diagnostic.get(bufnr, options)
    if vim.tbl_isempty(line_diagnostics) then
        return
    end

    local diagnostic_message = ""
    for i, diagnostic in ipairs(line_diagnostics) do
        diagnostic_message = diagnostic_message .. string.format(
            "%d: %s", i, diagnostic.message or ""
        )
        print(diagnostic_message)
        if i ~= #line_diagnostics then
            diagnostic_message = diagnostic_message .. " "
        end
    end
    vim.api.nvim_echo({ { diagnostic_message, "Normal" } }, false, {})
end

-- From the lspconfig repo

local capabilities = vim.lsp.protocol.make_client_capabilities()

lspconfig["lua_ls"].setup({
    on_attach = attach,
    -- capabilities=lsp_status.capabilities
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

lspconfig["pylsp"].setup({
    -- on_init=on_init,
    on_attach = attach,
    -- capabilities=lsp_status.capabilities
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = { include_params = true },
                pylsp_mypy = { enabled = true },
                pylsp_flake8 = { enabled = true },
            },
        },
    },
})

lspconfig["vimls"].setup({
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
})

lspconfig["erlangls"].setup({
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
})

lspconfig["gopls"].setup({
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
})

lspconfig["tsserver"].setup({
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
})

lspconfig["bashls"].setup({
    -- on_init=on_init,
    on_attach = attach,
    capabilities = capabilities,
    -- capabilities=lsp_status.capabilities
})

require("trouble").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
})

require("nvim-web-devicons").setup()

return M
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

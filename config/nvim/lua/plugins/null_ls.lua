local ok, null_ls = pcall(require, "null-ls")

if not ok then return end

-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/code_actions
local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/completion
-- local completion = null_ls.builtins.completion
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/hover
local hover = null_ls.builtins.hover

null_ls.setup({
    debug = true,
    sources = {
        -- Code Actions
        -- code_actions.eslint,
        -- code_actions.gitsigs,
        code_actions.refactoring,
        code_actions.shellcheck,
        -- Completion
        -- completion.luasnip,
        -- completion.spell,
        -- completion.tags,
        -- Diagnostics
        -- diagnostics.flake8,
        -- diagnostics.pylint,
        -- diagnostics.mypy,
        diagnostics.codespell,
        diagnostics.gitlint,
        diagnostics.hadolint,
        diagnostics.jsonlint,
        -- diagnostics.luacheck,
        -- diagnostics.shellcheck,
        -- diagnostics.vint,
        diagnostics.write_good,
        diagnostics.yamllint,
        -- diagnostics.editorconfig_checker,
        -- diagnostics.eslint,
        -- Formatting
        -- formatting.autopep8,
        formatting.isort,
        formatting.trim_whitespace,
        formatting.black,
        formatting.gofumpt,
        formatting.goimports,
        formatting.yamlfmt,
        -- formatting.clang_format,
        -- formatting.eslint,
        -- formatting.yapf,
        formatting.lua_format,
        -- Hover
        hover.dictionary
    },
    -- you can reuse a shared lspconfig on_attach callback here
    -- on_attach = function(client, bufnr)
    --     if (client.supports_method("textDocument/formatting")
    --             and vim.bo.filetype == 'python') then
    --         vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
    --                 -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
    --                 vim.lsp.buf.format()
    --                 print("Formatted file...")
    --             end
    --         })
    --     end
    -- end
})

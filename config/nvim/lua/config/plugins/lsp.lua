-- LSP servers and clients communicate which features they support through "capabilities".
--  By default, Neovim supports a subset of the LSP specification.
--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
--
-- This can vary by config, but in general for nvim-lspconfig:

local options = { noremap = true, silent = true, buffer = 0 }

require("mason").setup()

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

require("nvim-web-devicons").setup()
local capabilities = vim.lsp.protocol.make_client_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf
        -- on_attach_vim_plus_keymaps(client, bufnr)
        vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, options)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, options)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, options)
        vim.keymap.set("n", "<leader>td", vim.lsp.buf.type_definition, options)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, options)
        vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, options)

        -- TODO: implement incoming and outgoing calls.
        vim.keymap.set("n", "<leader>oc", vim.lsp.buf.outgoing_calls, options)
        vim.keymap.set("n", "<leader>ic", vim.lsp.buf.incoming_calls, options)

        vim.keymap.set("n", "<c-K>", vim.lsp.buf.signature_help, options)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, options)
        vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, options)
        vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, options)
        vim.keymap.set("n", "gD", vim.lsp.buf.implementation, options)
        vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, options)
        vim.keymap.set("n", "<leader>gd", vim.lsp.buf.declaration, options)
        vim.keymap.set("n", "<c-]>", vim.lsp.buf.definition, options)
        vim.keymap.set("n", '<leader>th',
            function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
            end, { desc = "Toggle inlay hints" })
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false

        if client.name == "pylsp" or client.name == "ruff" then
            client.server_capabilities.renameProvider = false
            client.server_capabilities.referencesProvider = false
            client.server_capabilities.definitionProvider = false
        end
    end,
})


return {
    {
        'https://github.com/hedyhli/outline.nvim',
        config = function()
            require("outline").setup({
                symbols = {
                    filter = {
                        python = { "Function", "Class", "Method", "Property" },
                    }
                },
                providers = {
                    lsp = {
                        blacklist_clients = { "pylsp" },
                    }
                },
            })
        end,
        keys = {
            { "<localleader>a", "<cmd>belowright Outline<cr>", desc = "Toggle outline" }
        }
    },
    {
        'https://github.com/neovim/nvim-lspconfig',
        dependencies = { 'saghen/blink.cmp' },

        vim.lsp.config('basedpyright', {
            settings = {                           -- see https://docs.basedpyright.com/latest/configuration/language-server-settings/
                basedpyright = {
                    disableOrganizeImports = true, -- use ruff instead of it
                    analysis = {
                        typeCheckingMode = "basic",
                        autoImportCompletions = true,
                        autoSearchPaths = true, -- auto serach command paths like 'src'
                        diagnosticMode = 'openFilesOnly',
                        useLibraryCodeForTypes = true,
                        diagnosticSeverityOvides = {
                            reportAttributeAccessIssue = "warning",
                            reportUnusedImport = "error",
                            reportUnusedFunction = "error",
                            reportUnusedVariable = "information",
                            reportGeneralTypeIssues = "none",
                            reportOptionalMemberAccess = false,
                            reportPrivateImportUsage = false,
                            reportOptionalSubscript = "none",
                            reportIndexIssue = "information",
                            reportAny = false,
                            reportMissingTypeStubs = "none",
                        },
                    }
                },
            },
        }),

        vim.lsp.config('pylsp', {
            settings = {
                pylsp = {
                    plugins = {
                        jedi_completion = { include_params = true },
                        flake8 = {
                            enabled = true,
                            maxLineLength = 90
                        },
                        mccabe = {
                            enabled = true,
                            threshold = 10,
                        },
                        pycodestyle = { enabled = false },
                    },
                },
            },
        }),

        vim.lsp.config('lua_ls', {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    hint = { enable = true },
                    workspace = {
                        checkThirdParty = false
                    },
                },
            },
        }),

        opts = {
            servers = {
                lua_ls = {
                    capabilities = capabilities,
                },
                vimls = {
                    capabilities = capabilities,
                },
                docker_compose_language_service = {
                    capabilities = capabilities,
                },
                bashls = {
                    capabilities = capabilities,
                },
                rust_analyzer = {
                    capabilities = capabilities,
                    settings = {
                        check = {
                            command = "clippy",
                        },
                        diagnostics = {
                            enable = true,
                        }
                    },
                },
                pylsp = {
                    capabilities = capabilities,
                },
                basedpyright = {
                    capabilities = capabilities,
                }
            }
        },
        config = function(_, ls_servers)
            for server, config in pairs(ls_servers.servers) do
                vim.lsp.enable(server)
            end
        end
    }
}

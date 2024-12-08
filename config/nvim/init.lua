local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\"

vim.cmd([[cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%']])

require("duikboot.options")

local lua_init_file = vim.fn.stdpath("config") .. "/lua/duikboot.lua"

if vim.loop.fs_stat(lua_init_file) then
    vim.keymap.set('n', '<leader>V', function()
        package.loaded.duikboot = nil
        print("Reloading " .. lua_init_file .. "...")
        vim.cmd(":luafile " .. lua_init_file)
    end)
end


require("lazy").setup({
    {"https://github.com/folke/tokyonight.nvim",
        lazy = false,        -- make sure we load this during startup if it is your main colorscheme
        priority = 1000,     -- make sure to load this before all the other start plugins
        -- transparent = true,
        config = function()
        --     -- load the colorscheme here
            vim.cmd([[set background=light]])
            vim.cmd([[colorscheme tokyonight]])
        end
    },
    -- {
    --     "yorik1984/newpaper.nvim",
    --     priority = 1000,
    --     config = true},
    -- -- {'https://github.com/xiyaowong/transparent.nvim',
    -- --     lazy = false,
    -- -- },
    {
        "https://github.com/rebelot/kanagawa.nvim",
        config = function()
            -- Set opacity in alacritty.toml
            -- Run picom
            -- load the colorscheme here
            -- vim.o.background = ""
            -- vim.cmd([[colorscheme kanagawa]])
        end
    },
    "https://github.com/savq/melange-nvim",
    -- { 'https://github.com/folke/which-key.nvim', opts = {} },

    { "https://github.com/hoob3rt/lualine.nvim" },
    "https://github.com/mhinz/vim-startify",
    { "https://github.com/kyazdani42/nvim-web-devicons", lazy = true },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    { "https://github.com/nvim-treesitter/playground",   event = "VeryLazy" },
    "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    -- "https://github.com/theHamsta/nvim-treesitter-commonlisp",
    "https://github.com/nvim-treesitter/nvim-treesitter-refactor",
    "https://github.com/andymass/vim-matchup",
    {
        'https://github.com/Wansmer/treesj',
        keys = { '<space>m', '<space>j', '<space>s' },
        config = function()
            require('treesj').setup({ --[[ your config ]] })
        end
    },

     -- CMP
    -- "https://github.com/hrsh7th/nvim-cmp",
    {
      "iguanacucumber/magazine.nvim",
      name = "nvim-cmp", -- Otherwise highlighting gets messed up
    },
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-nvim-lua",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/cmp-vsnip",
    "https://github.com/hrsh7th/vim-vsnip",
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/octaltree/cmp-look",
    "https://github.com/ray-x/cmp-treesitter",
    -- Use your favorite package manager to install, for example in lazy.nvim
    --  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.
    {
        "https://github.com/sourcegraph/sg.nvim",
        event = "InsertEnter",
        dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
    },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({})
        end,
    },

    -- Vcs
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/sindrets/diffview.nvim",
    "https://github.com/polarmutex/git-worktree.nvim",
    {
        'https://github.com/fredeeb/tardis.nvim',
        dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
        config = true,
    },

    -- Search
    {
        "https://github.com/ThePrimeagen/harpoon",
        branch = "harpoon2"},
    {
        "https://github.com/romainl/vim-cool",
        config = function()
            vim.g.CoolTotalMatches = 0
        end
    },

    -- LSP
    {
        "https://github.com/williamboman/mason.nvim",
    },
    "https://github.com/williamboman/mason-lspconfig.nvim",
    -- {
    --     "jay-babu/mason-null-ls.nvim",
    --     event = { "BufReadPre", "BufNewFile" },
    --     config = function()
    --       require("plugins.null_ls") -- require your null-ls config here (example below)
    --     end,
    -- },
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/onsails/lspkind-nvim",
    "https://github.com/folke/lsp-trouble.nvim",
    "https://github.com/folke/lsp-colors.nvim",
    -- "https://github.com/jose-elias-alvarez/null-ls.nvim",
    "https://github.com/nvimtools/none-ls.nvim",
    "https://github.com/theprimeagen/refactoring.nvim",
    -- "https://github.com/nvimdev/lspsaga.nvim",
    -- 'https://github.com/stevanmilic/nvim-lspimport',
    -- {"https://github.com/VidocqH/lsp-lens.nvim",
    --     config = function()
    --         require("lsp-lens").setup()
    --     end
    -- },
    {
      "https://github.com/zeioth/garbage-day.nvim",
      event = "VeryLazy",
      opts = {
        -- your options here
      }
    },
    {
        'https://github.com/onsails/diaglist.nvim',
        config = function()
            require("diaglist").init()
        end,
        lazy = true
    },
    "https://github.com/jose-elias-alvarez/null-ls.nvim",

    -- Navigation

    -- {
    --     "folke/flash.nvim",
    --     event = "VeryLazy",
    --     -- @type Flash.Config
    --     opts = {},
    --     -- stylua: ignore
    --     keys = {
    --         { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    --         { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    --         { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    --         { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --         { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    --     },
    -- },
    "https://github.com/pechorin/any-jump.vim",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/camgraff/telescope-tmux.nvim",

    -- Editing
    {
        'https://github.com/piersolenski/telescope-import.nvim',
        config = function()
            require("telescope").load_extension("import")
        end
    },
    -- {
    --     "https://github.com/zbirenbaum/copilot.lua",
    --     enabled = true,
    --     cmd = "Copilot",
    --     event = "InsertEnter",
    --     config = function()
    --         require("copilot").setup({
    --             suggestion = { enabled = true },
    --             panel = { enabled = false },
    --         })
    --     end,
    --     opts = { suggestion = { enabled = false }, panel = { enabled = false } }
    -- },
    {
        "https://github.com/kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },
    -- { 'https://codeberg.org/esensar/nvim-dev-container',
    --     config = function()
    --         require('devcontainer').setup({})
    --     end
    -- },
    "https://github.com/tpope/vim-unimpaired",
    'https://github.com/Olical/vim-enmasse',
    'https://github.com/kevinhwang91/nvim-hlslens',
    'https://github.com/machakann/vim-swap',
    {
        'https://github.com/windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            require('nvim-autopairs').setup({
                disable_filetype = { "TelescopePrompt" }
            })
        end
    },
    {
        'https://github.com/stevearc/oil.nvim',
        config = function()
            require('oil').setup()
        end
    },
    "https://github.com/romainl/vim-qf",

    -- FZF
    { "https://github.com/junegunn/fzf", build = "./install --all" },
    "https://github.com/junegunn/fzf.vim",
    "https://github.com/nvim-lua/popup.nvim",
    -- use 'https://github.com/cbochs/portal.nvim'

    'https://github.com/kassio/neoterm',
    {
        'https://github.com/samharju/yeet.nvim',
        dependencies = {
            "https://github.com/stevearc/dressing.nvim" -- optional, provides sane UX
        },
        opts = {
            clear_before_yeet = false,
        },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup({
                yeet = {
                    select = function(list_item, _, _)
                        require("yeet").execute(list_item.value)
                    end,
                },
            })

            vim.keymap.set( "n", "<leader><BS>",
                function() harpoon.ui:toggle_quick_menu(harpoon:list("yeet")) end
            )
            vim.keymap.set( "n", "<localleader><localleader>",
                function()
                    require("yeet").execute(nil, {clear_before_yeet = false})
                end
            )


            -- other harpoon keymaps etc
            -- ...
        end,
    },

    -- Telescope
    {
        "https://github.com/nvim-telescope/telescope.nvim",
        dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
    },
    {
        "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    "https://github.com/JoseConseco/telescope_sessions_picker.nvim",
    "https://github.com/nvim-telescope/telescope-media-files.nvim",
    "https://github.com/nvim-telescope/telescope-symbols.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
    "https://github.com/debugloop/telescope-undo.nvim",
    "https://github.com/mbbill/undotree",
    "https://github.com/aaronhallaert/advanced-git-search.nvim",
    "gbprod/yanky.nvim",
    "https://github.com/ptdewey/yankbank-nvim",
    {"https://github.com/cagve/telescope-texsuite",
        ft = { "tex", "bib" },
        config = function()
            require('telescope').load_extension('texsuite')
        end
    },
    {"https://github.com/fcying/telescope-ctags-outline.nvim", },
  {
    'https://github.com/MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      });
    end
  },

    -- dap
    "https://github.com/mfussenegger/nvim-dap",
    { "https://github.com/rcarriga/nvim-dap-ui", dependencies = {"nvim-neotest/nvim-nio"} },
    { "https://github.com/mfussenegger/nvim-dap-python", ft = 'python' },
    "https://github.com/theHamsta/nvim-dap-virtual-text",
    "https://github.com/nvim-telescope/telescope-dap.nvim",
    "https://github.com/jay-babu/mason-nvim-dap.nvim",
    -- {
    --     "https://github.com/numToStr/Comment.nvim",
    --     event = "VeryLazy",
    --     config = function() require("Comment").setup() end
    -- },
    -- Lisp
    --  use { 'https://github.com/monkoose/parsley' }
    -- use 'https://github.com/monkoose/nvlime'
    {
        'https://github.com/vlime/vlime',
        config = function(plugin)
            vim.opt.rtp:append(plugin.dir .. "/vim")
        end,
        ft = { "lisp" }
    },
    { 'https://github.com/HiPhish/nvim-cmp-vlime', ft = 'lisp' },
    { 'https://github.com/bhurlow/vim-parinfer', ft = 'lisp' },
    {
        'https://github.com/hedyhli/outline.nvim',
        config = function() require("outline").setup({
            symbols = {
                filter = {
                    python = {"Function", "Class", "Method", "Property"},
                }
            },
            providers = {
                lsp = {
                    blacklist_clients = { "pylsp" },
                }
            },
        }) end
    },
    {
        "https://github.com/vhyrro/luarocks.nvim",
        priority = 1000,
        opts = {
            rocks = {  "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }},
        config = true
    },
    {
        "https://github.com/rest-nvim/rest.nvim",
        ft = "http",
        cmd = {"Rest", "Http"},
        dependencies = { "luarocks.nvim" },
        config = function()
            require("rest-nvim").setup()
        end,
    },
    --  If rest.nvim stops working
    -- {"https://github.com/mistweaverco/kulala.nvim",
    --     config = function()
    --         require('kulala').setup()
    --     end
    -- },
    {
      'https://github.com/stevearc/overseer.nvim',
      opts = {},
    },
    -- Telekasten
    'https://github.com/renerocksai/telekasten.nvim',
    'https://github.com/renerocksai/calendar-vim',
    'https://github.com/MunifTanjim/nui.nvim/',
    'https://github.com/nvim-neo-tree/neo-tree.nvim/',
    'https://github.com/FabianWirth/search.nvim',
    { 'https://github.com/tris203/hawtkeys.nvim', config = true },
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod', lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    -- {
    -- "OXY2DEV/markview.nvim",
    -- lazy = false,      -- Recommended
    -- -- ft = "markdown" -- If you decide to lazy-load anyway
    --
    -- dependencies = {
    --     "nvim-treesitter/nvim-treesitter",
    --     "nvim-tree/nvim-web-devicons"
    --     }
    -- },
    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
    },
})

require("duikboot")

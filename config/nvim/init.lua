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
    change_detection = { enabled = false },
    spec = {
        {"https://github.com/folke/tokyonight.nvim",
        lazy = false,        -- make sure we load this during startup if it is your main colorscheme
        priority = 1000,     -- make sure to load this before all the other start plugins
        -- transparent = true,
        config = function()
        --     -- load the colorscheme here
            vim.cmd([[set background=dark]])
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

    --  -- CMP
    -- -- "https://github.com/hrsh7th/nvim-cmp",
    -- {
    --   "iguanacucumber/magazine.nvim",
    --   name = "nvim-cmp", -- Otherwise highlighting gets messed up
    -- },
    -- "https://github.com/hrsh7th/cmp-nvim-lsp",
    -- "https://github.com/hrsh7th/cmp-buffer",
    -- "https://github.com/hrsh7th/cmp-nvim-lua",
    -- "https://github.com/hrsh7th/cmp-cmdline",
    -- "https://github.com/hrsh7th/cmp-vsnip",
    -- "https://github.com/hrsh7th/vim-vsnip",
    -- "https://github.com/rafamadriz/friendly-snippets",
    -- "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
    -- "https://github.com/hrsh7th/cmp-path",
    -- "https://github.com/octaltree/cmp-look",
    -- "https://github.com/ray-x/cmp-treesitter",
    -- Use your favorite package manager to install, for example in lazy.nvim
    --  Optionally, you can also install nvim-telescope/telescope.nvim to use some search functionality.

    -- Vcs
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/sindrets/diffview.nvim",
    "https://github.com/polarmutex/git-worktree.nvim",

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

    -- { 'https://codeberg.org/esensar/nvim-dev-container',
    --     config = function()
    --         require('devcontainer').setup({})
    --     end
    -- },
    "https://github.com/tpope/vim-unimpaired",
    'https://github.com/Olical/vim-enmasse',
    'https://github.com/kevinhwang91/nvim-hlslens',
    'https://github.com/machakann/vim-swap',
    "https://github.com/romainl/vim-qf",

    -- FZF
    { "https://github.com/junegunn/fzf", build = "./install --all" },
    "https://github.com/junegunn/fzf.vim",
    "https://github.com/nvim-lua/popup.nvim",
    -- use 'https://github.com/cbochs/portal.nvim'

    'https://github.com/kassio/neoterm',
    "https://github.com/stevearc/dressing.nvim", -- optional, provides sane UX

    -- Telescope
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
        "https://github.com/vhyrro/luarocks.nvim",
        priority = 1000,
        opts = {
            rocks = {  "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }},
        config = true
    },

    -- Telekasten
    'https://github.com/renerocksai/telekasten.nvim',
    'https://github.com/renerocksai/calendar-vim',
    'https://github.com/MunifTanjim/nui.nvim/',
    -- 'https://github.com/nvim-neo-tree/neo-tree.nvim/',
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
    { import = "config.plugins" },
}})


require("duikboot")

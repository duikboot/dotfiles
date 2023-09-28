local vim = vim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Startup
    use 'https://github.com/mhinz/vim-startify'
    -- Colorschemes
    use({
        'https://github.com/rose-pine/neovim',
        as = 'rose-pine',
    })
    use 'https://github.com/rmehri01/onenord.nvim'
    use 'https://github.com/folke/tokyonight.nvim'

    -- FZF
    use 'https://github.com/junegunn/fzf'
    use 'https://github.com/junegunn/fzf.vim'
    use 'https://github.com/nvim-lua/plenary.nvim'
    use 'https://github.com/nvim-lua/popup.nvim'
    -- use 'https://github.com/cbochs/portal.nvim'

    -- LSP
    use {'https://github.com/williamboman/mason.nvim', run = ":MasonUpdate"}
    use {'https://github.com/williamboman/mason-lspconfig.nvim'}

    use 'https://github.com/neovim/nvim-lspconfig'
    use 'https://github.com/onsails/lspkind-nvim'
    use 'https://github.com/folke/lsp-trouble.nvim'
    use 'https://github.com/folke/lsp-colors.nvim'
    use 'https://github.com/folke/flash.nvim'
    use 'https://github.com/jose-elias-alvarez/null-ls.nvim'
    use("theprimeagen/refactoring.nvim")

    -- use 'https://github.com/simrat39/symbols-outline.nvim'

    -- use {
    -- 'VonHeikemen/lsp-zero.nvim',
    -- requires = {
    --     -- LSP Support
    --     {'neovim/nvim-lspconfig'},
    --     {'williamboman/mason.nvim'},
    --     {'williamboman/mason-lspconfig.nvim'},

    --     -- Autocompletion
    --     {'hrsh7th/nvim-cmp'},
    --     {'hrsh7th/cmp-buffer'},
    --     {'hrsh7th/cmp-path'},
    --     {'saadparwaiz1/cmp_luasnip'},
    --     {'hrsh7th/cmp-nvim-lsp'},
    --     {'hrsh7th/cmp-nvim-lua'},

    --     -- Snippets
    --     {'L3MON4D3/LuaSnip'},
    --     {'rafamadriz/friendly-snippets'},
    -- }
    -- }

    -- Telescope
    use ('https://github.com/nvim-telescope/telescope.nvim', {run = ':TSUpdate'})
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use 'https://github.com/JoseConseco/telescope_sessions_picker.nvim'
    use 'https://github.com/nvim-telescope/telescope-media-files.nvim'
    use 'https://github.com/nvim-telescope/telescope-symbols.nvim'
    use 'https://github.com/nvim-telescope/telescope-file-browser.nvim'
    use 'https://github.com/debugloop/telescope-undo.nvim'
    use 'https://github.com/mbbill/undotree'
    use 'https://github.com/aaronhallaert/advanced-git-search.nvim'

    use {
        'https://github.com/stevearc/aerial.nvim',
        config = function() require('aerial').setup() end
    }
    use 'https://github.com/Vimjas/vim-python-pep8-indent'
    use 'https://github.com/kyazdani42/nvim-web-devicons'
    use 'https://github.com/hoob3rt/lualine.nvim'

    use 'https://github.com/romainl/vim-qf'
    use 'https://github.com/stevearc/oil.nvim'

    use 'https://github.com/ThePrimeagen/vim-be-good'
    use 'https://github.com/kevinhwang91/nvim-hlslens'
    use 'https://github.com/Olical/vim-enmasse'
    use 'https://github.com/AckslD/muren.nvim'

    -- completion
    use 'https://github.com/hrsh7th/nvim-cmp'
    use 'https://github.com/hrsh7th/cmp-nvim-lsp'
    use 'https://github.com/hrsh7th/cmp-buffer'
    use 'https://github.com/hrsh7th/cmp-nvim-lua'
    use 'https://github.com/hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
    use 'https://github.com/rafamadriz/friendly-snippets'
    use 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help'

    use 'https://github.com/hrsh7th/cmp-path'
    use 'https://github.com/octaltree/cmp-look'
    use 'https://github.com/ray-x/cmp-treesitter'

    use 'https://github.com/windwp/nvim-autopairs'

    -- dap
    use 'https://github.com/mfussenegger/nvim-dap'
    use 'https://github.com/rcarriga/nvim-dap-ui'
    use 'https://github.com/mfussenegger/nvim-dap-python'
    use 'https://github.com/theHamsta/nvim-dap-virtual-text'
    use 'https://github.com/nvim-telescope/telescope-dap.nvim'

    -- TPope
    use { 'https://github.com/tpope/vim-markdown', opt = true }
    use 'https://github.com/tpope/vim-repeat'
    use 'https://github.com/tpope/vim-sensible'
    -- use 'https://github.com/tpope/vim-surround'
    use 'https://github.com/tpope/vim-unimpaired'
    -- use 'https://github.com/tpope/vim-commentary'
    use 'https://github.com/numToStr/Comment.nvim'
    use({
        "https://github.com/kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    })
    -- Lazy loading:
    -- Load on specific commands
    use { 'https://github.com/tpope/vim-dispatch',
        opt = true,
        cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }

    use 'https://github.com/christoomey/vim-tmux-navigator'
    use 'https://github.com/takac/vim-hardtime'
    use 'https://github.com/nyngwang/NeoZoom.lua'

    -- Treesitter
    use { 'https://github.com/nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'https://github.com/nvim-treesitter/playground'
    use 'https://github.com/nvim-treesitter/nvim-treesitter-refactor'
    use 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
    use 'https://github.com/David-Kunz/treesitter-unit/'
    use 'https://github.com/nvim-treesitter/nvim-treesitter-context'
    use 'https://github.com/theHamsta/nvim-treesitter-commonlisp'
    -- use 'https://github.com/ThePrimeagen/refactoring.nvim'

    -- Vcs
    use 'https://github.com/tpope/vim-fugitive'
    use 'https://github.com/lewis6991/gitsigns.nvim'
    use { 'NeogitOrg/neogit', requires = 'nvim-lua/plenary.nvim' }

    -- Search
    use 'https://github.com/ThePrimeagen/harpoon'
    use 'https://github.com/romainl/vim-cool'

    use 'https://github.com/gbprod/yanky.nvim'
    use 'https://github.com/wesQ3/vim-windowswap'

    -- Terminal
    use 'https://github.com/kassio/neoterm'

    -- Lisp
    --  use { 'https://github.com/monkoose/parsley' }
    -- use 'https://github.com/monkoose/nvlime'
    use { 'https://github.com/vlime/vlime', rtp = 'vim/' }
    use 'https://github.com/HiPhish/nvim-cmp-vlime'
    use 'https://github.com/bhurlow/vim-parinfer'
    -- use 'https://github.com/prabirshrestha/asyncomplete.vim'

    -- Telekasten
    use 'https://github.com/renerocksai/telekasten.nvim'
    use 'https://github.com/renerocksai/calendar-vim'
    use {
        "SmiteshP/nvim-navbuddy",
        requires = {
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        }
    }
    -- use 'https://github.com/mrjones2014/legendary.nvim'
    -- use 'https://github.com/stevearc/dressing.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

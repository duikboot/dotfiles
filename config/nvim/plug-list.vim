
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'https://github.com/mhinz/vim-startify'
Plug 'https://github.com/NLKNguyen/papercolor-theme'
Plug 'https://github.com/folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'https://github.com/tjdevries/colorbuddy.vim'
Plug 'https://github.com/Th3Whit3Wolf/onebuddy'
Plug 'https://github.com/Th3Whit3Wolf/one-nvim'
Plug 'https://github.com/tjdevries/gruvbuddy.nvim'
Plug 'https://github.com/christoomey/vim-tmux-navigator'
Plug 'https://github.com/conweller/endarkened.vim'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/stsewd/fzf-checkout.vim'
" Plug 'https://github.com/machakann/vim-highlightedyank'
Plug 'https://github.com/machakann/vim-swap'
" Plug 'mhinz/vim-grepper'
" Plug 'mhinz/vim-signify'
Plug 'https://github.com/tpope/vim-markdown'
Plug 'https://github.com/tpope/vim-obsession'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-unimpaired'
" Plug 'https://github.com/bling/vim-airline'
Plug 'https://github.com/tpope/vim-commentary'
" Plug 'https://github.com/tpope/vim-obsession'
" Plug 'https://github.com/rmagatti/auto-session'
" Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
" Plug 'https://github.com/davidhalter/jedi-vim', {'do': 'git submodule update --init --recursive'}
" Plug 'https://github.com/ervandew/supertab'
Plug 'https://github.com/godlygeek/tabular'

Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/junegunn/gv.vim'

" Plug 'https://github.com/TimUntersberger/neogit'
Plug 'https://github.com/psf/black'
Plug 'https://github.com/kassio/neoterm'
Plug 'https://github.com/vlime/vlime', {'rtp': 'vim/'}
Plug 'https://github.com/wellle/targets.vim'
Plug 'https://github.com/lervag/vimtex'
Plug 'https://github.com/iCyMind/NeoSolarized'
" Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/Olical/vim-enmasse'
" Plug 'https://github.com/eraserhd/parinfer-rust', {'do':  'cargo build --release'}
Plug 'https://github.com/bhurlow/vim-parinfer'
" Plug 'https://github.com/guns/vim-sexp'
" Plug 'https://github.com/dense-analysis/ale'

Plug 'https://github.com/vim-scripts/vcscommand.vim'
Plug 'https://github.com/simnalamburt/vim-mundo'
" Plug 'https://github.com/Raimondi/delimitMate'
" Plug 'https://github.com/cohama/lexima.vim'
Plug 'https://github.com/windwp/nvim-autopairs'
Plug 'https://github.com/lifepillar/vim-gruvbox8'
Plug 'https://github.com/romainl/vim-cool'
Plug 'https://github.com/arzg/vim-colors-xcode'
" Plug 'https://github.com/liuchengxu/vista.vim'

" Plug 'https://github.com/Shougo/context_filetype.vim'

if has('nvim')
    Plug 'https://github.com/neovim/nvim-lspconfig'
    " Plug 'https://github.com/nvim-lua/lsp-status.nvim'
endif

Plug 'https://github.com/prabirshrestha/asyncomplete.vim'

" Plug 'https://github.com/lambdalisue/fern.vim'
Plug 'https://github.com/unblevable/quick-scope'
Plug 'https://github.com/phaazon/hop.nvim'
" Plug 'https://github.com/tpope/vim-dadbod'
" Plug 'https://github.com/kristijanhusak/vim-dadbod-ui'
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc'

Plug 'https://github.com/romainl/vim-qf'

Plug 'https://github.com/ncm2/ncm2'
Plug 'https://github.com/roxma/nvim-yarp'
Plug 'https://github.com/HiPhish/ncm2-vlime'

" Plug 'https://github.com/hrsh7th/nvim-compe'
Plug 'https://github.com/hrsh7th/nvim-cmp'
Plug 'https://github.com/hrsh7th/cmp-nvim-lsp'
Plug 'https://github.com/hrsh7th/cmp-buffer'
Plug 'https://github.com/hrsh7th/cmp-nvim-lua'
Plug 'https://github.com/L3MON4D3/LuaSnip'
Plug 'https://github.com/saadparwaiz1/cmp_luasnip'
Plug 'https://github.com/rafamadriz/friendly-snippets'
Plug 'https://github.com/hrsh7th/cmp-path'
Plug 'https://github.com/octaltree/cmp-look'
Plug 'https://github.com/ray-x/cmp-treesitter'
Plug 'https://github.com/onsails/lspkind-nvim'

Plug 'https://github.com/srcery-colors/srcery-vim'

Plug 'https://github.com/barlog-m/oceanic-primal-vim' , { 'branch': 'main' }

Plug 'https://github.com/rhysd/git-messenger.vim'

Plug 'https://github.com/nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
Plug 'https://github.com/nvim-treesitter/playground'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter-refactor'

Plug 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects'
Plug 'https://github.com/David-Kunz/treesitter-unit/'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter-context'

Plug 'https://github.com/ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'https://github.com/nvim-lua/popup.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/ThePrimeagen/refactoring.nvim'

Plug 'https://github.com/lewis6991/gitsigns.nvim'
Plug 'https://github.com/nvim-lua/telescope.nvim'
Plug 'https://github.com/kevinhwang91/nvim-hlslens'
" Plug 'https://github.com/dbeniamine/cheat.sh-vim'

" Plug 'https://github.com/glepnir/lspsaga.nvim'
" Plug 'https://github.com/ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

" Plug 'RishabhRD/popfix'
" Plug 'https://github.com/RishabhRD/nvim-lsputils'

Plug 'https://github.com/sainnhe/edge'
Plug 'https://github.com/rhysd/committia.vim'
Plug 'https://github.com/kyazdani42/nvim-web-devicons'
Plug 'https://github.com/hoob3rt/lualine.nvim'
Plug 'https://github.com/nvim-telescope/telescope-fzy-native.nvim', {'do': 'make'}
Plug 'https://github.com/folke/lsp-trouble.nvim'
Plug 'https://github.com/ray-x/lsp_signature.nvim'
Plug 'https://github.com/jose-elias-alvarez/null-ls.nvim'
Plug 'https://github.com/j-hui/fidget.nvim'

Plug 'https://github.com/aklt/plantuml-syntax'

Plug 'https://github.com/windwp/nvim-spectre'

Plug 'https://github.com/JoseConseco/telescope_sessions_picker.nvim'

" Plug 'https://github.com/gabrielpoca/replacer.nvim'

" Plug 'https://github.com/tversteeg/registers.nvim'

Plug 'https://github.com/folke/lsp-colors.nvim'
"Plug 'https://github.com/simrat39/symbols-outline.nvim'
Plug 'https://github.com/stevearc/aerial.nvim'

Plug 'https://github.com/folke/material.nvim'
" Plug 'https://github.com/kosayoda/nvim-lightbulb'

Plug 'https://github.com/jose-elias-alvarez/buftabline.nvim'

" Plug 'https://github.com/weilbith/nvim-lsp-smag'
Plug 'https://github.com/theHamsta/nvim-treesitter-commonlisp'

" Plug 'https://github.com/kristijanhusak/orgmode.nvim'
" Plug 'https://github.com/vhyrro/neorg'
" Plug 'https://github.com/weilbith/nvim-code-action-menu'

" Plug 'https://github.com/AckslD/nvim-neoclip.lua'
Plug 'https://github.com/gbprod/yanky.nvim'
" Plug 'https://github.com/tami5/sqlite.lua'

Plug 'https://github.com/gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'https://github.com/wesQ3/vim-windowswap'

Plug 'https://github.com/ThePrimeagen/harpoon'

Plug 'https://github.com/Olical/vim-expand'
" Plug 'https://github.com/ggandor/lightspeed.nvim'

Plug 'https://github.com/Vimjas/vim-python-pep8-indent'

Plug 'https://github.com/renerocksai/telekasten.nvim'
Plug 'https://github.com/renerocksai/calendar-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'https://github.com/nvim-telescope/telescope-media-files.nvim'
Plug 'https://github.com/nvim-telescope/telescope-symbols.nvim'
Plug 'https://github.com/nvim-telescope/telescope-file-browser.nvim'

Plug 'https://github.com/sainnhe/everforest'
" Plug 'https://github.com/sidebar-nvim/sidebar.nvim'

Plug 'https://github.com/mfussenegger/nvim-dap'
Plug 'https://github.com/rcarriga/nvim-dap-ui'
Plug 'https://github.com/mfussenegger/nvim-dap-python'
Plug 'https://github.com/theHamsta/nvim-dap-virtual-text'
Plug 'https://github.com/nvim-telescope/telescope-dap.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

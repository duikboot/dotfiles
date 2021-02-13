
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'NLKNguyen/papercolor-theme'
Plug 'christoomey/vim-tmux-navigator'
Plug 'conweller/endarkened.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/stsewd/fzf-checkout.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'machakann/vim-swap'
Plug 'mhinz/vim-grepper'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'davidhalter/jedi-vim', {'do': 'git submodule update --init --recursive'}
" Plug 'ervandew/supertab'
" Plug 'https://github.com/godlygeek/tabular'
Plug 'tpope/vim-fugitive'
Plug 'psf/black'
Plug 'kassio/neoterm'
Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'wellle/targets.vim'
Plug 'lervag/vimtex'
Plug 'iCyMind/NeoSolarized'
Plug 'sheerun/vim-polyglot'
Plug 'Olical/vim-enmasse'
" Plug 'eraserhd/parinfer-rust', {'do':  'cargo build --release'}
Plug 'https://github.com/bhurlow/vim-parinfer'
" Plug 'https://github.com/guns/vim-sexp'
Plug 'dense-analysis/ale'
" Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'
Plug 'vim-scripts/vcscommand.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com/Raimondi/delimitMate'
Plug 'lifepillar/vim-gruvbox8'
Plug 'https://github.com/romainl/vim-cool'
Plug 'https://github.com/arzg/vim-colors-xcode'
" Plug 'liuchengxu/vista.vim'
Plug 'https://github.com/idanarye/vim-merginal'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'
Plug 'https://github.com/majutsushi/tagbar'

" Plug 'https://github.com/norcalli/snippets.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'https://github.com/duikboot/vs-snippets'

" Plug 'https://github.com/Shougo/context_filetype.vim'

if has('nvim')
    Plug 'neovim/nvim-lspconfig'
    " Plug 'https://github.com/nvim-lua/lsp-status.nvim'
endif

Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
" Plug 'https://github.com/Shougo/deoplete-lsp'

" Plug 'https://github.com/lambdalisue/fern.vim'
Plug 'https://github.com/unblevable/quick-scope'
" Plug 'https://github.com/tpope/vim-dadbod'
" Plug 'https://github.com/kristijanhusak/vim-dadbod-ui'
Plug 'https://github.com/MarcWeber/vim-addon-local-vimrc'

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'https://github.com/HiPhish/ncm2-vlime'

" Plug 'https://github.com/nvim-lua/completion-nvim'
" Plug 'https://github.com/steelsojka/completion-buffers'

Plug 'https://github.com/hrsh7th/nvim-compe'

Plug 'https://github.com/srcery-colors/srcery-vim'

Plug 'https://github.com/barlog-m/oceanic-primal-vim' , { 'branch': 'main' }

Plug 'https://github.com/rhysd/git-messenger.vim'

Plug 'https://github.com/ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'https://github.com/nvim-treesitter/nvim-treesitter' , {'do': ':TSUpdate'}
Plug 'https://github.com/nvim-lua/popup.nvim'
Plug 'https://github.com/nvim-lua/plenary.nvim'
Plug 'https://github.com/nvim-lua/telescope.nvim'
Plug 'https://github.com/kevinhwang91/nvim-hlslens'
" Plug 'https://github.com/kyazdani42/nvim-tree.lua'
Plug 'https://github.com/dbeniamine/cheat.sh-vim'

" Plug 'https://github.com/glepnir/lspsaga.nvim'
" Plug 'https://github.com/ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'RishabhRD/popfix'
Plug 'https://github.com/RishabhRD/nvim-lsputils'

Plug 'https://github.com/sainnhe/edge'
Plug 'https://github.com/rhysd/committia.vim'
" Plug 'https://github.com/RishabhRD/nvim-cheat.sh'
" Plug 'https://github.com/gabrielpoca/replacer.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

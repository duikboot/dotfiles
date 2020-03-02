
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'NLKNguyen/papercolor-theme'
Plug 'christoomey/vim-tmux-navigator'
Plug 'conweller/endarkened.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
" Plug 'prabirshrestha/asyncomplete.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'psf/black'
Plug 'kassio/neoterm'
Plug 'vlime/vlime', {'rtp': 'vim/'}
Plug 'wellle/targets.vim'
Plug 'lervag/vimtex'
Plug 'iCyMind/NeoSolarized'
Plug 'sheerun/vim-polyglot'
Plug 'Olical/vim-enmasse'
Plug 'eraserhd/parinfer-rust', {'do':  'cargo build --release'}
Plug 'dense-analysis/ale'
" Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'
Plug 'vim-scripts/vcscommand.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com/Raimondi/delimitMate'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'

if has('nvim')
    Plug 'neovim/nvim-lsp'
endif

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

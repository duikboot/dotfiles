source ~/config/dotfiles/config/nvim_debug/plug-list.vim

let g:mapleader="\<space>"             " change the leader to be a comma vs slash
let g:maplocalleader="\\"       " map localleader to \\


nnoremap <silent> <leader>V :source /home/arjen/config/dotfiles/config/nvim_debug/init.vim <CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

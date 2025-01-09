local option = vim.opt
local g = vim.g
local home = vim.fn.expand("~/")

g.loaded_python_provider = 0 -- DISABLE Python 2
g.python3_host_prog = home .. '/.dotfiles/.venv/bin/python'

g.python3_host_prog_bin = home .. '/.dotfiles/.venv/bin/'

option.termguicolors = true
option.encoding = "utf-8"
option.fileencoding = "utf-8"

option.tags = "./tags,tags"
option.clipboard = "unnamedplus"
option.scrolloff = 3             -- Keep 3 context lines above and below the cursor
option.expandtab = true
option.softtabstop=4           -- <BS> over an autoindent deletes both spaces.
option.tabstop=4               -- <tab> inserts 4 spaces
option.shiftwidth = 4 -- but an indent level is 4 spaces wide.
option.splitright = true
option.splitbelow = true
option.number = true                -- Display line numbers
option.numberwidth = 1              -- using only 1 column (and 1 space) while possible
option.hidden = true
option.title = true                 -- show title in console title bar
option.wildmenu = true
option.wildmode = "full"            -- <Tab> cycles between all matching choices.
option.undolevels = 1000            -- use many levels of undo
option.display = "lastline"
option.joinspaces = false           -- Use only 1 space after "." when joining lines, not 2"
option.showfulltag = true           -- Show full tags when doing search completion
option.relativenumber = true        -- show linenumber relative to line cursor is on
option.foldlevel = 666
option.foldmethod = 'indent'
option.foldtext = "set foldtext"
option.fillchars = "vert:│,fold:·,diff:"
option.keywordprg = ":help"         -- Use K to show help on subject under cursor
option.backupdir = home .. ".tmp//"
option.directory = home .. ".tmp//" --set directory for swapfiles
--set conceallevel=0
option.updatetime = 500
option.formatoptions = { c = true, q = true, r = true, n = true, j = true }
option.suffixesadd = ".tex,.latex,.java,.js,.hrl,.erl,.lisp,.asd,.lua"
option.pumheight = 20 -- Keep a small completion window
-- option.winblend = 60 -- Keep a small completion window

option.colorcolumn = "79"

option.messagesopt="hit-enter,history:500,wait:1000"

-- Keep a persistend backupfile
option.undofile = true
option.undodir = home .. "/.vim"
option.inccommand = "nosplit"
option.winbar = "%f%m"            -- Show winbar with filename and modified flag

option.listchars = "tab:>-,trail:-,precedes:<,extends:>,"
option.list = true

-- Searching and Patterns
option.ignorecase = true              -- Default to using case insensitive searches,
option.smartcase = true               -- unless uppercase letters are used in the regex.

option.breakindent = true
option.breakindentopt='shift:4'
option.showbreak ='↳ '
option.showmatch = true
option.wrap = true
option.linebreak = true
-- vim.cmd([[let &showbreak='↳ ']])

-- look at db file
g.dbs = {
     mob2_dev = "postgres://django:django@localhost:5432/django",
}
vim.cmd(
[[augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END]]
)
-- autocmd BufNewFile,BufRead *.js set nosmarttab  " If  don't use smarttab"

vim.opt.path:append('**')

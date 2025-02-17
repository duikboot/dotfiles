local vim = vim
local telescope = require("telescope")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
-- local finders = require("telescope.finders")
local trouble = require("trouble.providers.telescope")

-- local pickers = require("telescope.pickers")
-- local finders = require("telescope.finders")

-- local input = {'rg', '--line-number', '--column', ''}

-- local opts = {
--     finder = finders.new_oneshot_job(input),
--     sorter = sorters.get_generic_fuzzy_sorter()
-- }

-- local picker = pickers.new(opts)
-- picker:find()

telescope.setup{
    defaults = {
        -- prompt_prefix = "🔍 ",
        winblend = 10,
        -- path_display = {
        --     "shorten",
        --     "absolute"
        -- },
        file_sorter = sorters.get_fzy_sorter,
        file_ignore_patterns = {"tags"},
        sorting_strategy = "descending",
        -- sorting_strategy = "ascending",
        mappings = {
            i = {
                ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
                -- ["<c-t>"] = trouble.open_with_trouble,
            },
            n = {
                ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
                -- ["<c-t>"] = trouble.open_with_trouble,
            },
        }
    },
    pickers = {
        current_buffer_fuzzy_find = {
            sorting_strategy = "ascending",
            layout_config = {
                prompt_position = "top",
            },
        }
    },
    extensions = {
        -- fzf = {
        --     override_generic_sorter = false, -- override the generic sorter
        --     override_file_sorter = true,     -- override the file sorter
        --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        --     -- the default case_mode is "smart_case"
        -- },
        sessions_picker = {
            sessions_dir = vim.fn.stdpath('data') ..'/session/',  -- same as '/home/user/.local/share/nvim/session'
        },
        ctags_outline = {
            ft_opt = {
                python = '--python-kinds=-iv',
            }
        }
    }
}

require('telescope').load_extension('dap')
require('telescope').load_extension("advanced_git_search")
require('telescope').load_extension("tmux")
require('telescope').load_extension("rest")
-- require("telescope").load_extension("git_workree")
-- require("telescope").load_extension('harpoon')

vim.keymap.set("n", "<localleader>u", "<cmd>Telescope undo<cr>")

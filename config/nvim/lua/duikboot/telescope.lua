local telescope = require'telescope'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local trouble = require("trouble.providers.telescope")

telescope.setup{
    defaults = {
        -- prompt_prefix = "🔍 ",
        winblend = 10,
        -- path_display = {
        --     "shorten",
        --     "absolute"
        -- },
        file_sorter = sorters.get_fzy_sorter,
        -- file_ignore_patterns = {"%js"},
        mappings = {
            i = {
                ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
                ["<c-t>"] = trouble.open_with_trouble,
            },
            n = {
                ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
                ["<c-t>"] = trouble.open_with_trouble,
            },
        }
    },
    pickers = {
        current_buffer_fuzzy_find = {
            sorting_strategy = "ascending",
            prompt_position = "top"
        }
    },
    extensions = {
    --     fzy_native =  {
    --         override_generic_sorter = false,
    --         override_file_sorter = true
    --     },
        fzf = {
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
    }
}

-- require('telescope').load_extension('fzy_native')
require('telescope').load_extension('neoclip')
require('telescope').load_extension('fzf')

local M = {}

M.grep_prompt = function()
    require('telescope.builtin').grep_string {
       shorten_path = false,
       search = vim.fn.input "Grep String > ",
    }
end


M.find_virtual_env = function()
  require('telescope.builtin').find_files({
      shorten_path = false,
      cwd = ".venv/lib",
      results_title = "~ Virtual Environment ~",
    })
end

return M

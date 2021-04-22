local telescope = require'telescope'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'

telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter = sorters.get_fzy_sorter,
    file_ignore_patterns = {"%js"},
    generic_sorter =  telescope.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    mappings = {
        i = {
            ["<C-x>"] = actions.send_to_qflist + actions.open_qflist,
            },
    }
  },
  extensions = {
    fzy_native =  {
        override_generic_sorter = false,
        override_file_sorter = true
    },
    -- fzf = {
    --   override_generic_sorter = false, -- override the generic sorter
    --   override_file_sorter = true,     -- override the file sorter
    --   case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    --                                    -- the default case_mode is "smart_case"
    -- }
  }
}


function FindVirtualEnv()
  require('telescope.builtin').find_files({
      shorten_path = false,
      cwd = ".venv/",
      prompt = "~ venv ~",
    })
end

require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('fzf')

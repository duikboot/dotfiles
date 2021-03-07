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
    file_ignore_patterns = {},
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

    mappings = {
        i = {
            ["<C-c>"] = actions.send_to_qflist + actions.open_qflist,
            },
    }
  }
}

require('telescope').load_extension('fzy_native')
-- pcall(require('telescope').load_extension, 'frecency')

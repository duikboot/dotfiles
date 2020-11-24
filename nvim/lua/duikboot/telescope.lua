telescope = require'telescope'
sorters = require'telescope.sorters'
-- require('telescope').setup {
--   defaults = {
--     layout_strategy = "flex",
--     winblend = 5,
--     generic_sorter = require'telescope.sorters'.get_fzy_sorter,
--     file_sorter = require'telescope.sorters'.get_fzy_sorter,
--   }
-- }
-- defaults:

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
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter = sorters.get_fuzzy_file ,
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
  }
}

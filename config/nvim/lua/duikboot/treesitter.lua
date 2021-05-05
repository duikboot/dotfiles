require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
        enable = true,              -- false will disable the whole extension
        -- disable = { "c", "rust" },  -- list of language that will be disabled
  },
  indent = {
    enable = true,
    disable = { "python" }
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  -- refactor = {
  --   highlight_definitions = {enable = true},
  --   highlight_current_scope = {enable = false},
  --   smart_rename = {
  --     enable = true,
  --     keymaps = {
  --       -- mapping to rename reference under cursor
  --       smart_rename = 'grr',
  --     },
  --   },
-- }
}


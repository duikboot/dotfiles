return {
    {
        "https://github.com/nvim-telescope/telescope.nvim",
        dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
        keys = {
            -- TODO: last telescope
            {
                "<leader>.",
                "<cmd>Telescope resume<cr>",
                { mode = { "n" } },
                { desc = "Resume Telescope" }
            },
            {
                "<leader>ff",
                "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
                { mode = { "n" } },
                { desc = "Find files" }
            },
            { '<localleader>f', function()
                require 'telescope.builtin'.current_buffer_fuzzy_find {}
            end, { desc = "Buffer [F]uzzy find" }
            },

        }
    },
    {
        "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    },
    {
        "https://github.com/camgraff/telescope-tmux.nvim",
        keys = {
            { "<leader>ts", ":Telescope tmux sessions<cr>",      { noremap = true } },
            { "<leader>tw", ":Telescope tmux windows<cr>",       { noremap = true } },
            { "<leader>tc", ":Telescope tmux pane_contents<cr>", { noremap = true } },
        }
    },
    "https://github.com/JoseConseco/telescope_sessions_picker.nvim",
    "https://github.com/nvim-telescope/telescope-media-files.nvim",
    "https://github.com/nvim-telescope/telescope-symbols.nvim",
    "https://github.com/nvim-telescope/telescope-file-browser.nvim",
    "https://github.com/debugloop/telescope-undo.nvim",
    "https://github.com/mbbill/undotree",
    "https://github.com/aaronhallaert/advanced-git-search.nvim",
    "gbprod/yanky.nvim",
    "https://github.com/ptdewey/yankbank-nvim",
    { "https://github.com/fcying/telescope-ctags-outline.nvim", },
    {
        "https://github.com/cagve/telescope-texsuite",
        ft = { "tex", "bib" },
        config = function()
            require('telescope').load_extension('texsuite')
        end
    },
}

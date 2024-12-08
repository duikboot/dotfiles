local load_extensions = require('telescope').load_extension

local Find_virtual_env = function()
    require('telescope.builtin').find_files({
        shorten_path = false,
        cwd = ".venv/lib",
        results_title = "~ Virtual Environment ~",
    })
end

return {
    {
        "https://github.com/nvim-telescope/telescope.nvim",
        dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
        keys = {
            -- TODO: last telescope
            {
                "<leader>.",
                "<cmd>Telescope resume<cr>",
                { desc = "Resume Telescope" }
            },
            {
                "<leader>ff",
                "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
                { desc = "Find files" }
            },
            { '<localleader>f', function()
                require 'telescope.builtin'.current_buffer_fuzzy_find {}
            end, { desc = "Buffer [F]uzzy find" }
            },

            -- { '<C-u>', "<ESC>mzgUiw`za", mode = { "i", "n" }, desc = "Uppercase previous word" },

            { '<leader>fv',
                function() Find_virtual_env() end,
                { desc = "[F]ind [V]irtual env" }
            },
        },
    },
    {
        "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function() load_extensions('fzf') end
    },
    {
        "https://github.com/camgraff/telescope-tmux.nvim",
        keys = {
            { "<leader>ts", ":Telescope tmux sessions<cr>",      { noremap = true } },
            { "<leader>tw", ":Telescope tmux windows<cr>",       { noremap = true } },
            { "<leader>tc", ":Telescope tmux pane_contents<cr>", { noremap = true } },
        }
    },
    {
        "https://github.com/JoseConseco/telescope_sessions_picker.nvim",
        config = function() load_extensions('sessions_picker') end
    },
    {
        "https://github.com/nvim-telescope/telescope-symbols.nvim",
    },
    {
        "https://github.com/nvim-telescope/telescope-file-browser.nvim",
        config = function() load_extensions('file_browser') end
    },
    {
        "https://github.com/debugloop/telescope-undo.nvim",
        config = function() load_extensions('undo') end
    },
    "https://github.com/mbbill/undotree",
    "https://github.com/aaronhallaert/advanced-git-search.nvim",
    -- {
    --     "https://github.com/gbprod/yanky.nvim",
    --     config = function() load_extensions('yank_history') end
    -- },
    -- {
    --     "https://github.com/cagve/telescope-texsuite",
    --     ft = { "tex", "bib" },
    --     config = function()
    --         require('telescope').load_extension('texsuite')
    --     end
    -- },
}

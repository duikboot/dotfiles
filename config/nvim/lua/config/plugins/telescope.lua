local load_extensions = require('telescope').load_extension

local grep_prompt = function()
    require('telescope.builtin').grep_string {
        shorten_path = false,
        hidden = true,
        no_ignore = true,
        search = vim.fn.input "Grep String > ",
    }
end
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
                'T', ":Telescope ", { desc = "Open [T]telescope" }
            },
            { '<leader>cg',
                function() grep_prompt() end,
                { desc = "[C]ode [G]rep" } },
            {
                "<leader>.",
                "<cmd>Telescope resume<cr>",
                { desc = "Resume Telescope" }
            },
            { '<leader>gs',
                function() require 'telescope.builtin'.git_status {} end,
                { desc = "[G]it [S]tatus" }
            },
            { '<leader>fg',
                function() require 'telescope.builtin'.git_files {} end,
                { desc = "[F]ind [G]it files" } },
            { '<leader>gc',
                function() require 'telescope.builtin'.git_commits() end,
                { desc = "[G]it [C]commits" }
            },
            {
                'gr',
                function() require 'telescope.builtin'.lsp_references() end,
                { desc = "[G]o to [R]references" }
            },
            { '<leader>lg',
                function() require 'telescope.builtin'.live_grep {} end,
                { desc = "[L]ive [G]rep" }
            },
            {
                "<leader>o",
                function() require('telescope.builtin').find_files() end,
                { desc = "[O]pen file" }
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

            { '<leader>bb', function()
                require 'telescope.builtin'.buffers {}
            end,
                { desc = "Show [B]buffers" }
            },

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
        config = function() load_extensions('file_browser') end,
        keys = {
            {
                '<Leader>fb',
                ":Telescope file_browser<CR>",
                { desc = "[F]ile [B]browser" },
            },
        }
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

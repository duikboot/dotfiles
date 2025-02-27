require('telescope').load_extension('git_worktree')

return {
    'polarmutex/git-worktree.nvim',
    version = '^2',
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>gw",
            function()
                require("telescope").extensions.git_worktree.git_worktree()
            end,
            desc = "Git Worktree",
        }
    },
    config = function()
        vim.g.git_worktree = {
            change_directory_command = "cd",
            update_on_change = true,
            update_on_change_command = "e .",
            clearjumps_on_change = true,
            confirm_telescope_deletions = true,
            autopush = false,
        }
        local Hooks = require("git-worktree.hooks")
        local function on_tree_switch(op, path)
            -- vim.cmd("%bd|e#")
        end

        Hooks.register(Hooks.type.SWITCH, Hooks.builtins.update_current_buffer_on_switch)
        Hooks.register(Hooks.type.SWITCH, on_tree_switch)
    end
}

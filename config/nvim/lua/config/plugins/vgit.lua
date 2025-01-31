return {
    'https://github.com/tanvirtin/vgit.nvim',
    branch = 'v1.0.x',
    -- or               , tag = 'v1.0.2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
    -- Lazy loading on 'VimEnter' event is necessary.
    event = 'VimEnter',
    config = function()
        require("vgit").setup({
            settings = {
                live_blame = {
                    enabled = false
                },

                live_gutter = {
                    enabled = false
                }
            }
        })
    end,
}

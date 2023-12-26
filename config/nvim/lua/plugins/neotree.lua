require("neo-tree").setup({
    sources = {
        -- Any other Neo-tree sources you had/want.
        -- Just add the netman source somewhere in this array
        "netman.ui.neo-tree", -- The one you really care about 😉
    },
    -- If you want Netman to appear in the winbar/statusline, you will need
    -- to setup source selector
    -- source_selector = {
    --     sources = {
    --         -- Any other items you had in your source selector
    --         -- Just add the netman source as well
    --         { source = "remote" }
    --     }
    -- }
})

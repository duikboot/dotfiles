return {
    "https://github.com/Davidyz/inlayhint-filler.nvim",
    ft = "python",
    keys={
        {
            "<Leader>I", -- Use whatever keymap you want.
            function()
                require("inlayhint-filler").fill()
            end,
            desc = "Insert the inlay-hint under cursor into the buffer."
        }
    }
}

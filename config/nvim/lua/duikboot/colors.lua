local vim = vim

function Colorscheme(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

Colorscheme()

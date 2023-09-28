local vim = vim

function Rosepine(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
end

Rosepine()
--
function Tokyonight(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)
end

require('tokyonight').setup({
    style="moon"
})

Tokyonight()



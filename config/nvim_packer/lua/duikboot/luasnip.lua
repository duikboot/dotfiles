local vim = vim

local function prequire(...)
local status, lib = pcall(require, ...)
if (status) then return lib end
    return nil
end

local luasnip = prequire('luasnip')
local snippets = luasnip.snippets
local s = luasnip.snippet
local sn = luasnip.snippet_node
local tn = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

snippets.python =  {
    s({
        trig = 'from',
        name = 'from … import …',
        dscr = {
            'import from module',
        },
    }, {
            tn { 'from ' },
            i(1, ''),
            tn { ' import ' },
            i(0, ''),
        }),
}

    require("luasnip/loaders/from_vscode").load()
        vim.cmd [[
        imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
        inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
        imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'
        snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
        snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]]

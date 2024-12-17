local home = vim.fn.expand("~/zettelkasten")
require('telekasten').setup({
    home         = home,
    dailies      = home .. '/' .. 'daily',
    weeklies     = home .. '/' .. 'weekly',
    templates    = home .. '/' .. 'templates',

    -- image subdir for pasting
    -- subdir name
    -- or nil if pasted images shouldn't go into a special subdir
    image_subdir = "img",

    -- markdown file extension
    extension    = ".md",

    -- following a link to a non-existing note will create it
    follow_creates_nonexisting = true,
    dailies_create_nonexisting = true,
    weeklies_create_nonexisting = true,

    -- template for new notes (new_note, follow_link)
    -- set to `nil` or do not specify if you do not want a template
    template_new_note = home .. '/' .. 'templates/new_note.md',

    -- template for newly created daily notes (goto_today)
    -- set to `nil` or do not specify if you do not want a template
    template_new_daily = home .. '/' .. 'templates/daily.md',

    -- template for newly created weekly notes (goto_thisweek)
    -- set to `nil` or do not specify if you do not want a template
    template_new_weekly= home .. '/' .. 'templates/weekly.md',

    template_handling = "smart",

    -- image link style
    -- wiki:     ![[image name]]
    -- markdown: ![](image_subdir/xxxxx.png)
    image_link_style = "markdown",

    -- integrate with calendar-vim
    plug_into_calendar = true,
    calendar_opts = {
        -- calendar week display mode: 1 .. 'WK01', 2 .. 'WK 1', 3 .. 'KW01', 4 .. 'KW 1', 5 .. '1'
        weeknm = 1,
        -- use monday as first day of week: 1 .. true, 0 .. false
        calendar_monday = 1,
        -- calendar mark: where to put mark for marked days: 'left', 'right', 'left-fit'
        calendar_mark = 'left-fit',
    },

    -- telescope actions behavior
    close_after_yanking = false,
    insert_after_inserting = true,
    take_over_my_home = true,

    -- make syntax available to markdown buffers and telescope previewers
    install_syntax = true,

    -- tag notation: '#tag', ':tag:', 'yaml-bare'
    tag_notation = "#tag",

})

vim.cmd [[
    nnoremap <leader>zf :lua require('telekasten').find_notes()<CR>
    nnoremap <leader>zd :lua require('telekasten').find_daily_notes()<CR>
    nnoremap <leader>zg :lua require('telekasten').search_notes()<CR>
    nnoremap <leader>zz :lua require('telekasten').follow_link()<CR>
    nnoremap <leader>zT :lua require('telekasten').goto_today()<CR>
    nnoremap <leader>zW :lua require('telekasten').goto_thisweek()<CR>
    nnoremap <leader>zw :lua require('telekasten').find_weekly_notes()<CR>
    nnoremap <leader>zn :lua require('telekasten').new_note()<CR>
    nnoremap <leader>zN :lua require('telekasten').new_templated_note()<CR>
    nnoremap <leader>zy :lua require('telekasten').yank_notelink()<CR>
    nnoremap <leader>zc :lua require('telekasten').show_calendar()<CR>
    nnoremap <leader>zC :CalendarT<CR>
    nnoremap <leader>zi :lua require('telekasten').paste_img_and_link()<CR>
    nnoremap <leader>zt :lua require('telekasten').toggle_todo()<CR>
    nnoremap <leader>zb :lua require('telekasten').show_backlinks()<CR>
    nnoremap <leader>zF :lua require('telekasten').find_friends()<CR>
    nnoremap <leader>zI :lua require('telekasten').insert_img_link({ i=true })<CR>
    nnoremap <leader>zp :lua require('telekasten').preview_img()<CR>
    nnoremap <leader>zm :lua require('telekasten').browse_media()<CR>
    nnoremap <leader># :lua require('telekasten').show_tags()<CR>

" we could define [[ in **insert mode** to call insert link
" inoremap [[ <ESC>:lua require('telekasten').insert_link()<CR>
" alternatively: leader [
" inoremap <localleader>[ <ESC>:lua require('telekasten').insert_link({ i=true })<CR>
" inoremap <localleader>zt <ESC>:lua require('telekasten').toggle_todo({ i=true })<CR>


]]

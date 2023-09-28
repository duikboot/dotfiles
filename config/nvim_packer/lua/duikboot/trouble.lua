local vim = vim
local trouble = require("trouble")

local trouble_opts = {skip_groups = true, jump = true}

-- jump to the next item, skipping the groups
vim.keymap.set("n", "<leader>xn", function() trouble.next(trouble_opts) end)

-- jump to the previous item, skipping the groups
vim.keymap.set("n", "<leader>xp", function() trouble.previous(trouble_opts) end)

-- jump to the first item, skipping the groups
vim.keymap.set("n", "<leader>x0", function() trouble.first(trouble_opts) end)

-- jump to the last item, skipping the groups
vim.keymap.set("n", "<leader>xl", function() trouble.last(trouble_opts) end)

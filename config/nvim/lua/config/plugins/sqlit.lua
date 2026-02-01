return {
  "Maxteabag/sqlit",
  keys = {
    {
      "<leader>D",
      function()
        vim.cmd("tabnew | terminal sqlit --theme textual-ansi")
        vim.cmd("startinsert")
      end,
      desc = "Database (sqlit)",
    },
  },
}

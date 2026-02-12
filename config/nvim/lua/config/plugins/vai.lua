-- lazy.nvim
return {
  'https://github.com/johnpmitsch/vai.nvim',
    config = function()
    require('vai').setup(
            {
            trigger='<leader><cr>'
}
    )
  end,
}

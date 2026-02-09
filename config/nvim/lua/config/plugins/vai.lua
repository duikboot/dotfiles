-- lazy.nvim
return {
  'johnpmitsch/vai.nvim',
  config = function()
    require('vai').setup(
            {
            trigger='<cr>'
}
    )
  end,
}

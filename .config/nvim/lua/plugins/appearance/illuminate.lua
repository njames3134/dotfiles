return {
  "RRethy/vim-illuminate",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    --default configuration
    require('illuminate').configure({})
  end
}

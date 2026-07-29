return {
  'nanozuki/tabby.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VimEnter',
  config = function()
    require('tabby').setup {}
  end,
}

return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'vault1',
        path = '~/obsidian/vault1',
      },
    },
    templates = {
      folder = '~/obsidian/templates',
    },
  },
}

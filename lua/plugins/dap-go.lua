return {
  'leoluz/nvim-dap-go',
  ft = 'go',
  dependencies = {
    'mfussenegger/nvim-dap',
  },
  config = function()
    -- FIXME: is this loading?
    require('dap-go').setup()

    -- Keymaps for debugging Go tests
    vim.keymap.set('n', '<Leader>dt', function()
      require('dap-go').debug_test()
    end, { desc = 'Debug Go test' })

    vim.keymap.set('n', '<Leader>dl', function()
      require('dap-go').debug_last_test()
    end, { desc = 'Debug last Go test' })
  end,
}

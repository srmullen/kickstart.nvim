return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'leoluz/nvim-dap-go',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('dap-go').setup()

      require('dapui').setup()
      require('dap-go').setup()
      require('nvim-dap-virtual-text').setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set('n', '<Leader>du', ':DapUiToggle<CR>', {})
      vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
      vim.keymap.set('n', '<Leader>dc', dap.continue, {})
      vim.keymap.set('n', '<Leader>dr', ":lua require('dapui').open({reset = true})<CR>", {})

      vim.keymap.set('n', '<Leader>?', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.fn.sign_define('DapBreakpoint', { text = '⏺', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    end,
  },
}

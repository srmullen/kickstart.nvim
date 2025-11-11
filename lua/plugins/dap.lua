return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'nvim-neotest/nvim-nio',
      'williamboman/mason.nvim',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('dapui').setup()
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

      vim.keymap.set('n', '<Leader>dn', dap.step_over)
      vim.keymap.set('n', '<Leader>dp', dap.step_out)
      vim.keymap.set('n', '<Leader>dj', dap.step_over)
      vim.keymap.set('n', '<Leader>dn', dap.step_into)
      vim.keymap.set('n', '<Leader>dk', dap.step_back)

      vim.keymap.set('n', '<Leader>?', function()
        require('dapui').eval(nil, { enter = true })
      end)

      vim.fn.sign_define('DapBreakpoint', { text = '⏺', texthl = 'DapBreakpoint', linehl = 'DapBreakpoint', numhl = 'DapBreakpoint' })
    end,
  },
}

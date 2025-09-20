vim.keymap.set('i', 'jj', function()
  vim.cmd 'stopinsert'
  vim.cmd 'wa'
end, { desc = 'exit insert mode and save' })

vim.keymap.set('i', 'JJ', function()
  vim.cmd 'stopinsert'
  require('conform').format({ async = true, lsp_format = 'fallback' }, function(err)
    if err then
      vim.notify('Formatting failed: ' .. err, vim.log.levels.ERROR)
    end
    vim.cmd 'wa'
  end)
end, { desc = 'Format document and save' })

vim.keymap.set('n', '<leader>bp', function()
  vim.fn.setreg('+', vim.api.nvim_buf_get_name(0))
  print(vim.api.nvim_buf_get_name(0))
end, { desc = 'Copy file path' })

vim.keymap.set('n', ']e', function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR, wrap = true, float = true }
end, { desc = 'Next Error' })

vim.keymap.set('n', '[e', function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR, wrap = true, float = true }
end, { desc = 'Previous Error' })

local function toggle_quickfix()
  local windows = vim.fn.getwininfo()
  for _, win in pairs(windows) do
    if win['quickfix'] == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end

vim.keymap.set('n', '<Leader>q', toggle_quickfix, { desc = 'Toggle Quickfix Window' })


vim.keymap.set('i', 'jj', function()
  vim.cmd 'stopinsert'
  vim.cmd 'wa'
end, { desc = 'exit insert mode and save' })

vim.keymap.set('i', 'JJ', function()
  vim.cmd 'stopinsert'
  require('conform').format({ async = true }, function(err)
    if not err then
      vim.cmd 'write'
    else
      vim.notify('Formatting failed: ' .. err, vim.log.levels.ERROR)
    end
  end)
end, { desc = 'Format document and save' })

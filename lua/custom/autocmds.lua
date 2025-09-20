vim.api.nvim_create_autocmd('BufLeave', {
  pattern = '*',
  callback = function()
    local buftype = vim.bo.buftype
    local modified = vim.bo.modified
    local bufname = vim.api.nvim_buf_get_name(0)

    if buftype == '' and modified and bufname ~= '' then
      local ok, err = pcall(vim.cmd, 'write')
      if not ok then
        vim.notify('Auto-save failed: ' .. err, vim.log.levels.WARN)
      end
    end
  end,
})
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    local buftype = vim.bo.buftype
    local bufname = vim.api.nvim_buf_get_name(0)

    if buftype == '' and bufname ~= '' then
      vim.cmd 'Neotree close'
    end
  end,
})

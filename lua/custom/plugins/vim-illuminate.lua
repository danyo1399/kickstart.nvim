return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure {
      delay = 200,
      filetypes_denylist = {
        'dirvish',
        'fugitive',
      },
    }
  end,
}

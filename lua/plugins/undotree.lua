return {
  'mbbill/undotree',
  name = 'undotree',
  priority = 1000,
  config = function()
    vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle, { desc = 'Undo tree' })
  end,
}

-- vim: ts=2 sts=2 sw=2 et

return {
  'mg979/vim-visual-multi',
  branch = 'master',
  config = function()
    vim.g.VM_maps = {
      ['Select All'] = '<M-n>',
      ['Visual All'] = '<M-n>',
      ['Skip Region'] = '<C-x>',
      ['Increase'] = '+',
      ['Decrease'] = '-',
    }
  end,
}

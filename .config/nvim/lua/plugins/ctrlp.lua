vim.g['ctrlp_user_command']  = 'rg %s --files --hidden --glob "!.git/*"'
vim.g['ctrlp_use_caching'] = 0

vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>CtrlPBuffer<CR>', {noremap = true}) -- Open buffer menu
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>CtrlPMRUFiles<CR>', {noremap = true}) -- Open most recently used files menu
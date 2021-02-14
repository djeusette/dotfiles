vim.g['NERDSpaceDelims'] = 1

vim.api.nvim_set_keymap('', '<Leader>cc', ':call NERDComment("n", "AlignLeft")<CR>', {noremap = true}) -- Comment selection
vim.api.nvim_set_keymap('', '<Leader>cu', ':call NERDComment("n", "Uncomment")<CR>', {noremap = true}) -- Uncomment selection

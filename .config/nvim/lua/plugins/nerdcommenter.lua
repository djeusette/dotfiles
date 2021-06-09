vim.g['NERDSpaceDelims'] = 1
vim.g['NERDCreateDefaultMappings'] = 0

vim.api.nvim_set_keymap('', '<Leader>cc', ':call NERDComment("n", "Toggle")<CR>', {noremap = true}) -- Comment selection
-- vim.api.nvim_set_keymap('', '<Leader>cu', ':call NERDComment("n", "Uncomment")<CR>', {noremap = true}) -- Uncomment selection

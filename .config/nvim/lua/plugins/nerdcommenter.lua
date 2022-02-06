vim.g['NERDSpaceDelims'] = 1
vim.g['NERDCreateDefaultMappings'] = 0

vim.api.nvim_set_keymap('', '<Leader>cc', ':call nerdcommenter#Comment("n", "Toggle")<CR>', {noremap = true}) -- Toggle Comment selection

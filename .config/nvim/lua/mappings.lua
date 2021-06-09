function open_terminal()
  vim.cmd('split term://zsh')
  vim.cmd('resize 10')
end

function close_buffer()
  if #vim.fn.getbufinfo('')[1]['windows'] > 1 then vim.cmd 'close'; return end
  local buflisted = vim.fn.getbufinfo {buflisted = 1}
  local last_bufnr = buflisted[#buflisted]['bufnr']
  if vim.fn.bufnr '' == last_bufnr then vim.cmd 'bp' else vim.cmd 'bn' end
  vim.cmd 'bd #'
end

-- Use ; for commands
vim.api.nvim_set_keymap('', ';', ':', {noremap=true})
-- Switch between last used buffers
vim.api.nvim_set_keymap('n', '<leader><leader>', '<c-^>', {noremap=true})
-- Use <Tab> and <S-Tab> to navigate through popup menu
-- vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {noremap=true, expr = true})
-- vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {noremap=true, expr = true})
-- vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? "\\<C-y>\\<CR>" : "\\<C-g>u\\<CR>"', {noremap=true, expr = true})

-- turn terminal to normal mode with escape
vim.api.nvim_set_keymap('t',  '<Esc>', '<C-\\><C-n>', {noremap=true})
-- open terminal
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>lua open_terminal()<CR>', {noremap=true})

-- search and replace
vim.api.nvim_set_keymap('n', '<Leader>s',  ':%s//g<Left><Left>', {noremap=true})
-- close buffer
vim.api.nvim_set_keymap('n', '<leader>w', '<cmd>lua close_buffer()<CR>', {noremap=true})

-- resize
vim.api.nvim_set_keymap('n', '<Leader>+', ':exe "resize " .  (winheight(0) * 3/2)<CR>', { noremap=true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>-', ':exe "resize " .  (winheight(0) * 2/3)<CR>', { noremap=true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>>', ':exe "vertical resize " .  (winwidth(0) * 4/3)<CR>', { noremap=true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader><', ':exe "vertical resize " .  (winwidth(0) * 3/4)<CR>', { noremap=true, silent = true })

-- Delete vs cut --
vim.api.nvim_set_keymap('n', 'd', '"_d', {noremap=true})
vim.api.nvim_set_keymap('v', 'd', '"_d', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>d', '"+d', {noremap=true})
vim.api.nvim_set_keymap('v', '<leader>d', '"+d', {noremap=true})
vim.api.nvim_set_keymap('n', 'D', '"_D', {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>D', '"+D', {noremap=true})
vim.api.nvim_set_keymap('n', 'x', '"_x', {noremap=true})
vim.api.nvim_set_keymap('n', 'X', '"_X', {noremap=true})
vim.api.nvim_set_keymap('n', 'c', '"_c', {noremap=true})
vim.api.nvim_set_keymap('v', 'c', '"_c', {noremap=true})

-- Clear highlights
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>noh<CR>', {noremap=true})

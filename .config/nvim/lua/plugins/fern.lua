function fern_init()
  vim.api.nvim_exec(
  [[
    nmap <buffer> n <Plug>(fern-action-new-path)
    nmap <buffer> r <Plug>(fern-action-reload)
  ]], false)
end

local function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
      for _, def in ipairs(definition) do
        local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
        vim.api.nvim_command(command)
      end
    vim.api.nvim_command('augroup END')
  end
end

vim.api.nvim_set_keymap('', '<Leader>n', '<cmd>Fern . -drawer -toggle -reveal=%<CR>', {noremap = true, silent = true})

nvim_create_augroups({
  FernGroup = {
    {"FileType", "fern", [[lua fern_init()]]};
  }
})
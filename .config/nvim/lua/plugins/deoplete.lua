vim.g['deoplete#enable_at_startup'] = 1

vim.fn['deoplete#custom#var']('tabnine', {
  ['line_limit'] = 500,
  ['max_num_results'] = 5,
})

let g:ElixirLS = {}
let ElixirLS.path = stdpath('config').'/bundle/elixir-ls'
let ElixirLS.lsp = ElixirLS.path.'/release/language_server.sh'
let ElixirLS.cmd = join([
        \ 'KERL_CONFIGURE_OPTIONS="--without-javac --with-ssl=$(brew --prefix openssl)"',
        \ 'asdf install &&',
        \ 'mix do',
        \ 'local.hex --force --if-missing,',
        \ 'local.rebar --force,',
        \ 'deps.get,',
        \ 'compile,',
        \ 'elixir_ls.release'
        \ ], ' ')

function ElixirLS.on_stdout(_job_id, data, _event)
  let self.output[-1] .= a:data[0]
  call extend(self.output, a:data[1:])
endfunction

let ElixirLS.on_stderr = function(ElixirLS.on_stdout)

function ElixirLS.on_exit(_job_id, exitcode, _event)
  if a:exitcode[0] == 0
    echom '>>> ElixirLS compiled'
  else
    echoerr join(self.output, ' ')
    echoerr '>>> ElixirLS compilation failed'
  endif
endfunction

function ElixirLS.compile()
  let me = copy(g:ElixirLS)
  let me.output = ['']
  echom '>>> compiling ElixirLS'
  let me.id = jobstart('cd ' . me.path . ' && git pull && ' . me.cmd, me)
endfunction

" If you want to wait on the compilation only when running :PlugUpdate
" then have the post-update hook use this function instead:

" function ElixirLS.compile_sync()
"   echom '>>> compiling ElixirLS'
"   silent call system(g:ElixirLS.cmd)
"   echom '>>> ElixirLS compiled'
" endfunction


" Then, update the Elixir language server
call coc#config('elixir', {
  \ 'command': g:ElixirLS.lsp,
  \ 'filetypes': ['elixir', 'eelixir']
  \})
call coc#config('elixir.pathToElixirLS', g:ElixirLS.lsp)

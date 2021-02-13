local lsp = require 'lspconfig'

-- LSP setup for Typescript
lsp.tsserver.setup {}

-- LSP setup for Elixir
lsp.elixirls.setup {
  cmd = { "/Users/djeusette/Code/elixir-ls/release/language_server.sh" };
}

-- https://github.com/iamcco/diagnostic-languageserver
-- for eslint and prettier
lsp.diagnosticls.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
  init_options = {
    linters = {
      eslint = {
        command = "./node_modules/.bin/eslint",
        rootPatterns = {"package.json", ".git"},
        debounce = 100,
        args = {
          "--stdin",
          "--stdin-filename",
          "%filepath",
          "--format",
          "json"
        },
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "${message} [${ruleId}]",
          security = "severity"
        },
        securities = {
          [2] = "error",
          [1] = "warning"
        }
      },
    },
    filetypes = {
      javascript = "eslint",
      javascriptreact = "eslint",
      ["javascript.jsx"] = "eslint",
      typescript = "eslint",
      ["typescript.tsx"] = "eslint",
      typescriptreact = "eslint"
    },
    formatFiletypes = {
      javascript = "prettier",
      javascriptreact = "prettier",
      ["javascript.jsx"] = "prettier",
      typescript = "prettier",
      ["typescript.tsx"] = "prettier",
      typescriptreact = "prettier"
    },
    formatters = {
      prettier = {
        command = "./node_modules/.bin/prettier",
        args = {"--stdin", "--stdin-filepath", "%filepath"},
        rootPatterns = {
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.toml",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          ".prettierrc.json5",
          ".prettierrc.js",
          ".prettierrc.cjs",
          "prettier.config.js",
          "prettier.config.cjs"
        }
      }
    }
  }
}

vim.api.nvim_set_keymap('n', '<leader>lp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ln', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>LspDiagnosticsAll<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>lm', '<cmd>lua vim.lsp.buf.rename()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>ls', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>lc', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {noremap = true})
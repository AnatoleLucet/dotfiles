local autocmd = vim.api.nvim_create_autocmd

local lspconfig = require "lspconfig"

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require("neodev").setup()

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "lua_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern ".git",
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
}

lspconfig.eslint.setup {
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "vue",
    "svelte",
  },
  on_attach = function()
    autocmd("BufWritePre", {
      pattern = "*",
      command = "EslintFixAll",
    })
  end,
}

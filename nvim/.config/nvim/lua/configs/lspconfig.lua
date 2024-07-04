local autocmd = vim.api.nvim_create_autocmd

local lspconfig = require "lspconfig"

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "lua_ls",
  "intelephense",
  "svelte",
  -- "tailwindcss",
  "gopls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup {
  root_dir = lspconfig.util.root_pattern ".git",
  capabilities = capabilities,
  on_attach = on_attach,
  on_init = on_init,
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

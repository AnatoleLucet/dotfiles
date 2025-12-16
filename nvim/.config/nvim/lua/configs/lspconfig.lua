local autocmd = vim.api.nvim_create_autocmd

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  "lua_ls",
  "intelephense",
  "svelte",
  "biome",
  "jsonls",
  "yamlls",
  -- "tailwindcss",
  "gopls",
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

vim.lsp.enable("vtsls", {
  root_dir = lspconfig.util.root_pattern ".git",
})

vim.lsp.enable("eslint", {
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
})

vim.lsp.enable("ltex", {
  settings = {
    ltex = {
      -- language = "auto",
      -- language = "fr",
      language = "en-GB",
    },
  },
})

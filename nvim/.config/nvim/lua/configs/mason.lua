local opts = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettierd",
    "eslint-lsp",
    "graphql-language-service-cli",
    "svelte-language-server",
    "intelephense",
    "tailwindcss-language-server",

    -- golang
    "gopls",
    "gofumpt",

    -- rust
    "rust-analyzer",

    -- sys
    "bash-language-server",
    "dockerfile-language-server",
    "yaml-language-server",
  },
  automatic_install = true,
}

require("mason").setup()
require("mason-lspconfig").setup(opts)

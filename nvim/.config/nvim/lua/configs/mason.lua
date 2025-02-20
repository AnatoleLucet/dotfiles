local opts = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- web dev
    "css-lsp",
    "html-lsp",
    -- "typescript-language-server",
    "vtsls",
    "deno",
    "prettierd",
    "eslint-lsp",
    "biome",
    "json-lsp",
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

    -- writing
    "ltex-ls",
  },
  automatic_install = true,
}

require("mason").setup()
require("mason-lspconfig").setup(opts)

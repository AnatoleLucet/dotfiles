local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",

    "html",
    "css",
    "graphql",
    "svelte",

    "javascript",
    "typescript",
    "tsx",

    "php",

    "go",
    "gomod",
    "gosum",

    "rust",

    "dockerfile",
    "bash",
    "yaml",
    "json",

    "markdown",
    "markdown_inline",
  },
  highlight = { enable = true },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

-- git support in nvimtree
M.nvimtree = {

  view = {
    float = {
      enable = true,
      open_win_config = function()
        local gwidth = vim.api.nvim_list_uis()[1].width
        local gheight = vim.api.nvim_list_uis()[1].height

        local nvimtree_width = math.floor(math.min(gwidth * 0.6, 80))
        local nvimtree_height = math.floor(math.min(gheight * 0.6, 40))

        return {
          border = "rounded",
          relative = "editor",
          width = nvimtree_width,
          height = nvimtree_height,
          row = (gheight - nvimtree_height) * 0.4,
          col = (gwidth - nvimtree_width) * 0.5,
        }
      end,
    },
  },

  git = {
    enable = true,
  },

  renderer = {
    add_trailing = true,
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = {
  sources = {
    -- Copilot Source
    { name = "copilot", group_index = 2 },
    -- Other Sources
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return M

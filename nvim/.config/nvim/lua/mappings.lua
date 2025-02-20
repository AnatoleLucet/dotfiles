require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local del = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

del("n", "<leader>x")

-- general
map("n", ";", ":", { desc = "enter command mode", nowait = true })
map("n", "n", "nzz", { desc = "next match", nowait = true })
map("n", "N", "Nzz", { desc = "previous match", nowait = true })

map("n", "<C-m>", "<C-^>", { desc = "last buffer", nowait = true })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up", nowait = true })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down", nowait = true })

map("n", "<leader>bk", "<cmd>bp<bar>sp<bar>bn<bar>bd!<cr>", { desc = "kill buffer", nowait = true, silent = true })

map("n", "<leader>to", "<cmd>tabnew<cr>", { desc = "open new tab", nowait = true, silent = true })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "close current tab", nowait = true, silent = true })

map("n", "[q", "<cmd>cprev<cr>", { desc = "previous quickfix list element", nowait = true, silent = true })
map("n", "]q", "<cmd>cnext<cr>", { desc = "next quickfix list element", nowait = true, silent = true })

-- harpoon
map("n", "<leader>wl", function()
  require("harpoon.ui").toggle_quick_menu()
end, { desc = "Open Harpoon" })
map("n", "<leader>wa", function()
  require("harpoon.mark").add_file()
end, { desc = "Add current buffer to Harpoon" })
map("n", "<C-h>", function()
  require("harpoon.ui").nav_file(1)
end, { desc = "Go to previous file in Harpoon" })
map("n", "<C-j>", function()
  require("harpoon.ui").nav_file(2)
end, { desc = "Go to next file in Harpoon" })
map("n", "<C-k>", function()
  require("harpoon.ui").nav_file(3)
end, { desc = "Go to next file in Harpoon" })
map("n", "<C-l>", function()
  require("harpoon.ui").nav_file(4)
end, { desc = "Go to next file in Harpoon" })

-- lsp
map("n", "gD", function()
  vim.lsp.buf.declaration()
end, { desc = "LSP declaration" })
map("n", "gd", function()
  vim.cmd "Lspsaga goto_definition"
end, { desc = "LSP definition" })
map("n", "K", function()
  vim.cmd "Lspsaga hover_doc"
end, { desc = "LSP hover" })
map("n", "gi", function()
  vim.lsp.buf.implementation()
end, { desc = "LSP implementation" })
map("n", "<leader>ls", function()
  vim.lsp.buf.signature_help()
end, { desc = "LSP signature help" })
map("n", "<leader>D", function()
  vim.cmd "Lspsaga goto_type_definition"
end, { desc = "LSP definition type" })
map("n", "<leader>ra", function()
  vim.cmd "Lspsaga rename"
end, { desc = "LSP rename" })
map("n", "<leader>ca", function()
  vim.cmd "Lspsaga code_action"
end, { desc = "LSP code action" })
map("n", "<leader>cd", function()
  vim.cmd "Lspsaga show_cursor_diagnostics"
end, { desc = "LSP cursor diagnostics" })
map("n", "gr", function()
  vim.cmd "Lspsaga finder"
end, { desc = "LSP references" })
map("n", "<leader>f", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating diagnostic" })
map("n", "[d", function()
  vim.diagnostic.goto_prev()
end, { desc = "Goto prev" })
map("n", "]d", function()
  vim.diagnostic.goto_next()
end, { desc = "Goto next" })
map("n", "<leader>q", function()
  vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })
map("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end, { desc = "LSP formatting" })

map("n", "<leader>ff", function()
  require("telescope.builtin").find_files {
    find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
  }
end, { desc = "Find files" })
map("n", "<leader>gmc", function()
  require("telescope").extensions.live_grep_args.live_grep_args { default_text = "<<<<<<<" }
end, { desc = "Search for merge conflicts" })
map("n", "<leader>fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Search for merge conflicts" })

map("n", "<leader>xx", function()
  require("trouble").toggle { mode = "lsp_workspace_diagnostics" }
end, { desc = "LSP workspace diagnostics" })
map("n", "<leader>xd", function()
  require("trouble").toggle { mode = "lsp_document_diagnostics" }
end, { desc = "LSP document diagnostics" })
map("n", "<leader>xl", function()
  require("trouble").toggle { mode = "loclist" }
end, { desc = "Loclist" })
map("n", "<leader>xq", function()
  require("trouble").toggle { mode = "quickfix" }
end, { desc = "Quickfix" })
map("n", "<leader>xr", function()
  require("trouble").toggle { mode = "references" }
end, { desc = "References" })

-- zenmode
map("n", "<leader>z", function()
  require("zen-mode").toggle {
    window = { width = 160 },
  }
end, { desc = "List workspace folders" })

-- ssr
map("n", "<leader>sr", function()
  require("ssr").open()
end, { desc = "Open SSR" })
map("x", "<leader>sr", function()
  require("ssr").open()
end, { desc = "Open SSR" })

-- nvim-tree
map("n", "<A-e>", "<cmd>NvimTreeToggle<cr>zz", { desc = "Toggle NvimTree" })

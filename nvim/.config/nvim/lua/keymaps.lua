local map = vim.keymap.set

vim.g.mapleader = " "

-- general
map("v", "<Space>", "<nop>", { silent = true }) -- noop space to prevent <leader> conflict

map("n", "n", "nzz", { desc = "next match" })
map("n", "N", "Nzz", { desc = "previous match" })

map("n", "<C-m>", "<C-^>", { desc = "last buffer" })
map("n", "<C-u>", "<C-u>zz", { desc = "scroll up" })
map("n", "<C-d>", "<C-d>zz", { desc = "scroll down" })

map("n", "<Esc>", "<cmd>nohl<cr>", { desc = "hide search highlights" })

map("n", "<leader>bk", "<cmd>bp<bar>sp<bar>bn<bar>bd!<cr>", { desc = "kill buffer", silent = true })

map("n", "[q", "<cmd>cprev<cr>", { desc = "previous quickfix list element", silent = true })
map("n", "]q", "<cmd>cnext<cr>", { desc = "next quickfix list element", silent = true })

map("x", "<leader>p", '"_dP', { desc = "paste without yaking", nowait = true })
map({"n", "v"}, "<leader>y", '"+y', { desc = "copy selection to system clipboard", nowait = true })
map("n", "<leader>Y", ":%y+<cr>", { desc = "copy file content to system clipboard", nowait = true })
map({"n", "v"}, "<leader>d", '"_d', { desc = "delete without yanking", nowait = true })


-- neotree
map('n', '<M-e>', '<cmd>Neotree toggle<cr>', { desc = 'neotree toggle', silent = true })


-- fff
map('n', '<leader>ff', function() require('fff').find_files() end, { desc = 'find files' })
map('n', '<leader>fw', function() require('fff').live_grep() end, { desc = 'live grep' })
map('n', '<leader>gmc', function() require('fff').live_grep({ query = '<<<<<<<' }) end, { desc = 'search for merge conflicts' })


-- floatty
map('n', '<M-i>', function() floatty.toggle() end, { desc = 'floatty toggle' })
map('t', '<M-i>', function() floatty.toggle() end, { desc = 'floatty toggle' })


-- harpoon
map("n", "<leader>wl", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "open Harpoon" })
map("n", "<leader>wa", function() require("harpoon.mark").add_file() end, { desc = "add current buffer to Harpoon" })
map("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end, { desc = "go to previous file in Harpoon" })
map("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end, { desc = "go to next file in Harpoon" })
map("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end, { desc = "go to next file in Harpoon" })
map("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end, { desc = "go to next file in Harpoon" })


-- lsp
map("n", "K", vim.lsp.buf.hover, { desc = "lsp hover" })

map("n", "[d", vim.diagnostic.goto_prev, { desc = "goto prev" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "goto next" })

map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "lsp rename" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "cursor diagnostics" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "lsp code action" })

map("n", "gd", vim.lsp.buf.definition, { desc = "lsp definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "lsp declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "lsp implementation" })
map("n", "gr", vim.lsp.buf.references, { desc = "lsp references" })

map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "diagnostic setloclist" })

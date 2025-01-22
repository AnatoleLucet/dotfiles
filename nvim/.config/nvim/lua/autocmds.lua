local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format {
      async = false,
      filter = function(client)
        return client.name ~= "tsserver" and client.name ~= "vtsls"
      end,
    }
  end,
})

autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "Search",
      timeout = 200,
    }
  end,
})

autocmd("LspAttach", {
  pattern = "*",
  callback = function()
    -- saga
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

    -- lsp
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
  end,
})

autocmd("RecordingEnter", {
  pattern = "*",
  callback = function()
    print "Recording"
  end,
})

autocmd("RecordingLeave", {
  pattern = "*",
  callback = function()
    print "Recording stopped"
  end,
})

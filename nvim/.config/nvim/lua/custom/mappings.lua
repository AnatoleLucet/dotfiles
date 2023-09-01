---@type MappingsTable
local M = {}

M.disabled = {
	n = {
		["<leader>x"] = "",
	},
}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["n"] = { "nzz", "next match", opts = { nowait = true } },
		["N"] = { "Nzz", "previous match", opts = { nowait = true } },

		["<C-m>"] = { "<C-^>", "last buffer", opts = { nowait = true } },
		["<C-u>"] = { "<C-u>zz", "scroll up", opts = { nowait = true } },
		["<C-d>"] = { "<C-d>zz", "scroll down", opts = { nowait = true } },

		["<leader>bk"] = { "<cmd>bp<bar>sp<bar>bn<bar>bd!<cr>", "kill buffer", opts = { nowait = true, silent = true } },

		["<leader>to"] = { "<cmd>tabnew<cr>", "open new tab", opts = { nowait = true, silent = true } },
		["<leader>tc"] = { "<cmd>tabclose<cr>", "close current tab", opts = { nowait = true, silent = true } },

		["[q"] = { "<cmd>cprev<cr>", "previous quickfix list element", opts = { nowait = true, silent = true } },
		["]q"] = { "<cmd>cnext<cr>", "next quickfix list element", opts = { nowait = true, silent = true } },
	},
}

M.harpoon = {
	n = {
		["<leader>wl"] = {
			function()
				require("harpoon.ui").toggle_quick_menu()
			end,
			"Open Harpoon",
		},
		["<leader>wa"] = {
			function()
				require("harpoon.mark").add_file()
			end,
			"Add current buffer to Harpoon",
		},
		["<C-h>"] = {
			function()
				require("harpoon.ui").nav_file(1)
			end,
			"Go to previous file in Harpoon",
		},
		["<C-j>"] = {
			function()
				require("harpoon.ui").nav_file(2)
			end,
			"Go to next file in Harpoon",
		},
		["<C-k>"] = {
			function()
				require("harpoon.ui").nav_file(3)
			end,
			"Go to next file in Harpoon",
		},
		["<C-l>"] = {
			function()
				require("harpoon.ui").nav_file(4)
			end,
			"Go to next file in Harpoon",
		},
	},
}

M.lspconfig = {
	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"LSP declaration",
		},
		["gd"] = {
			function()
				vim.cmd("Lspsaga goto_definition")
			end,
			"LSP definition",
		},
		["K"] = {
			function()
				vim.cmd("Lspsaga hover_doc")
			end,
			"LSP hover",
		},
		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"LSP implementation",
		},
		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"LSP signature help",
		},
		["<leader>D"] = {
			function()
				vim.cmd("Lspsaga goto_type_definition")
			end,
			"LSP definition type",
		},
		["<leader>ra"] = {
			function()
				require("nvchad_ui.renamer").open()
			end,
			"LSP rename",
		},
		["<leader>ca"] = {
			function()
				vim.cmd("Lspsaga code_action")
			end,
			"LSP code action",
		},
		["<leader>cd"] = {
			function()
				vim.cmd("Lspsaga show_cursor_diagnostics")
			end,
			"LSP cursor diagnostics",
		},
		["gr"] = {
			function()
				vim.cmd("Lspsaga lsp_finder")
			end,
			"LSP references",
		},
		["<leader>f"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},
		["[d"] = {
			function()
				vim.diagnostic.goto_prev()
			end,
			"Goto prev",
		},
		["]d"] = {
			function()
				vim.diagnostic.goto_next()
			end,
			"Goto next",
		},
		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},
		["<leader>fm"] = {
			function()
				vim.lsp.buf.format({ async = true })
			end,
			"LSP formatting",
		},
	},
}

M.telescope = {
	n = {
		["<leader>ff"] = {
			function()
				require("telescope.builtin").find_files({
					find_command = { "rg", "--files", "--iglob", "!.git", "--hidden" },
				})
			end,
			"Find files",
		},
		["<leader>gmc"] = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args({ default_text = "<<<<<<<" })
			end,
			"Search for merge conflicts",
		},
		["<leader>fw"] = {
			function()
				require("telescope").extensions.live_grep_args.live_grep_args()
			end,
			"Search for merge conflicts",
		},
	},
}

M.trouble = {
	n = {
		["<leader>xx"] = {
			function()
				require("trouble").toggle({ mode = "lsp_workspace_diagnostics" })
			end,
			"LSP workspace diagnostics",
		},
		["<leader>xd"] = {
			function()
				require("trouble").toggle({ mode = "lsp_document_diagnostics" })
			end,
			"LSP document diagnostics",
		},
		["<leader>xl"] = {
			function()
				require("trouble").toggle({ mode = "loclist" })
			end,
			"Loclist",
		},
		["<leader>xq"] = {
			function()
				require("trouble").toggle({ mode = "quickfix" })
			end,
			"Quickfix",
		},
		["<leader>xr"] = {
			function()
				require("trouble").toggle({ mode = "references" })
			end,
			"References",
		},
	},
}

M.zenmode = {
	n = {
		["<leader>z"] = {
			function()
				require("zen-mode").toggle()
			end,
			"List workspace folders",
		},
	},
}

return M

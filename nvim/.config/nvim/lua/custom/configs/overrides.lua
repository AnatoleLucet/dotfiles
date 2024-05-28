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

M.mason = {
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
}

-- git support in nvimtree
M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
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

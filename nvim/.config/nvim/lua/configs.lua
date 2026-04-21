local M = {}

-- functions to run on install/update
M.pack_hooks = {
	["fff.nvim"] = function(ev)
		if not ev.data.active then
			vim.cmd.packadd("fff.nvim")
		end
		require("fff.download").download_or_build_binary()
	end,
}

---- configs ----

M.mini = {
	surround = { delay = 0 },

	hipatterns = {
		highlighters = {
			fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "_MiniHipatternsFix" },
			hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "_MiniHipatternsHack" },
			todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "_MiniHipatternsTodo" },
			note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "_MiniHipatternsNote" },
		},
	},
}

M.tokyonight = {
	style = "night", -- storm / moon / night / day
	on_highlights = function(hl, c)
		-- builtins
		hl.CursorLineNr = { fg = c.fg_dark }

		-- mini.hipatterns
		hl._MiniHipatternsFix = { fg = c.red1, bold = true }
		hl._MiniHipatternsHack = { fg = c.yellow, bold = true }
		hl._MiniHipatternsTodo = { fg = c.blue1, bold = true }
		hl._MiniHipatternsNote = { fg = c.teal, bold = true }

		-- ibl
		hl._IblIdent = { fg = c.bg_highlight, bold = true }
		hl._IblScope = { fg = c.fg_gutter, bold = true }

		-- illuminate
		hl.IlluminatedWordText = { bg = c.bg_highlight }

		-- lualine
		hl._LualineRecording = { fg = c.orange }

		-- treesitter
		hl["@keyword"] = { fg = c.purple, italic = false }
		hl["@keyword.function"] = { fg = c.purple, italic = false }
		hl["@keyword.modifier"] = { fg = c.purple, italic = false } -- pub, priv, mut...
		hl["@keyword.coroutine"] = { fg = c.purple, italic = false } -- async/await
		hl["@keyword.import"] = { fg = c.purple, italic = false }
		hl["@keyword"] = { fg = c.magenta, italic = false }
		hl["@keyword.function"] = { fg = c.magenta, italic = false } -- fn/func/def
		hl["@keyword.modifier"] = { fg = c.magenta2, italic = false }
		hl["@function.method.call"] = { fg = c.blue2 } -- foo.bar()
		hl["@function.method"] = { fg = c.blue } -- method definitions
		hl["@variable"] = { fg = c.fg_dark } -- general variables
		hl["@variable.parameter"] = { fg = c.orange } -- function params
		hl["@punctuation.delimiter"] = { fg = c.red } -- , ; .
		hl["@punctuation.bracket"] = { fg = c.magenta } -- ( ) [ ] { }
		hl["@operator"] = { fg = c.fg_dark } -- = ! > < etc
	end,
	on_colors = function(colors)
		colors.border = colors.bg_highlight
		colors.border_highlight = colors.fg_gutter
	end,
}

M.noice = {
	lsp = {
		signature = { enabled = false },
	},
}

M.noneckpain = {
	width = 140,
	autocmds = {
		enableOnVimEnter = "safe",
	},
}

M.neotree = {
	popup_border_style = "", -- "" to use nvim 'winborder'
	enable_git_status = true,
	enable_diagnostics = true,
	filesystem = {
		filtered_items = {
			hide_dotfiles = false, -- unix
			hide_hidden = false, -- windows
			hide_gitignored = true,
		},
		follow_current_file = {
			enabled = true,
			leave_dirs_open = false, -- close auto-expanded dirs when leaving
		},
	},
	window = {
		position = "float",
		popup = {
			title = "Filesystem",
			size = { width = "45%", height = "80%" },
		},
		mappings = {
			["/"] = "none", -- disable builtin search

			["o"] = { "open", nowait = true },
			-- need to disable defaults for 'o' to work:
			["oc"] = "none",
			["od"] = "none",
			["og"] = "none",
			["om"] = "none",
			["on"] = "none",
			["os"] = "none",
			["ot"] = "none",

			["I"] = { "toggle_hidden", nowait = true },
		},
	},
}

M.lualine = {
	sections = {
		lualine_b = {
			"branch",
			"diff",
			"diagnostics",
			{
				"macro",
				fmt = function()
					local reg = vim.fn.reg_recording()
					if reg ~= "" then
						return "@" .. reg
					end
					return nil
				end,
				color = function()
					local fg = vim.api.nvim_get_hl(0, { name = "_LualineRecording", link = false }).fg
					return { fg = string.format("#%06x", fg) }
				end,
				draw_empty = false,
			},
		},
	},
}

M.fff = {
	lazy_sync = true, -- start syncing only when the picker is open
	title = "Find",
	prompt = "> ",
	keymaps = {
		close = "<C-c>",
	},
}

M.gitsigns = {
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	current_line_blame = true,
	current_line_blame_opts = {
		delay = 0,
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
	},
}

M.floatty = {
	window = {
		border = "single",
		width = 0.6,
		height = 0.6,
	},
}

M.ibl = {
	indent = { char = "▏", highlight = "_IblIdent" },
	scope = { show_start = false, highlight = "_IblScope" },
}

M.illuminate = {
	delay = 100,
	providers = { "lsp", "treesitter", "regex" },
}

M.copilot = {
	suggestion = {
		auto_trigger = false,
		keymap = {
			accept = "<M-o>",
			-- dismiss = "<M-p>",
			next = "<M-]>",
			prev = "<M-[>",
		},
	},
}

M.filetypes = {
	lua = {
		lsp = { "lua-language-server" },
		formatter = { "stylua" },
	},
	javascript = {
		lsp = { "vtsls", "denols", "eslint-lsp" },
		formatter = { "prettierd", "biome" },
	},
	typescript = {
		lsp = { "vtsls", "denols", "eslint-lsp" },
		formatter = { "prettierd", "biome" },
	},
	javascriptreact = {
		lsp = { "vtsls", "eslint-lsp" },
		formatter = { "prettierd", "biome" },
	},
	typescriptreact = {
		lsp = { "vtsls", "eslint-lsp" },
		formatter = { "prettierd", "biome" },
	},
	svelte = {
		lsp = { "svelte-language-server", "eslint-lsp" },
		formatter = { "prettierd" },
	},
	css = {
		lsp = { "css-lsp", "tailwindcss-language-server" },
		formatter = { "prettierd" },
	},
	html = {
		lsp = { "html-lsp" },
		formatter = { "prettierd" },
	},
	json = {
		lsp = { "json-lsp" },
		formatter = { "prettierd", "biome" },
	},
	graphql = {
		lsp = { "graphql-language-service-cli" },
		formatter = { "prettierd" },
	},
	yaml = {
		lsp = { "yaml-language-server" },
		formatter = { "prettierd" },
	},
	go = {
		lsp = { "gopls" },
		formatter = { "gofumpt" },
	},
	rust = {
		lsp = { "rust-analyzer" },
	},
	zig = {
		lsp = { "zls" },
	},
	sh = {
		lsp = { "bash-language-server" },
	},
	dockerfile = {
		lsp = { "docker-language-server" },
		linter = { "hado-lint" },
	},
	markdown = {
		lsp = { "ltex-ls-plus" },
	},
}

M.conform = {
	formatters_by_ft = {},
	format_on_save = { timeout_ms = 500, lsp_fallback = true },
}
for ft, config in pairs(M.filetypes) do
	if config.formatter then
		M.conform.formatters_by_ft[ft] = config.formatter
	end
end

M.lint = {
	linters_by_ft = {},
}
for ft, config in pairs(M.filetypes) do
	if config.linter then
		M.lint.linters_by_ft[ft] = config.linter
	end
end

M.blink = {
	cmp = {
		cmdline = { enabled = true },
		appearance = { nerd_font_variant = "normal" },
		fuzzy = { implementation = "prefer_rust" },
		sources = { default = { "lsp", "snippets", "buffer", "path" } },

		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
		},

		signature = {
			enabled = true,
			window = { border = "single" },
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					scrollbar = false,
					border = "single",
				},
			},
			menu = {
				scrollbar = false,
				border = "single",
			},
		},
	},
}
return M

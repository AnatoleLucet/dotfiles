local autocmd = vim.api.nvim_create_autocmd

-- auto install and start treesitter parsers
autocmd("FileType", {
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match)
		local available_langs = require("nvim-treesitter").get_available()
		local is_available = vim.tbl_contains(available_langs, lang)

		if is_available then
			local installed_langs = require("nvim-treesitter").get_installed()
			local installed = vim.tbl_contains(installed_langs, lang)

			if not installed then
				require("nvim-treesitter").install(lang):wait()
			end

			vim.treesitter.start()
			require("nvim-treesitter").indentexpr()
		end
	end,
})

-- keymap to close quickfix list
autocmd("FileType", {
	pattern = { "qf" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>cclose<cr><cmd>wincmd p<cr>", { silent = true, buffer = true })
	end,
})

-- lint after write
autocmd("BufWritePost", {
	callback = function()
		require("lint").try_lint()
	end,
})

-- highlight yank
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "Search", timeout = 200 })
	end,
})

-- refresh lualine on recording enter/leave
-- (needed for custom section in configs.lua)
autocmd({ "RecordingEnter", "RecordingLeave" }, {
	callback = function()
		require("lualine").refresh()
	end,
})

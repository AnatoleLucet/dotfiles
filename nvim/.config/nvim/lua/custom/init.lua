require("custom.options")

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({
			async = false,
			filter = function(client)
				return client.name ~= "tsserver"
			end,
		})
	end,
})

autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "Search",
			timeout = 200,
		})
	end,
})

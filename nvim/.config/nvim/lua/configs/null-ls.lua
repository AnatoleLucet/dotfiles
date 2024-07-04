local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	-- webdev stuff
	b.formatting.prettierd.with({
		filetypes = vim.list_extend({
			"svelte",
		}, b.formatting.prettierd.filetypes),
	}),

	-- Lua
	b.formatting.stylua,

	-- golang
	b.formatting.gofumpt,

	-- others
	b.diagnostics.write_good,
}

null_ls.setup({
	debug = true,
	sources = sources,
})

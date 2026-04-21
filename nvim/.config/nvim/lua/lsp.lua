local configs = require("configs")
local registry = require("mason-registry")
local lsp_to_mason = require("mason-lspconfig.mappings").get_mason_map()

-- install tools
local seen = {}
for _, config in pairs(configs.filetypes) do
	for _, group in ipairs({ config.lsp, config.formatter, config.linter }) do
		for _, tool in ipairs(group or {}) do
			local name = lsp_to_mason[tool] or tool
			if not seen[name] then
				seen[name] = true
				local ok, pkg = pcall(registry.get_package, name)
				if ok and not pkg:is_installed() then
					pkg:install()
				end
			end
		end
	end
end

---- customs lsp configs ----

-- lua
vim.lsp.config("lua_ls", {
	settings = { Lua = { diagnostics = { globals = { "vim" } } } },
})

-- nodejs
vim.lsp.config("vtsls", {
	root_markers = { "package.json" },
	single_file_support = false, -- don't activate on bare .ts files
})

-- deno
vim.lsp.config("denols", {
	root_markers = { "deno.json", "deno.jsonc" },
	single_file_support = false, -- same
})

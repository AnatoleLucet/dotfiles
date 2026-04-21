local configs = require("configs")

-- run config hooks when a pack is installed/updated
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		local hook = configs.pack_hooks[name]
		if hook and (kind == "install" or kind == "update") then
			hook(ev)
		end
	end,
})

----- plugins -----

-- lspconfig
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

-- treesitter
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- treesitter-textobjects
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" })
require("nvim-treesitter-textobjects").setup()

-- treesitter-context
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })
require("treesitter-context").setup()

-- tokyonight
vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
require("tokyonight").setup(configs.tokyonight)
vim.cmd.colorscheme("tokyonight")

-- noice
vim.pack.add({
	"https://github.com/folke/noice.nvim",
	-- dependencies
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/rcarriga/nvim-notify",
})
require("noice").setup(configs.noice)

-- mini
vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })
require("mini.pairs").setup()
require("mini.surround").setup(configs.mini.surround)
require("mini.hipatterns").setup(configs.mini.hipatterns)

-- no-neck-pain
vim.pack.add({ "https://github.com/shortcuts/no-neck-pain.nvim" })
require("no-neck-pain").setup(configs.noneckpain)

-- fff
vim.pack.add({ "https://github.com/dmtrKovalenko/fff.nvim" })
vim.g.fff = configs.fff

-- gitsigns
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require("gitsigns").setup(configs.gitsigns)

-- conflict
vim.pack.add({ "https://github.com/niekdomi/conflict.nvim" })
require("conflict").setup()

-- neo-tree
vim.pack.add({
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = vim.version.range("3") },
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
})
require("neo-tree").setup(configs.neotree)

-- lualine
vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	-- dependencies
	"https://github.com/nvim-tree/nvim-web-devicons",
})
require("lualine").setup(configs.lualine)

-- auto-session
vim.pack.add({ "https://github.com/rmagatti/auto-session" })
require("auto-session").setup()

-- floatty
vim.pack.add({ "https://github.com/ingur/floatty.nvim" })
_G.floatty = require("floatty").setup(configs.floatty)

-- ibl
vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
require("ibl").setup(configs.ibl)

-- illuminate
vim.pack.add({ "https://github.com/RRethy/vim-illuminate" })
require("illuminate").configure(configs.illuminate)

-- colorizer
vim.pack.add({ "https://github.com/catgoose/nvim-colorizer.lua" })
require("colorizer").setup()

-- bqf
vim.pack.add({ "https://github.com/kevinhwang91/nvim-bqf" })

-- harpoon
vim.pack.add({
	"https://github.com/ThePrimeagen/harpoon",
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
})

-- copilot
vim.pack.add({ "https://github.com/zbirenbaum/copilot.lua" })
require("copilot").setup(configs.copilot)

-- mason
vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
})
require("mason").setup()
require("mason-lspconfig").setup()

-- conform
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup(configs.conform)

-- nvim-lint
vim.pack.add({ "https://github.com/mfussenegger/nvim-lint" })
require("lint").linters_by_ft = configs.lint.linters_by_ft

-- blink.cmp
vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("*") } })
require("blink.cmp").setup(configs.blink.cmp)

local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- lsp
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/neodev.nvim",
        config = function()
          require("neodev").setup()
        end,
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
    opts = overrides.lspconfig,
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function(_, opts)
      require("lspsaga").setup(opts)
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require "configs.mason"
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        config = function() end,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
  },

  -- syntax highlithing
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-context",
        config = function(_, opts)
          require("treesitter-context").setup(opts)
        end,
      },
      {
        "windwp/nvim-ts-autotag",
        config = function()
          require("nvim-ts-autotag").setup()
        end,
      },
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        config = function()
          require("ts_context_commentstring").setup()
        end,
        dependencies = {
          {
            "numToStr/Comment.nvim",
            config = function()
              require("Comment").setup {
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
              }
            end,
          },
        },
      },
    },
  },

  -- ui
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "NvChad/nvim-colorizer.lua",
  },
  {
    "folke/zen-mode.nvim",
  },
  {
    "f-person/git-blame.nvim",
    event = "UIEnter",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "UIEnter",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup {
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = false,
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = false,        -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      require("telescope").load_extension "live_grep_args"
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "cshuaimin/ssr.nvim",
    event = "VeryLazy",
    config = function()
      require("ssr").setup()
    end,
  },
  -- {
  -- 	"rasulomaroff/reactive.nvim",
  -- 	event = "VeryLazy",
  -- 	config = function()
  -- 		require("reactive").setup({
  -- 			builtin = {
  -- 				cursorline = true,
  -- 				cursor = true,
  -- 				modemsg = true,
  -- 			},
  -- 		})
  -- 	end,
  -- },

  -- rest
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_root_dir = vim.fn.stdpath "data" .. "/sessions/",
      }
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<M-o>",
            -- dismiss = "<M-p>",
            next = "<M-]>",
            prev = "<M-[>",
          },
        },
      }
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    config = function()
      require("gitlinker").setup {
        callbacks = {
          ["git.ayaline.com"] = function(url_data)
            url_data.host = "gitlab.ayaline.com"
            return require("gitlinker.hosts").get_gitlab_type_url(url_data)
          end,
        },
      }
    end,
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
  },
  {
    "nacro90/numb.nvim",
    event = "BufEnter",
    config = function()
      require("numb").setup()
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    event = "BufEnter",
    config = function()
      require("git-conflict").setup {
        default_mappings = true,
        highlights = {
          incoming = "ConflictMarkerOurs",
          current = "ConflictMarkerTheirs",
        },
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "jamestthompson3/nvim-remote-containers",
    event = "VeryLazy",
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins

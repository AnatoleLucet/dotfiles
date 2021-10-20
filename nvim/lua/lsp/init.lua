local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }

  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>Telescope lsp_definitions<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>Lspsaga rename<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua require("telescope.builtin").lsp_code_actions(require("telescope.themes").get_ivy())<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>Lspsaga code_action<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<space>cc", "<cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<space>co", "<cmd>Trouble<CR>", opts)
  buf_set_keymap("n", "<space>s", "<cmd>Telescope lsp_document_symbols<CR>", opts)

  if client.resolved_capabilities.document_formatting then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
  end

  -- doesnt seems to work very well
  -- require('lsp_signature').on_attach()
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    underline = true,
    update_in_insert = true,
    virtual_text = true,
  }
)

local servers = {
  {
    name = "bashls",
    useContainers = true,
  },
  {
    name = "cssls",
    useContainers = false,
  },
  --[[ {
    name = "denols",
    useContainers = true,
  }, ]]
  {
    name = "dockerls",
    useContainers = true,
  },
  {
    name = "gopls",
    useContainers = false,
  },
  {
    name = "graphql",
    useContainers = false,
  },
  {
    name = "html",
    useContainers = true,
  },
  {
    name = "jsonls",
    useContainers = true,
  },
  --[[ {
    name = "stylelint_lsp",
    useContainers = false,
  }, ]]
  {
    name = "svelte",
    useContainers = true,
  },
  {
    name = "tsserver",
    useContainers = false,
  },
  {
    name = "vimls",
    useContainers = false,
  },
  {
    name = "sumneko_lua",
    useContainers = true,
  },
  {
    name = "yamlls",
    useContainers = true,
  },
  {
    name = "vuels",
    useContainers = true,
  },
  {
    name = "terraformls",
    useContainers = true,
  },
  {
    name = "rust_analyzer",
    useContainers = true,
  },
  {
    name = "pyright",
    useContainers = true,
  },
}
-- vim.lsp.set_log_level("debug")

for _, lsp in ipairs(servers) do
  local opts = {
    on_attach = on_attach,
  }

  --[[ if lsp.name == "gopls" then
    local cwd = vim.fn.getcwd()

    opts.cmd = {"gopls", "-debug", "/tmp/logs"}
    vim.lsp.set_log_level("debug")

    opts.cmd_env = {
      GOROOT = cwd .. "/bazel-" .. cwd:match("/([^/]*)$") .. "/external/go_sdk",
      GOPACKAGESDRIVER_BAZEL_QUERY = "kind(go_binary, //...)",
      GOPACKAGESDRIVER = "bazel run -- @io_bazel_rules_go//go/tools/gopackagesdriver"
    }

    print(vim.inspect(opts.cmd_env))
  end ]]

  if lsp.useContainers then
    opts.cmd = require("lspcontainers").command(lsp.name)
  end

  nvim_lsp[lsp.name].setup(opts)
end

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  sources = {
    { name = 'path' },
    { name = 'calc' },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'emoji' },
  },

  completion = {
    completeopt = 'menu,menuone,noinsert',
  }
})

require("luasnip/loaders/from_vscode").load()

require("nvim-treesitter.configs").setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    -- max_file_lines = 1000,
    colors = {
      "#7dcfff",
      "#ff9e64",
      "#1abc9c",
      "#c0caf5",
      "#f7768e",
      "#bb9af7",
      -- "#9ece6a",
    },
  },
  textsubjects = {
    enable = true,
    keymaps = {
      ["<cr>"] = "textsubjects-smart",
      -- [";"] = "textsubjects-container-outer",
    },
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})

require('lspsaga').init_lsp_saga({
  use_saga_diagnostic_sign = true,
  error_sign = '',
  warn_sign = '',
  hint_sign = ' ',
  border_style = 'round',
  code_action_prompt = { enabled = false },
})


-- lsp-install
local function setup_servers()
  require("lspinstall").setup()

  local installed_servers = require("lspinstall").installed_servers()
  local servers = {
    {
      install_name = "typescript",
      lsp_name = "tsserver"
    },
    {
      install_name = "deno",
      lsp_name = "denols"
    },
  }

  for _, server in pairs(servers) do
    local is_server_installed = false
    for _, installed_server in ipairs(installed_servers) do
      if installed_server == server.install_name then
        is_server_installed = true
        break
      end
    end

    print(vim.inspect(installed_servers), server.install_name)

    if is_server_installed == false then
      require("lspinstall").install_server(server.install_name)
    end

    local config = {}

    require("lspconfig")[server.lsp_name].setup(config)
  end
end

-- deosn't work
--[[ setup_servers()
-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end ]]

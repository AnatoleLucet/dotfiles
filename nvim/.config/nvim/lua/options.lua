local o = vim.o
local opt = vim.opt

-- line numbers
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.ruler = false -- hide line/col counter

-- cursor
o.cursorline = true -- enable highlight on the line the cursor is on
o.cursorlineopt = "number" -- number | line | both

-- statusline
o.laststatus = 3 -- single global statusline across all windows
o.showmode = false -- don't show -- INSERT -- (statusline handles it)

-- splits
o.splitbelow = true
o.splitright = true
o.splitkeep = "screen" -- keep text in place when splitting

-- indenting
o.expandtab = true -- spaces instead of tabs
o.shiftwidth = 2
o.tabstop = 2
o.softtabstop = 2
o.smartindent = true -- auto indent new lines

-- search
o.ignorecase = true -- make search case insensitive
o.smartcase = true -- case sensitive if query has uppercase letters

-- appearance
o.winborder = "single" -- add borders for lsp hover etc
o.termguicolors = true -- enable 24-bit RGB colors
o.wrap = false -- don't wrap lines
o.signcolumn = "yes" -- always show, prevents layout shift
opt.fillchars = { eob = " " } -- hide ~ at end of buffer

-- behaviour
-- o.clipboard = 'unnamedplus' -- sync with system clipboard
o.mouse = "a" -- enable mouse support (yeah im weird)
o.undofile = true -- persist undo history across sessions
o.confirm = true -- ask to save instead of erroring on unsaved changes
o.updatetime = 250 -- faster swap write and CursorHold events
o.timeoutlen = 400 -- time to wait for mapped sequence to complete (ms)
opt.shortmess:append("sI") -- suppress search and intro messages
opt.whichwrap:append("<>[]hl") -- allow h/l and arrows to cross line boundaries

-- others
vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

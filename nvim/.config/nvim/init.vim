call plug#begin('~/.vim/plugged')

Plug 'psliwka/vim-smoothie'
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'drewtempelmeyer/palenight.vim'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" https://github.com/coc-extensions/coc-svelte/issues/13
" Plug 'coc-extensions/coc-svelte', {'do': 'yarn install --frozen-lockfile'}
" Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
" Plug 'tpope/vim-commentary'
" Plug 'b3nj5m1n/kommentary'
Plug 'numToStr/Comment.nvim'

" Plug 'evanleck/vim-svelte', {'branch': 'main'}
"
Plug 'tpope/vim-surround'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
" Plug 'pangloss/vim-javascript'

" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'chemzqm/vim-jsx-improve'

" Plug 'dense-analysis/ale'
" Plug 'nathunsmitty/nvim-ale-diagnostic'

" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'hoob3rt/lualine.nvim'
Plug 'arkav/lualine-lsp-progress'

" Plug 'thaerkh/vim-workspace'
Plug 'LucHermitte/lh-brackets'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/lh-style'
" Plug 'voldikss/vim-floaterm'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'morhetz/gruvbox'
Plug 'ThePrimeagen/vim-be-good'
Plug 'metakirby5/codi.vim'
Plug 'camspiers/animate.vim'
Plug 'rhysd/clever-f.vim'
Plug 'matze/vim-move'
Plug 'rhysd/git-messenger.vim'
Plug 'liuchengxu/vista.vim'
Plug 'wellle/targets.vim'
Plug 'kyazdani42/nvim-web-devicons'

" Plug 'romgrk/barbar.nvim'
Plug 'akinsho/nvim-bufferline.lua'

Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-dispatch'
" Plug 'romgrk/doom-one.vim'
" Plug 'GustavoPrietoP/doom-one.vim'
Plug 'stsewd/fzf-checkout.vim'
" Plug 'alvan/vim-closetag'
Plug 'windwp/nvim-ts-autotag'
Plug 'vimlab/split-term.vim'
Plug 'vim-scripts/guicolorscheme.vim'
" Plug 'ghifarit53/tokyonight-vim'
Plug 'folke/tokyonight.nvim'

Plug 'sheerun/vim-polyglot'
Plug 'ghifarit53/daycula-vim' , {'branch' : 'main'}

Plug 'kkvh/vim-docker-tools'
Plug 'mbbill/undotree'

Plug 'liuchengxu/vim-which-key'
Plug 'junkblocker/git-time-lapse'

Plug 'terryma/vim-multiple-cursors'
Plug 'bronson/vim-visual-star-search'

" meh
" Plug 'chaoren/vim-wordmotion'

Plug 'tpope/vim-abolish'
Plug 'markonm/traces.vim'

" Plug 'junegunn/goyo.vim'
Plug 'Pocco81/TrueZen.nvim'
Plug 'folke/zen-mode.nvim'

Plug 'glepnir/dashboard-nvim'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'
Plug 'chr4/nginx.vim'
" Plug 'szw/vim-maximizer'

Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}

Plug 'itchyny/vim-gitbranch'
Plug 'chrisbra/csv.vim'

Plug 'vimwiki/vimwiki'

Plug 'tpope/vim-vinegar'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'phaazon/hop.nvim'
Plug 'nacro90/numb.nvim'

Plug 'edluffy/specs.nvim'

Plug 'rmagatti/auto-session'
Plug 'rmagatti/session-lens'

Plug 'numtostr/FTerm.nvim'

Plug 'ruifm/gitlinker.nvim'
Plug 'famiu/nvim-reload'

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-emoji'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'commit': '668de0951a36ef17016074f1120b6aacbe6c4515'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate' }
Plug 'p00f/nvim-ts-rainbow'
Plug 'machakann/vim-highlightedyank'
Plug 'RRethy/vim-illuminate'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'ray-x/lsp_signature.nvim'
Plug 'folke/trouble.nvim'
Plug 'kabouzeid/nvim-lspinstall'
" Plug 'glepnir/lspsaga.nvim'
" Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}
Plug 'tami5/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'mfussenegger/nvim-ts-hint-textobject'

Plug 'romgrk/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

Plug 'f-person/git-blame.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'TimUntersberger/neogit'

Plug 'norcalli/nvim-colorizer.lua'
Plug 'lewis6991/spellsitter.nvim'

Plug 'windwp/nvim-autopairs'

" Plug 'sbdchd/neoformat'
Plug 'mfussenegger/nvim-lint'

Plug 'johngrib/vim-game-code-break'
Plug 'johngrib/vim-game-snake'

Plug 'sindrets/diffview.nvim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'folke/todo-comments.nvim'
Plug 'alec-gibson/nvim-tetris'

Plug 'matbme/JABS.nvim'

Plug 'dyng/ctrlsf.vim'

Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'marko-cerovac/material.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'projekt0n/github-nvim-theme'
Plug 'pwntester/octo.nvim'
" Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'tpope/vim-unimpaired'
Plug 'junkblocker/git-time-lapse'

Plug 'simrat39/symbols-outline.nvim'
Plug 'mileszs/ack.vim'
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'lewis6991/impatient.nvim'

Plug 'github/copilot.vim'

Plug 'chentoast/marks.nvim'

Plug 'nvim-neorg/neorg'
Plug 'nvim-neorg/neorg-telescope'

" Plug 'hkupty/iron.nvim'
Plug 'm-demare/hlargs.nvim'

call plug#end()

set nu
set relativenumber
set tabstop=2
set shiftwidth=2
set cmdheight=1
set noshowmode
set noswapfile
set nocompatible
set ma
set mouse=a
set timeoutlen=500
set cursorline
set fileencodings=utf-8
set ignorecase
set infercase
set guifont=MonoLisa\ Nerd\ Font\ 12
set completeopt=menuone,noselect,noinsert
" set spell
set signcolumn=yes
set colorcolumn=99999
set fillchars+=diff:╱
" set wrap!

let mapleader=" "
nnoremap <silent> <ESC> :nohlsearch<CR>
map <leader>y "+y
map <leader>p "+p
nnoremap <silent> <leader>q :w<cr>:q<cr>
nnoremap <silent> <leader>Q :q!<cr>
vnoremap <leader>\ y:%s/<C-r>"//g<left><left>
nnoremap <leader>\ y:%s/<C-r><C-w>//g<left><left>
map +y "+y
map +p "+p
tnoremap <silent><F3> <C-\><C-n>:TZFocus<CR>i
nnoremap <silent><F3> :TZFocus<CR>

nnoremap <C-m> <C-^>

lua require("lsp")

" better o/O https://stackoverflow.com/a/27820229/8990411
function! s:NewLineInsertExpr( isUndoCount, command )
	if !v:count || v:count == 1
			return a:command
	endif

	let l:reverse = { 'o': 'O', 'O': 'o' }

	return (a:isUndoCount && v:count ? "\<C-\>\<C-n>" : '') .
	\ a:command . "$\<Esc>m`" .
	\ (v:count - 1) . l:reverse[a:command] . "\<Esc>" .
	\ 'g``"_s'
endfunction
nnoremap <silent> <expr> o <SID>NewLineInsertExpr(1, 'o')
nnoremap <silent> <expr> O <SID>NewLineInsertExpr(1, 'O')

nnoremap <silent> <A-\> :!i3-msg -t command fullscreen toggle<CR>:sleep 150m<CR>:ZenMode<CR>

" hlArgs
lua require('hlargs').setup()
autocmd ColorScheme * highlight! link Hlargs TSParameter

" Marks
lua require('marks').setup({})

" Impatient
lua require('impatient')

" Wilder
call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#python_file_finder_pipeline({
      \       'file_command': ['find', '.', '-type', 'f', '-printf', '%P\n'],
      \       'dir_command': ['find', '.', '-type', 'd', '-printf', '%P\n'],
      \       'filters': ['fuzzy_filter', 'difflib_sorter'],
      \     }),
      \     wilder#cmdline_pipeline(),
      \     wilder#python_search_pipeline(),
      \   ),
      \ ])
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'max_height': 10
      \ }))

" Diffview
lua << EOF
require('diffview').setup({
  enhanced_diff_hl = true,
})
EOF

" Ack
if executable('ag')
  let g:ackprg = 'ag --hidden --vimgrep'
endif

" LuaSnip
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

" nvim-ts-hint-textobject
omap <silent> m :<C-U>lua require('tsht').nodes()<CR>
vnoremap <silent> m :lua require('tsht').nodes()<CR>

" Comment
lua << EOF
require('Comment').setup({
  pre_hook = function(ctx)
    local U = require('Comment.utils')
    local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

    return require('ts_context_commentstring.internal').calculate_commentstring {
      key = type,
    }
  end,
})
EOF


" Kommentary
" lua << EOF
" require('kommentary.config').configure_language('typescriptreact', {
"   single_line_comment_string = 'auto',
"   multi_line_comment_strings = 'auto',
"   hook_function = function()
"     require('ts_context_commentstring.internal').update_commentstring()
"   end,
" })
" EOF

" Trouble
nnoremap <leader>o :Trouble<CR>

" TrueZen
lua require("true-zen").setup({ ataraxis = { force_when_plus_one_window = true } })
lua require("zen-mode").setup({ window = { width = .60 } })
nnoremap <F4> :ZenMode<CR><CR>

" Todo comments
lua require("todo-comments").setup()

" Buffergator
nnoremap <silent> <leader>bm :JABSOpen<CR>

" ALE 
lua << EOF
-- stdin limited to ~279 lines
-- eslint cjs module not found in stdin mode
require("lint").linters.eslint = {
  cmd = "eslint",
  stdin = false,
  args = {"-f=json"},
  stream = "stdout",
  ignore_exitcode = true,
  parser = function(output, bufnr)
    local decoded = vim.fn.json_decode(output)
    local diagnostics = {}

    for _, message in pairs(decoded[1].messages or {}) do
      table.insert(diagnostics, {
        range = {
          ["start"] = {
            line = message.line - 1,
            character = message.column - 1,
          },
          ["end"] =  {
            line = message.endLine - 1,
            character = message.endColumn - 1,
          },
        },
        severity = message.severity,
        message = message.message .. " eslint(" .. message.ruleId .. ")",
      })
    end

    return diagnostics
  end,
}

require("lint").linters_by_ft = {
  javascript = {"eslint"},
  typescript = {"eslint"},
  javascriptreact = {"eslint"},
  typescriptreact = {"eslint"},
  -- go = {"golangcilint"},
}
EOF
" let g:ale_linters_explicit = 1
" let b:ale_linters = ['eslint', 'standard', 'tslint', 'tsserver', 'typecheck', 'xo']
" lua require('nvim-ale-diagnostic')

" Neoformat
" if isdirectory($PWD .'/node_modules')
"   let $PATH .= ':' . $PWD . '/node_modules/.bin'
" endif
" augroup fmt
"   autocmd!
"   " au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
"   au BufWritePre * Dispatch :Neoformat
"   au BufWritePre * Dispatch :lua require("lint").try_lint()
" augroup END
" let g:neoformat_enabled_javascript = ['prettier', 'deno fmt', 'prettier-eslint']

" Autopairs
:lua require('nvim-autopairs').setup({ disable_filetype = { "TelescopePrompt" } })

" Spellsitter
" :lua require('spellsitter').setup({ hl = 'error', captures = { "comment" } })

" Neogit
:lua require('neogit').setup()

" Nvim Tree
lua require("nvim-tree").setup()
nnoremap <leader>e :NvimTreeFindFile<CR>:NvimTreeOpen<CR>
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_lsp_diagnostics = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_auto_close = 1
let g:nvim_tree_width = 39

" Telescope
nnoremap <silent><leader>. :Telescope file_browser<CR>
augroup telescopeMaps
  au VimEnter * noremap <silent> <leader>t :Telescope<CR>
  " unmap buffergator's
  au VimEnter * unmap <leader>tc
  au VimEnter * unmap <leader>to
augroup END

" Gitlinker
lua << EOF
local opts = {
  callbacks = {
    ['git.ayaline.com'] = function(url_data)
      url_data.host = 'gitlab.ayaline.com'
      return require('gitlinker.hosts').get_gitlab_type_url(url_data)
    end,
    ['***REMOVED***'] = require('gitlinker.hosts').get_gitlab_type_url,
  }
}

require('gitlinker').setup(opts)
EOF

" FTerm
nnoremap <silent> <A-t> :lua require("FTerm").toggle()<cr>
tnoremap <silent> <A-t> <C-\><C-n>:lua require("FTerm").toggle()<cr>

" Specs
" lua << EOF
" local opts = {
"   min_jump = 15,
"   popup = {
"     resizer = require('specs').empty_resizer,
"     winhl = "ConflictMarkerBegin",
"     blend = 50,
"     resizer = function(width, ccol, cnt)
"       if cnt < 100 then
"         local winwidth = vim.api.nvim_win_get_width(0)
"         local col = vim.api.nvim_win_get_position(0)[2]
"         print(winwidth, col)
"         return {winwidth, col}
"       else
"         return nil
"       end
"     end
"   } 
" }
" require('specs').setup(opts)
" EOF

" Num
:lua require('numb').setup()

" Vimspector
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>di <Plug>VimspectorBalloonEval

command! CopyFilePathAndLine let @+ = join([fnamemodify(expand("%"), ":~:."),  line(".")], ':')
command! CopyFilePath let @+ = fnamemodify(expand("%"), ":~:.")

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         40,
  \    'vimspectorBPCond':     9,
  \    'vimspectorBPDisabled': 8,
  \    'vimspectorPC':         999,
  \ }

" Hop
lua require('hop').setup()
nnoremap s :HopChar2<cr>
nnoremap S :HopLine<cr>
vnoremap s <Cmd>HopChar2<cr>
vnoremap S <Cmd>HopLine<cr>

" Wiki
if has("gui_running") || has('nvim-0.4')
  hi def VimwikiDelText term=strikethrough cterm=strikethrough gui=strikethrough
endif

" Dashboard
let g:dashboard_default_executive = 'telescope'
" let g:dashboard_preview_command = "cat"
" let g:dashboard_preview_pipeline = 'lolcat'
" let g:dashboard_preview_file = '~/.config/nvim/logo'
" let g:dashboard_preview_file_height = 12
" let g:dashboard_preview_file_width = 80
" let g:dashboard_custom_header =<< trim END
" =================     ===============     ===============   ========  ========
" \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //
" ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .||
" || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||
" ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||
" || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . ||
" ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .||
" || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . ||
" ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.||
" ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `||
" ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   ||
" ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   ||
" ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   ||
" ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   ||
" ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   ||
" ||.=='    _-'                                                     `' |  /==.||
" =='    _-'                        N E O V I M                         \/   `==
" \   _-'                                                                `-_   /
"  `''                                                                      ``'
" END
let g:dashboard_custom_header = [
    \'',
    \'   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ',
    \'    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
    \'          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ',
    \'           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
    \'          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
    \'   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
    \'  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
    \' ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
    \' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ',
    \'      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
    \'       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
    \'',
    \]



" lh brackets
let g:marker_define_jump_mappings = 0

" Typescript
" let g:typescript_ignore_typescriptdoc = 0
let g:yats_host_keyword = 1

" Closetag
" let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
" let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.tsx'
" let g:closetag_emptyTags_caseSensitive = 1
" let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = ''

" Checkout
nnoremap <silent> <leader>gb :GBranches<cr>
nnoremap <silent> <leader>gco :GBranches checkout<cr>
let g:fzf_checkout_merge_settings = v:false
let g:fzf_branch_actions = {
\ 'checkout': {
\   'prompt': 'Checkout> ',
\   'execute': 'echo system("{git} checkout -t {branch}")',
\   'multiple': v:false,
\   'keymap': 'enter',
\   'required': ['branch'],
\   'confirm': v:false,
\ },
\}

" Conflict
let g:conflict_marker_highlight_group = ''
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

" Airline
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"
" let g:airline_left_sep = "\uE0BC"
" let g:airline_right_sep = "\uE0BE"
" let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
" let g:airline_theme="deus"
lua << EOF
require("lualine").setup({
  options = { theme = "tokyonight" },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {
      {
        'diagnostics',
        sources = {'nvim_diagnostic'},
      },
      {
        'filename',
        path = 1,
      },
      'lsp_progress'
    },
    lualine_x = {
      'encoding',
      'fileformat',
      'filetype'
    },
    lualine_y = {
      'progress'
    },
    lualine_z = {'location'}
  },
})
EOF

" Bufferline
lua require("bufferline").setup({ separator_style = "thin" })
nnoremap <silent> <C-s> :BufferLinePick<CR>
nnoremap <silent> <leader>bd :BufferLineSortByDirectory<CR>
nnoremap <silent> <leader>be :BufferLineSortByExtension<CR>
nnoremap <silent>    <A-.> :BufferLineCycleNext<CR>
nnoremap <silent>    <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent>    <A->> :BufferLineMoveNext<CR>
nnoremap <silent>    <A-<> :BufferLineMovePrev<CR>
nnoremap <silent> <leader>bk :bp<bar>sp<bar>bn<bar>bd!<CR>

" Vista
let g:vista_cursor_delay = 20
let g:vista_default_executive = 'coc'
" nnoremap <silent> <C-v> :Vista!!<CR>
" nmap <silent> <leader>v :Vista finder<CR>

" Move
let g:move_key_modifier = 'C'

" Animate
nnoremap <silent> <C-Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <C-Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <C-Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <C-Right> :call animate#window_delta_width(-10)<CR>

" Fugitive
nnoremap <silent> <leader>gs :Neogit kind=vsplit<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Dispatch! git push<CR>
nnoremap <leader>gl :Dispatch! git pull<CR>
nnoremap <leader>glo :DiffviewFileHistory<CR>
nnoremap <leader>gst :DiffviewOpen<CR>
nnoremap <silent> <leader>gd :Gdiffsplit<CR><C-w>l
nnoremap <silent> <leader>gcd :Gvdiff!<CR><C-w>J
nnoremap <silent> gdr :diffget //0<CR>
nnoremap <silent> gdh :diffget //2<CR>
nnoremap <silent> gdl :diffget //3<CR>
command! Gf :Dispatch! git fetch
command! Gl :Dispatch! git pull
command! Gp :Git push
command! Gpf :Git push -f
command! -nargs=1 Grb :Git rebase <args>
command! Grbc :Git rebase --continue
command! Grba :Git rebase --abort
command! Grbs :Git rebase --skip
command! -nargs=1 Gcb :Git checkout -b <args>
command! -nargs=* Gb :Git branch<args>
command! Gpsup :execute "Git push --set-upstream origin " . gitbranch#name()

" FZF
nnoremap <silent> <C-p> :Telescope find_files find_command=rg,--ignore,--hidden,--files,-g,!.git<CR>
nnoremap <silent> <leader>bl :Telescope buffers<CR>
" nnoremap <silent> ; :Telescope commands<CR>
nnoremap <silent> <leader>gmc :Ag <<<<<<<<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_commands_expect = 'alt-enter'

" Ident line
let g:indentLine_char = '▏'
set list lcs=tab:▏\ 
let g:indentLine_fileTypeExclude = ['dashboard', 'json']
let g:indent_blankline_show_end_of_line = v:false
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_show_current_context = v:true
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_context_patterns = ['class', 'function', 'method', 'if', 'while', 'for', 'arguments']
let g:indent_blankline_buftype_exclude = ['terminal']
" hi link IndentBlanklineContextChar Directory

" Theme
set t_Co=256
" also set onedark for missing syntax in doom-one
" colorscheme one
" colorscheme doom-one
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
" colorscheme material
" let g:material_style = 'palenight'
syntax enable
set pumblend=20
set winblend=20
set pumheight=15

" FloaTerm
" let g:floaterm_keymap_new    = '<C-space>nt'
" let g:floaterm_keymap_toggle = '<C-space>t'
" let g:floaterm_keymap_prev   = '<C-A-h>'
" let g:floaterm_keymap_next   = '<C-A-l>'
" let g:floaterm_keymap_kill   = '<C-A-k>'

" Sessions
nnoremap <silent> <leader><tab> :SearchSession<cr>:lua require("FTerm").exit()<cr>
lua << EOF
local opts = {
  log_level = 'error',
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
}

require('auto-session').setup(opts)
EOF
" don't save nerdtree / coc-explorer
set sessionoptions-=blank

" Colors things
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif


" Coc
" let b:coc_suggest_disable = 1
" " \ 'coc-tsserver',
" let g:coc_global_extensions = [
" \ 'coc-snippets',
" \ 'coc-eslint',
" \ 'coc-prettier',
" \ 'coc-json',
" \ 'coc-html',
" \ 'coc-css',
" \ 'coc-emmet',
" \ 'coc-highlight',
" \ 'coc-pairs',
" \ 'coc-explorer',
" \ 'coc-go',
" \ 'coc-git',
" \ 'coc-yank',
" \ 'coc-spell-checker',
" \ 'coc-todolist',
" \ 'coc-docker',
" \ 'coc-vimlsp',
" \ 'coc-marketplace',
" \ 'coc-sh',
" \ 'coc-phpls',
" \ 'coc-flutter',
" \ ]

" coc-explorer
" nmap <silent> <leader>e :CocCommand explorer<CR>
" function! CocExplorerInited(filetype, bufnr)
" 	call setbufvar(a:bufnr, '&number', 1)
" 	call setbufvar(a:bufnr, '&relativenumber', 1)
" endfunction

" From Coc's doc
" nmap <silent> <leader>r :CocCommand document.renameCurrentWord<CR>

" " if hidden is not set, TextEdit might fail.
" set hidden

" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=100

" " don't give |ins-completion-menu| messages.
" set shortmess+=c

" " always show signcolumns
" set signcolumn=yes

" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" hi link CocHighlightText Visual

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" " Remap for format selected region
" xmap <leader>F  <Plug>(coc-format-selected)
" nmap <leader>F  <Plug>(coc-format-selected)
" nmap <leader>f  :Format<cr>

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)

" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <leader>c :<C-u>CocList diagnostics<cr>
" " Find symbol of current document
" nnoremap <silent> <leader>o :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <leader>s :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <leader>j :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <leader>k :<C-u>CocPrev<CR>
" " Fuzzy CocAction
" nnoremap <silent> <leader>a :CocAction<CR>

" " Remap next / prev autocomplete
" imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" " save
" nmap <silent> <leader>w :<C-u>silent! call CocAction('runCommand', 'editor.action.organizeImport')<CR>:<C-u>silent! Format<CR>:w<CR>
" nmap <silent> <leader>W :w<CR>

" " Git status
" nnoremap <silent> <leader>g  :<C-u>CocList --normal gstatus<cr>

" " Yanks
" nnoremap <silent> <leader>Y  :<C-u>CocList -A --normal yank<cr>
" nnoremap <silent> <leader>cy :CocCommand yank.clean<cr>

" " kill node process on vim leave (less memory usage)
" autocmd VimLeavePre * :call coc#rpc#kill()
" autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

" Remap split focus
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>l <C-w>l

" Messenger
nnoremap <silent> <leader>gm :GitMessenger<CR>

nnoremap <silent> <leader>nt :tabnew<CR>
nnoremap <silent> <leader>ns :vsplit<CR>

" Docker
" nnoremap <silent> <leader>d :DockerToolsToggle<cr>
let g:dockertools_default_all = 0
let g:dockertools_term_position = 'lefta'
let g:dockertools_logs_position = 'lefta'

lua << EOF
require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--hidden",
      "--smart-case"
    },
  },
})
EOF
nnoremap <silent> <leader>/ :Telescope live_grep<cr>

com! SynStack call SyntaxStack()
fu! SyntaxStack() 
    let synNames = []
    let lastID       = 0
    for id in synstack(line("."), col("."))
        call add(synNames, synIDattr(id, "name"))
        let lastID = id
    endfor
    if lastID == 0 | return | end
    echohl synIDattr(synIDtrans(lastID), "name")
    echon synIDattr(synIDtrans(lastID), "name")
    echon ' ' . string(synNames)
    echohl None
endfu "

set incsearch

" Colorizer (need to stay at the end for some reason)
:lua require("colorizer").setup()

" keep at end
lua require('gitsigns').setup()

" hi link TelescopeBorder LineNr
" hi link TelescopePromptBorder LineNr
" hi link TelescopeResultsBorder LineNr
" hi link TelescopePreviewBorder LineNr

" hi DiffText guibg=#344f69

" hi link illuminatedWord Visual

" hi link NvimTreeIndentMarker IndentBlankLineChar

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

hi link TSNodeUnmatched HopUnmatched

set shortmess+=c

set nu
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

set noswapfile 

autocmd Filetype json let g:indentLine_enabled = 0

map <C-o> :NERDTreeToggle<CR>

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
\ if v:insertmode == 'i' |
\   silent execute '!echo -ne "\e[6 q"' | redraw! |
\ elseif v:insertmode == 'r' |
\   silent execute '!echo -ne "\e[4 q"' | redraw! |
\ endif
au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif


call plug#begin('~/.vim/plugged')

Plug 'Yggdroot/indentLine'

Plug 'junegunn/vim-easy-align'

Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'https://github.com/drewtempelmeyer/palenight.vim.git'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdcommenter'

Plug 'evanleck/vim-svelte'

Plug 'jiangmiao/auto-pairs'

Plug 'tpope/vim-surround'

Plug 'terryma/vim-multiple-cursors'

Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdtree'

Plug 'editorconfig/editorconfig-vim'

Plug 'mattn/emmet-vim'

Plug 'dense-analysis/ale'

Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'fatih/vim-go', { 'tag': '*' }

Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug '~/my-prototype-plugin'

call plug#end()


set background=dark
set t_Co=256
colorscheme palenight


if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"if (has("termguicolors"))
  "set termguicolors
"endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

call plug#begin('~/.vim/plugged')

Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-commentary'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
" Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'chemzqm/vim-jsx-improve'
Plug 'dense-analysis/ale'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'thaerkh/vim-workspace'
Plug 'LucHermitte/lh-brackets'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/lh-style'
Plug 'voldikss/vim-floaterm'
Plug 'justinmk/vim-sneak'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'morhetz/gruvbox'
Plug 'ThePrimeagen/vim-be-good'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'metakirby5/codi.vim'
Plug 'camspiers/animate.vim'
Plug 'rhysd/clever-f.vim'
Plug 'matze/vim-move'
Plug 'rhysd/git-messenger.vim'
Plug 'liuchengxu/vista.vim'
Plug 'wellle/targets.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-dispatch'
Plug 'romgrk/doom-one.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'alvan/vim-closetag'

call plug#end()

set nu
set relativenumber
set tabstop=2
set shiftwidth=2
set cmdheight=1
set noshowmode
set noswapfile
set ma
set mouse=a
set timeoutlen=500
set cursorline


let mapleader=" "
nnoremap <silent> <ESC> :call coc#float#close_all()<CR>:nohlsearch<CR>
" not sure about theses
" inoremap {<space> {<space><space>}<left><left>
" inoremap {<cr> {<cr>}<c-o><s-o>
" inoremap [<cr> [<cr>]<c-o><s-o>
" inoremap (<cr> (<cr>)<c-o><s-o>
map <leader>y "+y
map <leader>p "+p

" better o/O https://stackoverflow.com/a/27820229/8990411
function! s:NewLineInsertExpr( isUndoCount, command )
	if ! v:count
			return a:command
	endif

	let l:reverse = { 'o': 'O', 'O' : 'o' }
	return (a:isUndoCount && v:count ? "\<C-\>\<C-n>" : '') .
	\ a:command . "$\<Esc>m`" .
	\ v:count . l:reverse[a:command] . "\<Esc>" .
	\ 'g``"_s'
endfunction
nnoremap <silent> <expr> o <SID>NewLineInsertExpr(1, 'o')
nnoremap <silent> <expr> O <SID>NewLineInsertExpr(1, 'O')

" autoclose preview window when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Gutter
let g:gitgutter_map_keys = 0

" Closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = ''


" Checkout
nnoremap <silent> <leader>gb :GBranches<cr>

" Conflict
let g:conflict_marker_highlight_group = ''
let g:conflict_marker_begin = '^<<<<<<< .*$'
let g:conflict_marker_end   = '^>>>>>>> .*$'

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

" Airline
set guifont=DroidSansMono\ Nerd\ Font\ 12
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"
let g:airline_left_sep = "\uE0BC"
let g:airline_right_sep = "\uE0BE"
let g:airline_section_z = airline#section#create(["\uE0A1" . '%{line(".")}' . "\uE0A3" . '%{col(".")}'])
let g:airline_theme='deus'

" Barbar
nnoremap <silent> <C-s> :BufferPick<CR>
nnoremap <silent> <leader>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <leader>bl :BufferOrderByLanguage<CR>
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
nnoremap <silent>    <A-;> :BufferNext<CR>
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
nnoremap <silent> <leader>bk :BufferClose<CR>

" Vista
let g:vista_cursor_delay = 20
let g:vista_default_executive = 'coc'
nnoremap <silent> <C-v> :Vista!!<CR>
nmap <silent> <leader>v :Vista finder<CR>

" Move
let g:move_key_modifier = 'C'

" Animate
nnoremap <silent> <C-Up>    :call animate#window_delta_height(30)<CR>
nnoremap <silent> <C-Down>  :call animate#window_delta_height(-30)<CR>
nnoremap <silent> <C-Left>  :call animate#window_delta_width(30)<CR>
nnoremap <silent> <C-Right> :call animate#window_delta_width(-30)<CR>

" Fugitive
nnoremap <silent> <leader>gs :G<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <leader>gco :G checkout<space>
nnoremap <leader>gp :Dispatch! git push<CR>
nnoremap <leader>gl :Dispatch! git pull<CR>
nnoremap <leader>glo :Glog<CR>
nnoremap <silent> <leader>gd :Gvdiff!<CR>
nnoremap <silent> gdh :diffget //2<CR>
nnoremap <silent> gdl :diffget //3<CR>

" Hexokinase (colors highlight)
let g:Hexokinase_highlighters = ['virtual']

" FZF
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <leader>bl :Buffers<CR>
nnoremap <silent> ; :Commands<CR>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
let g:fzf_commands_expect = 'alt-enter'

" Ident line
let g:indentLine_char = '▏'
set list lcs=tab:▏\ 
" disable indent line for json
autocmd Filetype json let g:indentLine_enabled = 0

" Sneak
let g:sneak#label = 1

" Theme
set t_Co=256
" also set onedark for missing syntax in doom-one
colorscheme onedark
colorscheme doom-one
syntax enable
set background=dark
set pumblend=20
set winblend=20
set pumheight=15

" FloaTerm
let g:floaterm_keymap_new    = '<C-space>nt'
let g:floaterm_keymap_toggle = '<C-space>t'
let g:floaterm_keymap_prev   = '<C-A-h>'
let g:floaterm_keymap_next   = '<C-A-l>'
let g:floaterm_keymap_kill   = '<C-A-k>'

" Workspaces
let g:workspace_autosave_always = 0
let g:workspace_autosave = 0
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_undodir=$HOME . '/.vim/undo-dir'
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
let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-tsserver',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-html',
\ 'coc-css',
\ 'coc-svelte',
\ 'coc-emmet',
\ 'coc-highlight',
\ 'coc-pairs',
\ 'coc-explorer',
\ 'coc-go',
\ 'coc-git',
\ 'coc-yank',
\ 'coc-spell-checker',
\ 'coc-todolist',
\ ]

" coc-explorer
nmap <silent> <leader>e :CocCommand explorer<CR>
function! CocExplorerInited(filetype, bufnr)
	call setbufvar(a:bufnr, '&number', 1)
	call setbufvar(a:bufnr, '&relativenumber', 1)
endfunction

" From Coc's doc
nmap <silent> <leader>r :CocCommand document.renameCurrentWord<CR>

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
hi link CocHighlightText Visual

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>F  <Plug>(coc-format-selected)
nmap <leader>f  :Format<cr>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>
" Show commands
nnoremap <silent> <leader>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k :<C-u>CocPrev<CR>
" Fuzzy CocAction
nnoremap <silent> <leader>a :CocAction<CR>

" Remap next / prev autocomplete
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" save
nmap <silent> <leader>w :call CocAction('runCommand', 'editor.action.organizeImport')<CR>:Format<CR>:w<CR>
nmap <silent> <leader>W :w<CR>

" Git status
nnoremap <silent> <leader>g  :<C-u>CocList --normal gstatus<cr>

" Yanks
nnoremap <silent> <leader>Y  :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> <leader>cy :CocCommand yank.clean<cr>

" kill node process on vim leave (less memory usage)
autocmd VimLeavePre * :call coc#rpc#kill()
autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

" Remap split focus
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>l <C-w>l

" Messenger
nnoremap <silent> <leader>gm :GitMessenger<CR>

nnoremap <silent> <leader>nt :tabnew<CR>
nnoremap <silent> <leader>ns :vsplit<CR>

" Todos
nnoremap <silent> <leader>tl :CocList todolist<cr>
nnoremap <silent> <leader>tn :CocCommand todolist.create<cr>
nnoremap <silent> <leader>tc :CocCommand todolist.clear<cr>
nnoremap <silent> <leader>tw :w<cr>:q!<cr>

" keep at end
hi tsxTagName guifg=#51afef
hi Directory gui=bold guifg=#51afef

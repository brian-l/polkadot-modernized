call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/NeoSolarized'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/tcomment_vim'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/tlib_vim'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-addon-mw-utils'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-airline'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-colors-solarized'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-fireplace'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-gitgutter'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-javascript'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-jinja2-syntax'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-json'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-jsx'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-less'
Plug 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ NEOVIM_CONFIG_DIR }}/vim-terraform'

call plug#end()
filetype plugin indent on

syntax enable

"Settings
set ic
set colorcolumn=132
set backup
set backupdir={{ DOTFILES_HOME_DIRECTORY }}/{{ VIM_TMP_DIR }}
set swapfile
set wrap
set number
set t_Co=256

"Sets how many lines of history VIM has to remember
set history=700

"2 spaces tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set viminfo='20,<1000,s10,h
set backspace=2
set autoindent
set nocompatible
set showmatch
"Do not redraw between macros (speed)
set lazyredraw
"No beeps
set vb t_vb=
"Highlights search
set hls
"Shows line and column number at the bottom
set ruler
"Incremental search
set incsearch
"Ignore case sensitivity on searches
set ignorecase
"Shows that you are typing as command
set showcmd
"highlight current line
if v:version > 700
    set cursorline
    hi CursorLine cterm=NONE ctermbg=237
	" hi CursorLine		gui=bold,reverse	cterm=NONE ctermbg=17 guibg=17
	" hi CursorColumn gui=bold,reverse	cterm=NONE ctermbg=17 guibg=17
endif
"Statusline
set laststatus=2
"Scroll from the center
set scrolloff=1000
"Remember the last editing position
autocmd BufReadPost *
    \ if ! exists("g:leave_my_cursor_position_alone") |
    \     if line("'\"") > 0 && line ("'\"") <= line("$") |
    \         exe "normal g'\"" |
    \     endif |
    \ endif
"light solarized is blinding
set background=dark
"Solarized theme
colorscheme solarized
" Salt states are yaml
au BufRead,BufNewFile *.sls set filetype=yaml

highlight SignColumn ctermbg=0
highlight ColorColumn ctermbg=237
highlight ExtraWhitespace ctermbg=81 guibg=red

match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"Mappings
nnoremap ; :
nnoremap <silent> <C-l> :nohl<CR><C-l>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:gitgutter_max_signs=10000
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_lost=1
let g:syntastic_enable_signs=1
let g:sparkupExecuteMapping = '<C-e>'
let g:vim_json_syntax_conceal=0


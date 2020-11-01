set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/snipmate-snippets'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/syntastic'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/tcomment_vim'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/tlib_vim'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-addon-mw-utils'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-airline'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-colors-solarized'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-fireplace'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-gitgutter'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-javascript'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-json'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-jsx'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-less'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-snipmate'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/vim-terraform'
Plugin 'file:///{{ DOTFILES_HOME_DIRECTORY }}/{{ BUNDLE_DIR }}/YouCompleteMe'


call vundle#end()
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

let g:gitgutter_max_signs=10000
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_lost=1
let g:syntastic_enable_signs=1
let g:sparkupExecuteMapping = '<C-e>'
let g:vim_json_syntax_conceal=0


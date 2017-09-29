" ----------
" Vim Config
" ----------
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to " come first or last, like Vundle and sourcing the machine-local config.
" Instead, add it to one of the files in .vim/init, or create a new one.

set nocompatible               " be iMproved
filetype off                   " required!

" Based on http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let need_to_install_plugins=0

if empty(system("grep lazy_load ~/.vim/bundle/vundle/autoload/vundle.vim"))
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !rm -rf ~/.vim/bundle/vundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let need_to_install_plugins=1
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

Plugin 'gmarik/vundle'
" :PluginInstall to run this file
"
" Colorschemes
Plugin 'flazz/vim-colorschemes'

"
" Elixir / Phoenix
"
Plugin 'elixir-lang/vim-elixir'

"
" Ruby / Rails
"
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'nelstrom/vim-textobj-rubyblock'

"
" General Editing
"
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'Julian/vim-textobj-variable-segment'
Plugin 'kana/vim-textobj-line'
Plugin 'thinca/vim-textobj-between'
Plugin 'sjl/gundo.vim'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-bufferline'
Plugin 'camelcasemotion'
Plugin 'mgamba/edit-plus'
Plugin 'brysgo/quickfixfix'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'regreplop.vim'
Plugin 'Peeja/insert_mode_background_color'
Plugin 'vim-scripts/L9'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'YankRing.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-projectionist'

" Searching
"
Plugin 'mileszs/ack.vim'
Plugin 'epmatsw/ag.vim'
Plugin 'kien/ctrlp.vim'

"
" Navigation
"
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

"
" Languages
"
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'chrisbra/csv.vim'

" Golang settings
Plugin 'fatih/vim-go'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"
" Development Tool Integration
"
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-dispatch'
Plugin 'carlobaldassi/ConqueTerm'
Plugin 'sjl/vitality.vim'
Plugin 'mdelillo/vim-simple-bdd'

call vundle#end()
"
" Set status line
"
set statusline=%f\ -\ FileType:\ %y\ -\ %l
set statusline+=/
set statusline+=%L
set statusline +=%1*\ %n\ %* 

filetype plugin indent on

"
" Syntax/Spellchecking
"
syntax on
set spell spelllang=en_us

if need_to_install_plugins == 1
  echo "Installing plugins via Vundle. Please ignore warnings afterwards."
  echo "This is a one-time operation that will take about a minute..."
  silent! PluginInstall
  echo "Done installing Vundle plugins!"
  q
end

if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

runtime! init/**.vim

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

au BufRead,BufNewFile *.hamlc set ft=haml


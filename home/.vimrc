set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdcommenter'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'godlygeek/tabular'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-rails'

Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Load plugins and indentation preferences based on file type.
filetype on
filetype plugin on
filetype indent on

" Remap leader to ",".
let mapleader = ","

" Jump to the marked line and column on ', and only the marked line on `.
nnoremap ' `
nnoremap ` '

" Alias :WQ, :W and :Q to their lowercase variants
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Keep 1000 commands worth of history.
set history=1000

" Allow 1000 levels of undo.
set undolevels=1000

" Ignore some files when autocompleting.
set wildignore=*.swp,*.pyc,*.class

" Change the terminal's title.
set title

" Don't create backup or swap files.
set nobackup
set noswapfile

" Work with the system clipboard
set clipboard=unnamed

" Maintain at least 3 lines worth of context around the cursor.
set scrolloff=3

imap <Tab> <C-P>

" Show line numbers
set number

" Set color scheme
colorscheme busybee

" Enable syntax highlighting
syntax on

" Quickly edit and source ~/.vimrc.
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC

" Allow opening new files without writing changes first.
set hidden

" Don't wrap lines.
set nowrap

" A tab is 2 spaces.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Round indentation to multiples of shiftwidth when indenting.
set shiftround

" Enable automatic indentation.
set autoindent
set copyindent

" Show search matches as you type.
set incsearch

" Set default encoding
set encoding=utf-8

" Disable the arrow keys. You'll thank me later.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easy switch between files using space
map <space> :e#

" Display a list of completion alternatives.
set wildmenu

" Allow deleting anything with backspace.
set backspace=indent,eol,start

" Always show the status line.
set laststatus=2

" Customize the status line
set statusline=%f\ (%{&fenc})%=\ %l/%L

" Helper function to run a command and preserve state
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" Refresh CommandT's index when you write a new file, or regain focus
augroup CommandTExtension
  autocmd!
  autocmd FocusGained * CommandTFlush
  autocmd BufWritePost * CommandTFlush
augroup END

" Remove trailing whitespace on save
autocmd BufWritePre *.rb,*.py,*.js :call Preserve("%s/\\s\\+$//e")
nnoremap <silent> <F5> :call Preserve("%s/\\s\\+$//e")<CR>

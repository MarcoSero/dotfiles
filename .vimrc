if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=/Users/marco/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/Users/marco/.vim/bundle'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" YouCompleteMe can take a while to install
let g:neobundle#install_process_timeout = 1500

" Bundles

NeoBundle 'Valloric/YouCompleteMe', {
\ 'build'      : {
    \ 'mac'     : './install.sh --clang-completer --system-libclang',
    \ 'unix'    : './install.sh --clang-completer --system-libclang',
    \ 'windows' : './install.sh --clang-completer --system-libclang',
    \ 'cygwin'  : './install.sh --clang-completer --system-libclang'
    \ }
\ }

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

NeoBundle 'jiangmiao/auto-pairs'

NeoBundle 'chriskempson/base16-vim'

NeoBundle 'ctrlpvim/ctrlp.vim'

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'eagletmt/ghcmod-vim'

NeoBundle 'eagletmt/neco-ghc'

NeoBundle 'tpope/vim-commentary'

NeoBundle 'jistr/vim-nerdtree-tabs'

NeoBundle 'scrooloose/syntastic'

NeoBundle 'godlygeek/tabular'

NeoBundle 'bling/vim-airline'

NeoBundle 'terryma/vim-expand-region'

NeoBundle 'tpope/vim-git'

NeoBundle 'tpope/vim-markdown'

NeoBundle 'tpope/vim-surround'

NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'dag/vim2hs'

NeoBundle 'jordwalke/VimAutoMakeDirectory'

NeoBundle 'jordwalke/MacVimSmartGUITabs'
" Make sure to have `set guioptions+=e` in your `.gvimrc`.
map <D-Cr> :SmartGUITabsToggleFullScreen<CR>
imap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>
nmap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>

NeoBundle 'jordwalke/VimCleanColors'

NeoBundle 'scrooloose/nerdtree'

NeoBundle 'keith/swift.vim'

NeoBundle 'cfdrake/vim-carthage'

NeoBundle 'tpope/vim-fugitive'
set diffopt+=vertical

NeoBundle 'majutsushi/tagbar'

NeoBundle 'rizzatti/dash.vim'

" Make vim understand readline
NeoBundle 'tpope/vim-rsi'

NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'sjl/vitality.vim'

NeoBundle 'mileszs/ack.vim'
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

call neobundle#end()

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sanity Mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable syntax
syntax on

" line numbers
set number
set relativenumber
" disable folding
set nofoldenable

" make line wrapping behave normally
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=l

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" always set autoindenting on
set autoindent
" copy the previous indentation on autoindenting
set copyindent
" always show line numbers
set number
" number of spaces to use for autoindenting
set shiftwidth=4
" use multiple of shiftwidth when indenting with '<' and '>'
set shiftround
" set show matching parenthesis
set showmatch
" remember more commands and search history
set history=1000
" use many muchos levels of undo
set undolevels=1000
" ignore certain files
set wildignore=*.swp,*.bak,*.pyc,*.class
" change the terminal's title
set title

" don't beep
set visualbell
set noerrorbells

" don't use swap file
set nobackup
set noswapfile

" Enable mouse (toggle with F12)
set mouse=a

" Tab specific options
"A tab is 8 spaces
set tabstop=4
"Always uses spaces instead of tabs
set expandtab
"Insert 4 spaces when tab is pressed
set softtabstop=4
"An indent is 4 spaces
set shiftwidth=4
"Round indent to nearest shiftwidth multiple
set shiftround

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"
let maplocalleader = ","

" stop highlighting search result keeping Esc behavior
nnoremap <CR> :noh<CR>

" toogle nerd tree visibility
nnoremap <Leader>e :NERDTreeToggle<CR>

map <leader>tt :TagbarToggle<CR>

" open file
nnoremap <Leader>o :CtrlP<CR>
nnoremap <leader>. :CtrlPTag<cr>

" save file
nnoremap <Leader>s :w<CR>

" copy and paste to system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" visual line mode
nmap <Leader><Leader> V


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ignore case when searching
set ignorecase
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab
" highlight search terms
set hlsearch
" show search matches as you type
set incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

" do not lose register when pasting over a word
xnoremap p pgvy

" change window with ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" disable arrow keys - REAL VIM MODE
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" drag visual blocks
vmap <expr> <LEFT> DVB_Drag('left')
vmap <expr> <RIGHT> DVB_Drag('right')
vmap <expr> <DOWN> DVB_Drag('down')
vmap <expr> <UP> DVB_Drag('up')
vmap <expr> D DVB_Duplicate()

" disable macro
nnoremap Q <nop>

" stop macro window
map q: :q

" region expanding
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Make computers make sense
nnoremap Y y$

"reselect visual block after indent
vnoremap < <gv
vnoremap > >gv

" auto center
nnoremap n nzz
nnoremap N Nzz

" quickly select text you just pasted
noremap gV `[v`]

" Type 12<Enter> to go to line 12 (12G breaks my wrist)
" Hit Enter to go to end of file.
" Hit Backspace to go to beginning of file.
" nnoremap <CR> G
" nnoremap <BS> gg

" don't move the cursor back 1 position when exiting insert mode
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

command! Q q " Bind :Q to :q
command! Qall qall

" quickly edit and source vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Draw a subtle line at 81 columns
set colorcolumn=80
highlight ColorColumn ctermbg=6

" For commit messages highlight column 50 as the limit for the title
au FileType gitcommit set colorcolumn=50

" color scheme
let base16colorspace=256
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME

if has('gui_running')
    "set guifont=Inconsolata\ for\ Powerline:h15
    colorscheme spacegray
    set background=dark
    set guifont=Source\ Code\ Pro\ for\ Powerline:h13
    set guioptions-=r "remove scrollbars
    set guioptions-=R "remove scrollbars
    set guioptions-=l "remove scrollbars
    set guioptions-=L "remove scrollbars
    set guioptions-=T " Remove toolbars
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" remove delay insert mode
set ttimeoutlen=50

" Change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

if has('gui_running')
   au InsertLeave * hi Cursor guibg=red
   au InsertEnter * hi Cursor guibg=green
endif

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins and miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enable filetype detection, plus loading of filetype plugins
filetype plugin indent on

" when you forgot to sudo before editing a file that requires root privileges
" (typically /etc/hosts).
" This lets you use w!! to do that after you opened the file already
cmap w!! w !sudo tee % >/dev/null

" Configure browser for haskell_doc.vim
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" select next completion with TAB
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"

" enable YouCompleteMe for haskell
let g:ycm_semantic_triggers = {'haskell' : ['.']}

" necoghc#omnifunc for omni-completion
setlocal omnifunc=necoghc#omnifunc

" ghc-mod aynchronous checking and linting when .hs files are written
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" Use stylish haskell instead of par for haskell buffers
autocmd FileType haskell let &formatprg="stylish-haskell"

" CocoaPods
au BufNewFile,BufRead Podfile,*.podspec set filetype=ruby

" Disable autocomplete
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \ 'gitcommit' : 1,
      \ 'objcpp' : 1,
      \ 'objc' : 1
      \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlPVimRc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Splitting rightwards helps preserve a left nav when opening ctrlp.
set splitright

"jump to existing buffer on ANY open command (split/tab/etc).
let g:ctrlp_switch_buffer="ETVH"

" Open ctrlp with cmd+p
"let g:ctrlp_map = '<D-p>'
" Open goto symbol on current buffer
" Not mapping D-r like sublime/etc so we can use it for refreshing an app.
" nmap <D-r> :MyCtrlPTag<cr>
" imap <D-r> <esc>:MyCtrlPTag<cr>
" Open goto symbol on all buffers
" nmap <D-R> :CtrlPBufTagAll<cr>
" imap <D-R> <esc>:CtrlPBufTagAll<cr>
" Open goto file
" nmap <D-t> :CtrlPBuffer<cr>
" imap <D-t> <esc>:CtrlPBuffer<cr>

" search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_cmd = 'CtrlPMixed'
"search for nearest ancestor like .git, .hg, else the directory of the current file
let g:ctrlp_working_path_mode = 'a'
" show the match window at the top of the screen
let g:ctrlp_match_window_bottom = 1
" maxiumum height of match window
" See other match window setting
" let g:ctrlp_max_height = 10
let g:ctrlp_match_window = 'bottom,order:btt,min:13,max:13'
" enable caching
let g:ctrlp_use_caching = 1
" speed up by not removing clearing cache evertime
let g:ctrlp_clear_cache_on_exit=0
" show me dotfiles
let g:ctrlp_show_hidden = 1
" number of recently opened files
let g:ctrlp_mruf_max = 250
let g:ctrlp_max_depth = 7
let g:ctrlp_max_files = 30000

" See https://github.com/kien/ctrlp.vim/issues/389
let g:ctrlp_prompt_mappings = {
        \ 'CreateNewFile()':      [''],
        \ 'ToggleType(1)':        ['<c-u>', '<c-up>'],
        \ 'ToggleType(-1)':       ['<c-y>', '<c-down>'],
        \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
        \ 'PrtCurRight()':        ['<c-f>', '<right>'],
        \ 'AcceptSelection("e")': ['<c-t>'],
        \ 'AcceptSelection("h")': ['<c-v>'],
        \ 'AcceptSelection("v")': ['<c-s>'],
        \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
        \ 'PrtClearCache()':      ['<D-C>'],
        \ 'PrtDeleteEnt()':       ['<F7>'],
        \ 'PrtExit()':            ['<c-l>', '<esc>', '<c-c>', '<c-g>'],
        \ }

" TODO: add javascript and some other languages who doesn't have ctags support
" coffee: https://gist.github.com/michaelglass/5210282
" go: http://stackoverflow.com/a/8236826/462233
" objc:  http://www.gregsexton.org/2011/04/objective-c-exuberant-ctags-regex/
" rust: https://github.com/mozilla/rust/blob/master/src/etc/ctags.rust
let g:ctrlp_buftag_types = {
      \ 'go'     	 : '--language-force=go --golang-types=ftv',
      \ 'coffee'     : '--language-force=coffee --coffee-types=cmfvf',
      \ 'markdown'   : '--language-force=markdown --markdown-types=hik',
      \ 'objc'       : '--language-force=objc --objc-types=mpci',
      \ 'rc'         : '--language-force=rust --rust-types=fTm'
      \ }

" Faster ctrlp navigation for git projects
"let g:ctrlp_use_caching = 0
"if executable('ag')
    "set grepprg=ag\ --nogroup\ --nocolor
    "let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"else
  "let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  "let g:ctrlp_prompt_mappings = {
    "\ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    "\ }
"endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Close vim if the only window left
" open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" nice arrow
let g:NERDTreeDirArrows = 1
" not so much cruft
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowBookmarks = 1
let NERDTreeShowHidden=1
hi def link NERDTreeRO Normal
hi def link NERDTreePart StatusLine
hi def link NERDTreeDirSlash Directory
hi def link NERDTreeCurrentNode Search
hi def link NERDTreeCWD Normal
" Not so much color
let g:NERDChristmasTree = 0

let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_gui_startup = 0
if has("gui_running")
  if has("gui_macvim")
    map <D-e> :NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
    imap <D-e> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
    vmap <D-e> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
    nmap <D-e> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>

    map <D-E> :NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr><c-w><c-w><c-w><c-p>
    imap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr><c-w><c-w><c-w><c-p>
    vmap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr><c-w><c-w><c-w><c-p>
    nmap <D-E> <Esc>:NERDTreeTabsOpen<Cr>:NERDTreeTabsFind<Cr><c-w><c-w><c-w><c-p>
  endif
  if has("gui_win32")
    map <F11> :NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
    imap <F11> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
    vmap <F11> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
    nmap <F11> <Esc>:NERDTreeTabsToggle<Cr><c-w><c-w><c-w><c-p>
  endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='base16'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" turn on spell check on markdown files
autocmd BufRead,BufNewFile *.md setlocal spell

" add words to the dictionary by cursoring on the word and typing zg

" to manually turn it on
" :setlocal spell spelllang=en_us

" words completion if spelling is enabled
set complete+=kspell


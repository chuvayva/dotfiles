call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'          " project tree
Plug 'ctrlpvim/ctrlp.vim'           " ctrl-p file search
Plug 'tpope/vim-fugitive'           " git tool
Plug 'vim-airline/vim-airline'      " nice status line
Plug 'tpope/vim-surround'           " working with ",), ]
Plug 'tpope/vim-sensible'           " better vim view and more
Plug 'tpope/vim-repeat'             " repeat command for all stuff
Plug 'tpope/vim-unimpaired'         " shotcuts with [,]
Plug 'slim-template/vim-slim'       " slim syntax highlighting
Plug 'janko-m/vim-test'             " test plugin
Plug 'benmills/vimux'               " tmux for vim
"Plug 'scrooloose/syntastic'        " syntax checker
Plug 'airblade/vim-gitgutter'       " git signs
Plug 'gregsexton/gitv'              " git tree and history
Plug 'joequery/Stupid-EasyMotion'   " moving in the line
Plug 'vim-scripts/BufOnly.vim'      " close all buffers
Plug 'gorkunov/smartgf.vim'         " lookup methods
Plug 'scrooloose/nerdcommenter'     " comment text
Plug 'tpope/vim-bundler'            " For auto tags generating (gem-ctags is needeed)
Plug 'hashivim/vim-vagrant'         " Vagrant file syntax highligh
"Plug 'vim-ruby/vim-ruby'            " auto 'end' adding
Plug 'tpope/vim-endwise'            " auto 'end' adding
Plug 'Raimondi/delimitMate'         " automatic closing of quotes, parenthesis, brackets, etc.
Plug 'vimwiki/vimwiki'              " try wiki
Plug 'itchyny/vim-cursorword'       " just select word under cursor

" Themes
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

call plug#end()




" General {{

  " Search down into subfolders
  " Provides tab-completion for all file-related tasks
  set path+=**

  " Don't redraw while executing macros (good performance config)
  set lazyredraw

  set cursorline

  " Turn backup off, since most stuff is in SVN, git etc anyway...
  set nobackup
  set nowb
  set noswapfile
  set nocompatible

  set hidden " navigate from chaged buffer

  set updatetime=250

  nnoremap <F2> :set invpaste paste?<CR>
  set pastetoggle=<F2>

  set smarttab

  "set noautoindent        " I indent my code myself.
  "set nocindent           " I indent my code myself.
  "set smartindent        " Or I let the smartindent take care of it.

  set ttimeout
  set ttimeoutlen=100

  set ignorecase

  " mouse
  " Send more characters for redraws
  set ttyfast

  " Enable mouse use in VISUAL mode only
  set mouse=a

  map <ScrollWheelUp> <C-Y>
  map <ScrollWheelDown> <C-E>

  " Set this to the name of your terminal that supports mouse codes.
  " Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
  set ttymouse=xterm2

  filetype on                  " Enable filetype detection
  filetype indent plugin on    " Enable filetype-specific indenting

  set foldmethod=syntax       " zc - close fold, zC close all folds, l open fold, zR open old folds
  set foldlevel=100           " inititialy all folds are opened
" }}}

" Formatting {
  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set showmode            " Show current mode.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set rnu               " Relative numbers
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them.
  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=2           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

  " More natural splits
  set splitright          " Vertical split to right of current.

  if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
  endif
  if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
  endif
  set display+=lastline
  set nostartofline       " Do not jump to first character with page commands.

  set clipboard=unnamed   " Ctrl-C Ctrl-V on mac

  set nowrap              " switch text wrapping off
  set synmaxcol=170       " fix slow vim with long lines

  " {
    " Tell Vim which characters to show for expanded TABs,
    " trailing whitespace, and end-of-lines. VERY useful!
    if &listchars ==# 'eol:$'
      set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    endif
    set list                " Show problematic characters.

    " Also highlight all tabs and trailing whitespace characters.
    highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    match ExtraWhitespace /\s\+$\|\t/

" }

" Enter to go to EOF and backspace to go to start
"nnoremap <CR> G
"nnoremap <BS> gg
nnoremap <BS> h<Del>
"nnoremap <S-BS> 0<D>

" Stop cursor from jumping over wrapped lines
nnoremap j gj
nnoremap k gk


let mapleader="\<SPACE>"

" Cursor sign in different modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Options {

  " Colorscheme options.
  colorscheme gruvbox
  syntax enable
  "set background=light

  " ================ Persistent Undo ==================
  " Keep undo history across sessions, by storing in file.
  if has('persistent_undo')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
  endif

  " Sets a status line. If in a Git repository, shows the current branch.
  " Also shows the current file name, line and column number.
  if has('statusline')
      set laststatus=2

      " Broken down into easily includeable segments
      set statusline=%<%f\                     " Filename
      set statusline+=%w%h%m%r                 " Options
      "set statusline+=%{fugitive#statusline()} " Git Hotness
      set statusline+=\ [%{&ff}/%Y]            " Filetype
      set statusline+=\ [%{getcwd()}]          " Current dir
      set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif
" }


" Keybindings {
  " Save file
  nnoremap <Leader>t :tabnew<CR>
  "nnoremap <Leader>w :tabclose<CR>

  nmap <Leader>w :bd<CR>

  " return to normal mode by jj
  imap jj <C-c>

  " Map ctrl-movement keys to window switching
  map <C-k> <C-w><Up>
  map <C-j> <C-w><Down>
  map <C-l> <C-w><Right>
  map <C-h> <C-w><Left>

  " Switch off arrows
  for prefix in ['i', 'n', 'v']
    for key in ['<Up>', '<Down>', '<Left>', '<Right>']
      exe prefix . "noremap " . key . " <Nop>"
    endfor
  endfor

  map <F9> :e! ~/.vimrc<Enter>
  map <F5> :so  ~/.vimrc<Enter>

  " select all
  nmap <C-a> ggVG

  " upper/lower word
  " nmap <leader>u mQviwU`Q
  " nmap <leader>l mQviwu`Q

  " Allow to copy/paste between VIM instances
  " copy the current visual selection to ~/.vbuf
  vmap <Leader>y :w! ~/.vbuf<CR>
  " copy the current line to the buffer file if no visual selection
  nmap <Leader>y :.w! ~/.vbuf<CR>
  " paste the contents of the buffer file
  nmap <Leader>p :r ~/.vbuf<CR>
  " print vbuf to terminal (for copy-paste)
  nmap <Leader>P :!cat ~/.vbuf<CR>

  nmap <Leader>9 :Gstatus<CR>

  " invoke cmd by :
  nnoremap ; :

  nmap <silent> <RIGHT> :cnext<CR>
  nmap <silent> <C-RIGHT> :cnfile<CR> " Go to the next item in the next file
  nmap <silent> <LEFT> :cprev<CR>
  nmap <silent> <C-LEFT> :cpfile<CR> " Go to the next item in the next file
  nmap <silent> <UP> :cwindow<CR> " Open if any errors
  nmap <silent> <DOWN> :cclose<CR> " close

  " Search and Replace
  nmap <Leader>r :%s//gc<Left><Left><Left>
" }







" Plugin configuration {{{
  set t_Co=256

  " BufOnly {
    map <Leader><C-w> :BufOnly<CR>
  " }


  " Airline {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_theme= 'gruvbox'
  " }

  " NERD TREE {
    nmap <silent> <leader>1 :NERDTreeToggle<CR>
    nmap <C-\> :NERDTreeFind<CR>
  " }

  " Ctrl {
    " Open file menu
    nnoremap <Leader>n :CtrlP<CR>
    " Open buffer menu
    nnoremap <Leader>b :CtrlPBuffer<CR>
    " Open most recently used files
    nnoremap <Leader>e :CtrlPMRUFiles<CR>
    " ctags panel
    nnoremap <leader>. :CtrlPTag<cr>

    let g:ctrlp_working_path_mode = 0
  " }

  " Git {
    nmap <leader>gv :Gitv --all<cr>
    nmap <leader>gV :Gitv! --all<cr>
    vmap <leader>gV :Gitv! --all<cr>
  " }

  let g:Gitv_DoNotMapCtrlKey = 1
  "let g:Gitv_OpenPreviewOnLaunch = 0
  let g:Gitv_OpenHorizontal = 1
  let g:Gitv_TruncateCommitSubjects = 1
  let g:Gitv_CommitStep = 100

  " let g:auto_save = 1
  " let g:auto_save_silent = 1

  " vim test
  let g:test#ruby#minitest#executable = 'm'
  nmap <silent> <leader>T :TestNearest<CR>
  nmap <silent> <leader><C-t> :TestFile<CR>
  nmap <silent> <leader>l :TestLast<CR>

  " make test commands execute using dispatch.vim
  let test#strategy = "basic"
  let test#ruby#rspec#executable = 'heroku local:run -e .env.test bundle exec rspec'

" }}}






" Commands {{{

  " save automatically when text is changed
  au CursorHold,CursorHoldI * silent! update

  "command! MakeTags !ctags -R -f ./.git/tags .
  command! MakeTags !ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)






  " {{{ The Silver Searcher
    if executable('ag')
      " Use ag over grep
      set grepprg=ag\ --nogroup\ --nocolor

      " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      "let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

      " ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
    endif

    " bind \ (backward slash) to grep shortcut
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

    nnoremap <leader>f :Ag<SPACE>

    " bind K to grep word under cursor
    nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

  " }}}

  " Remove trailing spaces before saving text files
  " http://vim.wikia.com/wiki/Remove_trailing_spaces
  autocmd BufWritePre * :call StripTrailingWhitespace()
  function! StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
      normal mz
      normal Hmy
      if &filetype == 'mail'
    " Preserve space after e-mail signature separator
        %s/\(^--\)\@<!\s\+$//e
      else
        %s/\s\+$//e
      endif
      normal 'yz<Enter>
      normal `z
    endif
  endfunction

  "
  " Repurpose arrow keys to move lines {{{
    function! s:MoveLineUp()
      call <SID>MoveLineOrVisualUp(".", "")
    endfunction

    function! s:MoveLineDown()
      call <SID>MoveLineOrVisualDown(".", "")
    endfunction

    function! s:MoveVisualUp()
      call <SID>MoveLineOrVisualUp("'<", "'<,'>")
      normal gv
    endfunction

    function! s:MoveVisualDown()
      call <SID>MoveLineOrVisualDown("'>", "'<,'>")
      normal gv
    endfunction

    function! s:MoveLineOrVisualUp(line_getter, range)
      let l_num = line(a:line_getter)
      if l_num - v:count1 - 1 < 0
        let move_arg = "0"
      else
        let move_arg = a:line_getter." -".(v:count1 + 1)
      endif
      call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
    endfunction

    function! s:MoveLineOrVisualDown(line_getter, range)
      let l_num = line(a:line_getter)
      if l_num + v:count1 > line("$")
        let move_arg = "$"
      else
        let move_arg = a:line_getter." +".v:count1
      endif
      call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
    endfunction

    function! s:MoveLineOrVisualUpOrDown(move_arg)
      let col_num = virtcol(".")
      execute "silent! ".a:move_arg
      execute "normal! ".col_num."|"
    endfunction

    " Arrow key remapping:
    " Up/Dn = move line up/dn
    " Left/Right = indent/unindent
    function! SetArrowKeysAsTextShifters()
      " Normal mode
      nnoremap <silent> <S-Left>   <<
      nnoremap <silent> <S-Right>  >>
      nnoremap <silent> <S-Up>     <Esc>:call <SID>MoveLineUp()<CR>
      nnoremap <silent> <S-Down>   <Esc>:call <SID>MoveLineDown()<CR>

      " Visual mode
      vnoremap <silent> <S-Left>   <gv
      vnoremap <silent> <S-Right>  >gv
      vnoremap <silent> <S-Up>     <Esc>:call <SID>MoveVisualUp()<CR>
      vnoremap <silent> <S-Down>   <Esc>:call <SID>MoveVisualDown()<CR>

      " Insert mode
      inoremap <silent> <S-Left>   <C-D>
      inoremap <silent> <S-Right>  <C-T>
      inoremap <silent> <S-Up>     <C-O>:call <SID>MoveLineUp()<CR>
      inoremap <silent> <S-Down>   <C-O>:call <SID>MoveLineDown()<CR>
    endfunction

    call SetArrowKeysAsTextShifters()
  " }}}

" }}}



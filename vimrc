" == General == {{{
" ==================================================================== 

" == Vim-Plug == {{{
" ====================================================================

let mapleader=","
nnoremap <Space> <Nop>
let maplocalleader=" "
set nocompatible " be iMproved, required
filetype off     " required

" Set up Vim-Plug
call plug#begin('~/.vim/plugged')

" Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'claco/jasmine.vim'
Plug 'dgrnbrg/vim-redl'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'

" Clojure {{{

let g:syntastic_clojure_checkers = ['joker']
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
" Plug 'tpope/vim-salve'
Plug 'gonzaloserrano/vim-salve', { 'branch': 'revert-14-cljc-files' }
Plug 'tpope/vim-leiningen'
Plug 'guns/vim-clojure-static'

let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', '^Given', '^When', '^Then']

Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
" Plug 'venantius/vim-eastwood'

" Use following fork to be able to
" pass in custom config
" Plug 'MichaelBlume/vim-cljfmt'
" Plug 'venantius/vim-cljfmt'

" Plug 'bhurlow/vim-parinfer'

Plug 'aclaimant/syntastic-joker'

" }}}

Plug 'henrik/vim-indexed-search'
Plug 'itspriddle/vim-jquery'

Plug 'jgdavey/tslime.vim'
nmap <C-c>r <Plug>SetTmuxVars
vmap <C-c><C-c> <Plug>SendSelectionToTmux

Plug 'jgdavey/vim-turbux'
let g:turbux_runner = 'tslime'

Plug 'kien/rainbow_parentheses.vim'
Plug 'lucapette/vim-textobj-underscore'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'

Plug 'tpope/vim-projectionist'

let g:rails_projections = {
      \ "app/presenters/*.rb": {
      \   "command": "presenter",
      \ },
      \ "app/uploaders/*.rb": {
      \   "command": "uploader",
      \ },
      \ "app/jobs/*.rb": {
      \   "command": "job",
      \ },
      \ "app/mailers/*.rb": {
      \   "command": "mailer",
      \ },
      \ "app/decorators/*.rb": {
      \   "command": "decorator",
      \ },
      \ "app/services/*.rb": {
      \   "command": "service",
      \ },
      \ "app/builders/*.rb": {
      \   "command": "builder",
      \ },
      \ "app/operations/*.rb": {
      \   "command": "operation",
      \ },
      \ "app/settings/*.rb": {
      \   "command": "setting",
      \ },
      \ "app/validators/*.rb": {
      \   "command": "validator",
      \ },
      \ "app/admin/*.rb": {
      \   "command": "admin",
      \ },
      \ "config/routes.rb": {
      \   "type": "config",
      \ },
      \ "config/*": {
      \   "type": "config",
      \   "command": "config",
      \ },
      \ "spec/factories/*.rb": {
      \   "command": "factory",
      \ },
      \ "app/assets/javascripts/templates/*.hamlc": {
      \   "command": "template",
      \ },
      \ "app/assets/javascripts/models/*.coffee": {
      \   "command": "jmodel",
      \ },
      \ "app/assets/javascripts/views/*.coffee": {
      \   "command": "jview",
      \ },
      \ "app/assets/javascripts/collections/*.coffee": {
      \   "command": "jcollection",
      \ },
      \ "app/assets/javascripts/routers/*.coffee": {
      \   "command": "jrouter",
      \ },
      \ "spec/javascripts/*.coffee": {
      \   "command": "jspec",
      \ },
      \ "spec/javascripts/fixtures/*.html": {
      \   "command": "jfixture",
      \ },
\ }

Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'Valloric/YouCompleteMe', {
"          \ 'do': './install.py'
"      \ }
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/paredit.vim'
" Plug 'edsono/vim-matchit'
Plug 'hspec/hspec.vim'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'rodjek/vim-puppet'
Plug 'scrooloose/nerdtree'
Plug 'tonchis/to-github-vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'

" Haskell
Plug 'jivagoalves/vim2hs'
let g:haskell_conceal_wide = 0

Plug 'kana/vim-filetype-haskell'

Plug 'lukerandall/haskellmode-vim'
" augroup haskell
"   autocmd BufEnter *.hs compiler ghc
" augroup END
let g:haddock_browser="/usr/bin/google-chrome"

" Hoogle
Plug 'Twinside/vim-hoogle'
augroup haskell_docs
  autocmd!
  autocmd BufEnter *.hs noremap K :Hoogle <C-r><C-w><CR>
augroup END

Plug 'eagletmt/ghcmod-vim'

nnoremap <silent> tw :GhcModTypeInsert<CR>
nnoremap <silent> ts :GhcModSplitFunCase<CR>
nnoremap <silent> tt :GhcModType<CR>
nnoremap <silent> te :GhcModTypeClear<CR>

Plug 'eagletmt/neco-ghc'
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_use_caching = 0
Plug 'scrooloose/nerdcommenter'

Plug 'ervandew/supertab'

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim', {
      \ 'for': 'haskell',
      \ 'do':  'make',
      \}

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" ctags
" Plug 'craigemery/vim-autotag'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'

Plug 'terryma/vim-multiple-cursors'

" Scala
Plug 'derekwyatt/vim-scala'

" F#
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}

Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Crystal
Plug 'rhysd/vim-crystal'

" Idris
Plug 'idris-hackers/idris-vim'

" command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" }}}

scriptencoding utf-8
set encoding=utf-8
set number
" set relativenumber
set autoread
set list listchars=tab:\ \ ,trail:·
set splitbelow
set splitright
set smartcase

if $TMUX =~ "tmate"
  " Quick fix for solarized issue on other
  " ppl's machines when pairing via tmate.
  let g:solarized_termcolors=256
endif

set background=dark
colorscheme solarized

" Use behavior of shell autocomplete functions for completing filenames
set wildmode=longest,list

set nobackup            " don't want no backup files
set nowritebackup       " don't make a backup before overwriting a file
set noswapfile          " no swap files
set hidden              " hide buffers when abandoned

set undofile            " Save undo's after file closes
set undodir=~/.vim/undo " where to save undo histories
set undolevels=1000     " How many undos
set undoreload=10000    " number of lines to save for undo

" resize windows whenever we resize the terminal window
autocmd VimResized * :wincmd =

" Highlight chars past 80 columns
augroup highlight
  autocmd!
  " autocmd BufEnter *.rb,*.haml,*.markdown highlight OverLength ctermbg=lightyellow guibg=#592929
  " autocmd BufEnter *.rb,*.haml,*.markdown match OverLength /\%80v.*/

  " Clojure
  autocmd BufEnter *.clj RainbowParenthesesActivate
  autocmd BufEnter *.clj RainbowParenthesesLoadRound
  autocmd BufEnter *.clj RainbowParenthesesLoadSquare
  autocmd BufEnter *.clj RainbowParenthesesLoadBraces

augroup END

" Allow to use Alt + key
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" Rainbow Parentheses
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]

" }}}

" == Search Settings == {{{
" ====================================================================

set incsearch

" }}}

" == Indentation == {{{
" ====================================================================

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent
filetype plugin indent on

" }}}

" == Utility functions == {{{
" ====================================================================

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

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
noremap <leader>n :call RenameFile()<cr>

" }}}

" == Dealing with whitespaces and EOF == {{{
" ====================================================================

" Remove whitespaces at the end of the line
nnoremap _$ :call Preserve("%s/\\s\\+$//e")<CR>

" Indent the whole file
nnoremap _= :call Preserve("normal gg=G")<CR>zz

" Remove whitespaces after saving files with the following extensions
augroup whitespaces
  autocmd!
  autocmd BufWritePre *.rb,*.rake,*.js,*.coffee :call Preserve("%s/\\s\\+$//e")
  autocmd BufWritePre *.haml,*.sass,*.scss,*.yml :call Preserve("%s/\\s\\+$//e")
  autocmd BufWritePre *.clj,*.cljs :call Preserve("%s/\\s\\+$//e")
  autocmd BufWritePre *.hs,*.elm :call Preserve("%s/\\s\\+$//e")
augroup END

" Avoid EOL at the end of the file:
" augroup avoid_eol
  " autocmd!
  " autocmd BufWritePre * :set binary | set noeol
  " autocmd BufWritePost * :set nobinary | set eol
" augroup END

" }}}

" == Mappings == {{{
" ====================================================================

" Leave insert mode with `jk`
inoremap jk <ESC>

" Edit vimrc file
nnoremap <Leader>ev :split $MYVIMRC<CR>

" Reload vimrc file
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Edit .bash_profile file
nnoremap <Leader>eb :split $HOME/.bash_profile<CR>

" Edit .tmux.conf file
nnoremap <Leader>et :split $HOME/.tmux.conf<CR>

" Yank after the cursor instead of the entire line
nnoremap Y y$

" Copy and paste between Vim instances
vnoremap <silent> <Leader>y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nnoremap <silent> <Leader>y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
noremap <silent> <Leader>p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
noremap <silent> <Leader>P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" Copy to clipboard
vnoremap <silent> <C-c> "+y

" Paste in insert mode
inoremap <C-v> <ESC>pa

" Surround word in double quotes
nnoremap <Leader>" viw<ESC>a"<ESC>hbi"<ESC>lel

" Surround word in single quotes
nnoremap <Leader>' viw<ESC>a'<ESC>hbi'<ESC>lel

" Surround text visually selected with double quotes
vnoremap <Leader>" <ESC>a"<ESC>`<i"<ESC>`>E

" Move lines downward with one keystroke
noremap - ddp

" Move lines upward with one keystroke
" noremap _ ddkP

" Convert current word to uppercase
inoremap <C-u> <Esc>vawUea

" Delete line content and move cursor to the begining
inoremap <C-d> <Esc>ddO

" Makes K split lines (the opposite of J).
" nnoremap K i<CR><Esc>k$

" Split line at comma
nnoremap <Leader>, 0f,<Space>i<CR><Esc>k$j

" Split line at comma
nnoremap <Leader>; 0f;<Space>i<CR><Esc>k$j

" Split line at dot
nnoremap <Leader>. 0f.<Space>i<CR><Esc>k$j

" Squeeze whitespaces except at the beginning of the line
nnoremap <Leader>sq :call Preserve("s/\\(\\S\\)\\s\\+/\\1 /g")<CR>

" Makes Leader s save the current buffer
nnoremap <Leader>s <Esc>:w<CR>
inoremap <Leader>s <C-o>:w<CR>

" Move current line to top of screen
nnoremap zk zt

" Move current line to botton of screen
nnoremap zj zb

" Change between recent buffers
nnoremap <C-w><C-w> <C-^>

" Clears highlight
nnoremap <Leader>c :noh<CR>

" Clears highlight and console
nnoremap <Leader>cl :noh<CR>:call Send_to_Tmux("clear\n")<CR>

" Makes Q quit.
nnoremap Q :q<CR>

augroup help
  autocmd!
  autocmd BufEnter .vimrc noremap K :help <C-r><C-w><CR>
augroup END

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" NOTE: Don't use this since it breaks
" seamless navigation between vim
" and tmux when we reload vimrc.
" Windows shortcuts to change focus
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l

" Make all windows (almost) equally high and wide
noremap <Leader>ew <C-w>=

" Expands %% to the path of the active buffer on Vim's command-line prompt
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Change Ruby block from {} to 'do end'
noremap <Leader>rb 0f{"tdi}ca}do<CR>end<ESC>O<ESC>"tp=<Space>:w<CR>
noremap <Leader>r{ "tdir?do<CR>cw{<ESC>/end<CR>cw}<ESC>"tPkJJF{w:noh<CR>

augroup evaluation
  autocmd!
  " Inspect value of current line taking into account begining of the file
  " until current line. For example, line '1 + 1' will be '1 + 1 # => 2'.
  " noremap <Leader>e A#<ESC>0f#DVgg"wy<C-o>0Cp()<ESC>PVgg:!ruby<CR>"wP<C-o>kA<Space>#<Space>=><Space><ESC>J
  autocmd FileType ruby noremap <buffer> <Localleader>e A#<ESC>0f#DVgg"wy<C-o>0Cp()<ESC>PVgg:!ruby<CR>"wP<C-o>kA<Space>#<Space>=><Space><ESC>J
  autocmd FileType clojure noremap <buffer> <Localleader>e :Eval<CR>
augroup END

" Refactorings
noremap <Leader>xb "td?describe<CR>obefore { <ESC>"tpA }<ESC>

" Clojure
nnoremap [de :Djump <C-r><C-w><CR>
nnoremap ]de :Djump <C-r><C-w><CR>
nnoremap [s :Source <C-r><C-w><CR>
nnoremap ]s :Source <C-r><C-w><CR>

" Testing
augroup testing
  autocmd!
  " Clojure
  autocmd FileType clojure nnoremap <buffer> cpr :Require!<CR>:RunTests<CR>
  autocmd FileType clojure nnoremap <buffer> cll :Eval (clojure.tools.namespace.repl/refresh-all)<CR>
  autocmd FileType clojure nnoremap <buffer> <Leader>t :call Send_to_Tmux("(require '[eftest.runner]'[clojure.tools.namespace.repl]) (reloaded.repl/reset) (eftest.runner/run-tests (eftest.runner/find-tests \"test\"))\n")<CR>
augroup END

" Run js specs
nnoremap <Leader>j :noh<CR>:call Send_to_Tmux("bin/rake spec:javascript\n")<CR>

augroup indentation
  autocmd!
  autocmd FileType ruby nmap <buffer> =- =ar
augroup END

" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

nnoremap <Space><Space> :GGrep<CR>

" -- Git Customization -- {{{
" --------------------------------------------------------------------

noremap <Leader>gl :!clear && git log<CR>
noremap <Leader>gln :!clear && git log --name-only<CR>
noremap <Leader>glp :!clear && git log -p<CR>
noremap <Leader>gs :!clear && git status -s<CR>
noremap <Leader>gb :!clear && git branch<CR>
noremap <Leader>ga :!clear && git add %<CR>
noremap <Leader>gap :!clear && git add -p<CR>
noremap <Leader>gac :!clear && git add -p %<CR>
noremap <Leader>gca :!clear && git commit --amend<CR>
noremap <Leader>gcp :!clear && git checkout -p<CR>
noremap <Leader>gp :!git push origin `git rev-parse --abbrev-ref HEAD`<CR>
noremap <Leader>gpr :!git pull --rebase<CR>
noremap <Leader>gpf :!git push -f origin `git rev-parse --abbrev-ref HEAD`<CR>
noremap <Leader>gc :!clear && git commit<CR>
noremap <Leader>gd :!clear && git diff<CR>
noremap <Leader>gdc :!clear && git diff --cached<CR>
noremap <Leader>gfo :!clear && git fetch -p origin<CR>
noremap <Leader>gr :!clear && git rebase origin/master<CR>
noremap <Leader>gri :!clear && git rebase -i origin/master<CR>
noremap <Leader>grc :!clear && git rebase --continue<CR>
noremap <Leader>gra :!clear && git rebase --abort<CR>
noremap <Leader>gfr :!clear && git fetch -p origin && git rebase origin/master<CR>
noremap <Leader>gcb :execute (":!clear && git checkout -b " . SanitizeInput(input("New branch name:")) . " origin/master\n")<CR>
noremap gs :Ggrep "\b<C-r><C-w>\b"<CR>
noremap <Leader>gst :!clear && git stash<CR>
noremap <Leader>gsp :!clear && git stash pop<CR>

function! SanitizeInput(name)
  return substitute(join(split(tolower(a:name)), "_"), "[\]\['\"/`:#<>-]", "", "g")
endfunction

function! GetCurrentBranch()
  return system("git rev-parse --abbrev-ref HEAD")
endfunction

" Expand %b to the current branch
cnoremap <expr> %b getcmdtype() == ':' ? GetCurrentBranch() : '%%'

noremap ]c :GitGutterNextHunk<CR>
noremap [c :GitGutterPrevHunk<CR>

" }}}

" }}}

" == Movement Mappings == {{{
" ====================================================================

" -- Brackets -- {{{
" --------------------------------------------------------------------

onoremap p i(

" following are like 'inside/around next/last ( or )'
onoremap in( :<C-u>execute "normal! /(\r:nohlsearch\rvi)"<CR>
onoremap in) :<C-u>execute "normal! /)\r:nohlsearch\rvi("<CR>
onoremap il( :<C-u>execute "normal! ?(\r:nohlsearch\rvi("<CR>
onoremap il) :<C-u>execute "normal! ?)\r:nohlsearch\rvi)"<CR>
onoremap an( :<C-u>execute "normal! /(\r:nohlsearch\rva)"<CR>
onoremap an) :<C-u>execute "normal! /)\r:nohlsearch\rva("<CR>
onoremap al( :<C-u>execute "normal! ?(\r:nohlsearch\rva("<CR>
onoremap al) :<C-u>execute "normal! ?)\r:nohlsearch\rva)"<CR>

" following are like 'inside/around next/last { or }'
onoremap in{ :<C-u>execute "normal! /{\r:nohlsearch\rvi}"<CR>
onoremap in} :<C-u>execute "normal! /}\r:nohlsearch\rvi{"<CR>
onoremap il{ :<C-u>execute "normal! ?{\r:nohlsearch\rvi}"<CR>
onoremap il} :<C-u>execute "normal! ?}\r:nohlsearch\rvi{"<CR>
onoremap an{ :<C-u>execute "normal! /{\r:nohlsearch\rva}"<CR>
onoremap an} :<C-u>execute "normal! /}\r:nohlsearch\rva{"<CR>
onoremap al{ :<C-u>execute "normal! ?{\r:nohlsearch\rva}"<CR>
onoremap al} :<C-u>execute "normal! ?}\r:nohlsearch\rva{"<CR>

" following are like 'inside/around next/last [ or ]'
onoremap in[ :<C-u>execute "normal! /[\r:nohlsearch\rvi]"<CR>
onoremap in] :<C-u>execute "normal! /]\r:nohlsearch\rvi["<CR>
onoremap il[ :<C-u>execute "normal! ?[\r:nohlsearch\rvi]"<CR>
onoremap il] :<C-u>execute "normal! ?]\r:nohlsearch\rvi["<CR>
onoremap an[ :<C-u>execute "normal! /[\r:nohlsearch\rva]"<CR>
onoremap an] :<C-u>execute "normal! /]\r:nohlsearch\rva["<CR>
onoremap al[ :<C-u>execute "normal! ?[\r:nohlsearch\rva]"<CR>
onoremap al] :<C-u>execute "normal! ?]\r:nohlsearch\rva["<CR>

" }}}

" -- Single and Double Quotes -- {{{
" --------------------------------------------------------------------

" following are like 'inside/around next/last single/double quotes
onoremap in" :<C-u>execute "normal! /\"\r:nohlsearch\rvi\""<CR>
onoremap in' :<C-u>execute "normal! /'\r:nohlsearch\rvi'"<CR>
onoremap il" :<C-u>execute "normal! ?\"\r:nohlsearch\rvi\""<CR>
onoremap il' :<C-u>execute "normal! ?'\r:nohlsearch\rvi'"<CR>
onoremap an" :<C-u>execute "normal! /\"\r:nohlsearch\rva\""<CR>
onoremap an' :<C-u>execute "normal! /'\r:nohlsearch\rva'"<CR>
onoremap al" :<C-u>execute "normal! ?\"\r:nohlsearch\rva\""<CR>
onoremap al' :<C-u>execute "normal! ?'\r:nohlsearch\rva'"<CR>

" }}}

" -- underscores -- {{{
" --------------------------------------------------------------------

" following are like inside next/last underscore
onoremap in_ :<C-u>execute "normal! /_\r:nohlsearch\rlvt_"<CR>
onoremap il_ :<C-u>execute "normal! ?_\r:nohlsearch\rhvT_"<CR>

" following are like around next/last underscore
onoremap an_ :<C-u>execute "normal! /_\r:nohlsearch\rvf_"<CR>
onoremap al_ :<C-u>execute "normal! ?_\r:nohlsearch\rvF_"<CR>

" }}}

" email
onoremap in@ :<C-u>execute "normal! /[A-Za-z0-9%-.]\\+@\r:nohlsearch\rvt@"<CR>

" }}}

" == Turbux Customization == {{{
" ====================================================================

" Use Bundle prefix only when there is a Gemfile present
if filereadable("bin/spring")
  let g:turbux_command_prefix = ''
elseif filereadable("Gemfile")
  let g:turbux_command_prefix = 'bundle exec'
endif

" Pass in a random seed to RSpec from bash's $RANDOM
if filereadable("bin/rspec")
  let g:turbux_command_rspec = 'bin/rspec --seed $RANDOM'
else
  let g:turbux_command_rspec = 'rspec --seed $RANDOM'
endif

function! SendTestToTmuxWithZeus()
  let g:turbux_command_tmp = g:turbux_command_prefix
  let g:turbux_command_prefix = 'zeus'
  call SendTestToTmux(expand('%'))
  let g:turbux_command_prefix = g:turbux_command_tmp
endfunction

function! SendFocusedTestToTmuxWithZeus()
  let g:turbux_command_tmp = g:turbux_command_prefix
  let g:turbux_command_prefix = 'zeus'
  call SendFocusedTestToTmux(expand('%'), line('.'))
  let g:turbux_command_prefix = g:turbux_command_tmp
endfunction

nnoremap <Leader>z :call SendTestToTmuxWithZeus()<CR>
nnoremap <Leader>Z :call SendFocusedTestToTmuxWithZeus()<CR>

" }}}

" == Zeus == {{{
" ====================================================================

" Run all specs with Zeus or Bundle or only RSpec
if filereadable(".zeus.sock")
  nnoremap <Leader>a :call Send_to_Tmux("zeus ".g:turbux_command_rspec." spec\n")<CR>
elseif filereadable("Gemfile")
  nnoremap <Leader>a :call Send_to_Tmux("bundle exec ".g:turbux_command_rspec." spec\n")<CR>
else
  nnoremap <Leader>a :call Send_to_Tmux(g:turbux_command_rspec." spec\n")<CR>
endif

" Run specs with debugging
nnoremap <Leader>dt :call Send_to_Tmux("env POLTERGEIST_DEBUG=yes ".g:turbux_command_rspec." ".expand('%')."\n")<CR>

" Restart Zeus by touching config/application.rb
nnoremap <Leader>rz :silent execute "!touch config/application.rb > /dev/null &"<CR>:redraw!<CR>

" Run migrations
if filereadable(".zeus.sock")
  nnoremap <Leader>m :call Send_to_Tmux("zeus rake db:migrate db:test:prepare\n")<CR>
  nnoremap <Leader>um :call Send_to_Tmux("zeus rake db:rollback\n")<CR>
elseif filereadable("bin/rake")
  nnoremap <Leader>m :call Send_to_Tmux("bin/rake db:migrate db:test:prepare\n")<CR>
  nnoremap <Leader>um :call Send_to_Tmux("bin/rake db:rollback\n")<CR>
elseif filereadable("Gemfile")
  nnoremap <Leader>m :call Send_to_Tmux("bundle exec rake db:migrate db:test:prepare\n")<CR>
  nnoremap <Leader>um :call Send_to_Tmux("bundle exec rake db:rollback\n")<CR>
else
  nnoremap <Leader>m :call Send_to_Tmux("rake db:migrate db:test:prepare\n")<CR>
  nnoremap <Leader>um :call Send_to_Tmux("rake db:rollback\n")<CR>
endif

" Choose faster rake when zeus or bundle is present
if filereadable(".zeus.sock")
  let g:rake = "zeus rake"
elseif filereadable("zeus.json")
  let g:rake = "zeus rake"
elseif filereadable("Gemfile")
  let g:rake = "bundle exec rake"
else
  let g:rake = "rake"
endif

" }}}

" == Puppet == {{{
" ====================================================================

" Run specs for Puppet project
if filereadable("manifests/init.pp")
  nnoremap <Leader>t :call Send_to_Tmux("script/specs\n")<CR>
end

" }}}

" == Gist Customization == {{{
" ====================================================================

let g:gist_open_browser_after_post = 1

" }}}

" == YouCompleteMe == {{{
" ====================================================================

let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']

" }}}

" == Temporary for muscle memory == {{{
" ====================================================================

nnoremap zt <nop>
nnoremap zb <nop>
nnoremap <C-^> <nop>

" }}}

" == Stuff to try out == {{{
" ====================================================================

" Playing around with remappings on a per-filetype basis
augroup comments
  autocmd!
  autocmd FileType clojure nnoremap <buffer> <Localleader>/ I;<ESC>
  autocmd FileType ruby,coffee nnoremap <buffer> <Localleader>/ I#<ESC>
  autocmd FileType javascript nnoremap <buffer> <Localleader>/ I//<ESC>
  autocmd FileType haml nnoremap <buffer> <Localleader>/ I= # <ESC>
  autocmd BufNewFile,BufRead .vimrc nnoremap <buffer> <Localleader>/ I" <ESC>
augroup END

augroup markdown
  autocmd!
  autocmd BufNewFile,BufRead *.markdown set filetype=markdown
  autocmd FileType markdown onoremap <buffer> ih :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rkvg_"<cr>
  autocmd FileType markdown onoremap <buffer> ah :<c-u>execute "normal! ?^[=-][=-]\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END

" Change RSpec's `should` to `expect(object).to`
nnoremap <Leader>ste 0/should<CR>ceto<ESC>^c/\.to<CR>expect()<ESC>P^
" Change RSpec's `should_not` to `expect(object).to_not`
nnoremap <Leader>snte 0/should<CR>ceto_not<ESC>^c/\.to_not<CR>expect()<ESC>P^
" Change RSpec's `should_receive` to `expect(object).to receive`
nnoremap <Leader>str 0/should<CR>cawreceive<ESC>bito <ESC>^c/\.to<CR>()<ESC>PIexpect<ESC>^
" Change RSpec's `should_not_receive` to `expect(object).to_not receive`
nnoremap <Leader>sntr 0/should<CR>cawreceive<ESC>bito_not <ESC>^c/\.to_not<CR>()<ESC>PIexpect<ESC>^

" }}}

" Load .vim.custom file per project
if filereadable(".vim.custom")
  so .vim.custom
endif

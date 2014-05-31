" == General == {{{
" ==================================================================== 

" == Pathogen == {{{
" ====================================================================

call pathogen#infect()
call pathogen#helptags()

" }}}

set number
set relativenumber
set autoread
set list listchars=tab:\ \ ,trail:·
set splitbelow
set splitright
set smartcase
set background=dark
colorscheme jellybeans

" Use behavior of shell autocomplete functions for completing filenames
set wildmode=longest,list

" Highlight chars past 80 columns
augroup highlight
  autocmd!
  " autocmd BufEnter *.rb,*.haml,*.markdown highlight OverLength ctermbg=lightyellow guibg=#592929
  " autocmd BufEnter *.rb,*.haml,*.markdown match OverLength /\%80v.*/
augroup END

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
  autocmd BufWritePre *.clj :call Preserve("%s/\\s\\+$//e")
  autocmd BufWritePre *.hs :call Preserve("%s/\\s\\+$//e")
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

" Yank after the cursor instead of the entire line
nnoremap Y y$

" Copy and paste between Vim instances
vnoremap <silent> <Leader>y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nnoremap <silent> <Leader>y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
noremap <silent> <Leader>p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
noremap <silent> <Leader>P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

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
nnoremap K i<CR><Esc>k$

" Split line at comma
nnoremap <Leader>, 0f,<Space>i<CR><Esc>k$j

" Split line at comma
nnoremap <Leader>; 0f;<Space>i<CR><Esc>k$j

" Split line at dot
nnoremap <Leader>. 0f.<Space>i<CR><Esc>k$j

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

" Zoom in/out current window
noremap <C-w>z :call ZoomInOutCurrentWindow()<CR>

let g:window_status = "out"
function! ZoomInOutCurrentWindow()
  if g:window_status ==? "in"
    let g:window_status = "out"
    execute "normal! \<C-w>="
  else
    let g:window_status = "in"
    resize
  endif
endfunction

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

" -- Git Customization -- {{{
" --------------------------------------------------------------------

noremap <Leader>gl :!clear && git log<CR>
noremap <Leader>gln :!clear && git log --name-only<CR>
noremap <Leader>glp :!clear && git log -p<CR>
noremap <Leader>gs :call Send_to_Tmux("clear\ngit status -s\n")<CR>
noremap <Leader>ga :!clear && git add %<CR>
noremap <Leader>gap :!clear && git add -p<CR>
noremap <Leader>gac :!clear && git add -p %<CR>
noremap <Leader>gca :!clear && git commit --amend<CR>
noremap <Leader>gcp :!clear && git checkout -p %<CR>
noremap <Leader>gp :!git push origin `git rev-parse --abbrev-ref HEAD`<CR>
noremap <Leader>gpf :!git push -f origin `git rev-parse --abbrev-ref HEAD`<CR>
noremap <Leader>gc :!clear && git commit<CR>
noremap <Leader>gd :!clear && git diff<CR>
noremap <Leader>gdc :!clear && git diff --cached<CR>
noremap <Leader>gfp :!clear && git fetch -p origin<CR>
noremap <Leader>gr :!clear && git rebase origin/master<CR>
noremap <Leader>gfr :!clear && git fetch -p origin && git rebase origin/master<CR>
noremap <Leader>gcb :call Send_to_Tmux("git checkout -b " . SanitizeInput(input("New branch name:")) . " origin/master && clear\n")<CR>

function! SanitizeInput(name)
  return substitute(join(split(tolower(a:name)), "_"), "[\]\['\"`:#<>-]", "", "g")
endfunction

function! GetCurrentBranch()
  return system("git rev-parse --abbrev-ref HEAD")
endfunction

" Expand %b to the current branch
cnoremap <expr> %b getcmdtype() == ':' ? GetCurrentBranch() : '%%'

noremap ]c :call GitGutterNextHunk()<CR>
noremap [c :call GitGutterPrevHunk()<CR>

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

" }}}

" email
onoremap in@ :<C-u>execute "normal! /[A-Za-z0-9%-.]\\+@\r:nohlsearch\rvt@"<CR>

" }}}

" == Turbux Customization == {{{
" ====================================================================

" Use Bundle prefix when there is a Gemfile present
if filereadable("Gemfile")
  let g:turbux_command_prefix = 'bundle exec'
endif

" Pass in a random seed to RSpec from bash's $RANDOM
let g:turbux_command_rspec = 'rspec --seed $RANDOM'

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
if filereadable("zeus.json")
  nnoremap <Leader>a :call Send_to_Tmux("zeus ".g:turbux_command_rspec." spec\n")<CR>
elseif filereadable("Gemfile")
  nnoremap <Leader>a :call Send_to_Tmux("bundle exec ".g:turbux_command_rspec." spec\n")<CR>
else
  nnoremap <Leader>a :call Send_to_Tmux(g:turbux_command_rspec." spec\n")<CR>
endif

" Restart Zeus by touching config/application.rb
nnoremap <Leader>rz :silent execute "!touch config/application.rb > /dev/null &"<CR>:redraw!<CR>

" Run migrations
if filereadable("zeus.json")
  nnoremap <Leader>m :call Send_to_Tmux("zeus rake db:migrate db:test:prepare\n")<CR>
elseif filereadable("Gemfile")
  nnoremap <Leader>m :call Send_to_Tmux("bundle exec rake db:migrate db:test:prepare\n")<CR>
else
  nnoremap <Leader>m :call Send_to_Tmux("rake db:migrate db:test:prepare\n")<CR>
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

" == Rails.vim support for Backbone.js == {{{
" ====================================================================

augroup backbone
  autocmd!
  autocmd User Rails Rnavcommand template    app/assets/javascripts/templates   -glob=**/*  -suffix=.hamlc
  autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jspec       spec/javascripts                   -glob=**/*  -suffix=.coffee
  autocmd User Rails Rnavcommand jfixture    spec/javascripts/fixtures          -glob=**/*  -suffix=.html
augroup END

" }}}

" == Rails.vim support for custom paths == {{{
" ====================================================================

augroup rails_custom_paths
  autocmd!
  autocmd User Rails Rnavcommand presenter  app/presenters  -glob=**/*  -suffix=.rb
  autocmd User Rails Rnavcommand uploader   app/uploaders   -glob=**/*  -suffix=.rb
  autocmd User Rails Rnavcommand job        app/jobs        -glob=**/*  -suffix=.rb
  autocmd User Rails Rnavcommand mailer     app/mailers     -glob=**/*  -suffix=.rb
  autocmd User Rails Rnavcommand decorator  app/decorators  -glob=**/*  -suffix=.rb
  autocmd User Rails Rnavcommand validator  app/validators  -glob=**/*  -suffix=.rb
  autocmd User Rails Rnavcommand admin      app/admin       -glob=**/*  -suffix=.rb
  autocmd User Rails Rnavcommand config     config          -glob=*.*   -suffix=      -default=routes.rb
augroup END

" }}}

" == Rails.vim support for factories == {{{
" ====================================================================

augroup rails_factories
  autocmd!
  autocmd User Rails Rnavcommand factory spec/factories -glob=**/* -suffix=.rb
augroup END

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

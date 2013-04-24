" NeoVundle Setting------------------------------------------------------- {{{
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
    \ },
    \ }

" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails.git'

NeoBundle 'taichouchou2/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}


" vim-scripts repos
NeoBundle 'Command-T'
NeoBundle 'EasyMotion'
NeoBundle 'fugitive.vim'
NeoBundle 'L9'
NeoBundle 'snipMate'
NeoBundle 'Solarized'
NeoBundle 'surround.vim'
NeoBundle 'Tabular'
NeoBundle 'taglist.vim'
NeoBundle 'tComment'
NeoBundle 'The-NERD-tree'
NeoBundle 'vim-coffee-script'
NeoBundle 'YankRing.vim'
NeoBundle 'ZenCoding.vim'
" Non github repos

" Non git repos

"...
filetype plugin indent on

" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck


" }}}

" Basic Settings----------------------------------------------------- {{{
set guifont=Ricty\ for\ Powerline
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v,'\/'),"\n",'\\n','g')<CR><CR>
" }}}

" Display Settings----------------------------------------------------- {{{
set autoread
:set number
" :Set relativenumber
filetype plugin indent on
:set hidden
:set autowrite
:set hlsearch
:set ic
" }}}

" Status line ------------------------------------------------------------- {{{
set laststatus=2
let g:Powerline_symbols = 'compatible'
" set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
" set statusline=%f    " Path.
" set statusline+=%m   " Modified flag.
" set statusline+=%r   " Readonly flag.
" set statusline+=%w   " Preview window flag.

" set statusline+=\    " Space.

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
" set statusline+=%*

" set statusline+=%=   " Right align.

" " File format, encoding and type.  Ex:          " (unix/utf-8/python)"
" set statusline+=(
" set statusline+=%{&ff}                        " Format (unix/DOS).
" set statusline+=/
" set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
" set statusline+=/
" set statusline+=%{&ft}                        " Type (python).
" set statusline+=)

" " Line and column position and counts.
" set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" File format, encoding and type.  Ex: "
" set statusline+=(
" set statusline+=%{&ff)
" set statusline+=/
" set statusline+=%{strlen()
" set statusline+=/
" set statusline+=%{&ft)
" set statusline+=)

" " Line and column position and counts.
" set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" set hidden
" set modelines=0
" set list
" set listchars=tab:>-
" }}}

" {{{ Color Settings
set t_Co=256
syntax on

" MacVimで動かしたときはSolarizedのdarkを適用
if has("gui_macvim")
  set background=dark
  colorscheme solarized
endif
" }}}

" Bell Settings--------------------------------------------------------- {{{
set visualbell
set noerrorbells
" }}}

" Key Binding ------------------------------------------------------------- {{{

let mapleader = ","
let g:mapleader = ","

" Fast editing of the .vimrc
autocmd! BufWritePost .vimrc source ~/.vimrc

" Spliting the Screen
nmap <Space>- :split<cr><cr>
nmap <Space>\| :vsplit<cr><cr>

"deleting search highlight
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Delete Key Problem
set backspace=2 " make backspace work like most other apps

" disable allow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" disable K
nnoremap K <nop>

" }}}

" Indent Setting------------------------------------------------------- {{{
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
" }}}

" Folding--------------------------------------------------------------- {{{
set foldmethod=marker
set foldlevelstart=0
"nnoremap <Space> za
"vnoremap <Space> za
" }}}

" Backup Settings------------------------------------------------------- {{{
set nobackup
set noswapfile
" }}}

" Line Numbering-------------------------------------------------------- {{{
:set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

noremap <C-n><C-n> :call NumberToggle()<cr>

:au FocusLost * :set number
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" }}}

" Paste / Nopaste ------------------------------------------------------ {{{
" function! PasteToggle()
"   if(&nopaste == 1)
"     set paste 
"     call s:warningMsg('Setting to Paste Mode')
"   else
"     set nopaste 
"     call s:warningMsg('Setting to NO-Paste Mode')
"   endif
" endfunc
" 
" noremap <C-p><C-p> :call PasteToggle()<cr>
" }}}
 
" ctag setting---------------------------------------------------------- {{{
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
" }}}

" Command-T------------------------------------------------------------- {{{
let g:CommandTMaxHeight=20
let g:CommandTMatchWindowAtTop=1
nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>b :CommandTBuffer<CR>
nmap <silent> <Leader>f :CommandTFlush<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>m :TagbarToggle<CR>
" }}}

" Tabularize------------------------------------------------------------ {{{
if exists("Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>al :Tabularize /,\zs<CR>
  vmap <Leader>al :Tabularize /,\zs<CR>
endif
" }}}

" NERD-tree------------------------------------------------------------- {{{
let g:NERDTreeWinSize = 40
" }}}

" WildMenu-------------------------------------------------------------- {{{
set wildignore+=.hg,.git,.svn                                       " VCS
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg                      " Images
set wildignore+=vendor/*,log/*,tmp/*,*app/admin/*,*app/view/admin/* " Rails
set wildignore+=*.jar,*.class                                       " Java
set wildignore+=rebar,tags,*.beam,deps/*,rel/*,*/ebin/*             " Erlang
set wildignore+=*.lzo,*.zip,*.gz,*.tgz,*.tar                        " Compressed files
set wildignore+=*.log,BLANK,*.log.[0-9]*,*.lock,*.pid               " log, lock, pid files "
set wildignore+=*.DS_Store                                          " OS X
" }}}

" ZenCoding------------------------------------------------------------- {{{
let g:user_zen_settings = {
  \'indentation' : '  ',
  \}
" }}}

" Rails.vim------------------------------------------------------------- {{{
" }}}

" snipmate-------------------------------------------------------------- {{{
let g:snippets_dir = '~/.vim/snippets/'
" }}}

" YankRing ------------------------------------------------------------- {{{
let g:yankring_paste_v_akey = ''
let g:yankring_paste_v_bkey = ''
" }}}

" Surround.vim --------------------------------------------------------- {{{
" }}}

" Utility Function ----------------------------------------------------- {{{
function! s:warningMsg(msg)
    echohl WarningMsg
    echomsg a:msg
    echohl None
endfunction
" }}}

" Search Dash for word under cursor {{{
function! SearchDash()
  let s:browser = "/usr/bin/open"
  let s:wordUnderCursor = expand("<cword>")
  let s:url = "dash://".s:wordUnderCursor
  let s:cmd ="silent ! " . s:browser . " " . s:url
  execute s:cmd
  redraw!
endfunction
map <leader>d :call SearchDash()<CR> 
" }}}

" vimgrep     ------------------------------------------------------ {{{
autocmd QuickFixCmdPost *grep* cwindow

nnoremap [q :cprevious<CR>   " To Previous 
nnoremap ]q :cnext<CR>       " To Next 
nnoremap [Q :<C-u>cfirst<CR> " To First
nnoremap ]Q :<C-u>clast<CR>  " To Last 

" }}}

" なにこれ？
autocmd QuickfixCmdPost make copen

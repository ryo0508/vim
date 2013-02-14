" Vundle Setting------------------------------------------------------- {{{
set nocompatible
filetype plugin indent on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'ZenCoding.vim'
Bundle 'surround.vim'
Bundle 'snipMate'
Bundle 'L9'
Bundle 'Command-T'
Bundle 'taglist.vim'
Bundle 'https://github.com/majutsushi/tagbar.git'
Bundle 'Tabular'
Bundle 'YankRing.vim'
Bundle 'EasyMotion'
Bundle 'The-NERD-tree'
Bundle 'vim-coffee-script'
Bundle 'tomasr/molokai'
Bundle 'pangloss/vim-javascript'
Bundle 'tComment'
Bundle 'tpope/vim-rails.git'
Bundle 'Solarized'
Bundle 'fugitive.vim'
" Bundle 'https://github.com/goldfeld/vim-seek.git'
com! EditBundles :e $bundles_file
augroup Vundle
  au BufWritePost $bundles_file call vundle#config#init()
  au BufWritePost $bundles_file source $bundles_file
  au BufWritePost $bundles_file BundleClean
  au BufWritePost $bundles_file BundleInstall
augroup END
" }}}

" Basic Settings----------------------------------------------------- {{{
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
"set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%4v\ %l/%L
set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.

set statusline+=\    " Space.

set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()} " Syntastic errors.
set statusline+=%*

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)

" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

" File format, encoding and type.  Ex: "
" set statusline+=(
" set statusline+=%{&ff)
" set statusline+=/
" set statusline+=%{strlen()
" set statusline+=/
" set statusline+=%{&ft)
" set statusline+=)
"
" " Line and column position and counts.
" set statusline+=\ (line\ %l\/%L,\ col\ %03c)

set hidden
set modelines=0
set list
set listchars=tab:>-
" }}}

" {{{ Color Settings
syntax on
set t_Co=256

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
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

noremap <C-n><C-n> :call NumberToggle()<cr>

:au FocusLost * :setnumber
:au FocusGained * :set relativenumber

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

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

" Snipmate-------------------------------------------------------------- {{{
let g:snippets_dir = '~/.vim/snippets/'
" }}}

" YankRing ------------------------------------------------------------- {{{
let g:yankring_paste_v_akey = ''
let g:yankring_paste_v_bkey = ''
" }}}

" Surround.vim --------------------------------------------------------- {{{
" }}}

autocmd QuickfixCmdPost make copen

"**********Vundle Setting***************************************
"{{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" 1.bundles.vimでプラグインのリストを管理
" 2.EditBundlesでこのリストの編集を開始
" 3.リストを保存することでg:bundlesを更新してBundleCleanする
let $bundles_file=$HOME.'/.vim/bundles.vim'
com! EditBundles :e $bundles_file
augroup Vundle
	au BufWritePost $bundles_file call vundle#config#init()
	au BufWritePost $bundles_file source $bundles_file
	au BufWritePost $bundles_file BundleClean
	au BufWritePost $bundles_file BundleInstall
augroup END
source $bundles_file

filetype plugin indent on
"}}}*******Vundle Setting End***********************************
"**********HTML TEMPLATE ***************************************
"{{{
augroup SkeletonAu
	autocmd!
	autocmd BufNewFile *.html 0r ~/vimfiles/templates/skel.html
augroup END
"}}}*******HTML TEMPLATE End************************************


"**********COLOR SETTING****************************************
"{{{
syntax on
"}}}*******COLOR SETTING End************************************


:set number
:set hidden
:set autowrite
"**********KEY BINDING******************************************
" Fast saving
nmap <leader>w :w!<cr>

" Fast editing of the .vimrc
nmap <leader>e :e! ~/.vimrc<cr>

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" For faster file switching
nmap <Space>b :ls<CR>:buffer 
nmap <Space>f :edit .<CR>
nmap <Space>v :vsplit<CR><C-w><C-w>:ls<CR>:buffer

" Spliting the Screen
nmap <Space>- :split<cr><cr>
nmap <Space>\| :vsplit<cr><cr>
"**********KEY BINDING END**************************************
set foldmethod=marker

"**********INDENT SETTING***************************************
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
"**********INDENT SETTING END***********************************


"ctag setting
"{{{
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
" }}}

" ---------------------------------------------------------------------- {{{
" Command-T
let g:CommandTMaxHeight=40
let g:CommandTMatchWindowAtTop=1
nmap <silent> <Leader>t :CommandT<CR>
nmap <silent> <Leader>b :CommandTBuffer<CR>
nmap <silent> <Leader>f :CommandTFlush<CR>
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>m :TagbarToggle<CR>
" }}}


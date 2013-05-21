#dotvim
##REQUIREMENT:
* Vim compiled with Ruby support(7.0+)
  - check by running'vim --version | grep ruby' and if you see "+ruby" then you are good to go :)
* git 
* ruby which should be linked to vim

##Caution:
When you switch to Neobundle from Vundle, you need to re-link command-t by reinstalling command-t.
Please follow from the step 3 below.


##USAGE:
1. git clone to your root directory:  
```
$ git clone git@github.com:ryo0508/vim.git
```

2. create symbolic links to your root directory:  
```
$ ln -s ~/vim/.vim vim/.vim && ln -s ~/vim/.vimrc ~/.vimrc && ln -s ~/vim/vimfiles ~/vim/.vimfiles
```
  
3 set up neobundle
```
$ git clone https://github.com/Shougo/neobundle.vim.git
```

4. open vim and run command below:  
```
:NeoBundleInstall
```

5. Install Command-t  (ref. http://git.wincent.com/command-t.git/blob/HEAD:/doc/command-t.txt)
```
$ cd .vim/bundle/Command-T/ruby/command-t
$ rvm use system
$ rbenv local system
$ ruby extconf.rb
$ make
$ sudo make install
```

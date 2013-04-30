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
  
3. set up vundler  
```
$ git clone https://github.com/gmarik/vundle.git ~/vim/.vim/bundle/vundle
```

3` set up neobundle
```
$ git clone https://github.com/Shougo/neobundle.vim.git
```

4. open vim and run command below:  
```
:BundleInstall

or

:NeoBundleInstall
```

5. Install Command-t  
```
$ cd .vim/bundle/Command-T/ruby/command-t
$ ruby extconf.rb
$ rvm use system
$ rbenv local system
$ make
$ sudo make install
```

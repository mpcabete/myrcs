#! /bin/bash
echo "source ~/myrcs/.vimrc" > ~/.vimrc

# create persistent undo dir
if [[ ! -d ~/.vim/undodir ]]
then
  echo "creating vim undodir";
  mkdir -p ~/.vim/undodir

fi

# print current keymap table 
xmodmap -pke > ~/.Xmodmap;
# append capslock bind
cat ./xmodmap-capslock >> ~/.Xmodmap;
# update bindings
xmodmap ~/.Xmodmap

# install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


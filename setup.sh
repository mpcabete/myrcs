#! /bin/bash
echo "source ~/myrcs/.vimrc" > ~/.vimrc

# create persistent undo dir
if [[ ! -d ~/.vim/undodir ]]
then
  echo "creating vim undodir";
  mkdir -p ~/.vim/undodir

fi

# install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


xmodmap ./.Xmodmap
cp ./.Xmodmap ~/.Xmodmap

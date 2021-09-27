#! /bin/bash
echo "source ~/myrcs/.vimrc" > ~/.vimrc


if [[ ! -d ~/.vim/undodir ]]
then
  echo "creating vim undodir";
  mkdir -p ~/.vim/undodir

fi

xmodmap ./.Xmodmap
cp ./.Xmodmap ~/.Xmodmap

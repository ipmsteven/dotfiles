#!/bin/bash


# Install Vim
curl -L https://bit.ly/janus-bootstrap | bash


# link dotfiles
dotdir=$(cd $(dirname $0) && pwd)
for filename in $(find $dotdir -name "*.symlink"); do
  ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
done

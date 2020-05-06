#!/bin/bash


# Install Vim
curl -L https://bit.ly/janus-bootstrap | bash

# Install zsh and ohmyzsh
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  sudo apt install -y zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi;

# link dotfiles
dotdir=$(cd $(dirname $0) && pwd)
for filename in $(find $dotdir -name "*.symlink"); do
  ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
done

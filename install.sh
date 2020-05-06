#!/bin/bash


# Install Vim
curl -L https://bit.ly/janus-bootstrap | bash

# Install zsh and ohmyzsh
if [ "$SHELL" != "/usr/bin/zsh" ]; then
  sudo apt install -y zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi;

# Reinstall tmux 3 on bp-dev box

sudo apt remove -y tmux

sudo apt install -y git
sudo apt install -y automake
sudo apt install -y build-essential
sudo apt install -y pkg-config
sudo apt install -y libevent-dev
sudo apt install -y libncurses5-dev
sudo apt install -y bison

rm -fr /tmp/tmux
git clone https://github.com/tmux/tmux.git /tmp/tmux
cd /tmp/tmux
sh autogen.sh
./configure && make
sudo make install
cd -
rm -fr /tmp/tmux

# Link dotfiles
dotdir=$(cd $(dirname $0) && pwd)
for filename in $(find $dotdir -name "*.symlink"); do
  ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
done

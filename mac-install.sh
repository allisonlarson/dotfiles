#!/bin/bash

clear

echo "Welcome to your installer"

if ! which brew > /dev/null; then
  echo "Now installing homebrew from https://raw.githubusercontent.com/Homebrew/install/master/install..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "homebrew installed!"
fi

if ! which zsh > /dev/null; then
  echo "Now installing zsh & zsh-completions"
  brew install zsh zsh-completions
  echo "ZSH installed!"
fi

if ! ls ~/.oh-my-zsh > /dev/null; then
  echo "Now installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "oh-my-zsh installed!"
fi

echo "Now installing .zshrc and themes"
echo "Moving princess theme into themes directory"
cp ./zsh/oh-my-zsh/themes/princess.zsh-theme ~/.oh-my-zsh/themes/
echo "Symlinking zshrc"
ln -sf ./zsh/.zshrc ~/.zshrc
echo "Sourcing .zshrc"
source ~/.zshrc
echo "ZSHrc and themes installed!"

echo "Moving on to vim install"
echo "Installing pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Pulling submodules.."
git submodule update --init --recursive
echo "Linking vim bundles"
ln -sf ./vim/bundle ~/.vim/
echo "linking vimrc"
ln -s ./vim/.vimrc ~/.vimrc
echo "Vim installed!"

echo "linking gitconfig"
ln -s ./.gitconfig ~/.gitconfig
echo "gitconfig linked"
echo "linking gitignore"
ln -s ./.gitignore ~/.gitignore
echo "gitignore linked"

if ! which ag > /dev/null; then
  echo "installing the silver searcher"
  brew install the_silver_searcher
fi
echo "linking .agignore"
ln -s ./ag/.agignore ~/.agignore
echo "ag installed"


if ! which tmux > /dev/null; then
  echo "installing tmux"
  brew install tmux
fi
echo "linking tmux configs"
ln -s ./tmux/.tmux.conf ~/.tmux.conf
echo "tmux installed"

echo "This has been fun! Later!"

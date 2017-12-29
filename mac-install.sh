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
ln -s `pwd`/zsh/oh-my-zsh/themes/princess.zsh-theme ~/.oh-my-zsh/themes/
echo "Symlinking zshrc"
ln -sf `pwd`/zsh/.zshrc ~/.zshrc
echo "Sourcing .zshrc"
source ~/.zshrc
echo "ZSHrc and themes installed!"

echo "Moving on to vim install"
echo "Installing vundle"
mkdir -p ~/.vim/bundle && \
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "Installing vim plugins"
vim +PluginInstall +qall
echo "linking vim after/syntax files"
mkdir -p ~/.vim/after/syntax
ln -s `pwd`/vim/after/syntax/* ~/.vim/after/syntax/
echo "linking vim princess airline theme"
ln -s `pwd`/vim/vim-airline-themes/princess.vim ~/.vim/bundle/vim-airline-themes/autoload/airline/themes/
echo "linking vimrc"
ln -s `pwd`/vim/.vimrc ~/.vimrc
echo "Vim installed!"

echo "linking gitconfig"
ln -s `pwd`/.gitconfig ~/.gitconfig
echo "gitconfig linked"
echo "linking gitignore"
ln -s `pwd`/.gitignore ~/.gitignore
echo "gitignore linked"

if ! which ag > /dev/null; then
  echo "installing the silver searcher"
  brew install the_silver_searcher
fi
echo "linking .agignore"
ln -s `pwd`/ag/.agignore ~/.agignore
echo "ag installed"


if ! which tmux > /dev/null; then
  echo "installing tmux"
  brew install tmux
fi

echo "linking tmux configs"
ln -s `pwd`/tmux/.tmux.conf ~/.tmux.conf
echo "tmux installed"

echo "This has been fun! Later!"

#!/bin/bash

# Detect machine
unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) MACHINE=Linux ;;
Darwin*) MACHINE=Mac ;;
CYGWIN*) MACHINE=Cygwin ;;
MINGW*) MACHINE=MinGw ;;
*) MACHINE="UNKNOWN:${unameOut}" ;;
esac

echo $MACHINE

echo "Installing Vim"

# Installs Oh my ZSH with Homebrew (Mac)
if [[ $MACHINE == "Mac" ]]; then
	# Installs vim ultimate vimrc for some sweet vim defaults https://github.com/amix/vimrc
	git clone https://github.com/amix/vimrc.git ~/.vim_runtime

	# Install the complete version
	sh ~/.vim_runtime/install_awesome_vimrc.sh

fi

# Installs Oh my ZSH with Linux
if [[ $MACHINE == "Linux" ]]; then
	git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_basic_vimrc.sh
fi

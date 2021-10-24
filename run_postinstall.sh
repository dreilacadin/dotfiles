#!/bin/zsh

# Detect machine
unameOut="$(uname -s)"
case "${unameOut}" in
Linux*) MACHINE=Linux ;;
Darwin*) MACHINE=Mac ;;
CYGWIN*) MACHINE=Cygwin ;;
MINGW*) MACHINE=MinGw ;;
*) MACHINE="UNKNOWN:${unameOut}" ;;
esac

if [[ $MACHINE == "Mac" ]]; then

	echo "Setting default shell to zsh"

	# Set default shell to zsh
	chsh -s $(which zsh)
	# apply our custom .zshrc, we need to do this because
	source ~/.zshrc.pre-oh-my-zsh
fi

if [[ $MACHINE == "Linux" ]]; then
	echo "this gets called"
fi

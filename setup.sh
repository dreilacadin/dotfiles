#!/bin/bash

cd "$HOME" || return

system_type=$(uname -s)

if [[ $system_type == "Darwin" ]]; then
	echo "Hello Mac User!"
	echo "Installing Homebrew"

	# install Homebrew
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# install git from Homebrew
	GIT_VERSION="$(git --version)"
	if [ "$GIT_VERSION" != "command not found" ]; then
		echo "git already" installed - $GIT_VERSION
	else
		echo "git is missing, installing git from homebrew"
		brew install git
	fi
fi

if [[ $system_type == "Linux" ]]; then
	echo "Hello Linux User!"
	sudo apt update

	# Make sure git is installed, not all installations have it by default
	GIT_VERSION="$(git --version)"
	if [ "$GIT_VERSION" != "command not found" ]; then
		echo "git already" installed - $GIT_VERSION
	else
		echo "git is missing, installing git"
		sudo apt install -y git
	fi
fi

echo -n "This will install meslo nerd font. Continue? (y/n)? "
read answer

mkdir -p ~/.fonts
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf --output ~/.fonts/'MesloLGS NF Regular.ttf'
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf --output ~/.fonts/'MesloLGS NF Bold.ttf'
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf --output ~/.fonts/'MesloLGS NF Italic.ttf'
curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf --output ~/.fonts/'MesloLGS NF Bold Italic.ttf'

# Install Oh-my-zsh
curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install | sh

# Install chezmoi dotfile manager: https://github.com/twpayne/chezmoi
curl -sfLS https://git.io/chezmoi | sh

export PATH=$HOME/bin:$PATH
chezmoi init --apply --verbose https://github.com/dreilacadin/dotfiles.git

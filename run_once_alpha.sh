#!/bin/bash

cd "$HOME" || return

system_type=$(uname -s)

if [[ $system_type == "Darwin" ]]; then
	echo "Hello Mac User!"

	# install Homebrew
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# Make sure we’re using the latest Homebrew.
	brew update

	# Upgrade any already-installed formulae.
	brew upgrade

	# Save Homebrew’s installed location.
	BREW_PREFIX=$(brew --prefix)

	# install all the packages in the Brewfile
	brew bundle --file ./Brewfile

	# Remove outdated versions from the cellar.
	brew cleanup

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

	# TODO: Update Linux install scripts

	# Make sure git is installed, not all installations have it by default
	GIT_VERSION="$(git --version)"
	if [ "$GIT_VERSION" != "command not found" ]; then
		echo "git already" installed - $GIT_VERSION
	else
		echo "git is missing, installing git"
		sudo apt install -y git
	fi
fi

export PATH=$HOME/bin:$PATH

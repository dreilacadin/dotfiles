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

# Installs .oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	# Installs Oh my ZSH with Homebrew (Mac)
	if [[ $MACHINE == "Mac" ]]; then
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

		# Assumes default ZSH installation
		ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

		# Install plugins
		echo "Installing ZSH Plugins"

		# Powerlevel 10k zsh theme
		git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

		# Fix permissions
		chmod 700 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	fi
fi

# Installs theme and plugins with linux
if [[ $MACHINE == "Linux" ]]; then
	# Assumes default ZSH installation
	ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

	# Install plugins
	echo "Installing ZSH Plugins"

	# Powerlevel 10k zsh theme
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	# Fix permissions
	chmod 700 ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

#!/bin/zsh

echo "Setting default shell to zsh"

# Set default shell to zsh
chsh -s $(which zsh)
# apply our custom .zshrc, we need to do this because
source ~/.zshrc.pre-oh-my-zsh

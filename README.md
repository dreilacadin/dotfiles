# dotfiles

## Powered by [Chezmoi](https://www.chezmoi.io/) ❤️

🔧 .files and configurations for MacOS. This is only compatible with MacOS (Big Sur and Up). Use at
your own risk. ⚠️

## Steps to bootstrap a new Mac

1. Install chezmoi and your dotfiles on a new machine with a single command

   - If you're using this on your dev environment, run:

   ```zsh
   sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply -v dreilacadin
   ```

   - If you're using this on a transitory environment(e.g. short lived containers), run:

   ```zsh
   sh -c "$(curl -fsLS git.io/chezmoi)" -- init --one-shot -v dreilacadin
   ```

   > 💡 The installation scripts might prompt you a couple of times for your administrator password.

2. That's it! After the installation finishes, verify your plugins, applications etc and your good
   to go. Start Hacking! 👨🏻‍💻

## TODO List

- Learn how to use [`defaults`](https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command)
  to record and restore System Preferences and other macOS configurations.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc.).
- Find inspiration and examples in other Dotfiles repositories at
  [dotfiles.github.io](https://dotfiles.github.io/).

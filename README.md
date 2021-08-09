# itscarlosecp's dotfiles

Welcome to my dotfiles, a repo where I store my development environment configurations. You can blindly copy these files if you wanted to, but I strongly suggest you use them as inspiration to build your dotfiles (you can learn a lot from setting up your personal configs).

![dotfiles](https://user-images.githubusercontent.com/47466248/126184263-fc17843c-3760-4368-8599-913284d99b5e.png)

## Details

These files are designed to work in UNIX-based operating systems such as Linux and MacOS. If you are using Windows as your desktop OS you can use [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) as well.

> ⚠️ Most of my folder structure is meant to be used with [GNU Stow](https://www.gnu.org/software/stow/). That's why you find nested folders inside some my dotfiles. To get to the actual config of the program you are looking for, you may have to navigate deeper into the file structure.

You can find a very complete list of the programs I use on a day-to-day in [info.txt](https://github.com/itscarlosecp/.dotfiles/blob/main/info.txt).

## VSCode

The main configuration files for VSCode are [settings.json](https://github.com/itscarlosecp/.dotfiles/blob/main/vscode/settings.json) and [keymappings.json](https://github.com/itscarlosecp/.dotfiles/blob/main/vscode/keymappings.json) both located under the VSCode directory. You must copy and paste these files. To access your current JSON config files you can either run `Open Settings (JSON)` and `Open Keyboard Shortcuts (JSON)` from VSCode's Command Palette or access them through GUI. My installed extensions ids are listed in [extensions.txt](https://github.com/itscarlosecp/.dotfiles/blob/main/vscode/exntensions.txt), you can install them through the extensions panel or using VSCode's CLI Tool: `code --install-extension <extension_id>`

> ⚠️ If you are using WSL you might need to install some of these extensions from Windows and some of them from WSL. You shouldn't have any problem installing all of them from the CLI Tool, the editor will later prompt you to install them in Windows.

## Neovim

I used to keep my Neovim config files in this repo. However, since those where to dotfiles I modified the most, I decided to move them to their very own repo. You can check out my Neovim config files here: [itscarlosecp.nvim](https://github.com/itscarlosecp/itscarlosecp.nvim).

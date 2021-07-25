# itscarlosecp's dotfiles

Welcome to my dotfiles, a repo where I store my development environment configurations. You can blindly copy these files if you wanted to, but I strongly suggest you use them as inspiration to build your dotfiles (you can learn a lot from setting up your personal configs).

![dotfiles](https://user-images.githubusercontent.com/47466248/126184263-fc17843c-3760-4368-8599-913284d99b5e.png)

## Details

These files are designed to work in UNIX-based operating systems such as Linux and MacOS. If you are using Windows as your desktop OS you can use [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) as well.

> ⚠️ Most of my folder structure is meant to be used with [GNU Stow](https://www.gnu.org/software/stow/). That's why you find nested folders inside some my dotfiles. To get to the actual config of the program you are looking for, you may have to navigate deeper into the file structure (ex.: `nvim/.config/nvim`, where the folder that actually contains my neovim config is the last `nvim` folder).

- **Operating System**
  - [ArcoLinuxB](https://www.arcolinux.info/downloads/)
- **Window Manager**
  - [AwesomeWM](https://github.com/awesomeWM/awesome)
- **Text Editor**
  - [VSCode](https://github.com/microsoft/vscode)
  - [Neovim](https://github.com/neovim/neovim)
  - [Vim](https://github.com/vim/vim) (when Neovim not available)
- **Terminal Emulator**
  - [Kitty](https://github.com/kovidgoyal/kitty)
  - [Windows Terminal](https://github.com/microsoft/terminal) (when using Windows)
- **Shell**
  - Bash
  - [Starship Prompt](https://github.com/starship/starship)

## VSCode

The main configuration files for VSCode are `settings.json` and `keymappings.json` both located under the VSCode directory. You must copy and paste these files. To access your current JSON config files you can either run `Open Settings (JSON)` and `Open Keyboard Shortcuts (JSON)` from VSCode's Command Palette or access them through GUI. My installed extensions ids are listed in `extensions.txt`, you can install them through the extensions panel or using VSCode's CLI Tool:

```bash
cat vscode/extensions.txt | xargs code --install-extension
```
> ⚠️ If you are using WSL you might need to install some of these extensions from Windows and some of them from WSL. You shouldn't have any problem installing all of them from the CLI Tool, the editor will later prompt you to install them in Windows.

## Neovim
> ⚠️ In order to use my Neovim configuration files you need to have version `0.5` or greater installed.

### Dependencies
- [GCC](https://gcc.gnu.org/): Required by [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) to install and compile language parsers (to improve syntax highlighting).

### Configuration
- **Plugins:** Plugins are managed by [Packer](https://github.com/wbthomason/packer.nvim). To install the plugins after downloading my config files, you must run `:PackerInstall` or `:PackerSync`. You can find the plugins list inside the `plugins.lua` file inside the `nvim` config folder. If you make some changes to this file, you will have to compile the plugins again. Find more information about this in the official documentation.

- **Autocompletion:** Intellisense and autocompletion are provided using the official [Neovim LSP API](https://github.com/neovim/nvim-lspconfig). By default, no language servers are installed, you will have to install them manually using [LSPInstall](https://github.com/kabouzeid/nvim-lspinstall) (ex.: `:LspInstall python`).

- **Formatting:** File auto-formatting is managed by external formatters. This allows you to use any formatting programm you want externally. Formatters can be configured in the `nvim/lua/_formatter/init.lua` file. Remember to add the filetype you want at the autocommands section at the end of this file.

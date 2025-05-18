<div align="center">
    <img src="logo.png" alt="Neovim logo" width="250">
    <h1> 🔥 Nvim-Forge: Modern Neovim Configuration 🔥 </h1>
    <p><em>A powerful, feature-rich Neovim setup for developers</em></p>

</div>

<p align="center">
  <a href="#-quick-installation">Installation</a> •
  <a href="#-features">Features</a> •
  <a href="#-key-mappings">Key Mappings</a> •
  <a href="#-plugins-included">Plugins</a> •
  <a href="#-customization">Customize</a>
</p>

> **Note**
>
> Configuration files fully created with Lua! Consider this your starting point, but remember that Vim is beautiful because you can make it your own. 😊

## ⚡ Quick Installation

There are two ways to install Nvim-Forge:

### 1. Automatic Installation (Recommended)

**Prerequisites**: This script requires Neovim and Node.js to be already installed on your system.

First, install the required base packages:

```bash
# For macOS
brew install neovim node git

# For Ubuntu/Debian
sudo apt install neovim nodejs npm git

# For Arch Linux
sudo pacman -S neovim nodejs npm git
```

Then run the installation script:

```bash
curl -s https://raw.githubusercontent.com/seyedrezabazyar/neovim/main/install.sh | bash
```

The automatic installation script will:
- Check for required dependencies (Neovim, Node.js, Git)
- Recommend optional dependencies (fzf, ripgrep, ctags)
- Backup your existing Neovim configuration
- Copy and configure all the necessary files
- Install Packer (plugin manager) automatically
- Install all plugins automatically
- Install all CoC extensions automatically
- Set everything up and make it ready to use!

### 2. Manual Installation

If you prefer to install manually or want to understand the process better, follow these steps:

1. Ensure you have the required dependencies:
   ```bash
   # For macOS
   brew install neovim node fzf the_silver_searcher ripgrep ctags
   brew tap homebrew/cask-fonts
   brew install --cask font-hack-nerd-font

   # For Ubuntu/Debian
   sudo apt install neovim nodejs npm fzf ripgrep universal-ctags silversearcher-ag

   # For Arch Linux
   sudo pacman -S neovim nodejs npm fzf ripgrep ctags the_silver_searcher
   ```

2. Clone this repository:
   ```bash
   git clone https://github.com/seyedrezabazyar/neovim.git
   cd neovim
   ```

3. Create directories for the configuration:
   ```bash
   mkdir -p ~/.config/nvim/lua/nvim-forge/{core,plugins}
   ```

4. Copy configuration files:
   ```bash
   # Copy main configuration files
   cp init.lua ~/.config/nvim/
   cp coc-settings.json ~/.config/nvim/
   cp logo.png ~/.config/nvim/

   # Copy core and plugin files
   cp -r lua/nvim-forge/core/* ~/.config/nvim/lua/nvim-forge/core/
   cp -r lua/nvim-forge/plugins/* ~/.config/nvim/lua/nvim-forge/plugins/
   cp lua/nvim-forge/plugins-setup.lua ~/.config/nvim/lua/nvim-forge/
   ```

   > Note: If you're installing from the original repository that still uses "mgazori" naming, use these commands instead:
   > ```bash
   > cp -r lua/mgazori/core/* ~/.config/nvim/lua/nvim-forge/core/
   > cp -r lua/mgazori/plugins/* ~/.config/nvim/lua/nvim-forge/plugins/
   > cp lua/mgazori/plugins-setup.lua ~/.config/nvim/lua/nvim-forge/
   >
   > # Then update all references
   > find ~/.config/nvim -type f -name "*.lua" -exec sed -i 's/mgazori/nvim-forge/g' {} \;
   > ```

5. Install Packer (plugin manager):
   ```bash
   git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
   ```

6. Install plugins (this might take a while):
   ```bash
   nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
   # or simply open Neovim and run:
   # :PackerSync
   ```

7. Install CoC extensions:
   ```bash
   nvim --headless -c 'CocInstall -sync coc-html coc-json coc-emmet coc-php-cs-fixer coc-blade @yaegassy/coc-intelephense |q'
   # or open Neovim and run:
   # :CocInstall coc-html coc-json coc-emmet coc-php-cs-fixer coc-blade @yaegassy/coc-intelephense
   ```

8. Start Neovim to enjoy your new setup:
   ```bash
   nvim
   ```

## 🙏 Credits

This configuration is based on the excellent work of [Mohammad Gazori (mgazori)](https://github.com/mgazori), the original creator. We've adapted it to be more accessible while preserving all the powerful features of the original setup. Special thanks to Mohammad for his incredible work!

### Rest in peace, dear [Bram Moonlenaar](https://vimhelp.org/version9.txt.html#Bram-Moolenaar); we will never forget you…

## 📋 Requirements

- [Neovim](https://neovim.io/) (>= 0.8)
- [NodeJS (with npm)](https://nodejs.org/en/)
- [Fuzzy Finder (fzf)](https://github.com/junegunn/fzf)
- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher)
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Ctags](https://github.com/universal-ctags/ctags)
- [Nerd Fonts](https://www.nerdfonts.com/)

### macOS Quick Setup

```bash
brew install neovim node fzf the_silver_searcher ripgrep ctags
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
```

For macOS users, we recommend these terminals for true color support:
- [iTerm2](https://iterm2.com/)
- [Warp](https://www.warp.dev/)

## ✨ Features

- 🎨 **Beautiful UI** - Nightfly theme with custom status line
- 🌳 **File Explorer** - Easy navigation with NvimTree
- 🔍 **Fuzzy Finding** - Powerful search capabilities with Telescope
- 📝 **Smart Completion** - Intelligent code suggestions with CoC
- 🖌️ **Syntax Highlighting** - Advanced highlighting with Treesitter
- 📌 **Git Integration** - See changes in real-time with Gitsigns
- 💬 **Easy Commenting** - Toggle comments with simple keystrokes
- ⚡ **Fast and Efficient** - Optimized for speed and productivity
- 🖥️ **Window Management** - Split, resize, and navigate with ease

## ⌨️ Key Mappings

### General
- `Space` - Leader key
- `Ctrl+q` / `Option+q` - Quit
- `Space+nh` - Clear search highlights
- `Space+e` - Toggle file explorer

### Window Management
- `Space+sv` - Split window vertically
- `Space+sh` - Split window horizontally
- `Space+se` - Make split windows equal size
- `Space+sx` - Close current split window
- `Space+sm` - Toggle window maximization

### Search
- `Space+ff` - Find files
- `Space+fs` - Find string in files
- `Space+fc` - Find string under cursor
- `Space+fb` - Find open buffers

### Tab Management
- `Space+to` - Open new tab
- `Space+tx` - Close current tab
- `Space+tn` - Go to next tab
- `Space+tp` - Go to previous tab

### Git
- `]c` / `[c` - Next/previous git hunk
- `Space+hs` - Stage hunk
- `Space+hr` - Reset hunk
- `Space+hp` - Preview hunk

## 🔌 Plugins Included

### Plugin Manager
- [wbthomason/packer](https://github.com/wbthomason/packer.nvim) - Efficient package manager

### Theme, Icons & Syntax
- [bluz71/vim-nightfly-guicolors](https://github.com/bluz71/vim-nightfly-guicolors) - Beautiful dark theme
- [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File icons
- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Advanced syntax highlighting
  - Supported languages: php, lua, json, html, and more

### File Explorer
- [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) - File system explorer

### Autocompletion
- [neoclide/coc.nvim](https://github.com/neoclide/coc.nvim) - Intelligent completion engine
  - Included extensions: coc-html, coc-json, coc-emmet, coc-php-cs-fixer, coc-blade, coc-intelephense

### Search Tools
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Powerful fuzzy finder
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim) - Performance boost

### Auto Save & Performance
- [auto-save.nvim](https://github.com/Pocco81/auto-save.nvim) - Auto save your work
- [vim-startuptime](https://github.com/dstein64/vim-startuptime) - Monitor startup performance

### Git Integration
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - Git integration in buffer

### Status Line & UI
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) - Beautiful status line
- [tagbar](https://github.com/majutsushi/tagbar) - Code structure overview

### Window Management
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Seamless navigation
- [vim-maximizer](https://github.com/szw/vim-maximizer) - Window maximization

### Editing Enhancements
- [Comment.nvim](https://github.com/numToStr/Comment.nvim) - Smart commenting
- [vim-surround](https://github.com/tpope/vim-surround) - Surround text objects
- [vim-ReplaceWithRegister](https://github.com/inkarkat/vim-ReplaceWithRegister) - Replace with register
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs) - Auto-pair brackets and quotes

## 🎨 Customization

You can customize this configuration by modifying the files in `~/.config/nvim/lua/nvim-forge/`. The structure is designed to be modular and easy to understand:

- `core/` - Core Neovim settings
  - `options.lua` - Basic Neovim options
  - `keymaps.lua` - Key mappings
  - `colorscheme.lua` - Theme settings
- `plugins/` - Plugin-specific configurations

## 🤝 Support and Contribution

If you find any issues or have suggestions for improvements, please open an issue or submit a pull request. Your contributions are welcome!

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

<div align="center">
  <p>Feel free to ask questions or contribute! ❤️</p>
  <p>
    <a href="https://github.com/seyedrezabazyar/neovim/issues">Report Bug</a> •
    <a href="https://github.com/seyedrezabazyar/neovim/issues">Request Feature</a>
  </p>
</div>

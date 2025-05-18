#!/bin/bash

# Nvim-Forge Installation Script
# This script automates the installation of Nvim-Forge configuration for Neovim

# Color codes for better readability
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_message() {
  echo -e "${BLUE}[Nvim-Forge]${NC} $1"
}

print_success() {
  echo -e "${GREEN}[Nvim-Forge]${NC} $1"
}

print_error() {
  echo -e "${RED}[Nvim-Forge]${NC} $1"
}

print_warning() {
  echo -e "${YELLOW}[Nvim-Forge]${NC} $1"
}

# Welcome message
clear
echo -e "${BLUE}"
cat << "EOF"
 _   _       _                ______
| \ | |     (_)              |  ____|
|  \| |_   ___ _ __ ___ ___  | |__ ___  _ __ __ _  ___ ___
| . ` \ \ / / | '_ ` _ ` _ \ |  __/ _ \| '__/ _` |/ _ / __|
| |\  |\ V /| | | | | | | | || | | (_) | | | (_| |  __\__ \
|_| \_| \_/ |_|_| |_| |_| |_||_|  \___/|_|  \__, |\___|___/
                                             __/ |
                                            |___/
EOF
echo -e "${NC}"

print_message "Starting Nvim-Forge installation..."
print_message "This script will install Nvim-Forge configuration for Neovim"

# Function to check and install prerequisites on macOS
check_and_install_macos() {
  if ! command -v brew &> /dev/null; then
    print_error "Homebrew is not installed. Please install Homebrew first."
    print_message "You can install Homebrew with:"
    print_message '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit 1
  fi

  # Check for Neovim
  if ! command -v nvim &> /dev/null; then
    print_warning "Neovim is not installed. Installing Neovim..."
    brew install neovim
    print_success "Neovim has been installed."
  fi

  # Check for Node.js
  if ! command -v node &> /dev/null; then
    print_warning "Node.js is not installed. Installing Node.js..."
    brew install node
    print_success "Node.js has been installed."
  fi

  # Check for Git
  if ! command -v git &> /dev/null; then
    print_warning "Git is not installed. Installing Git..."
    brew install git
    print_success "Git has been installed."
  fi
}

# Function to check and install prerequisites on Ubuntu/Debian
check_and_install_debian() {
  # Check for apt
  if ! command -v apt-get &> /dev/null; then
    print_error "apt-get is not available. This doesn't seem to be a Debian-based system."
    exit 1
  fi

  # Check for sudo
  if ! command -v sudo &> /dev/null; then
    print_error "sudo is not installed. Please install sudo or run this script as root."
    exit 1
  fi

  print_warning "This script needs to install packages using apt. You may be prompted for your password."

  # Check for Neovim
  if ! command -v nvim &> /dev/null; then
    print_warning "Neovim is not installed. Installing Neovim..."
    sudo apt-get update
    sudo apt-get install -y neovim
    print_success "Neovim has been installed."
  fi

  # Check for Node.js
  if ! command -v node &> /dev/null; then
    print_warning "Node.js is not installed. Installing Node.js..."
    sudo apt-get update
    sudo apt-get install -y nodejs npm
    print_success "Node.js has been installed."
  fi

  # Check for Git
  if ! command -v git &> /dev/null; then
    print_warning "Git is not installed. Installing Git..."
    sudo apt-get update
    sudo apt-get install -y git
    print_success "Git has been installed."
  fi
}

# Function to check and install prerequisites on Arch Linux
check_and_install_arch() {
  # Check for pacman
  if ! command -v pacman &> /dev/null; then
    print_error "pacman is not available. This doesn't seem to be an Arch-based system."
    exit 1
  fi

  # Check for sudo
  if ! command -v sudo &> /dev/null; then
    print_error "sudo is not installed. Please install sudo or run this script as root."
    exit 1
  fi

  print_warning "This script needs to install packages using pacman. You may be prompted for your password."

  # Check for Neovim
  if ! command -v nvim &> /dev/null; then
    print_warning "Neovim is not installed. Installing Neovim..."
    sudo pacman -Sy
    sudo pacman -S --noconfirm neovim
    print_success "Neovim has been installed."
  fi

  # Check for Node.js
  if ! command -v node &> /dev/null; then
    print_warning "Node.js is not installed. Installing Node.js..."
    sudo pacman -Sy
    sudo pacman -S --noconfirm nodejs npm
    print_success "Node.js has been installed."
  fi

  # Check for Git
  if ! command -v git &> /dev/null; then
    print_warning "Git is not installed. Installing Git..."
    sudo pacman -Sy
    sudo pacman -S --noconfirm git
    print_success "Git has been installed."
  fi
}

# Detect OS and install prerequisites
print_message "Detecting your operating system..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  print_message "macOS detected. Checking prerequisites..."
  check_and_install_macos
elif [[ -f /etc/debian_version ]]; then
  print_message "Debian/Ubuntu detected. Checking prerequisites..."
  check_and_install_debian
elif [[ -f /etc/arch-release ]]; then
  print_message "Arch Linux detected. Checking prerequisites..."
  check_and_install_arch
else
  print_warning "Unsupported OS detected. We'll try to continue with the installation, but you might need to install prerequisites manually."

  # Check for Neovim
  if ! command -v nvim &> /dev/null; then
    print_error "Neovim is not installed. Please install Neovim first."
    exit 1
  fi

  # Check for Node.js
  if ! command -v node &> /dev/null; then
    print_error "Node.js is not installed. Please install Node.js first."
    exit 1
  fi

  # Check for Git
  if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
  fi
fi

# Check for dependencies
print_message "Checking for additional dependencies..."

# Array of recommended packages
dependencies=("fzf" "ripgrep" "ctags")
missing_deps=()

for dep in "${dependencies[@]}"; do
  if ! command -v "$dep" &> /dev/null; then
    missing_deps+=("$dep")
  fi
done

if [ ${#missing_deps[@]} -ne 0 ]; then
  print_warning "Some recommended dependencies are missing: ${missing_deps[*]}"
  print_message "For macOS, you can install them with: brew install ${missing_deps[*]}"
  print_message "For Ubuntu/Debian, you can install them with: sudo apt install ${missing_deps[*]}"
  print_message "For Arch Linux, you can install them with: sudo pacman -S ${missing_deps[*]}"

  read -p "Continue installation without these dependencies? (y/n): " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_message "Installation aborted. Please install the missing dependencies and try again."
    exit 1
  fi
fi

# Backup existing Neovim configuration
if [ -d ~/.config/nvim ]; then
  print_message "Backing up existing Neovim configuration..."
  backup_dir=~/.config/nvim.backup.$(date +%Y%m%d%H%M%S)
  mv ~/.config/nvim $backup_dir
  print_success "Existing configuration backed up to $backup_dir"
fi

# Create necessary directories
print_message "Creating Nvim-Forge directories..."
mkdir -p ~/.config/nvim/lua/nvim-forge/{core,plugins}

# Clone the repository
print_message "Downloading Nvim-Forge configuration..."
temp_dir=$(mktemp -d)
git clone https://github.com/seyedrezabazyar/neovim.git "$temp_dir"

# Determine if the repo uses the new structure or the original structure
if [ -d "$temp_dir/lua/nvim-forge" ]; then
  # New structure
  print_message "Setting up configuration files using new structure..."

  # Copy main config files
  cp "$temp_dir/init.lua" ~/.config/nvim/
  cp "$temp_dir/coc-settings.json" ~/.config/nvim/

  # Copy core and plugin files
  cp -r "$temp_dir/lua/nvim-forge/core/"* ~/.config/nvim/lua/nvim-forge/core/
  cp -r "$temp_dir/lua/nvim-forge/plugins/"* ~/.config/nvim/lua/nvim-forge/plugins/
  cp "$temp_dir/lua/nvim-forge/plugins-setup.lua" ~/.config/nvim/lua/nvim-forge/

  # Copy logo
  cp "$temp_dir/logo.png" ~/.config/nvim/
else
  # Original structure with mgazori
  print_message "Setting up configuration files from original structure..."

  # Copy main config files
  cp "$temp_dir/init.lua" ~/.config/nvim/
  cp "$temp_dir/coc-settings.json" ~/.config/nvim/

  # Copy and rename core files
  cp -r "$temp_dir/lua/mgazori/core/"* ~/.config/nvim/lua/nvim-forge/core/

  # Copy and rename plugin files
  cp -r "$temp_dir/lua/mgazori/plugins/"* ~/.config/nvim/lua/nvim-forge/plugins/

  # Copy and rename plugins-setup.lua
  cp "$temp_dir/lua/mgazori/plugins-setup.lua" ~/.config/nvim/lua/nvim-forge/

  # Copy logo
  cp "$temp_dir/logo.png" ~/.config/nvim/

  # Update references to mgazori to nvim-forge
  print_message "Updating configuration references..."
  find ~/.config/nvim -type f -name "*.lua" -exec sed -i.bak 's/mgazori/nvim-forge/g' {} \;
  find ~/.config/nvim -type f -name "*.lua.bak" -delete
fi

# Create README.md
print_message "Creating README.md..."
cat > ~/.config/nvim/README.md << 'EOL'
<div align="center">
    <img src="logo.png" alt="Neovim logo" width="250">
    <h1> 🔥 Nvim-Forge: A Powerful Neovim Configuration 🔥 </h1>
</div>

This is a local installation of Nvim-Forge, a modern, feature-rich Neovim configuration for developers.

## Credits
This configuration is based on the excellent work of [Mohammad Gazori (mgazori)](https://github.com/mgazori), who created the original setup.

## Key Mappings
- `Space` - Leader key
- `Space+e` - Toggle file explorer
- `Space+ff` - Find files
- `Space+fs` - Find text in files
- `Space+sv` - Split window vertically
- `Space+sh` - Split window horizontally
- `Space+sm` - Toggle window maximization

For more information, visit the [Nvim-Forge GitHub repository](https://github.com/seyedrezabazyar/neovim).

Enjoy using Nvim-Forge! ❤️
EOL

# Install Packer (plugin manager)
print_message "Installing Packer.nvim (plugin manager)..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim 2>/dev/null || true

# Cleanup
rm -rf "$temp_dir"

print_success "Nvim-Forge has been successfully installed!"
print_message "Starting Neovim to install plugins..."

# Run Neovim and install plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

print_success "Plugins have been installed!"
print_message "Installing CoC extensions..."

# Install CoC extensions
nvim --headless -c 'CocInstall -sync coc-html coc-json coc-emmet coc-php-cs-fixer coc-blade @yaegassy/coc-intelephense |q'

print_success "Installation complete! 🎉"
print_message "Launch Neovim with 'nvim' command to start using Nvim-Forge."
print_message "Thank you for installing Nvim-Forge. Enjoy coding!"

-- init.lua
require('nvim-forge.plugins-setup')
require('nvim-forge.core.options')
require('nvim-forge.core.command')
require('nvim-forge.core.keymaps')
require('nvim-forge.core.colorscheme')

-- plugins configurations
require('nvim-forge.plugins.comment')
require('nvim-forge.plugins.nvim-tree')
require('nvim-forge.plugins.lualine')
require('nvim-forge.plugins.coc')
require('nvim-forge.plugins.gitsigns')
require('nvim-forge.plugins.treesitter')
require('nvim-forge.plugins.autopairs')

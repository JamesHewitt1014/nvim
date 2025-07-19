-- Download Mini.nvim - including the plugin manager mini.deps
local path_package = vim.fn.stdpath('data') .. '/site'
local mini_path = path_package .. '/pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
end

require('mini.deps').setup({path = { package = path_package }})
local add_plugin = MiniDeps.add

-- User Interface - Install and setup
require('interface.icons')
require('interface.animations')
require('interface.file-explorer')
require('interface.highlight')
require('interface.picker')
require('interface.startscreen')
require('interface.keymap-hints')
--TODO: Setup keymap hints to load after all other plugins?

add_plugin({source = 'nvim-lualine/lualine.nvim'})
require('interface.statusline')

add_plugin({
	source = 'ThePrimeagen/harpoon',
	checkout = "harpoon2",
	depends = {"nvim-lua/plenary.nvim"}
})
require('interface.bookmarks')

-- Language Tools - Install and setup
add_plugin({
	source = 'mason-org/mason-lspconfig.nvim',
	depends = {
		'mason-org/mason.nvim',
		'neovim/nvim-lspconfig',
  	'folke/lazydev.nvim',
	}
})
require('language-tools.ls-manager')

add_plugin({source = 'saghen/blink.cmp'})
require('language-tools.autocomplete')

add_plugin({
	source = 'nvim-treesitter/nvim-treesitter',
	checkout = 'main',
})
require('language-tools.treesitter')

add_plugin({
	source = 'rcarriga/nvim-dap-ui',
	depends = {
		'mfussenegger/nvim-dap',
		--'jay-babu/mason-nvim-dap.nvim', --I can't get this to work
		'nvim-neotest/nvim-nio',
		'leoluz/nvim-dap-go',
	}
})
require('language-tools.debugger')

-- THEMES
add_plugin({source = 'zaldih/themery.nvim'})
require('interface.themes')

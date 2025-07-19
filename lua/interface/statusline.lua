local statusline = require 'lualine'

local mode = {
	'mode',
	icons_enabled= true,
	separator = { left = '', right = ''}
}

local filename = {
	'filename',
	symbols = {
		modified = '',
		readonly = '',
		newfile = '[New]',
		unnamed = '[No Name]',
	},
	separator = { right = ''}
}

local branch = {
	'branch',
	icon = {'', align='left'}
}

local diagnostics = {
	'diagnostics',
	symbols = {
		error = ' ',
		warn = ' ',
		info = ' ',
		hint = ' '
	},
}

local filetype = {
	'filetype',
	colored = true,
	icon_only = false,
	icon = { align = 'left'},
}

local progress = {
	'progress',
	separator = { left = '', right = ''}
}

statusline.setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		globalstatus = true, --Don't know how I feel about that
		disabled_filetypes = {'prompt', 'ministarter'},
		ignore_focus = {'quickfix', 'minipick', 'harpoon'},
		section_separators = {
			left = '',
			right = ''
		},
		component_separators = '',
	},
	sections = {
			lualine_a = {mode},
			lualine_b = {filename},
			lualine_c = { branch, diagnostics},
			lualine_x = {'searchcount', 'encoding', filetype},
			lualine_y = {},
			lualine_z = {progress}
	},
}

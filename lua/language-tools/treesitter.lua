local later = MiniDeps.later
local treesitter = require('nvim-treesitter')

treesitter.setup {
	--Directory to install parsers and queries
	install_dir = vim.fn.stdpath('data') .. '/site',
}

-- Install missing treesitter parsers on startup, will ignore if already installed
treesitter.install({ 'lua', 'rust', 'go' })

local filetypes = {}

-- Enable highlighting in filetypes
vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'rs', 'lua', 'go'}, -- Add file names here (i.e. rs, lua, go, etc)
	callback = function() vim.treesitter.start() end,
})

--TODO: Previous version of treesitter required 'later()' block, need to figure out if thats still beneficial
--TODO: Do I want to add keymaps for ':Inspect' and ':InspectTree'?
--TODO: Do I want TS folding?

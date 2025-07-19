local MiniFiles = require("mini.files")
MiniFiles.setup({
	mappings = {
		reset = "<Space>",
		show_help = "?",

  	-- Don't use `h`/`l` for easier cursor navigation during text edit
    -- go_in = 'L',
    -- go_in_plus = '',
    -- go_out = 'H',
    -- go_out_plus = '',
	}

})

FileExplorerToggle = function()
	if not MiniFiles.close() then MiniFiles.open() end
end



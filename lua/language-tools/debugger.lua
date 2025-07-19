-- Mason-Nvim-Dap should be able to autoconfigure but I can't get it to work...
-- require("mason-nvim-dap").setup({ --NOTE: Must load after mason
-- 	automatic_installation = true,
-- 	ensure_installed = {"delve"}
-- })

local dap = require('dap')
local dap_ui = require('dapui')

-- UI Setup
dap_ui.setup({
	icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
	controls = {
		icons = {
			pause = '⏸',
			play = '▶',
			step_into = '⏎',
			step_over = '⏭',
			step_out = '⏮',
			step_back = 'b',
			run_last = '▶▶',
			terminate = '⏹',
			disconnect = '⏏',
		}
	}
})

-- Automatically open / close DAP UI when debugger stops or starts
dap.listeners.before.attach.dapui_config = function()
  dap_ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dap_ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dap_ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dap_ui.close()
end

-- Debugger Functionality
ToggleBreakpoint = dap.toggle_breakpoint
SetConditionalBreakpoint = function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end
DebugContinue = dap.continue
DebugStepInto = dap.step_into
DebugStepOver = dap.step_over
DebugStepOut = dap.step_out
DebugStepBack = dap.step_back -- Idk if most debuggers support this?

-- Things to look at
-- dap.run_to_cursor
-- Also dap_ui.toggle() function to toggle the UI on or off

-- Setup for individual debuggers
require('dap-go').setup()


--NOTE: Some keybinds are part of their plugin config (i.e. autocomplete, file explorer, pickers)

-- alias for setting keybinds
local map = vim.keymap.set

-- NAVIGATION
map("n", "<tab>", FileExplorerToggle, {desc = "Open File Explorer"})
map("n", "<leader>s", GrepFiles, {desc = " Search (Grep)"})
map("n", "<leader>f", FindFile, {desc = " Open File"})
map("n", "<leader>h", SearchHelp, {desc = "󰘥 Nvim help"})

-- File Bookmarks
map('n', '<leader>m', MarkFile, {desc=" Bookmark File"} )
map('n', '<leader><leader>', ListFileMarks, {desc="Open Bookmarks List"} )
map('n', 'g1', GotoMark1, {desc="Goto Bookmark 1"})
map('n', 'g2', GotoMark2, {desc="Goto Bookmark 2"})
map('n', 'g3', GotoMark3, {desc="Goto Bookmark 3"})

-- Window Management
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

--TODO: Do I want to change these (maybe they are fine on Ctrl-W?)
map('n', '<leader>wh', ':new<Enter>', { desc = 'New Horizontal Window' })
map('n', '<leader>wv', ':vertical:new<Enter>', { desc = 'New Vertical Window' })
map('n', '<leader>wx', '<C-w>x', { desc = 'Switch windows around'})

--TODO: Re-add terminal support?
-- require('interface.terminal')

-- LSP TOOLS
-- Note: Autocomplete keybinds are under "language-tools/autocomplete"
map('n', 'K', vim.lsp.buf.hover, { desc = "Hover Documentation"})
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = " Rename"})
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = " List Code Actions" })
map('n', '<leader>lf', vim.lsp.buf.format, { desc = "󰉼 Format Code" })
map("n", "<leader>ls", ListSymbols, {desc = "󰊕 List Document Symbols"})

map('n', 'gd', vim.lsp.buf.definition, { desc = "Goto Definitions" })
map('n', 'gD', GoToDeclaration, { desc = "Goto Declaration" })
map('n', 'gr', GoToReferences,{ desc = "Goto References" })
map('n', 'gI', GoToImplementation, { desc = "Goto Implementations" })
map('n', 'gT', GoToTypeDefinition, {desc = "Goto Type Definition"})

-- Diagnostics
map('n', '<leader>le', vim.diagnostic.setloclist, { desc = ' Show All Errors'})
map('n', '<leader>e', OpenFloatingDiagnostic, {desc = ' Show Error'})

-- Debugger
vim.keymap.set('n', '<leader>dD', DebugContinue, { desc = 'Debug Start / Continue' })
vim.keymap.set('n', '<leader>db', ToggleBreakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dB', SetConditionalBreakpoint, { desc = 'Set Conditional Breakpoint' })
vim.keymap.set('n', '<F5>', DebugContinue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F1>', DebugStepInto, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F2>', DebugStepOver, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F3>', DebugStepOut, { desc = 'Debug: Step Out' })

-- MISC
map('n', '<leader>T', ':Themery<Enter>', {desc = " Change Theme"})

-- Ctrl-backspace in insert mode to delete a word (Ctrl-w in insert mode deletes a word)
map('i','<C-BS>','<C-w>')
-- Some terminals map BS to Ctrl-H
map('i','<C-H>','<C-w>')

-- DISABLE
-- remove keybinds I don't use/like
local unbind = vim.keymap.del
unbind('n', 'grr')
unbind('n', 'gra')
unbind('n', 'grn')
unbind('n', 'gri')
unbind('n', 'gx')
unbind('n', 'gO')

-- Note: vim.keymap.del can't remove all default keybinds
map('n', 's', '<nop>') -- s is just a worse version of c
map('n', 'S', '<nop>') -- S is just a worse version of cc

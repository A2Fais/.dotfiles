local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local g = vim.g
local o = vim.opt

-- disable netrw at the very start of your init.lua
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_netrw_gitignore = 1
g.mapleader = " "
g.maplocalleader = "\\"

o.termguicolors = true
o.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
o.relativenumber = false
o.expandtab = true
o.number = true
o.cursorline = true
o.tabstop = 2
o.shiftwidth = 2
o.clipboard = "unnamedplus"
o.background = "dark"
o.splitright = true
o.splitbelow = true
o.autoindent = true
o.cursorline = false
o.foldmethod = "manual"
o.foldlevel = 1

vim.api.nvim_exec(
	[[
  augroup TerminalToggle
    autocmd!
    autocmd TermOpen * tnoremap <buffer> <C-n> <C-\><C-n><Cmd>NeotreeToggle<CR>
  augroup END
]],
	false
)

require("lazy").setup("plugins")

local keymaps = require("keymaps")
for _, key in ipairs(keymaps) do
	vim.keymap.set(key[1], key[2], key[3], key[4])
end

-- vim.cmd [[
-- hi BufferLineFill guibg='#202236'
-- ]]

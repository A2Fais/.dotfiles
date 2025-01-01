local opts
local wk = require("which-key")
wk.add({
	{ "<leader>b", group = "buffers" },
	{
		"bb",
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{ previewer = false })<cr>",
		desc = "buffers",
	},
	{ "bx", "<cmd> lua require('bufdelete').bufdelete(0, true)<cr>", desc = "Close Buffer" },

	{ "<leader>s", group = "search" },
	{ "sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
	{ "sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
	{ "sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
	{ "sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
	{ "sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
	{ "sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
	{ "sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
	{ "sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
	{
		"sf",
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy())<cr>",
		desc = "Find Files",
	},
	{
		"sg",
		"<cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_ivy())<cr>",
		desc = "Live Grep",
	},

	{ "<leader>t", group = "terminal" },
	{ "tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
	{ "th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal Term" },
	{ "tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical Term" },

	{ "<leader>l", group = "LSP" },
	{ "la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
	{ "ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
	{ "lf", "<cmd>lua require('conform').format()<cr>", desc = "Format" },
	{ "lg", "<cmd>LazyGit<CR>", desc = "Lazygit" },
	{ "lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
	{ "li", "<cmd>LspInfo<cr>", desc = "Info" },
	{ "lI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info" },
	{ "lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic" },
	{ "lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
	{ "lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
	-- {
	-- 	mode = { "n", "v" }, -- NORMAL and VISUAL mode
	-- 	{ "q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
	-- 	{ "w", "<cmd>w<cr>", desc = "Write" },
	-- },
})

local keymaps = {
	{ "n", "<leader>", ":WhichKey<CR>", opts },
	{ "n", "<C-l>", "<CMD>CopilotChatToggle<CR>", opts },
	{ { "i", "n" }, "<C-s>", ":w<CR>", opts },
	{ "n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
	{ "n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
	{ "n", "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
	{ "n", "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
	{ "n", "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
	{ "n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
	{ "n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
	{ "n", "<A-v>", "<cmd>vsplit<cr>", desc = "vertcal split" },
	{ "n", "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
	{ "n", "<C-j>", "<cmd>:m+1<cr>", desc = "Move a line down" },
	{ "n", "<C-k>", "<cmd>:m-2<cr>", desc = "Move a line up" },
}

return keymaps

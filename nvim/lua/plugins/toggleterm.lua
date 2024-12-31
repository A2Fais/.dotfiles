return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			hide_numbers = true, -- hide the number column in toggleterm buffers
			autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Norm
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell,
			auto_scroll = true, -- automatically scroll to the bottom on terminal output
			float_opts = {
				border = "single",
			},
		})
	end,
	keys = { { "<A-h>", "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" } },
	opts = {
		open_mapping = [[A-h]],
		hide_numbers = true,
		direction = "horizontal",
		start_in_insert = true,
		close_on_exit = true,
	},
}

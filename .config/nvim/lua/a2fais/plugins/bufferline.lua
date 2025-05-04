return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				separator_style = "slant",
				offsets = {
					{
						filetype = "neo-tree",
						text = "",
						highlight = "Directory",
						text_align = "left",
					},
				},
				diagnostics = "nvim_lsp",
			},
		})
	end,
}

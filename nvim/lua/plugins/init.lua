return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ "neovim/nvim-lspconfig" },
	{ "SmiteshP/nvim-navic" },
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
}

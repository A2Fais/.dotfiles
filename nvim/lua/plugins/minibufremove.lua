return {
	"echasnovski/mini.nvim",
	version = "*",
	config = function()
		require("mini.bufremove").setup()
	end,
}

return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	enabled = true,
	init = false,
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[
          ░░    
          ░░  ░░░░    
            ░░░░      
          ░░░░  ░░    
          ░░░░             
            ░░        
  █████████▓▓▓▓  ████  
██████████████████████      _    ____  _____ _____ ____ 
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒     / \  / ___|| ____| ____|  _ \ 
  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒    / _ \ \___ \|  _| |  _| | |_) | 
  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   / ___ \ ___) | |___| |___|  _ <   
    ▓▓▓▓▓▓▓▓▓▓██▓▓▓▓▓   /_/   \_\____/|_____|_____|_| \_\    
    ▓▓▓▓▓▓▓▓▓▓██▓▓▓▓       
    ▓▓▓▓▓▓▓▓▓▓██▓▓▓▓        _   ___     _____ __  __  
    ▓▓▓▓▓▓▓▓▓▓██▓▓▓▓       | \ | \ \   / /_ _|  \/  |  
    ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓       |  \| |\ \ / / | || |\/| | 
    ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒       | |\  | \ V /  | || |  | |  
      ▒▒▒▒▒▒▒▒▒▒▒▒         |_| \_|  \_/  |___|_|  |_|  
      ▒▒▒▒▒▒▒▒▒▒▒▒           
       ▒▒▒▒▒▒▒▒▒▒           

      The bigger the breakthrough the tougher the code 
    ]]

		dashboard.section.header.val = vim.split(logo, "\n")
    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("n", " Open New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", "󰈞 Look up for Recents", ":Telescope oldfiles <CR>"),
      dashboard.button("f", "󱔗 Telescope Find files", ":Telescope find_files <CR>"),
      dashboard.button("s", "󰦛 Restore Session", "<cmd>SessionRestore<cr>"),
      dashboard.button("q", "󰿅 Quit Neovim", "<cmd> qa <cr>"),
    }
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"
		dashboard.opts.layout[1].val = 8
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				once = true,
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		-- local function footer()
		-- 	return 
		-- end
		--
		-- dashboard.section.footer.val = footer()

	end,
}

return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		config = function()
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.buttons.val = {
				dashboard.button("ff", " " .. " Find file", ":Telescope find_files <CR>"),
				dashboard.button("<Space><Space>", " " .. " Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("fs", " " .. " Find text", ":Telescope live_grep <CR>"),
				dashboard.button("q", " " .. " Quit", ":qa<CR>"),
			}

			require("alpha").setup(dashboard.opts)
		end,
	},
}

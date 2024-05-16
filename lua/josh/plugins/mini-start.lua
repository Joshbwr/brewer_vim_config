return {
	"echasnovski/mini.starter",
		event = "VimEnter",
		config = function()
			local starter = require("mini.starter")
			starter.setup({
				autoopen = true,
				evaluate_single = true,
				items = {
					{ action = "Telescope find_files", name = "Find files", section = "Files" },

					{ action = "Telescope live_grep", name = "Grep", section = "Search" },

					{ action = "qa", name = "Exit", section = "Exit" },
				},
				content_hooks = {
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.aligning("center", "center"),
				},
				header = nil,
				footer = "",
				query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",
			})
		end,
}

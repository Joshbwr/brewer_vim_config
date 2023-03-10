return {
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			require("indent_blankline").setup({
				opts = {
					char = "│",
					filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
					show_trailing_blankline_indent = false,
					space_char_blankline = " ",
					show_current_context = true,
					show_current_context_start = true,
				},
			})
		end,
	},
}

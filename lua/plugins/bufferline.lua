return {
	{
		"akinsho/bufferline.nvim",
		tag = "v3.2.0",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("bufferline").setup({})
		end,
	},
}

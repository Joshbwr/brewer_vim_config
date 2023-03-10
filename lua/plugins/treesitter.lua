return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		dependencies = {
			"windwp/nvim-ts-autotag",
		},

		-- Config
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			context_commentstring = { enable = true, enable_autocmd = false },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
				"gitcommit",
				"lua",
			},
			-- auto install above language parsers
			auto_install = true,
			autotag = {
				enable = true,
			},
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}

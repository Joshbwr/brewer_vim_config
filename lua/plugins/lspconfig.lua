return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"tailwindcss",
					"html",
					"cssls",
					"lua_ls",
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",

		config = function()
			require("mason-null-ls").setup({
				ensure_installed = {
					"prettierd",
					"stylua",
					"eslint_d",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local on_attach = function(_, _)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("lspconfig")["lua_ls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						-- make the ls recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			require("lspconfig")["tsserver"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
			})

			require("lspconfig")["html"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			require("lspconfig")["cssls"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			require("lspconfig")["tailwindcss"].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}

return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    {"<leader>lr", "<cmd>TroubleToggle<CR>", desc = "Open/close trouble list"},
    {"<leader>le", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Open trouble document diagnostics"},
    {"<leader>lw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Open trouble workspace diagnostics"},
    {"<leader>lt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble"},
  },
}

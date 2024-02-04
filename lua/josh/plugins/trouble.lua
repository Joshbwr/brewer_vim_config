return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "<leader>lr", function()
      require("trouble").toggle("lsp_references")
    end)
    vim.keymap.set("n", "<leader>le", function()
      require("trouble").toggle("document_diagnostics")
    end)
  end,
}

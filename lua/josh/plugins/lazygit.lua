return {
  "kdheepak/lazygit.nvim",
  keys = {
    { "<Leader>gg", "<cmd>LazyGit<CR>", desc = "lazygit" },
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
  end,
}

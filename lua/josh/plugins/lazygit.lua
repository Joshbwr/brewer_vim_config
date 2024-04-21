return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile"
  },
  keys = {
    { "<Leader>gg", "<cmd>LazyGit<CR>", desc = "Open Lazygit" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
  end,
}

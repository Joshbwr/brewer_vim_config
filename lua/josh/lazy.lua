local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "josh.plugins" }, { import = "josh.plugins.lsp" } }, {
  install = {
    colorscheme = { "nightfly" },
    --colorscheme = { "gruvbox-material", "rose-pine" }, -- try to load one of these colorschemes when installation
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false,
  },
  ui = {
    border = "rounded",
    size = {
      width = 0.7,
      height = 0.7,
    },
  },
})

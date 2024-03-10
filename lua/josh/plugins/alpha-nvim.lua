return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set header
    dashboard.section.header.val = {
      "NVIM v%s",
      "Nvim is open source and freely distributable",
      "https://neovim.io/#chat",
      "type  :help nvim<Enter>       if you are new!",
      "type  :checkhealth<Enter>     to optimize Nvim",
      "type  :q<Enter>               to exit",
      "type  :help<Enter>            for help",
      "type  :help news<Enter> to see changes in v%s",
      "Become a registered Vim user!",
      "type  :help register<Enter>   for information]]",
    }
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}

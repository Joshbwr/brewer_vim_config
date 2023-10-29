return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local git_blame = require("gitblame")
    -- This disables showing of the blame text next to the cursor
    vim.g.gitblame_display_virtual_text = 0

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = "gruvbox-material",
      },
      sections = {
        lualine_x = {
          { "fileformat" },
          { "filetype" },
        },
        lualine_c = { { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } },
      },
    })
  end,
}

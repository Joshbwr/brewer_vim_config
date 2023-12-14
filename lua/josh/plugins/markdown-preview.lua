return {
  "iamcco/markdown-preview.nvim",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  ft = { "markdown" },
  cmd = {
    "MarkdownPreview",
    "MarkdownPreviewStop",
    "MarkdownPreviewToggle",
  },
  event = "BufRead",
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>mp",
      ":MarkdownPreviewToggle<CR>",
      mode = "n",
      desc = "Markdown preview toggle",
    },
  },
}

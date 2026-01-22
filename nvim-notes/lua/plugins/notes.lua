return {
  {
    "folke/twilight.nvim",
    ft = { "markdown", "text" },
    opts = {},
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    main = "render-markdown",
    name = "render-markdown",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "preservim/vim-pencil",
    ft = { "markdown", "text" },
  },
  "tpope/vim-surround",
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  "tpope/vim-sleuth",
}

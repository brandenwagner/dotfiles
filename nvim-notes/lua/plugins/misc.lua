return {
  {
    "ThePrimeagen/git-worktree.nvim",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod", "gosum", "gowork" },
    dependencies = { "ray-x/guihua.lua" },
    config = function()
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimport()
        end,
        group = format_sync_grp,
      })

      require("go").setup()
    end,
  },
}

return {
  {
    "epwalsh/obsidian.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        {
          name = "Personal",
          path = "~/Repositories/Personal/obsidian",
        },
      },
      mappings = {},
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      -- Optional: Keybindings
      local map = vim.keymap.set
      map("n", "<leader>on", ":ObsidianNew<CR>", { desc = "New note in Obsidian" })
      map("n", "<leader>of", ":ObsidianSearch<CR>", { desc = "Search Obsidian notes" })
    end,
  },
}

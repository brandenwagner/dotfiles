return {
  {
    "epwalsh/obsidian.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      dir = "~/Repositories/Personal/obsidian", -- Replace this with the actual path to your Obsidian vault
      completion = {
        nvim_cmp = true, -- Enable completion using nvim-cmp
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

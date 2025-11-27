-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { desc = "Map jj to Esc" })

-- Toggle snacks explorer
vim.keymap.set("n", "<leader>e", function()
  require("snacks").explorer()
end, { desc = "Toggle Explorer" })

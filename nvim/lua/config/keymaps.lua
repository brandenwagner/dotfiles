-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "jj", "<Esc>", { desc = "Map jj to Esc" })

-- Map W command to write with sudo privileges
vim.api.nvim_create_user_command("W", "write !sudo tee % >/dev/null", { desc = "Write with sudo" })

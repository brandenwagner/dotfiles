return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<C-CR]>",
            accept_word = "<C-w>",
            accept_line = "<C-l>",
            next = "<M-n>",
            prev = "<M-p>",
            dismiss = "<M-[>",
          },
        },
        panel = { enabled = false },
        filetypes = {
          markdown = true,
          help = false,
          gitcommit = true,
          ["*"] = true,
        },
      })
    end,
  },
}

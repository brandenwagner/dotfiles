return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      
      -- Disable Enter key for completion, only Ctrl-y to confirm
      opts.mapping = opts.mapping or {}
      opts.mapping["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = false }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
      })
      
      -- Setup cmdline completion for ":"
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })
      -- Setup cmdline completion for "/"
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      return opts
    end,
  },
}

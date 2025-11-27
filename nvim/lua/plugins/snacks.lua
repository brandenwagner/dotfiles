return {
  -- Snacks is now a core dependency
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          {
            icon = "",
            title = "Recent Files",
            section = "recent_files",
            cwd = true,
            limit = 5,
            padding = 1,
            indent = 2,
          },
          { section = "keys", padding = 1 },
          { section = "startup", padding = 1 },
        },
      },
    },
  },
}

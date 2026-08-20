return {
  -- Disable neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  -- Disable fzf-lua in favor of Snacks picker
  {
    "ibhagwan/fzf-lua",
    enabled = false,
  },

  -- Configure LazyVim to load catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      picker = "snacks",
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- typescript, json, and mini.starter support come from LazyVim extras enabled
  -- in lazyvim.json (not imported here directly — LazyVim's own xtras.lua merges
  -- and priority-orders extras so they patch correctly against other default
  -- extras like the snacks picker; a manual `{ import = ... }` here runs too late
  -- and crashes mini.starter's config).

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
}

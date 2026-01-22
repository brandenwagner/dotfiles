# nvim-notes

A lightweight Neovim configuration for note-taking.

## Features

- **Obsidian integration** - Manage your notes with obsidian.nvim
- **Zen mode** - Distraction-free writing
- **Twilight** - Focus on the current section
- **Markdown rendering** - Beautiful markdown preview
- **Telescope** - Fuzzy find your notes
- **Minimal plugins** - Fast startup time

## Setup

1. **Update Obsidian vault path**: Edit `lua/plugins/obsidian.lua` and set your vault location
   ```lua
   path = "/Users/branden/Obsidian/Notes",  -- UPDATE THIS PATH
   ```

2. **Launch nvim-notes**:
   ```bash
   NVIM_APPNAME=nvim-notes nvim
   ```

3. **Create an alias** (optional):
   Add to your `~/.zshrc` or `~/.bashrc`:
   ```bash
   alias notes='NVIM_APPNAME=nvim-notes nvim'
   ```

## Key Bindings

### Note-taking
- `<leader>z` - Toggle Zen mode
- `tw` - Toggle Twilight
- `jj` - Exit insert mode (quick escape)

### Navigation
- `<leader>sf` - Search files (Telescope)
- `<leader>sg` - Live grep (search in files)
- `<leader>sb` - Search buffers
- `<leader>?` - Recently opened files

### Buffers
- `th` - Previous buffer
- `tl` - Next buffer
- `tj` - First buffer
- `tk` - Last buffer
- `td` - Delete buffer

### File Operations
- `WW` - Quick save
- `QQ` - Quick quit (force)
- `<leader>qq` - Close split

## Plugins Included

Only essential plugins for note-taking:
- catppuccin (theme)
- obsidian.nvim
- zen-mode.nvim
- twilight.nvim
- render-markdown.nvim
- markdown-preview.nvim
- telescope.nvim
- nvim-treesitter (markdown only)
- vim-surround
- vim-pencil
- nvim-autopairs
- Comment.nvim

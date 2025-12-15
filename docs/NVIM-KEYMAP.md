# Neovim Keymap Cheat Sheet

> Based on LazyVim configuration with Snacks picker

**Leader Key:** `<Space>`

---

## Custom Keymaps

| Mode | Key | Action | Description |
|------|-----|--------|-------------|
| Insert | `jj` | `<Esc>` | Exit insert mode |
| Normal | `<leader>e` | Snacks Explorer | Toggle file explorer |

---

## General Navigation

| Mode | Key | Action |
|------|-----|--------|
| Normal | `h` / `j` / `k` / `l` | Left / Down / Up / Right |
| Normal | `w` / `b` | Next word / Previous word |
| Normal | `0` / `$` | Start / End of line |
| Normal | `gg` / `G` | Top / Bottom of file |
| Normal | `Ctrl-u` / `Ctrl-d` | Scroll up / down half page |
| Normal | `Ctrl-o` / `Ctrl-i` | Jump backward / forward |
| Normal | `%` | Jump to matching bracket |

---

## File Operations

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>fn` | New file |
| Normal | `<leader>ff` | Find files (Snacks picker) |
| Normal | `<leader>fr` | Recent files |
| Normal | `<leader>fg` | Live grep |
| Normal | `<leader>fb` | Find buffers |
| Normal | `<leader>fw` | Find word under cursor |
| Normal | `<leader>qq` | Quit all |
| Normal | `<leader>fs` / `:w` | Save file |

---

## Window Management

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>w` | Window prefix |
| Normal | `<leader>ww` | Other window |
| Normal | `<leader>wd` | Delete window |
| Normal | `<leader>w-` | Split window below |
| Normal | `<leader>w\|` | Split window right |
| Normal | `<leader>-` | Split window below |
| Normal | `<leader>\|` | Split window right |
| Normal | `Ctrl-h/j/k/l` | Navigate windows |
| Normal | `Ctrl-Up/Down/Left/Right` | Resize window |

---

## Buffer Management

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>bb` | Switch buffers |
| Normal | `<leader>bd` | Delete buffer |
| Normal | `<leader>bo` | Delete other buffers |
| Normal | `<leader>bp` | Toggle pin buffer |
| Normal | `<S-h>` | Previous buffer |
| Normal | `<S-l>` | Next buffer |
| Normal | `[b` | Previous buffer |
| Normal | `]b` | Next buffer |

---

## Tab Management

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader><tab>l` | Last tab |
| Normal | `<leader><tab>o` | Close other tabs |
| Normal | `<leader><tab>f` | First tab |
| Normal | `<leader><tab><tab>` | New tab |
| Normal | `<leader><tab>]` | Next tab |
| Normal | `<leader><tab>d` | Close tab |
| Normal | `<leader><tab>[` | Previous tab |

---

## LSP (Language Server)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `gd` | Go to definition |
| Normal | `gr` | Go to references |
| Normal | `gI` | Go to implementation |
| Normal | `gy` | Go to type definition |
| Normal | `gD` | Go to declaration |
| Normal | `K` | Hover documentation |
| Normal | `gK` | Signature help |
| Insert | `Ctrl-k` | Signature help |
| Normal | `<leader>ca` | Code action |
| Normal | `<leader>cc` | Run codelens |
| Normal | `<leader>cC` | Refresh codelens |
| Normal | `<leader>cr` | Rename |
| Normal | `<leader>cf` | Format document |
| Normal | `<leader>cd` | Line diagnostics |
| Normal | `]d` | Next diagnostic |
| Normal | `[d` | Previous diagnostic |
| Normal | `]e` | Next error |
| Normal | `[e` | Previous error |
| Normal | `]w` | Next warning |
| Normal | `[w` | Previous warning |

---

## Completion (nvim-cmp)

| Mode | Key | Action |
|------|-----|--------|
| Insert | `Ctrl-n` | Next completion item |
| Insert | `Ctrl-p` | Previous completion item |
| Insert | `Ctrl-b` | Scroll docs up |
| Insert | `Ctrl-f` | Scroll docs down |
| Insert | `Ctrl-Space` | Complete |
| Insert | `Ctrl-e` | Abort completion |
| Insert | `Ctrl-y` | Confirm selection |
| Insert | `Enter` | **Disabled** - inserts newline (confirm only if explicitly selected) |
| Insert | `Tab` | Select next item / snippet expand |
| Insert | `Shift-Tab` | Select previous item |
| Command | `:` | Command-line completion enabled |
| Command | `/` | Search completion enabled |

---

## Search & Replace

| Mode | Key | Action |
|------|-----|--------|
| Normal | `/` | Search forward |
| Normal | `?` | Search backward |
| Normal | `n` | Next match |
| Normal | `N` | Previous match |
| Normal | `*` | Search word under cursor |
| Normal | `#` | Search word under cursor (backward) |
| Normal | `<leader>sr` | Search and replace |
| Normal | `<leader>sR` | Search and replace (word) |
| Visual | `<leader>sr` | Search and replace in selection |

---

## Code Editing

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>ur` | Toggle relative line numbers |
| Normal | `<leader>uw` | Toggle word wrap |
| Normal | `<leader>us` | Toggle spelling |
| Normal | `<leader>uc` | Toggle conceallevel |
| Normal | `<leader>uf` | Toggle format on save |
| Normal | `gcc` | Toggle comment line |
| Visual | `gc` | Toggle comment |
| Normal | `>` / `<` | Indent / Dedent |
| Visual | `>` / `<` | Indent / Dedent |
| Visual | `J` | Move line down |
| Visual | `K` | Move line up |
| Normal | `<A-j>` | Move line down |
| Normal | `<A-k>` | Move line up |

---

## Git

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>gg` | LazyGit |
| Normal | `<leader>gb` | Git blame line |
| Normal | `<leader>gB` | Git browse |
| Normal | `<leader>gf` | LazyGit current file |
| Normal | `<leader>gl` | Git log |
| Normal | `<leader>gL` | Git log (current file) |
| Normal | `]h` | Next hunk |
| Normal | `[h` | Previous hunk |
| Normal | `<leader>ghp` | Preview hunk |
| Normal | `<leader>ghr` | Reset hunk |
| Visual | `<leader>ghs` | Stage hunk |
| Visual | `<leader>ghr` | Reset hunk |

---

## Terminal

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>ft` | Terminal (root dir) |
| Normal | `<leader>fT` | Terminal (cwd) |
| Normal | `<C-/>` | Terminal (root dir) |
| Normal | `<C-_>` | Terminal (root dir) (which-key) |
| Terminal | `<Esc><Esc>` | Enter normal mode |
| Terminal | `<C-/>` | Hide terminal |
| Terminal | `Ctrl-h/j/k/l` | Navigate windows |

---

## Telescope/Snacks Picker

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader><space>` | Find files |
| Normal | `<leader>/` | Grep (root dir) |
| Normal | `<leader>:` | Command history |
| Normal | `<leader>fb` | Buffers |
| Normal | `<leader>fc` | Find config file |
| Normal | `<leader>ff` | Find files (root) |
| Normal | `<leader>fF` | Find files (cwd) |
| Normal | `<leader>fg` | Find files (git) |
| Normal | `<leader>fr` | Recent files |
| Normal | `<leader>fR` | Recent files (cwd) |
| Normal | `<leader>gc` | Git commits |
| Normal | `<leader>gs` | Git status |
| Normal | `<leader>sa` | Grep (auto root) |
| Normal | `<leader>sb` | Buffer |
| Normal | `<leader>sc` | Command history |
| Normal | `<leader>sC` | Commands |
| Normal | `<leader>sd` | Document diagnostics |
| Normal | `<leader>sD` | Workspace diagnostics |
| Normal | `<leader>sg` | Grep (root) |
| Normal | `<leader>sG` | Grep (cwd) |
| Normal | `<leader>sh` | Help pages |
| Normal | `<leader>sk` | Key maps |
| Normal | `<leader>sm` | Jump to mark |
| Normal | `<leader>sM` | Man pages |
| Normal | `<leader>so` | Options |
| Normal | `<leader>sw` | Grep word (root) |
| Normal | `<leader>sW` | Grep word (cwd) |
| Visual | `<leader>sw` | Selection (root) |
| Visual | `<leader>sW` | Selection (cwd) |
| Normal | `<leader>ss` | Goto symbol |
| Normal | `<leader>sS` | Goto symbol (workspace) |

---

## UI Toggles

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>ub` | Toggle background |
| Normal | `<leader>uc` | Toggle conceallevel |
| Normal | `<leader>ud` | Toggle diagnostics |
| Normal | `<leader>uf` | Toggle format on save |
| Normal | `<leader>uh` | Toggle inlay hints |
| Normal | `<leader>ul` | Toggle line numbers |
| Normal | `<leader>uL` | Toggle relative line numbers |
| Normal | `<leader>us` | Toggle spelling |
| Normal | `<leader>uw` | Toggle word wrap |

---

## Lazy (Plugin Manager)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>l` | Lazy |
| Normal | `<leader>ll` | Lazy |
| Normal | `<leader>lu` | Update plugins |
| Normal | `<leader>lx` | Extras |
| Normal | `:Lazy` | Open Lazy UI |

---

## Mason (LSP/Tools Installer)

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>cm` | Mason |
| Normal | `:Mason` | Open Mason UI |

---

## Misc

| Mode | Key | Action |
|------|-----|--------|
| Normal | `<leader>xl` | Location list |
| Normal | `<leader>xq` | Quickfix list |
| Normal | `[q` | Previous quickfix |
| Normal | `]q` | Next quickfix |
| Normal | `<leader>ui` | Inspect position |
| Normal | `<leader>uI` | Inspect tree |
| Normal | `<leader>L` | LazyVim Changelog |
| Normal | `<leader>sn` | Noice (messages) |
| Normal | `<leader>nh` | Noice history |
| Normal | `<leader>nl` | Noice last message |

---

## Notes

- **Leader key** is `<Space>` by default
- **Alt** is represented as `<A-key>` (Option on Mac)
- **Ctrl** is represented as `<C-key>`
- **Shift** is represented as `<S-key>`
- Completion works in command mode (`:`) and search (`/`)
- File explorer shows hidden files by default
- Snacks picker searches hidden and ignored files


# Neovim Configuration

A modern Neovim configuration matching your Doom Material Alacritty theme.

## Features

### Theme & Appearance
- **Material Palenight** theme with custom Doom Material colors
- **Monaspace Xenon** font (for GUI Neovim)
- Material-themed status line (lualine)
- Git signs in the gutter
- Indent guides

### LSP & Completion
- **Mason** for easy LSP server installation
- Preconfigured LSP servers: Lua, Python, TypeScript, Rust, Go
- **nvim-cmp** for intelligent autocompletion
- Snippet support with LuaSnip
- Automatic code actions and refactoring

### File Navigation
- **Telescope** fuzzy finder for files, grep, and more
- **nvim-tree** file explorer
- Git integration with gitsigns

### Editing Enhancements
- **Treesitter** for superior syntax highlighting
- Auto-pairs for brackets and quotes
- Easy commenting with Comment.nvim
- Surround text objects
- TODO comment highlights
- Trouble for diagnostics panel

## Key Mappings

Leader key: `<Space>`

### General
- `<Esc>` - Clear search highlights
- `<C-h/j/k/l>` - Navigate between windows

### Telescope (Fuzzy Finder)
- `<leader>sf` - Search files
- `<leader>sg` - Live grep (search in files)
- `<leader>sw` - Search current word
- `<leader>sh` - Search help
- `<leader><leader>` - Find buffers
- `<leader>/` - Fuzzy find in current buffer

### File Explorer
- `<leader>e` - Toggle file explorer
- `<leader>o` - Focus file explorer

### LSP
- `gd` - Go to definition
- `gr` - Go to references
- `gI` - Go to implementation
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code actions

### Git
- `]c` / `[c` - Next/previous git change
- `<leader>hp` - Preview hunk
- `<leader>hs` - Stage hunk
- `<leader>hr` - Reset hunk
- `<leader>hb` - Blame line

### Diagnostics
- `<leader>xx` - Toggle diagnostics panel (Trouble)
- `<leader>q` - Open diagnostic quickfix

## Getting Started

1. Open Neovim: `nvim`
2. Plugins will auto-install on first launch (via lazy.nvim)
3. LSP servers will auto-install via Mason
4. Restart Neovim after initial installation

### Installing Language Servers

Most common servers are auto-installed. To add more:
1. `:Mason` - Open Mason UI
2. Search for your language server
3. Press `i` to install

## File Structure

```
~/.config/nvim/
├── init.lua              # Main configuration
├── lua/
│   └── plugins/
│       ├── theme.lua     # Material theme config
│       ├── lsp.lua       # LSP & completion
│       ├── treesitter.lua # Syntax highlighting
│       ├── telescope.lua  # Fuzzy finder
│       ├── ui.lua         # File explorer, status line, git signs
│       └── editor.lua     # Editor enhancements
└── README.md
```

## Customization

### Change Theme Style
Edit `lua/plugins/theme.lua`:
```lua
vim.g.material_style = "palenight" -- or "darker", "oceanic", "deep ocean"
```

### Add More LSP Servers
Edit `lua/plugins/lsp.lua` and add to the `servers` table:
```lua
local servers = {
  lua_ls = {},
  pyright = {},
  your_server = {},  -- Add here
}
```

### Modify Keybindings
Edit `init.lua` or the relevant plugin config file.

## Troubleshooting

### Plugins not installing
Run `:Lazy sync` to manually sync plugins

### LSP not working
1. `:Mason` to check server installation
2. `:LspInfo` to see attached servers
3. `:checkhealth` for general diagnostics

### Theme colors wrong
Make sure your terminal supports true colors:
```bash
echo $TERM  # Should be "alacritty" or similar
```

## Color Scheme Match

This config uses the exact colors from your Alacritty Doom Material theme:
- Background: `#262938`
- Foreground: `#EEFFFF`
- Keywords: `#c792ea` (purple)
- Strings: `#c3e88d` (green)
- Functions: `#82aaff` (blue)
- Numbers: `#f78c6c` (orange)

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
- `v`, `<` - Indent left and reselect
- `v`, `>` - Indent right and reselect
- `v`, `J` - Move selection down
- `v`, `K` - Move selection up
- `x`, `<leader>p` - Paste without yanking (replaces visual selection into blackhole register)

### File and Buffer Navigation
| Mode | Keybinding           | Description                    |
| :--- | :------------------- | :----------------------------- |
| n    | `<leader>e`          | Toggle file Explorer (NvimTree) |
| n    | `<leader>o`          | Focus file Explorer (NvimTree) |
| n    | `<leader><leader>`   | Find existing buffers          |

### Git Integration (using `gitsigns.nvim`)
| Mode | Keybinding           | Description                       |
| :--- | :------------------- | :-------------------------------- |
| n    | `]c`                 | Jump to next git change (hunk)    |
| n    | `[c`                 | Jump to previous git change (hunk) |
| n    | `<leader>hs`         | Stage current hunk                |
| v    | `<leader>hs`         | Stage selected hunk               |
| n    | `<leader>hr`         | Reset current hunk                |
| v    | `<leader>hr`         | Reset selected hunk               |
| n    | `<leader>hS`         | Stage buffer                      |
| n    | `<leader>hu`         | Undo staged hunk                  |
| n    | `<leader>hR`         | Reset buffer                      |
| n    | `<leader>hp`         | Preview hunk                      |
| n    | `<leader>hb`         | Show git blame for current line   |
| n    | `<leader>hd`         | Diff against index                |
| n    | `<leader>hD`         | Diff against last commit          |
| n    | `<leader>tb`         | Toggle git blame for current line |
| n    | `<leader>td`         | Toggle deleted lines in diff      |

### LSP (Language Server Protocol)
| Mode | Keybinding           | Description                      |
| :--- | :------------------- | :------------------------------- |
| n    | `gd`                 | Go to Definition                 |
| n    | `gr`                 | Go to References                 |
| n    | `gI`                 | Go to Implementation             |
| n    | `<leader>D`          | Go to Type Definition            |
| n    | `<leader>ds`         | Document Symbols                 |
| n    | `<leader>ws`         | Workspace Symbols                |
| n    | `<leader>rn`         | Rename symbol                    |
| n    | `<leader>ca`         | Code Action                      |
| n    | `K`                  | Hover Documentation              |
| n    | `gD`                 | Go to Declaration                |
| n    | `<leader>q`          | Open diagnostic Quickfix list    |

### Completion (using `nvim-cmp` and `LuaSnip`)
| Mode | Keybinding           | Description                       |
| :--- | :------------------- | :-------------------------------- |
| i,s  | `<C-n>`              | Select next completion item       |
| i,s  | `<C-p>`              | Select previous completion item   |
| i,s  | `<C-b>`              | Scroll completion docs up         |
| i,s  | `<C-f>`              | Scroll completion docs down       |
| i,s  | `<C-y>`              | Confirm completion                |
| i,s  | `<C-Space>`          | Trigger completion                |
| i,s  | `<C-l>`              | Expand or jump to next snippet placeholder |
| i,s  | `<C-h>`              | Jump to previous snippet placeholder |

### Treesitter Text Objects
These are powerful for selecting and moving around code blocks based on syntax.

| Mode      | Keybinding | Description                       |
| :-------- | :--------- | :-------------------------------- |
| x, o      | `af`       | Select **a**round **f**unction    |
| x, o      | `if`       | Select **i**nside **f**unction    |
| x, o      | `ac`       | Select **a**round **c**lass       |
| x, o      | `ic`       | Select **i**nside **c**lass       |
| n, x, o   | `]m`       | Go to next function start         |
| n, x, o   | `]]`       | Go to next class start            |
| n, x, o   | `]M`       | Go to next function end           |
| n, x, o   | `][`       | Go to next class end              |
| n, x, o   | `[m`       | Go to previous function start     |
| n, x, o   | `[[`       | Go to previous class start        |
| n, x, o   | `[M`       | Go to previous function end       |
| n, x, o   | `[]`       | Go to previous class end          |

### Telescope (Fuzzy Finder)
| Mode | Keybinding           | Description                            |
| :--- | :------------------- | :------------------------------------- |
| n    | `<leader>sh`         | [S]earch [H]elp tags                   |
| n    | `<leader>sk`         | [S]earch [K]eymaps                     |
| n    | `<leader>sf`         | [S]earch [F]iles                       |
| n    | `<leader>ss`         | [S]earch [S]elect Telescope (show all pickers) |
| n    | `<leader>sw`         | [S]earch current [W]ord                |
| n    | `<leader>sg`         | [S]earch by [G]rep (live)              |
| n    | `<leader>sd`         | [S]earch [D]iagnostics                 |
| n    | `<leader>sr`         | [S]earch [R]esume last search          |
| n    | `<leader>s.`         | [S]earch Recent Files                  |
| n    | `<leader>/`          | Fuzzily search in current buffer       |
| n    | `<leader>s/`         | Search by Grep in Open Files           |
| n    | `<leader>sn`         | Search Neovim files (your config)      |

## How to Take Advantage of Vim More (for an Emacs User)

Coming from Emacs, Vim's modal editing paradigm can feel restrictive at first. The key is to embrace it. Here are some tips:

1.  **Understand the Modes Deeply:**
    *   **Normal mode:** This is your home. You should spend most of your time here. It's for navigation, deletion, copying, pasting, and executing commands.
    *   **Insert mode:** For typing text. Get in, type, and get out (with `<Esc>` or `<C-[>`).
    *   **Visual mode (v, V, <C-v>):** For selecting text. Think of it like Emacs' region selection, but often more powerful due to text objects.
    *   **Command-line mode (:):** For executing Ex commands (like `:w`, `:q`, `:substitute`).
    *   **Operator-Pending mode:** This is a subtle but powerful mode. When you type an operator (like `d` for delete, `y` for yank), Vim waits for a "motion" or "text object" to act upon.
        *   *Emacs parallel:* Instead of marking a region and then cutting, in Vim you say "delete" (`d`) and then "this paragraph" (`ap`) -> `dap`.

2.  **Learn Motions and Text Objects:** This is where Vim's power truly shines and is likely the biggest difference from Emacs.
    *   **Motions:** `w` (word), `e` (end of word), `b` (beginning of word), `)` (sentence), `}` (paragraph), `G` (end of file), `gg` (beginning of file), `^` (first non-blank char), `$` (end of line), `H` (high), `M` (middle), `L` (low). Combine them with counts: `3w` (move 3 words forward).
    *   **Text Objects:** These describe syntactic blocks of text. Your `treesitter.lua` config adds many powerful ones like `af` (around function), `if` (inside function), `ac` (around class), `ic` (inside class).
        *   Combine operators with text objects: `dip` (delete **i**nside **p**aragraph), `yap` (yank **a**round **p**aragraph), `ci"` (change **i**nside **"** quotes). This is incredibly efficient.

3.  **The Dot Command (`.`):** This is Vim's most underrated feature. It repeats your *last change*. This includes complex changes like `ciw` (change inside word) followed by typing new text. After that, you can move to another word and just press `.` to repeat the `ciw` operation with the same new text.
    *   *Emacs parallel:* `C-x e` (repeat last complex command) but more granular as it applies to *any* change.

4.  **Macros (`q`, `@`, `@@`):** Record a sequence of keystrokes and play them back. Incredibly powerful for repetitive tasks.
    *   `qa`: Start recording macro into register `a`.
    *   `<do something>`
    *   `q`: Stop recording.
    *   `@a`: Play back macro `a`.
    *   `5@a`: Play back macro `a` five times.

5.  **Registers (`"`):** Vim has many registers for copying and pasting. `"` specifies which register to use.
    *   `"ayw`: Yank a word into register `a`.
    *   `"ap`: Paste from register `a`.
    *   The `+` register is for the system clipboard (useful for copying to/from other applications). `"+yy` yanks the current line to the system clipboard.

6.  **`grep` and `find` (Telescope):** You have Telescope configured, which is a modern fuzzy finder. Your mappings like `<leader>sg` (live grep) and `<leader>sf` (find files) are your equivalent of Emacs' `find-file` or `grep` commands, but with fuzzy matching and a much nicer UI. Get comfortable with these.

7.  **Explore Your Plugins:**
    *   **NvimTree:** Your file explorer. Learn its commands (e.g., `o` to open, `s` to split, `?` for help).
    *   **`gitsigns.nvim`:** Git integration. The `]<c` and `[c` for hunk navigation are super useful.
    *   **LSP:** Leverage your LSP mappings (`gd`, `gr`, `rn`, `ca`) for code navigation, refactoring, and quick fixes, similar to Emacs' `LSP-mode`.
    *   **Treesitter:** Not just for highlighting, but also for the text objects you have configured. These `a` and `i` text objects are a game-changer for editing structured code.
    *   **`nvim-cmp` and `LuaSnip`:** Your autocompletion and snippet engine. Learn how to use `<C-n>`, `<C-p>`, `<C-l>`, `<C-h>` for efficient coding.

8.  **Vim Help (`:h`):** The built-in help is excellent. If you forget a command or want to know more about something, just type `:h <topic>` (e.g., `:h motion`, `:h text-objects`, `:h registers`, `:h NvimTree`).

9.  **Practice:** The biggest hurdle is muscle memory. Stick with it. Use a tool like `vimtutor` if you need to reinforce the basics. The initial slowdown is temporary, and the long-term gain in efficiency is significant.

The main philosophical shift from Emacs to Vim is often described as:
*   **Emacs:** "Press a key combination to *do* something." (e.g., `C-x C-s` to save, `C-w` to cut).
*   **Vim:** "Move to *where* you want to change, say *what* you want to change, then say *how much*." (e.g., `dw` to delete word, `ci"` to change inside quotes).

Embrace the Normal mode, learn motions and text objects, and you'll unlock Vim's full potential.

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
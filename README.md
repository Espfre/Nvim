# Shadowkey's Neovim Config

Built with [Lazy.nvim](https://github.com/folke/lazy.nvim).

Designed for:

- Python, HTML, CSS, Lua, Bash.
- Keyboard-driven workflow

---

## Requirements

- Neovim 0.9+
- Nerd Font (for icons)
- `stylua`, `black`, `prettier`, `shfmt` installed
- Git

Recommended (optional):

- [ripgrep](https://github.com/BurntSushi/ripgrep) for Telescope live_grep
- [fortune-mod](https://github.com/shlomif/fortune-mod) for random dashboard footer

---

## Plugin Highlights

- **Lazy.nvim** — Plugin manager
- **Telescope** — Fuzzy finder
- **Neo-tree** — File explorer
- **nvim-cmp** — Autocompletion
- **LuaSnip** — Snippet engine
- **Mason + LSPConfig** — Language server setup
- **Treesitter** — Better syntax highlighting
- **Rainbow Delimiters** — Colored parentheses
- **Which-Key** — Keybinding helper
- **Tokyonight** — Colorscheme
- **Conform.nvim** — Formatter engine
- **Alpha.nvim** — Dashboard

---

## Folder Structure

```
~/.config/nvim/
├── init.lua            # Entry point
├── lua/
│   ├── core/           # Options, keymaps, highlight
│   ├── plugins/        # All plugin configs (one per file)
│   └── utils/          # (empty, ready for future utils)
```

---

## Installation

1. Clone this repo:

```bash
git clone https://github.com/Espfre/Nvim ~/.config/nvim
```

2. Open Neovim:

```bash
nvim
```

3. Lazy.nvim will bootstrap itself and install all plugins.

4. Start coding 🚀

---

## Notes

- Fortune footer: if you want offensive/cursed fortunes, you may need to manually install `fortune-mod-offensive`.
- This config is modular and environment-aware (future-proofed).

---

## License

MIT License — free to use and modify as you will.

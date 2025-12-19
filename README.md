# My Neovim config

A minimal but effective neovim config.

## Installing

This repository needs to be cloned recursively as it contains submodules:
```
git clone --recurse-submodules git@github.com:emilrid/nvim
```

If you cloned without `--recurse-submodules` flag:
```
cd nvim
git submodule update --init
```

## Features and usage
- Yanked text is copied to clipboard.
- Shell is zsh.
- Colorscheme is gruvbox.
- `<leader>` is space.

- `<leader>O` opens current directory with oil.nvim.
- `<leader>q` shows diagnostics.
- `<leader>tn` opens a new tab.
- `<leader>f` formats file with LSP.

- `<leader>sh` searches help.
- `<leader>sk` searches keybindings.
- `<leader>sf` searches files.
- `<leader>sd` searches diagnostics.
- `<leader>sg` searches file with grep.
 
- `tt` goes to next tab.
- `TT` goes to previous tab.
- `<esc><esc>` exits terminal mode.
- `gd` goes to definition.
- `K` shows information symbol under cursor.
- `<C-x><C-o>` shows LSP completions.

# Neovim Windows Setup

> This configuration is specifically designed for Windows 10/11 and is intended to be used with Neovim on Windows. If you are using Linux or macOS, this setup may still work, but it has not been optimized for those platforms.

This repo contains a custom `init.lua` for Neovim with a clean dark theme, plugin setup, fuzzy search, statusline, and a few extras for a smoother development experience.

# Requirements

Before using this config, make sure you have:

- Neovim installed
- Git installed
- Optional but recommended: ripgrep (`rg`) for faster text search
- Optional: `make` for the Telescope FZF extension on Windows

# Install on Windows

1. Install Neovim.
2. Install Git.
3. Install ripgrep if you want faster project search.
4. If you use a Windows package manager such as `winget`, you can install the essentials with commands like:

```powershell
winget install --id Git.Git -e
winget install --id Neovim.Neovim -e
winget install --id BurntSushi.Ripgrep.MSVC -e
```

5. Place this file in your Neovim config directory:

```powershell
mkdir "$env:LOCALAPPDATA\nvim"
copy .\init.lua "$env:LOCALAPPDATA\nvim\init.lua"
```

6. Open Neovim and let the plugins install automatically on the first run.

# First Launch

When you open Neovim for the first time:

- lazy.nvim will bootstrap itself if it is missing
- the plugins listed in this config will be installed automatically
- if you want to force plugin installation manually, run:

```vim
:Lazy install
```

If `make` is available, the optional Telescope FZF native extension will also be enabled.

# Features Included

## # Leader Keys

This config sets:

- `<leader>` to `Space`
- `<localleader>` to `Space`

This makes keyboard shortcuts easier to remember and keeps the layout consistent across editing sessions.

Example:

```vim
<leader>ff
```

## # Appearance

This config enables:

- true color support
- dark background mode
- absolute line numbers
- 2-space indentation
- tabs expanded to spaces

These are the basics for a clean, readable editing experience.

## # Theme: Tokyo Night

The configuration installs `folke/tokyonight.nvim` and applies the `storm` style.

It also customizes some syntax colors:

- strings = bright green
- constants = yellow
- functions = blue
- keywords = purple

This makes code easier to read and gives the editor a modern, polished look.

To manually reload the theme after changes, run:

```vim
:colorscheme tokyonight
```

## # Discord Rich Presence

This setup includes `vyfor/cord.nvim`, which enables Discord rich presence while you are editing in Neovim.

This is a cosmetic feature and is optional depending on whether you want Discord status updates from Neovim.

## # Statusline

The config installs `nvim-lualine/lualine.nvim` to create a stylish statusline at the bottom of the editor.

It matches the Tokyo Night theme and shows useful editor information such as:

- file name
- mode
- cursor position
- file type

## # Auto Pairing

The config includes `windwp/nvim-autopairs` so Neovim automatically closes pairs like:

- `()`
- `[]`
- `{}`
- `""`
- `''`

This saves time when writing code and config files.

## # Telescope

Telescope is installed as the main fuzzy-finder/search tool.

### Telescope shortcuts

These are configured by default:

- `<leader>ff` → find files
- `<leader>fg` → live grep
- `<leader>fb` → buffers
- `<leader>fh` → help tags

### Open Telescope manually

From normal mode, run:

```vim
:Telescope find_files
:Telescope live_grep
:Telescope buffers
:Telescope help_tags
```

### What each action does

#### Find files

```vim
<leader>ff
```

Opens a file picker so you can quickly search for files in your project.

#### Live grep

```vim
<leader>fg
```

Searches text across the files in your project.

This is great for finding symbols, variables, strings, or comments without leaving Neovim.

#### Buffers

```vim
<leader>fb
```

Lists open buffers so you can switch between files quickly.

#### Help tags

```vim
<leader>fh
```

Opens Neovim help documentation and lets you search help topics quickly.

## # Optional Telescope FZF Native Extension

The config also includes:

- `nvim-telescope/telescope-fzf-native.nvim`

This is an optional speed boost for Telescope. It only enables if `make` is installed and available in your Windows environment.

If you want to use it, make sure `make` is present in your PATH.

# Useful Commands

After installation, these are the most useful commands to remember:

```vim
:Lazy install
:Lazy update
:Telescope find_files
:Telescope live_grep
:Telescope buffers
:Telescope help_tags
:colorscheme tokyonight
```

# Notes for Windows Users

- This config assumes you are using Neovim on Windows.
- It expects the config file to live in `%LOCALAPPDATA%\nvim\init.lua`.
- If you use a custom Neovim install location, place `init.lua` in the appropriate config directory for your setup.
- If some plugins do not install correctly on the first launch, close and reopen Neovim, then run:

```vim
:Lazy sync
```

# Quick way to open your Neovim config folder on Windows

If you want to jump directly to the folder that contains your Neovim config, press:

- Windows key + R
- then type:

```text
%localappdata%\nvim
```

This will open the folder where your `init.lua` file lives. From there, you can open `init.lua` and edit it directly.

# Summary

This config adds a complete Neovim setup for Windows with:

- clean visual theme
- plugin auto-install
- Discord presence
- statusline
- auto-pairing
- fuzzy file search
- project-wide text search
- quick help navigation

It is a practical everyday Neovim configuration meant to feel modern, fast, and easy to use on Windows.

-- Set mapleader to Space (must be set before lazy setup)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable true color and dark background
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Show absolute line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Basic indentation settings
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup({

  -- 🌙 Tokyo Night theme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = false,
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      })
      vim.cmd("colorscheme tokyonight")

      -- Bright syntax colors
      vim.api.nvim_set_hl(0, "String",   { fg = "#9ECE6A" }) -- bright green
      vim.api.nvim_set_hl(0, "Constant", { fg = "#E0AF68" }) -- bright yellow
      vim.api.nvim_set_hl(0, "Function", { fg = "#7AA2F7" }) -- sky blue
      vim.api.nvim_set_hl(0, "Keyword",  { fg = "#BB9AF7" }) -- magenta
    end,
  },

  -- 🎮 Discord Rich Presence
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {},
  },


  -- 📊 Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "tokyonight",
      },
    },
  },

  -- () and "" autopairing
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- 🔍 Telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = { preview_width = 0.6 },
          },
          sorting_strategy = "ascending",
          prompt_prefix = "🔍 ",
        },
      })
    end,
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Live Grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help Tags" },
    },
  },

  -- (Optional) FZF native for speed — requires make installed
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = vim.fn.executable("make") == 1,
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
})

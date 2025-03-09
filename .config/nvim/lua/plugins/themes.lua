return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      styles = {
        functions = { bold = true },
        comments = { italic = true },
        keywords = { bold = true },
        -- types = { bold = true, italic = true },
        conditionals = { italic = true },
        -- variables = { bold = true },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "latte",
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
        styles = { -- Style to be applied to different syntax groups
          functions = "bold", -- Value is any valid attr-list value `:help attr-list`
          comments = "italic",
          keywords = "bold",
          -- types = "italic,bold",
          conditionals = "italic",
        },
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = true,
        },
      },
    },
  },
  -- { "NLKNguyen/papercolor-theme" },
  {
    "sainnhe/everforest",
    -- init = function()
    --   vim.g.everforest_transparent_background = 1
    --   vim.g.everforest_better_performance = 1
    --   vim.g.everforest_enable_italic = 1
    --   vim.g.everforest_background = "medium"
    --   vim.g.everforest_diagnostic_text_highlight = 1
    -- end,
  },
  -- {
  --   "f-person/auto-dark-mode.nvim",
  --   config = {
  --     update_interval = 1000,
  --     -- set_dark_mode = function()
  --     --   vim.api.nvim_set_option("background", "dark")
  --     --   vim.cmd("colorscheme everforest")
  --     -- end,
  --     -- set_light_mode = function()
  --     --   vim.api.nvim_set_option("background", "light")
  --     --   vim.cmd("colorscheme everforest")
  --     -- end,
  --   },
  -- },
  -- { "stevedylandev/flexoki-nvim", name = "flexoki" },
  -- { "rebelot/kanagawa.nvim" },
}

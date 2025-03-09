return {
  -- { "rodjek/vim-puppet" },
  -- { "noprompt/vim-yardoc" },
  { "shadowwa/vim-puppet" },
  { "nathanielc/vim-tickscript" },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      -- LSP Server Settings
      servers = {

        taplo = {
          filetypes = { "toml" },
          -- IMPORTANT: this is required for taplo LSP to work in non-git repositories
          root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
        },

        puppet = {
          cmd = {
            "puppet-languageserver",
            "--stdio",
            "--puppet-settings=--modulepath,/Users/pr3c0g/R3/2_CDC/git/infrastructure/puppet/modules/",
            "--feature-flags=puppetstrings",
            "--debug=/Users/pr3c0g/.local/state/nvim/lsp_puppet_debug.log",
          },
        },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        git_icons = false,
      },
    },
  },
  {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        sections = {
          -- { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          -- {
          --   section = "terminal",
          --   cmd = 'bash -c \'read -r pokemon < <(shuf -n 1 < <(find /usr/local/opt/pokemon-colorscripts/colorscripts/small/regular -printf "%f\n")); figlet "${pokemon%%-*}";[[ "$pokemon" == *-* ]] && opts=("-n ${pokemon%%-*}" "-f ${pokemon#*-}") || opts=("-n $pokemon"); pokemon-colorscripts --no-title ${opts[@]}\'',
          --   random = 10,
          --   pane = 2,
          --   indent = 4,
          --   height = 23,
          -- },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        preview = {
          treesitter = {
            enabled = false,
          },
        },
      },
    },
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  -- these two allow supertab (completion and snippets)
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        shfmt = {
          prepend_args = { "-ci", "-bn", "-i", "4" },
        },
      },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    opts = {
      highlight = {
        ui = "String",
        search = "GitGutterDelete",
        replace = "GitGutterAdd",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      cmdline = { view = "cmdline" },
      presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = {
      "KittyScrollbackGenerateKittens",
      "KittyScrollbackCheckHealth",
      "KittyScrollbackGenerateCommandLineEditing",
    },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^6.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
  { "fladson/vim-kitty" },
  { "tpope/vim-fugitive" },
  { "junegunn/vim-easy-align" },
  { "mbbill/undotree" },
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_global_ext = 0
      vim.g.vimwiki_hl_headers = 1
      vim.g.vimwiki_hl_cb_checked = 1

      -- Vimwikis list
      vim.g.vimwiki_list = {
        {
          auto_diary_index = 1,
          name = "work",
          path = "/Users/pr3c0g/vimwiki",
          syntax = "markdown",
          ext = ".md",
          custom_wiki2html = "~/vimwiki/convert.py",
        },
        {
          auto_diary_index = 1,
          name = "personal",
          path = "/Users/pr3c0g/vimwiki_personal",
          syntax = "markdown",
          ext = ".md",
          custom_wiki2html = "~/vimwiki/convert.py",
        },
        {
          auto_diary_index = 1,
          name = "local_setup",
          path = "/Users/pr3c0g/vimwiki_local_setup",
          syntax = "markdown",
          ext = ".md",
          custom_wiki2html = "~/vimwiki/convert.py",
        },
      }
    end,
  },
  { "norcalli/nvim-colorizer.lua" }, -- render color on top of color codes like #ffaa00 red blue RED Red RedHat Yellow yellow YELLOW #FF0 #A0A #AA00FF
  { "folke/zen-mode.nvim" },
  {
    "rbong/vim-flog",
    lazy = true,
    cmd = { "Flog", "Flogsplit", "Floggit" },
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
}

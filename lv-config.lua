-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"
vim.cmd("set timeoutlen=200")
vim.opt.relativenumber = true

-- keymappings
lvim.leader = ","
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<leader><space>"] = ":noh<CR>"
lvim.keys.normal_mode["<leader>z"] = ":ZenMode<CR>"

-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })
-- you can also use the native vim way directly
-- vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()", { noremap = true, silent = true, expr = true })

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Additional Plugins
lvim.plugins = {
  {"rodjek/vim-puppet"},
  {"nathanielc/vim-tickscript"},
  {"tpope/vim-fugitive"},
  {"tpope/vim-surround"},
  {"folke/trouble.nvim",  cmd = "TroubleToggle"},
  {"folke/twilight.nvim", config = function() require("twilight").setup() end},
  {"folke/zen-mode.nvim"},
}

-- require ~/.config/lvim/lua/user/functions.lua
require "user.functions"
require "user.cdc"

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  { "FileType", "puppet", [[set include=^\\s*require\  includeexpr=FindPuppetFile(v:fname) isfname+=:]]},
}

-- Additional Leader bindings for WhichKey

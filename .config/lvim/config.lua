-- general
lvim.format_on_save = false
lvim.leader = ","
-- lvim.colorscheme = "dayfox"
lvim.colorscheme = "nightfox"
lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.custom_header = {}
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } }

lvim.autocommands._markdown = {{ "FileType", "markdown", "setlocal wrap" }}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.rainbow.enable = true

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- Project.nvim stuff
lvim.builtin.project.detection_methods = { "pattern" }

-- Git stuff
vim.cmd([[ command! Gpush term git push ]])
vim.cmd([[ command! Gpull term git pull --rebase ]])
vim.cmd([[ command! Gpullr term git pull --rebase --recurse-submodules]])

-- LSP stuff
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.float.focusable = true

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- { exe = "puppet-lint", filetypes = {"puppet"} },
	{ exe = "shellcheck", args = { "--severity", "warning" } },
	{ exe = "luacheck" },

	-- These were for null-ls, but can't get rid of virtual text, relying on pylsp now
	-- { exe = "flake8", filetypes = {"python"}},
	-- { exe = "pylint", filetypes = {"python"}},
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{
		exe = "prettier",
		---@usage arguments to pass to the formatter
		-- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
		args = { "--print-width", "120" },
	},
	{
		exe = "black",
		args = { "--line-length", "80" },
	},
	{ exe = "stylua" },
	{ exe = "shfmt", args = { "--ci", "--bn", "-i", "2" } },
})

-- ToggleTerm stuff
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15
lvim.builtin.terminal.shade_terminals = "true"

-- barbar stuff
lvim.keys.normal_mode["<leader>bP"] = ":BufferPin<CR>"
lvim.keys.normal_mode["<leader>bp"] = ":BufferPick<CR>"

require("user.custom_functions")
require("user.plugins").config()
require("user.lualine").config()
require("user.telescope")
require("user.keybindings").config()

vim.api.nvim_set_keymap("n", "<F12>", '<Cmd>lua require"stylish".ui_clock()<CR>', {
	noremap = true,
	silent = true,
})

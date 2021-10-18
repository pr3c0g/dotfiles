-- luacheck: globals lvim vim

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "dark_catppuccino"
lvim.lsp.diagnostics.virtual_text = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><space>"] = ":noh<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
	local actions = require("telescope.actions")
	-- for input mode
	lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
	lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
	lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
	lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
	-- for normal mode
	lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
	lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}
lvim.builtin.which_key.mappings["V"] = {
	name = "+VimWiki",
	t = { "<cmd>VimwikiTOC<cr>", "Generate TOC" },
	s = { ":VWS ", "Vimwiki Search" },
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.custom_header = {}
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.lualine.theme = "catppuccino"
lvim.builtin.treesitter.indent = { enable = true, disable = { "yaml", "python" } }

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

lvim.lang.python.formatters = { { exe = "black" } }
lvim.lang.python.linters = { { exe = "flake8" } }
lvim.lang.yaml.formatters = { { exe = "prettierd" } }
lvim.lang.lua.formatters = { { exe = "stylua" } }
lvim.lang.lua.linters = { { exe = "luacheck" } }
lvim.lang.json.formatters = { { exe = "prettierd" } }

-- Additional Plugins
lvim.plugins = {
	{ "rodjek/vim-puppet" },
	{ "nathanielc/vim-tickscript" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{ "Pocco81/Catppuccino.nvim" },
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{ "vimwiki/vimwiki" },
	{ "simrat39/symbols-outline.nvim" },
	{ "ellisonleao/glow.nvim" },
	{ "is0n/fm-nvim" },
	{
		"p00f/nvim-ts-rainbow",
		require("nvim-treesitter.configs").setup({
			rainbow = {
				enable = true,
				extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
				max_file_lines = nil, -- Do not enable for files with more than n lines, int
			},
		}),
	},
	{
		"nvim-neorg/neorg",
		config = function()
			require("user.neorg")
		end,
		requires = "nvim-lua/plenary.nvim",
	},
}

-- Telescope stuff
lvim.builtin.telescope.extensions.fzy = {
	fuzzy = true, -- false will only do exact matching
	override_generic_sorter = false, -- override the generic sorter
	override_file_sorter = true, -- override the file sorter
	case_mode = "smart_case", -- or "ignore_case" or "respect_case"
	-- the default case_mode is "smart_case"
}
lvim.builtin.telescope.on_config_done = function()
	require("telescope").load_extension("fzf")
end
lvim.builtin.telescope.defaults.file_ignore_patterns = { "govc" }

-- Project.nvim stuff
lvim.builtin.project.detection_methods = { "pattern" }

-- Git stuff
vim.cmd([[ command! Gpush term git push ]])
vim.cmd([[ command! Gpull term git pull --rebase ]])

-- VimWiki stuff
vim.g.vimwiki_list = {
	{
		auto_diary_index = 1,
		name = "work",
		path = "~/vimwiki/",
		syntax = "markdown",
		ext = ".md",
		custom_wiki2html = "~/vimwiki/convert.py",
	},
	{
		auto_diary_index = 1,
		name = "personal",
		path = "~/vimwiki_personal/",
		syntax = "markdown",
		ext = ".md",
		custom_wiki2html = "~/vimwiki/convert.py",
	},
}

-- ToggleTerm stuff
lvim.builtin.terminal.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.size = 15
lvim.builtin.terminal.shade_terminals = "true"

-- barbar stuff
lvim.keys.normal_mode["<leader>bP"] = ":BufferPin<CR>"
lvim.keys.normal_mode["<leader>bp"] = ":BufferPick<CR>"

-- -- UI stuff
-- local components = require("core.lualine.components")
-- lvim.builtin.lualine.sections.lualine_z = {
-- 	components.progress,
-- 	components.location,
-- }

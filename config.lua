-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
--# selene: allow(undefined_variable, unscoped_variables)

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "dark_catppuccino"
lvim.lsp.diagnostics.virtual_text = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader><space>"] = ":noh<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

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
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}
-- lvim.builtin.which_key.mappings["D"] = {
-- 	name = "+DAP",
-- 	b = { ":lua require'dap'.toggle_breakpoint()<CR>" },
-- 	B = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
-- 	lp = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>" },
-- 	dr = { ":lua require'dap'.repl.open()<CR>" },
-- 	dl = { ":lua require'dap'.run_last()<CR>" },
-- }
-- lvim.builtin.which_key.mappings["S"] = {
-- 	name = "Spectre",
-- 	S = { "<cmd>:lua require('spectre').open()<cr>", "Open Spectre" },
-- 	sw = { "<cmd>:lua require('spectre').open_visual({select_word=true})<CR>", "Search current word" },
-- 	sp = { "<cmd>:lua require('spectre').open_file_search()<cr>", "Search current file" },
-- 	-- vnoremap <leader>s :lua require('spectre').open_visual()<CR>
-- 	-- "  search in current file
-- 	-- nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.dap.active = true
lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.lualine.theme = "catppuccino"

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
lvim.plugins = {
	-- {"folke/tokyonight.nvim"}, {
	--     "ray-x/lsp_signature.nvim",
	--     config = function() require"lsp_signature".on_attach() end,
	--     event = "InsertEnter"
	-- },
	{ "rodjek/vim-puppet" },
	{ "nathanielc/vim-tickscript" },
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-surround" },
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{
		"Pocco81/Catppuccino.nvim",
		require("catppuccino").setup({
			colorscheme = "dark_catppuccino",
			transparency = false,
			term_colors = false,
			styles = {
				comments = "italic",
				functions = "italic",
				keywords = "italic",
				strings = "NONE",
				variables = "NONE",
			},
			integrations = {
				treesitter = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = "italic",
						hints = "italic",
						warnings = "italic",
						information = "italic",
					},
					underlines = {
						errors = "underline",
						hints = "underline",
						warnings = "underline",
						information = "underline",
					},
				},
				lsp_trouble = false,
				lsp_saga = false,
				gitgutter = false,
				gitsigns = false,
				telescope = false,
				nvimtree = {
					enabled = false,
					show_root = false,
				},
				which_key = true,
				indent_blankline = {
					enabled = true,
					colored_indent_levels = true,
				},
				dashboard = true,
				neogit = false,
				vim_sneak = false,
				fern = false,
				barbar = false,
				bufferline = false,
				markdown = false,
				lightspeed = false,
				ts_rainbow = true,
				hop = false,
			},
		}),
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		setup = function()
			vim.g.indentLine_enabled = 1
			vim.g.indent_blankline_char = "▏"
			vim.g.indent_blankline_filetype_exclude = {
				"log",
				"gitcommit",
				"vimwiki",
				"markdown",
				"json",
				"txt",
				"vista",
				"NvimTree",
				"git",
				"TelescopePrompt",
				"undotree",
				"flutterToolsOutline",
				"org",
				"orgagenda",
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"", -- for all buffers without a file type
			}
			vim.g.indent_blankline_buftype_exclude = { "terminal" }
			vim.g.indent_blankline_show_trailing_blankline_indent = false
			vim.g.indent_blankline_show_first_indent_level = false
		end,
	},
	{
		"karb94/neoscroll.nvim",
		event = "WinScrolled",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
			})
			-- lua require(neoscroll).scroll
			-- lua require('neoscroll').scroll(-10, true, 300)
		end,
	},
	{ "vimwiki/vimwiki" },
	{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	{ "simrat39/symbols-outline.nvim" },
	-- {
	-- 	"windwp/nvim-spectre",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("spectre").setup()
	-- 	end,
	-- },
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
}

-- VimWiki setup
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

-- General settings
-- lvim.format_on_save = false -- because of shfmt

-- Treesitter settings
require("nvim-treesitter.configs").setup({
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "gnn",
			scope_incremental = "gns",
			node_decremental = "gnp",
		},
	},
})

-- Telescope settings
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

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
	{ "BufWinEnter", "*.md", "set nospell" },
}

-- YAML stuff
lvim.lang.yaml.formatters = { { exe = "prettier" } }

-- Bash stuff
-- lvim.lang.sh.formatters = { { exe = 'shfmt' } }

-- Python stuff
lvim.lang.python.formatters = { { exe = "black" } }
lvim.lang.python.linters = { { exe = "flake8" } }
local dap_install = require("dap-install")
dap_install.config("python", {})

-- Git stuff
vim.cmd([[ command! Gpush term git push ]])
vim.cmd([[ command! Gpull term git pull --rebase ]])

-- Lua stuff
lvim.lang.lua.formatters = { { exe = "stylua" } }
lvim.lang.lua.linters = { { exe = "selene" } }

-- cdc stuff
-- lvim.keys.normal_mode["<leader>S"] = ":e puppet/manifests/site.pp<CR>"

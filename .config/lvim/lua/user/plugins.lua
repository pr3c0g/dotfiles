local M = {}
M.config = function()
	lvim.plugins = {
		{ "rodjek/vim-puppet" },
		{ "nathanielc/vim-tickscript" },
		{ "tpope/vim-fugitive" },
		{ "tpope/vim-surround" },
		{ "folke/trouble.nvim", cmd = "TroubleToggle" },
		{
			"vimwiki/vimwiki",
			config = function()
				require("user.vimwiki").config()
			end,
		},
		{ "ellisonleao/glow.nvim" },
		{ "is0n/fm-nvim" },
		{
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
		},
		{
			"EdenEast/nightfox.nvim",
			require("user.themes").nightfox(),
		},
		{
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup({ "*" }, {
					RGB = false, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
				})
			end,
		},
		{
			"metakirby5/codi.vim",
			cmd = "Codi",
		},
		{
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("indent_blankline").setup({
					filetype_exclude = {
						-- "puppet",
						"help",
						"terminal",
						"dashboard",
						"NvimTree",
						"vimwiki",
						"man",
						"lspinfo",
						"packer",
						"TelescopePrompt",
						"TelescopeResults",
						"lsp-installer",
						"lsp-info",
						"",
					},
					buftype_exclude = { "terminal" },
					space_char_blankline = " ",
					-- show_foldtext = false,
					-- strict_tabs = true,
					-- debug = true,
					-- disable_with_nolist = true,
					-- max_indent_increase = 1,
					show_current_context = true,
					-- show_current_context_start = true,
					context_patterns = {
						"case",
						"class",
						"function",
						"func_literal",
						"method",
						"^if",
						"while",
						"for",
						"with",
						"try",
						"except",
						"argument_list",
						"object",
						"dictionary",
						"table",
						"element",
					},
				})
			end,
		},
		{ "ggandor/lightspeed.nvim" },
		{
			"danymat/neogen",
			config = function()
				require("neogen").setup({
					enabled = true,
				})
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		},
		{
			"catppuccin/nvim",
			config = function()
				require("user.themes").catppuccin()
				-- vim.cmd([[colorscheme catppuccin]])
			end,
		},
    { 'RishabhRD/popfix' },
		{ "RishabhRD/nvim-cheat.sh" },
		{
			"ray-x/lsp_signature.nvim",
			config = function()
				require("user.lsp_signature").config()
			end,
			event = { "BufRead", "BufNew" },
		},
		{
			"kosayoda/nvim-lightbulb",
			config = function()
				vim.fn.sign_define(
					"LightBulbSign",
					{ text = require("user.lsp_kind").icons.code_action, texthl = "DiagnosticInfo" }
				)
			end,
			event = "BufRead",
			-- ft = { "rust", "go", "typescript", "typescriptreact" },
		},
		-- { "sunjon/stylish.nvim" },
		{ "simrat39/symbols-outline.nvim" },
	}
end

return M

local M = {}

M.onedarker = function()
	local onedarker = require("onedarker")
	onedarker.config({
		italic_comments = true,
		italic_functions = true,
	})
end

M.catppuccin = function()
	local catppuccin = require("catppuccin")
	catppuccin.setup({
		transparent_background = false,
		term_colors = false,
		styles = {
			comments = "italic",
			functions = "italic",
			keywords = "bold",
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
			cmp = true,
			lsp_saga = false,
			gitgutter = false,
			gitsigns = true,
			telescope = true,
			nvimtree = {
				enabled = true,
				show_root = false,
			},
			which_key = false,
			indent_blankline = {
				enabled = true,
				colored_indent_levels = false,
			},
			dashboard = true,
			neogit = false,
			vim_sneak = false,
			fern = false,
			barbar = true,
			bufferline = true,
			markdown = true,
			lightspeed = false,
			ts_rainbow = false,
			hop = false,
			notify = true,
			telekasten = true,
		},
	})
end

M.nightfox = function()
	local nightfox = require("nightfox")

	-- This function sets the configuration of nightfox. If a value is not passed in the setup function
	-- it will be taken from the default configuration above
	nightfox.setup({
		fox = "nightfox", -- change the colorscheme to use nordfox
		styles = {
			comments = "italic", -- change style of comments to be italic
			keywords = "bold", -- change style of keywords to be bold
			functions = "italic,bold", -- styles can be a comma separated list
		},
		inverse = {
			match_paren = true, -- inverse the highlighting of match_parens
		},

	})

  -- local _time = os.date "*t"
  -- if _time.hour > 0 and _time.hour <= 7 then
  --   vim.cmd([[NightfoxLoad nightfox]])
  -- elseif _time.hour > 7 and _time.hour <= 17 then
  --   vim.cmd([[NightfoxLoad dayfox]])
  -- elseif _time.hour > 17 then
  --   vim.cmd([[NightfoxLoad nightfox]])
  -- end

end

return M

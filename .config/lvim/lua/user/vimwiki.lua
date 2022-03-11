local M = {}
M.config = function()
	-- VimWiki stuff
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
	}
  vim.g.vimwiki_hl_headers = 1
  vim.g.vimwiki_hl_cb_checked = 1
  vim.g.vimwiki_listsyms = '✗○◐●✓'
end
return M

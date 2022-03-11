local M = {}

local function set_which_key_bindings()
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
	lvim.builtin.which_key.mappings["w"] = {
		name = "+VimWiki",
		t = { "<cmd>VimwikiTOC<cr>", "Generate TOC" },
		s = { ":VWS ", "Vimwiki Search" },
	}
end

local function set_telescope_custom_bindings()
	lvim.keys.visual_mode["<leader>st"] = "<Cmd>lua require('user.telescope').grep_string_visual()<CR>"
end

M.config = function()
	lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
	lvim.keys.normal_mode["<leader><space>"] = ":noh<CR>"
	lvim.keys.normal_mode["<leader>w"] = false
	lvim.keys.normal_mode["<leader><CR>"] = {
		"<cmd>lua require('user.custom_functions').maximize_current_split()<CR>",
		{ noremap = true, silent = true, nowait = true },
	}

	set_which_key_bindings()
  set_telescope_custom_bindings()
end

return M

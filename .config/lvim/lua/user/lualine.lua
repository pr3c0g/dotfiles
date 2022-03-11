local M = {}

local kind = require("user.lsp_kind")

local function clock()
	return kind.icons.clock .. os.date("%H:%M")
end

local function lsp_progress()
  local messages = vim.lsp.util.get_progress_messages()
  if #messages == 0 then
    return ""
  end
  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end
  -- local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  -- local spinners = { " ", " ", " ", " ", " ", " ", " ", " ", " ", " " }
  -- local spinners = { " ", " ", " ", " ", " ", " ", " ", " ", " " }
  local spinners = {
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
  }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 60) % #spinners
  return spinners[frame + 1] .. " " .. table.concat(status, " | ")
end

M.config = function()
	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
		hide_small = function()
			return vim.fn.winwidth(0) > 150
		end,
		check_git_workspace = function()
			local filepath = vim.fn.expand("%:p:h")
			local gitdir = vim.fn.finddir(".git", filepath .. ";")
			return gitdir and #gitdir > 0 and #gitdir < #filepath
		end,
	}

	local components = require("lvim.core.lualine.components")

	local config = {

    options = {
      theme = "auto",
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		},
		sections = {
			lualine_a = {
				components.mode,
			},
			lualine_b = {
				components.branch,
				components.filename,
			},
			lualine_c = {
				components.diff,
				components.python_env,
			},
			lualine_x = {
				components.diagnostics,
				components.treesitter,
				components.lsp,
				components.filetype,
			},
			lualine_y = {},
			lualine_z = {
				components.location,
			},
		},
		inactive_sections = {
			lualine_a = {
				"filename",
			},
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = { "nvim-tree" },
	}

	-- Inserts a component in lualine_x ot right section
	local function ins_right(component)
		table.insert(config.sections.lualine_x, component)
	end

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  ins_left {
    lsp_progress,
    cond = conditions.hide_small,
  }

	ins_left({
		clock,
		cond = conditions.hide_in_width,
		-- color = { fg = "#c678dd" },
	})
	lvim.builtin.lualine.options = config.options
	lvim.builtin.lualine.sections = config.sections
end

return M

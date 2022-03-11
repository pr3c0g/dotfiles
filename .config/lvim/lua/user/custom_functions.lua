local M = {}

  function M.maximize_current_split()
  local cur_win = vim.api.nvim_get_current_win()
  vim.api.nvim_set_var("non_float_total", 0)
  vim.cmd "windo if &buftype != 'nofile' | let g:non_float_total += 1 | endif"
  vim.api.nvim_set_current_win(cur_win or 0)
  if vim.api.nvim_get_var "non_float_total" == 1 then
    if vim.fn.tabpagenr "$" == 1 then
      return
    end
    vim.cmd "tabclose"
  else
    local last_cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd "tabedit %:p"
    vim.api.nvim_win_set_cursor(0, last_cursor)
  end
end

return M

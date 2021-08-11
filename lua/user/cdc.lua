-- Keymaps

lvim.keys.normal_mode["<leader>S"] = ":e ~/R3/2_CDC/git/cdc/puppet/manifests/site.pp<CR>"

-- Functions

M = {}

M.FindPuppetFile = function(fname)
  -- find root directory "modules"
  local root = vim.fn.finddir('modules', '.;')
  if vim.fn.empty(root) then
    return ''
  end

  local path = vim.split(fname, '::')
  if #path == 1 then
    -- only module given, default to using init.pp
    add(path, 'init')
  end

  -- {'module', 'foo', 'bar'} -> module/manifests/foo/bar
  local path = vim.fn.join(table.insert(path, 'manifests', 1), '/')

  return root ..'/'..path..'.pp'
end

return M


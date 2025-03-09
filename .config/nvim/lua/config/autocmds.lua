-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[ command! Gpush term git push ]])
vim.cmd([[ command! Gpull term git pull --rebase ]])
vim.cmd([[ command! Gpullr term git pull --rebase --recurse-submodules --jobs=10]])

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "sh",
--   },
--   callback = function()
--     vim.opt.cc = "80"
--   end,
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "puppet",
--   },
--   callback = function()
--     vim.opt.cc = "140"
--   end,
-- })

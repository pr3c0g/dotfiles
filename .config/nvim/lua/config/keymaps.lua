-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VimWiki
vim.keymap.set({ "n", "v" }, "X", "<Plug>VimwikiToggleListItem")
vim.keymap.set("n", "<leader>wT", ":VimwikiTOC<CR>")
vim.keymap.set("n", "<F5>", ":UndotreeToggle<cr>")
vim.keymap.set("n", "<leader>bt", ":Telescope buffers<cr>")
vim.keymap.set("n", "<leader>t", ":lua Snacks.terminal()<cr>")
vim.keymap.set("n", "<C-\\>", ":lua Snacks.terminal.toggle()<cr>")

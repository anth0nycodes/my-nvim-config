-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>sg",
  "<cmd>lua require('telescope.builtin').live_grep({additional_args = {'--hidden'}})<cr>"
)

-- Remap Ctrl-d and Ctrl-u to also center with zz
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down half a page and center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up half a page and center cursor" })

-- Markdown Preview keymaps
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })
vim.keymap.set("n", "<leader>mc", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown Preview Close" })

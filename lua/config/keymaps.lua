-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set(
  "n",
  "<leader>sg",
  "<cmd>lua require('telescope.builtin').live_grep({additional_args = {'--hidden'}})<cr>"
)

-- Markdown Preview keymaps
vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })
vim.keymap.set("n", "<leader>mc", "<cmd>MarkdownPreviewStop<cr>", { desc = "Markdown Preview Close" })

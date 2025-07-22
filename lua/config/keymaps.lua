-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', {
  expr = true,
  silent = true,
  noremap = true,
  replace_keycodes = false,
})

vim.keymap.set(
  "n",
  "<leader>sg",
  "<cmd>lua require('telescope.builtin').live_grep({additional_args = {'--hidden'}})<cr>"
)

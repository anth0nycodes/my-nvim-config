return {
  "brianhuster/treesitter-endwise.nvim",
  lazy = false,
  init = function()
    vim.treesitter.language.register("lua", "luau")
  end,
}

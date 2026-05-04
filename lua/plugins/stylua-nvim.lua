return {
  "ckipp01/stylua-nvim",
  ft = { "luau" },
  config = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.luau",
      callback = function()
        require("stylua-nvim").format_file()
      end,
    })
  end,
}

return {
  "lopi-py/luau-lsp.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = { "luau" },
  opts = {
    platform = {
      type = "roblox",
    },
    sourcemap = {
      enabled = true,
      autogenerate = true,
    },
  },
}

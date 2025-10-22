return {
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      editor = {
        tooltip = "Editing {filename} in Neovim",
      },
      display = {
        show_workspace = true,
      },
    },
    config = function(_, opts)
      require("cord").setup(opts)
    end,
  },
}

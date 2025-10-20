return {
  "xiyaowong/transparent.nvim",
  event = "VeryLazy",
  config = function()
    require("transparent").setup({
      extra_groups = {
        -- Neo-tree
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "NeoTreeEndOfBuffer",
        "NeoTreeFloatBorder",
        "NeoTreeWinSeparator",
        "NeoTreeTabInactive",
        "NeoTreeTabSeparatorInactive",

        -- General UI
        "NormalFloat",
        "FloatBorder",
        "WinBar",
        "SignColumn",
        "EndOfBuffer",

        -- Telescope
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopeResultsNormal",
        "TelescopePreviewNormal",
      },
      exclude_groups = {},
    })

    -- Delay enable until after UI init (prevents invalid buffer errors)
    vim.schedule(function()
      vim.cmd("TransparentEnable")
    end)

    -- Re-apply whenever colorscheme changes
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        require("transparent").enable()
      end,
    })
  end,
}

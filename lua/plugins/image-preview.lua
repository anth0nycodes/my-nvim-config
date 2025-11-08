-- Note: doesn't work with ghostty terminal cause it doesn't support images yet
return {
  "skardyy/neo-img",
  build = ":NeoImg Install",
  config = function()
    require("neo-img").setup()
  end,
}

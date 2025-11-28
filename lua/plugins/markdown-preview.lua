return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    config = function()
      vim.g.mkdp_browserfunc = "g:Open_browser"

      vim.cmd([[
        function! g:Open_browser(url)
          if executable('open')
            silent exec "!open -g " . shellescape(a:url)
          endif
        endfunction
      ]])
    end,
  },
}

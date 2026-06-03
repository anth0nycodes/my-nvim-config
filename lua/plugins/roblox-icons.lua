return {
  "echasnovski/mini.icons",
  opts = function(_, opts)
    -- Custom magenta highlight for ModuleScript icons
    vim.api.nvim_set_hl(0, "RobloxModuleScript", { fg = "#A367FB" })
    vim.api.nvim_set_hl(0, "RobloxLocalScript", { fg = "#2BB1FF" })

    -- ModuleScript icon for general .luau files
    opts.extension = vim.tbl_deep_extend("force", opts.extension or {}, {
      luau = { glyph = "󰢱", hl = "RobloxModuleScript" },
    })

    -- Override luau filetype icon too (some resolvers use filetype instead of extension)
    opts.filetype = vim.tbl_deep_extend("force", opts.filetype or {}, {
      luau = { glyph = "󰢱", hl = "RobloxModuleScript" },
    })

    -- Rojo project file
    opts.file = vim.tbl_deep_extend("force", opts.file or {}, {
      ["default.project.json"] = { glyph = "󰣏", hl = "MiniIconsRed" },
    })

    -- Patch MiniIcons.get after setup to handle Rojo suffix patterns
    -- (.server.luau → ServerScript, .client.luau → LocalScript)
    vim.schedule(function()
      local ok, MiniIcons = pcall(require, "mini.icons")
      if not ok then return end

      local _get = MiniIcons.get
      MiniIcons.get = function(category, name)
        if category == "file" and type(name) == "string" then
          if name:match("%.server%.luau$") then
            return "󰒋", "MiniIconsGrey", false
          elseif name:match("%.client%.luau$") then
            return "󰌢", "RobloxLocalScript", false
          elseif name:match("%.luau$") then
            return "󰢱", "RobloxModuleScript", false
          end
        end
        if category == "extension" and name == "luau" then
          return "󰢱", "RobloxModuleScript", false
        end
        if category == "filetype" and name == "luau" then
          return "󰢱", "RobloxModuleScript", false
        end
        return _get(category, name)
      end
    end)
  end,
}

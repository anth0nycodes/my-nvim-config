return {
  "nvim-mini/mini.icons",
  opts = function(_, opts)
    -- Custom magenta highlight for ModuleScript icons
    vim.api.nvim_set_hl(0, "RobloxModuleScript", { fg = "#A367FB" })
    vim.api.nvim_set_hl(0, "RobloxLocalScript", { fg = "#2BB1FF" })
    vim.api.nvim_set_hl(0, "RobloxFolder", { fg = "#FADC7F" })
    vim.api.nvim_set_hl(0, "RobloxToolWarm", { fg = "#F2C67F" })

    -- ModuleScript icon for general .luau files
    opts.extension = vim.tbl_deep_extend("force", opts.extension or {}, {
      luau = { glyph = "󰢱", hl = "RobloxModuleScript" },
    })

    -- Override luau filetype icon too (some resolvers use filetype instead of extension)
    opts.filetype = vim.tbl_deep_extend("force", opts.filetype or {}, {
      luau = { glyph = "󰢱", hl = "RobloxModuleScript" },
    })

    -- Roblox tool config files
    opts.file = vim.tbl_deep_extend("force", opts.file or {}, {
      ["wally.toml"] = { glyph = "󰩃", hl = "RobloxToolWarm" },
      ["wally.lock"] = { glyph = "󰩃", hl = "RobloxToolWarm" },
      ["selene.toml"] = { glyph = "󰒓", hl = "MiniIconsGrey" },
      ["rokit.toml"] = { glyph = "󰏗", hl = "RobloxToolWarm" },
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
        if category == "directory" then
          return "󰉋", "RobloxFolder", false
        end
        return _get(category, name)
      end
    end)
  end,
}

---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'catppuccin',
  tabufline = {
    overriden_modules = function()
      return {
        buttons = function ()
          return ""
        end
      }
    end
  },
  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"
      -- this is just default table of statusline modules
      return {
        fileInfo = function()
          local prefix = "%#St_file_info#" .. vim.fn.expand "%:h" .. "%#St_file_sep#"
          return prefix .. st_modules.fileInfo()
          -- or just return "" to hide this module
        end,
      }
    end,
  },
}
 M.plugins = 'custom.plugins'
 M.mappings = require "custom.mappings"
 return M

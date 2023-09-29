---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'catppuccin',
  tabufline = {
    overriden_modules = function(modules)
      table.remove(modules, 4)
    end
  },
  statusline = {
    overriden_modules = function(modules)
        modules[2] = (function ()
            local prefix = (vim.fn.expand "%:e" == "" and "") or ("%#St_file_info#" .. vim.fn.expand "%:h" .. "%#St_file_sep#")
            return prefix .. modules[2]
          end)()
      end,
  },
}
 M.plugins = 'custom.plugins'
 M.mappings = require "custom.mappings"
 return M

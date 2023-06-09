---@type ChadrcConfig 
 local M = {}
 M.ui = {theme = 'catppuccin'}
 M.plugins = 'custom.plugins'
 M.mappings = require "custom.mappings"-- place this in one of your configuration file(s)
 return M

local M = {}

M.base_30 = {
  white = "#D9E0EE",
  darker_black = "#191828",
  black = "#000000", -- Pitch black background
  black2 = "#252434",
  one_bg = "#2d2c3c",
  one_bg2 = "#363545",
  one_bg3 = "#3e3d4d",
  grey = "#474656",
  grey_fg = "#4e4d5d",
  grey_fg2 = "#555464",
  light_grey = "#605f6f",
  red = "#F38BA8",
  baby_pink = "#ffa5c3",
  pink = "#F5C2E7",
  line = "#383747",
  green = "#ABE9B3",
  vibrant_green = "#b6f4be",
  nord_blue = "#8bc2f0",
  blue = "#89B4FA",
  yellow = "#FAE3B0",
  sun = "#ffe9b6",
  purple = "#d0a9e5",
  dark_purple = "#c7a0dc",
  teal = "#B5E8E0",
  orange = "#F8BD96",
  cyan = "#89DCEB",
  statusline_bg = "#232232",
  lightbg = "#2f2e3e",
  pmenu_bg = "#ABE9B3",
  folder_bg = "#89B4FA",
  lavender = "#c7d1ff",
}

M.base_16 = {
  base00 = "#000000", -- Pitch black background
  base01 = "#191828", -- Slightly lighter than pitch black
  base02 = "#252434", -- A bit lighter
  base03 = "#363545", -- Slightly lighter than base02
  base04 = "#555464", -- Lighter grey for comments
  base05 = "#605f6f", -- Light grey for default text
  base06 = "#bfc6d4", -- Lighter grey for unused elements
  base07 = "#D9E0EE", -- Lightest grey for special elements
  base08 = "#F38BA8", -- Red
  base09 = "#F8BD96", -- Orange
  base0A = "#FAE3B0", -- Yellow
  base0B = "#ABE9B3", -- Green
  base0C = "#89DCEB", -- Cyan
  base0D = "#89B4FA", -- Blue
  base0E = "#CBA6F7", -- Purple
  base0F = "#F38BA8", -- Red (same as base08)
}

M.polish_hl = {
  ["@variable"] = { fg = M.base_30.lavender },
  ["@property"] = { fg = M.base_30.teal },
  ["@variable.builtin"] = { fg = M.base_30.red },
}

M.type = "dark"

return M

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("plugins.configs.lspconfig")
local util = require "lspconfig/util"

require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  -- init_options = {
  --   settings = {
  --     -- Any extra CLI arguments for `ruff` go here.
  --     args = {},
  --   }
  -- }
}

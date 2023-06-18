local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities


local options = {
  tools = {
    runnables = {
      use_telescope = true,
    },
  },

  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ['rust_analyzer']= {
          procMacro = {
          enable = false,
        }
      }
    }
  }
}

return options

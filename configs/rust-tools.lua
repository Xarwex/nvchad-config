local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- Update this path
local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb'
local this_os = vim.loop.os_uname().sysname;

-- The path in windows is different
if this_os:find "Windows" then
  codelldb_path = package_path .. "adapter\\codelldb.exe"
  liblldb_path = package_path .. "lldb\\bin\\liblldb.dll"
else
  -- The liblldb extension is .so for linux and .dylib for macOS
  liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
end

local options = {
  tools = {
    runnables = {
      use_telescope = true,
    },
  },
  dap = {
    adapter = require('rust-tools.dap').get_codelldb_adapter(
        codelldb_path, liblldb_path)
  },
  server = {
    standalone = true,
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

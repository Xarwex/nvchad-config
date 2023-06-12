local cmp = require "cmp"
local rust = require "custom.plugins.rust"
local python = require "custom.plugins.python"

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "codelldb",
        "rustfmt",
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, _)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      M.completion.completeopt = "menu,menuone,noselect"
      M.mapping["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = false,
      }
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "phaazon/hop.nvim",
    branch = 'v2',
    lazy = false,
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      require("core.utils").load_mappings("hop")
    end
  },
  {
    "rmagatti/auto-session",
    lazy = false,
    dependencies = "nvim-tree/nvim-tree.lua",
    config = function()
      local function restore_nvim_tree()
        require("nvim-tree.api").tree.open({ focus = false })
      end
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
        post_restore_cmds = restore_nvim_tree()
      }
    end,
  },
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope-live-grep-args.actions")
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function (_, opts)
      return table.insert(opts.extensions_list, "live_grep_args")
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "cstrahan/vim-capnp",
    ft = "capnp",
  },
}
return vim.tbl_deep_extend("keep", plugins, rust, python)

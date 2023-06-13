local cmp = require "cmp"

local plugins = {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "codelldb",
        "rustfmt",
        -- "black",
        -- "debugpy",
        "mypy",
        "ruff",
        -- "ruff-lsp",
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
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "cmp"
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
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function (_, opts)
      return table.insert(opts.extensions_list, "live_grep_args")
    end
  },
  {
    "cstrahan/vim-capnp",
    ft = "capnp",
  },
}
return plugins

local cmp = require "cmp"

local plugins = {
   {
    "NvChad/nvim-colorizer.lua",
    config = function(_, _)
      require("colorizer").setup({ user_default_options = { names = false } })

      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "codelldb",
        "rustfmt",
        "stylua",
        "python-lsp-server",
        -- "black",
        -- "debugpy",
        -- "mypy",
        -- "ruff",
        -- "ruff-lsp",
        -- "pyright",
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
    "nvim-tree/nvim-tree.lua",
    lazy = false,
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
      opts.defaults.cache_picker = {
        num_pickers = 30
      }
      return table.insert(opts.extensions_list, "live_grep_args")
    end
  },
  {
    "cstrahan/vim-capnp",
    ft = "capnp",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
    lazy = false,
  },
  -- {
  --   "romainl/vim-qf",
  --   lazy = false,
  -- }
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
      require("lsp_lines").setup()
      require("core.utils").load_mappings("lsp_lines")
    end,
  },
  {
    "tpope/vim-unimpaired",
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {
      window = {
        width = .5
      }
    },
    config = function (_, opts)
      require("zen-mode").setup(opts)
      require("core.utils").load_mappings("zen_mode")
    end
  }
}
return plugins

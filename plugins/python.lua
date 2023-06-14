return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "python",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  -- {
  --   "tree-sitter/tree-sitter-python",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   ft = "python"
  -- }
  -- {
  --   "mfussenegger/nvim-dap-python",
  --   ft = "python",
  --   dependencies = {
  --     "mfussenegger/nvim-dap",
  --     "rcarriga/nvim-dap-ui",
  --   },
  --   config = function(_, _)
  --     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  --     require("dap-python").setup(path)
  --     require("core.utils").load_mappings("dap_python")
  --   end,
  -- },
}

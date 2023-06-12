local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.crates = {
  plugin = true,
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "update crates"
    }
  }
}

M.hop = {
  plugin = true,
  n = {
    ["<leader><leader>w"] = {
      ":HopWord <CR>"
    }
  }
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>fw"] = {
      ":Telescope live_grep_args <CR>"
    }
  }
}
return M

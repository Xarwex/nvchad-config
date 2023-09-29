local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "ToggleBreakpoint" },
    ["<leader>dus"] = {
      function ()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    },
    ["<F5>"] = { "<cmd> DapContinue <CR>", "Continue" },
    ["<S-F5>"] = { ":DapTerminate <CR>", "Terminate" },
    ["<F10>"] = { "<cmd> DapStepOver <CR>", "Step over"},
    ["<leader>lrc"] = {":lua require('dap.ext.vscode').load_launchjs(nil, {rt_lldb={'rust'}}) <CR>", "Load rust debug config"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
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
      "Update crates"
    }
  }
}

M.hop = {
  plugin = true,
  n = {
    ["<leader><leader>w"] = {
      ":HopWord <CR>",
      "HopWord"
    }
  }
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>fw"] = {
      ":Telescope live_grep_args <CR>"
    },
    ["<leader>gr"] = {
      ":Telescope lsp_references <CR>",
      "LSP references"
    },
    ["<leader>gd"] = {
      ":Telescope lsp_definitions <CR>",
      "LSP definitions"
    },
    ["<leader>re"] = {
      ":Telescope resume <CR>",
      "Resume last search"
    },
    ["<leader>di"] = {
      ":Telescope diagnostics <CR>",
      "Diagnostics"
    },
    ["<leader>pi"] = {
      ":Telescope pickers <CR>",
      "Pickers"
    }
  }
}

M.lsp_lines = {
  plugin = true,
  n = {
    ["<leader>ll"] = {
      function ()
        require('lsp_lines').toggle()
      end,
      "Toggle LSP lines"
    },
  }
}

M.zen_mode = {
  plugin = true,
  n = {
    ["<leader>kz"] = {
      ":ZenMode <CR>",
      "Toggle Zen Mode"
    }
  }
}
return M

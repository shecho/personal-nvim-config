return {
  {
    -- Plugin: nvim-dap
    -- URL: https://github.com/mfussenegger/nvim-dap
    -- Description: Debug Adapter Protocol client implementation for Neovim.
    "mfussenegger/nvim-dap",
    recommended = true, -- Recommended plugin
    desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

    dependencies = {
      -- Plugin: nvim-dap-ui
      -- URL: https://github.com/rcarriga/nvim-dap-ui
      -- Description: A UI for nvim-dap.
      "rcarriga/nvim-dap-ui",

      -- Plugin: nvim-dap-virtual-text
      -- URL: https://github.com/theHamsta/nvim-dap-virtual-text
      -- Description: Virtual text for the debugger.
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {}, -- Default options
      },
    },

    -- Keybindings for nvim-dap
    keys = {
      { "<leader>Dd", "", desc = "+debug", mode = { "n", "v" } }, -- Group for debug commands
      {
        "<leader>DB",
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end,
        desc = "Breakpoint Condition",
      },
      {
        "<leader>DT",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>Dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>Da",
        function()
          require("dap").continue({ before = get_args })
        end,
        desc = "Run with Args",
      },
      {
        "<leader>DC",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>Dg",
        function()
          require("dap").goto_()
        end,
        desc = "Go to Line (No Execute)",
      },
      {
        "<leader>Di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>Dj",
        function()
          require("dap").down()
        end,
        desc = "Down",
      },
      {
        "<leader>Dk",
        function()
          require("dap").up()
        end,
        desc = "Up",
      },
      {
        "<leader>Dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
      },
      {
        "<leader>Do",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
      {
        "<leader>DO",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>Dp",
        function()
          require("dap").pause()
        end,
        desc = "Pause",
      },
      {
        "<leader>Dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>Ds",
        function()
          require("dap").session()
        end,
        desc = "Session",
      },
      {
        "<leader>Dt",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>Dw",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Widgets",
      },
    },

    config = function()
      local dap = require("dap")

      -- Load mason-nvim-dap if available
      if LazyVim.has("mason-nvim-dap.nvim") then
        require("mason-nvim-dap").setup(LazyVim.opts("mason-nvim-dap.nvim"))
      end

      -- Set highlight for DapStoppedLine
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      -- Define signs for DAP
      for name, sign in pairs(LazyVim.config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end

      -- Setup DAP configuration using VsCode launch.json file
      local vscode = require("dap.ext.vscode")
      local json = require("plenary.json")
      vscode.json_decode = function(str)
        return vim.json.decode(json.json_strip_comments(str))
      end

      -- Load launch configurations from .vscode/launch.json if it exists
      if vim.fn.filereadable(".vscode/launch.json") then
        vscode.load_launchjs()
      end

      -- Function to load environment variables
      local function load_env_variables()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          variables[k] = v
        end

        -- Load variables from .env file manually
        local env_file_path = vim.fn.getcwd() .. "/.env"
        local env_file = io.open(env_file_path, "r")
        if env_file then
          for line in env_file:lines() do
            for key, value in string.gmatch(line, "([%w_]+)=([%w_]+)") do
              variables[key] = value
            end
          end
          env_file:close()
        else
          print("Error: .env file not found in " .. env_file_path)
        end
        return variables
      end

      -- Add the env property to each existing Go configuration
      for _, config in pairs(dap.configurations.go or {}) do
        config.env = load_env_variables
      end
    end,
  },
}

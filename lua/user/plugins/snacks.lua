return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = {
      enabled = true,
      replace_netrw = true,
      layout = { position = "right" },
    },
    picker = {
      enabled = true,
      sources = { explorer = { layout = { layout = { position = "right" } } } },
    },
    input = { enabled = true },
    scope = { enabled = true },
    bigfile = { enabled = true, size = 1.5 * 1024 * 1024 },
    quickfile = { enabled = true },
    dashboard = { enabled = false },
    indent = { enabled = false },
    -- input = { enabled = false },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        -- wo = { wrap = true } -- Wrap notifications
      },
    },
  },
  keys = {
    {
      "<leader>E",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    -- {
    --   "<leader>Z",
    --   function()
    --     Snacks.zen()
    --   end,
    --   desc = "Toggle Zen Mode",
    -- },
    -- { "<leader>Z",  function() Snacks.zen.zoom() end,                desc = "Toggle Zoom", },
    -- { "<leader>.",  function() Snacks.scratch() end,                 desc = "Toggle Scratch Buffer", },
    -- { "<leader>S",  function() Snacks.scratch.select() end,          desc = "Select Scratch Buffer", },
    {
      "<leader>N",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    {
      "<leader>cR",
      function()
        Snacks.rename.rename_file()
      end,
      desc = "Rename File",
    },
    {
      "<leader>gB",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
      mode = { "n", "v" },
    },
    {
      "<leader>gb",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    -- { "<leader>gg", function() Snacks.lazygit() end,                 desc = "Lazygit", },
    {
      "<leader>gL",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    -- { "<leader>un", function() Snacks.notifier.hide() end,           desc = "Dismiss All Notifications", },
    {
      "<c-/>",
      function()
        Snacks.terminal()
      end,
      desc = "Toggle Terminal",
      mode = { "t", "n" },
    },
    {
      "<c-_>",
      function()
        Snacks.terminal()
      end,
      desc = "which_key_ignore",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    {
      "<leader>N",
      desc = "Neovim News",
      function()
        Snacks.win({
          file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
          width = 0.7,
          height = 0.7,
          wo = {
            spell = false,
            wrap = false,
            signcolumn = "yes",
            statuscolumn = " ",
            conceallevel = 3,
          },
        })
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>Us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>Uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>UL")
        Snacks.toggle.diagnostics():map("<leader>Ud")
        Snacks.toggle.line_number():map("<leader>Ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>Uc")
        Snacks.toggle.treesitter():map("<leader>UT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>Ub")
        Snacks.toggle.inlay_hints():map("<leader>Uh")
        Snacks.toggle.indent():map("<leader>Ug")
        Snacks.toggle.dim():map("<leader>UD")
      end,
    })
  end,
}

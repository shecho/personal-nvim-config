return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set(
      "n",
      "<leader>na",
      "<cmd>lua require('harpoon.mark').add_file()<cr>",
      { desc = "Mark file with harpoon" }
    )
    keymap.set("n", "<leader>nn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", { desc = "Go to next harpoon mark" })
    keymap.set(
      "n",
      "<leader>np",
      "<cmd>lua require('harpoon.ui').nav_prev()<cr>",
      { desc = "Go to previous harpoon mark" }
    )
    keymap.set(
      "n",
      "<leader>nf",
      "<cmd>lua require('harpoon.ui').nav_first()<cr>",
      { desc = "Go to first harpoon mark" }
    )
    keymap.set("n", "<leader>nl", "<cmd>lua require('harpoon.ui').nav_last()<cr>", { desc = "Go to last harpoon mark" })
    keymap.set(
      "n",
      "<leader>nr",
      "<cmd>lua require('harpoon.mark').rm_file()<cr>",
      { desc = "Remove current file from harpoon" }
    )
    keymap.set(
      "n",
      "<leader>nc",
      "<cmd>lua require('harpoon.mark').clear_all()<cr>",
      { desc = "Remove current file from harpoon" }
    )
    keymap.set(
      "n",
      "<leader>m",
      "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
      { desc = "Remove current file from harpoon", silent = true, noremap = true }
    )
    keymap.set("n", "<leader>n1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "File 1" })
    keymap.set("n", "<leader>n2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "File 2" })
    keymap.set(
      "n",
      "<leader>sm",
      "<cmd>Telescope harpoon marks theme=dropdown previewer=false winblend=15 layout_config={height=0.60,width=0.50}'",
      { desc = "File 2" }
    )
  end,
}

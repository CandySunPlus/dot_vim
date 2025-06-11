---@type LazySpec
return {
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function() require("trouble").setup() end,
    cmd = "Trouble",
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      ---@type table<string, snacks.win.Config>
      styles = {
        blame_line = {
          border = "bold",
        },
        float = {
          border = "bold",
        },
        input = {
          border = "bold",
        },
        notification = {
          border = "bold",
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },
}

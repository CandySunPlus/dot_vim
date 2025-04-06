---@type LazySpec
return {
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup()
    end,
    cmd = "Trouble",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    }
  },
  {
    'mikesmithgh/borderline.nvim',
    enabled = true,
    lazy = true,
    event = 'VeryLazy',
    config = function()
      local bl_borders = require('borderline.borders')
      require('borderline').setup({
        border = bl_borders.heavy_single
      })
    end,
  }
}

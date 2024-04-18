---@type LazySpec
return {
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
      {
        "<c-s>",
        mode = { "n", "x", "o" },
        function() require("flash").treesitter() end,
        desc =
          "Flash Treesitter"
      },
      { "r", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
          "Treesitter Search"
      }
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup()
    end,
    event = "BufRead",
  },
}

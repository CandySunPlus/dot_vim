return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "zbirenbaum/copilot-cmp",
      "zbirenbaum/copilot.lua",
    },
    opts = function(_, opts)
      local lspkind = require("lspkind")
      opts.formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          max_width = 50,
          symbol_map = { Copilot = "" },
        }),
      }
      table.insert(opts.sources, { name = "copilot", group_index = 2 })
    end,
  },
}

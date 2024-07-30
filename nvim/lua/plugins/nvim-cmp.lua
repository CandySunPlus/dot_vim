return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "Exafunction/codeium.nvim",
    },
    opts = function(_, opts)
      local lspkind = require("lspkind")
      local cmp = require('cmp')
      opts.formatting = {
        format = lspkind.cmp_format({
          mode = "symbol",
          symbol_map = { Copilot = "" },
          menu = {
            nvim_lsp = "(LSP)",
            emoji = "(Emoji)",
            path = "(Path)",
            calc = "(Calc)",
            cmp_tabnine = "(Tabnine)",
            vsnip = "(Snippet)",
            luasnip = "(Snippet)",
            buffer = "(Buffer)",
            tmux = "(TMUX)",
            copilot = "(Copilot)",
            treesitter = "(TreeSitter)",
          },
        }),
      }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 750 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
        { name = "codeium",  priority = 700 },
      })
    end,
  },
}

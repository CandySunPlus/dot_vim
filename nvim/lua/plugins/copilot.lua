return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = {
      "onsails/lspkind.nvim",
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
      completion = {
        menu = {
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  return require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                    SymbolMap = {
                      Copilot = "",
                    },
                  })
                end,
              },
            },
          },
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
          },
        },
      },
    },
  },
}

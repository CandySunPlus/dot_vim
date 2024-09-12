---@type LazySpec
return {
  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    event = "BufRead package.json",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "ts_ls" })
    end,
  },
  {
    ---@type AstroLSPOpts
    "AstroNvim/astrolsp",
    optional = true,
    ---@diagnostic disable: missing-fields
    opts = {
      features = {
        codelens = true,
        inlay_hints = true,
        semantic_tokens = true
      },
      formatting = {
        filter = function()
          return true
        end,
      },
      config = {
        ts_ls = {
          init_options = {
            preferences = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            }
          }
        }
      },
    },
  },
}

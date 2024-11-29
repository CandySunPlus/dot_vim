local function is_visible(cmp) return cmp.core.view:visible() or vim.fn.pumvisible() == 1 end

---@type LazySpec
return {
  { "folke/lsp-colors.nvim", event = "BufRead" },
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "VidocqH/lsp-lens.nvim",
    event = "BufRead",
    opts = {
      enable = false,
      include_declaration = true,
      sections = {
        definition = false,
        references = true,
        implementation = false,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-P>"] = cmp.mapping(function()
          if is_visible(cmp) then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.complete()
          end
        end),
        ["<C-N>"] = cmp.mapping(function()
          if is_visible(cmp) then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.complete()
          end
        end),
      })
    end,
  }
}

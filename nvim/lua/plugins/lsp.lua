---@type LazySpec
return {
  { "folke/lsp-colors.nvim", event = "BufRead" },
  -- {
  --   "j-hui/fidget.nvim",
  --   branch = "legacy",
  --   config = function() require("fidget").setup {} end,
  -- },
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
}

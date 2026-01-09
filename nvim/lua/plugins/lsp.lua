---@type LazySpec
return {
  { "folke/lsp-colors.nvim", event = "BufRead" },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function() require("crates").setup() end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
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

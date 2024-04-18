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
      include_declaration = true,
      sections = {
        definition = false,
        references = true,
        implementation = false,
      },
    },
  },
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
}

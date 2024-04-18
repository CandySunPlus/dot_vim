return {
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local cmp = require("cmp")
      require("crates").setup({
        src = {
          cmp = {
            enabled = true,
          },
        },
      })
    end,
  },
}

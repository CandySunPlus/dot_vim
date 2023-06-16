local M = {}

M.config = function()
  local formatters = require "lvim.lsp.null-ls.formatters"
  local linters = require "lvim.lsp.null-ls.linters"

  formatters.setup {
    {
      command = "beautysh",
      extra_args = { "--indent-size", "2" },
    },
    { command = "clang-format" }
  }

  linters.setup {
    {
      command = "shellcheck",
    },
    {
      command = "misspell"
    }
  }
end

return M

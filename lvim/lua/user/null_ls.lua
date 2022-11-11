local M = {}

M.config = function()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    {
      command = "beautysh",
      extra_args = { "--indent-size", "2" },
    },
  }

  local linters = require "lvim.lsp.null-ls.linters"

  linters.setup {
    {
      command = "shellcheck",
    },
  }

end

return M

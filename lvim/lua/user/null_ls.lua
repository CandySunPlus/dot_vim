local M = {}

M.config = function()
  local formatters = require "lvim.lsp.null-ls.formatters"

  formatters.setup {
    { command = "beautysh", filetypes = { "sh" } },
  }

end

return M

local M = {}

M.config = function()
  local null_ls = require('null-ls')
  local cmp = require('cmp')

  require('crates').setup {
    src = {
      cmp = {
        enabled = true
      }
    }
  }
end

return M

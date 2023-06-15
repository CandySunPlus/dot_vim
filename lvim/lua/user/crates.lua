local M = {}

M.config = function()
  local null_ls = require('null-ls')
  local cmp = require('cmp')

  require('crates').setup {
    null_ls = {
      enabled = true,
      name = "crates.nvim"
    }
  }

  cmp.setup.filetype('toml', {
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "crates" },
      { name = "path" },
    }, {
      { name = "buffer" }
    })
  })
end

return M

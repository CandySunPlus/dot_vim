local M = {}
M.config = function()

  local codelldb_path = vim.fn.stdpath "data" .. "/mason/bin/codelldb"
  local liblldb_path = '/usr/lib/liblldb.so'

  local opts = {
    dap = {
      adapter = require(
        'rust-tools.dap'
      ).get_codelldb_adapter(codelldb_path, liblldb_path)
    },
    tools = {
      executor = require("rust-tools/executors").termopen,
      autoSetHints = true,
      inlay_hints = {
        only_current_line = false,
        show_parameter_hints = true,
        parameter_hints_prefix = "<- ",
        other_hints_prefix = "=> ",
        max_len_align = false,
        max_len_align_padding = 1,
        right_align = false,
        right_align_padding = 7,
        highlight = "Comment",
      },
      runnables = {
        use_telescope = true
      },
      hover_actions = {
        border = {
          { "╭", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╮", "FloatBorder" },
          { "│", "FloatBorder" },
          { "╯", "FloatBorder" },
          { "─", "FloatBorder" },
          { "╰", "FloatBorder" },
          { "│", "FloatBorder" },
        },
      },
    },
    server = {
      cmd = { vim.fn.stdpath "data" .. "/mason/bin/rust-analyzer" },
      on_attach = require("lvim.lsp").common_on_attach,
      on_init = require("lvim.lsp").common_on_init,
    },
  }

  require("rust-tools").setup(opts)
end

return M

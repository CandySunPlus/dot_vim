local M = {}
M.config = function()

  local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.7.0/'
  local codelldb_path = extension_path .. 'adapter/codelldb'
  local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

  local status_ok, rust_tools = pcall(require, "rust-tools")
  if not status_ok then
    return
  end

  local lsp_installer_servers = require "nvim-lsp-installer.servers"
  local _, requested_server = lsp_installer_servers.get_server("rust_analyzer")

  local opts = {
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    },
    tools = {
      autoSetHints = true,
      hover_with_actions = true,
      runnables = {
        use_telescope = true,
      },
      -- how to execute terminal commands
		  -- options right now: termopen / quickfix
  		executor = require("rust-tools/executors").termopen,
	  	-- callback to execute once rust-analyzer is done initializing the workspace
		  -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
		  on_initialized = nil,
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
      standalone = true,
      cmd = requested_server._default_options.cmd,
      on_attach = require("lvim.lsp").common_on_attach,
      on_init = require("lvim.lsp").common_on_init,
    },
  }
  rust_tools.setup(opts)
end

return M

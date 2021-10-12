local M = {}

M.config = function(lualine)
  local config = lualine.get_config()
  -- local conditions = require "core.lualine.conditions"
  local lsp_status_component = {
    function ()
      local lsp_status = require "lsp-status"
      lsp_status.config({
        status_symbol = '',
        indicator_separator = '',
        component_separator = '',
        diagnostics = false
      })
      lsp_status.register_progress()
      return lsp_status.status()
    end,
    icon = '',
    -- cond = conditions.hide_in_width
  }
  table.insert(config.sections.lualine_c, lsp_status_component)
  lualine.setup(config)
end

return M


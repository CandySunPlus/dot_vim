local M = {}

M.config = function()
  local cfg = {
    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = false, -- virtual hint enable
    hint_prefix = " ", -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = false, -- set to true if you want to use lspsaga popup
    hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
    handler_opts = {
      border = "rounded", -- double, single, shadow, none
    },
  }
  require("lsp_signature").setup(cfg)
end

return M

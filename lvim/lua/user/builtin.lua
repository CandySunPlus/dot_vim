local M = {}

M.config = function ()
  lvim.builtin.dashboard.active = true
  lvim.builtin.terminal.active = true
  lvim.builtin.nvimtree.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 0

  -- if you don't want all the parsers change this to a table of the ones you want
  lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.indent.enable = true
  lvim.builtin.treesitter.context_commentstring.enable = true

  lvim.builtin.dap.active = false
  lvim.builtin.terminal.active = true
  lvim.builtin.nvimtree.auto_open = 0

  if lvim.builtin.dap.active then
    require("user.dap").config()
  end

  if lvim.builtin.lualine.active then
    lvim.builtin.lualine.on_config_done = function (lualine)
      require("user.lualine").config(lualine)
    end
  end
end

return M

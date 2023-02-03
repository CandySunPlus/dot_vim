local M = {}

M.gitui_toggle = function()
  local Terminal = require("toggleterm.terminal").Terminal
  local gitui = Terminal:new {
    cmd = "gitui",
    hidden = true,
    direction = "float",
    float_opts = {
      border = "none",
      width = 100000,
      height = 100000,
    },
    on_open = function(_)
      vim.cmd "startinsert!"
    end,
    on_close = function(_) end,
    count = 99,
  }

  gitui:toggle()
end

return M

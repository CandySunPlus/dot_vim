local M = {}

M.config = function()
  lvim.autocommands = {
    {
      "BufWinEnter",
      {
        pattern = { "*" },
        command = "silent! loadview"
      }
    },
    {
      "BufWinEnter",
      {
        pattern = { "*.nasm" },
        command = "silent! set ft=nasm"
      }
    },
    {
      "BufLeave",
      {
        pattern = { "*" },
        command = "silent! mkview"
      }
    }
  }
end

return M

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
      "BufWinEnter",
      {
        pattern = { "*.wxml" },
        command = "silent! set ft=html"
      }
    },
    {
      "BufWinEnter",
      {
        pattern = { "*.wxss" },
        command = "silent! set ft=css"
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

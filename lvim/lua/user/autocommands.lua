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
      "BufLeave",
      {
        pattern = { "*" },
        command = "silent! mkview"
      }
    }
  }
end

return M

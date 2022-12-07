local M = {}

M.config = function()
  local status_ok, diffview = pcall(require, "diffview")
  if not status_ok then
    return
  end
  diffview.setup({
    view = {
      default = {
        layout = "diff2_horizontal"
      },
      merge_tool = {
        layout = "diff3_mixed",
        disable_diagnostics = true
      },
      file_history = {
        layout = "diff2_horizontal"
      },
    }
  })
end

return M

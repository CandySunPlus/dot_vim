local M = {}

M.config = function()
  local status_ok, chatgpt = pcall(require, "chatgpt")
  if not status_ok then
    return
  end
  chatgpt.setup({
    loading_text = "Loading...",
    keymaps = {
      submit = "<C-o>"
    }
  })
end

return M

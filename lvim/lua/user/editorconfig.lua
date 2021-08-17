local M = {}

M.config = function()
  vim.g.EditorConfig_exclude_patterns = {
    'fugitive://.*',
    'scp://.*'
  }
end

return M

local M = {}

M.config = function()
  vim.g.EditorConfig_exclude_patterns = {
    'fugitive://.*',
    'scp://.*'
  }
  vim.g.EditorConfig_verbose = true
end

return M

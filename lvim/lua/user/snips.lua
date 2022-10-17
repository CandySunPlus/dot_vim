local M = {};

M.config = function()
  require 'luasnip'.filetype_extend("objcpp", { "objc" })
end

return M

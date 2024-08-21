---@type LazySpec
return {
  "L3MON4D3/LuaSnip",
  config = function(plugin, opts)
    require("astronvim.plugins.configs.luasnip")(plugin, opts)
    require("luasnip").filetype_extend("cpp", { "c" })
  end
}

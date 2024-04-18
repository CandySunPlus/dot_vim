---@type LazySpec
return {
  {
    "xiyaowong/nvim-transparent",
    config = function()
      local status_ok, transparent = pcall(require, "transparent")
      if not status_ok then
        return
      end
      transparent.setup({
        extra_groups = { -- table/string: additional groups that should be cleared
          -- In particular, when you set it to 'all', that means all available groups
          "NvimTreeNormal",
          "LspInlayHint",
          "FidgetTitle",
          "FidgetTask",
          "NormalFloat"
        },
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end
  },
}

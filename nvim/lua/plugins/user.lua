---@type LazySpec
return {
  {
    'folke/noice.nvim',
    opts = {
      lsp = {
        progress = {
          enabled = false
        },
        hover = {
          enabled = false
        },
        signature = {
          enabled = false
        }
      },
      presets = {
        bottom_search = false,
        command_palette = false
      }
    }
  }
}

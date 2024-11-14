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
  },
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_output_win_max_height = 12
      vim.g.molten_auto_open_output = false
      -- vim.g.molten_virt_lines_off_by_1 = true
      vim.g.molten_output_virt_lines = true
      vim.g.molten_virt_text_output = true
      vim.g.molten_output_show_more = true
    end,
  },
}

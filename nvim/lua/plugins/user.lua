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
    "yetone/avante.nvim",
    event = "VeryLazy",
    opts = {
      provider = "openai",
      openai = {
        endpoint = "https://api.moonshot.cn/v1",
        model = "moonshot-v1-8k",
        temperature = 0.3,
        max_tokens = 8192
      }
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    }
  }
}

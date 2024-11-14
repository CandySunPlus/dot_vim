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
    lazy = false,
    version = false,
    build = "make",
    opts = {
      provider = "openai",
      openai = {
        -- endpoint = "http://127.0.0.1:1234/v1",
        -- model = "hermes-3-llama-3.1-8b",
        -- model = "yu-coder-9b-chat",
        endpoint = "https://api.moonshot.cn/v1",
        model = "moonshot-v1-8k",
        temperature = 0.3,
        max_tokens = 4096
      }
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "zbirenbaum/copilot.lua",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to setup it properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
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

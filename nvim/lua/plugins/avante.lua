return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  -- version = false,
  build = "make",
  opts = {
    provider = "openai",
    openai = {
      endpoint = "https://api.mistral.ai/v1",
      model = "ministral-8b-latest",
      -- ['local'] = true,
      -- endpoint = "http://127.0.0.1:8080/v1",
      -- model = "hermes3",
      temperature = 0.2,
      max_tokens = 4096
    },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
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
}

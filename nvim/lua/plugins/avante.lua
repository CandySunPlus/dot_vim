return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",
  opts = {
    provider = "kimi",
    providers = {
      kimi = {
        __inherited_from = "openai",
        endpoint = "https://api.moonshot.cn/v1",
        model = "kimi-k2-0905-preview",
        api_key_name = "KIMI_API_KEY",
        extra_request_body = {
          temperature = 0.2,
        },
      },
      aihubmix = {
        __inherited_from = "openai",
        endpoint = "https://aihubmix.com/v1",
        api_key_name = "AIHUBMIX_API_KEY",
        model = "zai-glm-4.6",
        extra_request_body = {
          temperature = 0.2,
        },
      },
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        api_key_name = "OPENROUTER_API_KEY",
        model = "z-ai/glm-4.6",
        extra_request_body = {
          temperature = 0.2,
        },
      },
      friday = {
        __inherited_from = "openai",
        endpoint = "https://aigc.sankuai.com/v1/openai/native",
        model = "anthropic.claude-4-sonnet",
        api_key_name = "FRIDAY_API_KEY",
        extra_request_body = {
          max_tokens = 4096,
          temperature = 0.2,
        },
      },
    },
    file_selector = {
      --- @alias FileSelectorProvider "native" | "fzf" | "telescope" | string
      provider = "snacks",
      -- Options override for custom providers
      provider_opts = {},
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
    -- {
    --   -- Make sure to setup it properly if you have lazy=true
    --   'MeanderingProgrammer/render-markdown.nvim',
    --   opts = {
    --     file_types = { "markdown", "Avante" },
    --   },
    --   ft = { "markdown", "Avante" },
    -- },
  },
}

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  build = "make",
  opts = {
    provider = "aihubmix",
    cursor_applying_provider = "kimi",
    behaviour = {
      --- ... existing behaviours
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
    },
    providers = {
      kimi = {
        __inherited_from = "openai",
        endpoint = "https://api.moonshot.cn/v1",
        model = "kimi-latest",
        api_key_name = "KIMI_API_KEY",
        extra_request_body = {
          max_completion_tokens = 32768,
          temperature = 0.2
        }
      },
      aihubmix = {
        __inherited_from = "openai",
        endpoint = "https://aihubmix.com/v1",
        api_key_name = "AIHUBMIX_API_KEY",
        model = "gpt-4.1-mini",
        extra_request_body = {
          temperature = 0.2,
        }
      },
      friday = {
        __inherited_from = "openai",
        endpoint = "https://aigc.sankuai.com/v1/openai/native",
        model = "anthropic.claude-3.5-sonnet",
        api_key_name = "FRIDAY_API_KEY",
        extra_request_body = {
          max_tokens = 4096,
          temperature = 0.2
        }
      },
      siliconflow_qwen3_8b = {
        __inherited_from = "openai",
        endpoint = "https://api.siliconflow.cn/v1",
        model = "Qwen/Qwen3-8B",
        api_key_name = "SILICONFLOW_API_KEY",
        extra_request_body = {
          max_completion_tokens = 32768,
          temperature = 0
        }
      },
      siliconflow_qwen3_32b = {
        __inherited_from = "openai",
        endpoint = "https://api.siliconflow.cn/v1",
        model = "Qwen/Qwen3-32B",
        api_key_name = "SILICONFLOW_API_KEY",
        extra_request_body = {
          temperature = 0,
        }
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

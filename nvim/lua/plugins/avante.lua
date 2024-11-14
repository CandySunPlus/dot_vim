Parse_curl_args_func = function(opts, code_opts)
  return {
    url = opts.endpoint .. "/chat/completions",
    headers = {
      ["Accept"] = "application/json",
      ["Content-Type"] = "application/json",
    },
    body = {
      model = opts.model,
      messages = require("avante.providers").copilot.parse_messages(code_opts), -- you can make your own message, but this is very advanced
      max_tokens = 2048,
      stream = true,
    },
  }
end

Parse_response_data_func = function(data_stream, event_state, opts)
  require("avante.providers").openai.parse_response(data_stream, event_state, opts)
end


local create_ollama_config = function(host, model)
  local url = string.format("http://%s:11434/v1", host)
  return {
    ["local"] = true,
    endpoint = url,
    model = model,
    parse_curl_args = Parse_curl_args_func,
    parse_response_data = Parse_response_data_func,
  }
end

return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  -- version = false,
  build = "make",
  opts = {
    provider = "openai",
    openai = {
      ['local'] = true,
      -- endpoint = "https://api.moonshot.cn/v1",
      -- model = "moonshot-v1-8k",
      endpoint = "http://127.0.0.1:8080/v1",
      model = "hermes3",
      temperature = 0.3,
      max_tokens = 4096
    },
    vendors = {
      ollama = create_ollama_config("127.0.0.1", "hermes3:8b"),
    }
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

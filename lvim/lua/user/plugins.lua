local M = {}

M.config = function()
  lvim.plugins = {
    { "folke/lsp-colors.nvim", event = "BufRead" },
    {
      "xiyaowong/nvim-transparent",
      config = function()
        require("user.transparent").config()
      end
    },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
      event = "BufRead"
    },
    -- {
    --   "andymass/vim-matchup",
    --   event = "CursorMoved",
    --   config = function()
    --     vim.g.matchup_matchparen_offscreen = { method = "popup" }
    --   end,
    -- },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      opts = {
        modes = {
          search = {
            enabled = false,
          },
        },
      },
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
        {
          "<c-s>",
          mode = { "n", "x", "o" },
          function() require("flash").treesitter() end,
          desc =
          "Flash Treesitter"
        },
        { "r", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
        {
          "R",
          mode = { "o", "x" },
          function() require("flash").treesitter_search() end,
          desc =
          "Treesitter Search"
        }
      },
    },
    {
      "folke/todo-comments.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup()
      end,
      event = "BufRead",
    },
    {
      "j-hui/fidget.nvim",
      branch = "legacy",
      config = function()
        require("fidget").setup {}
      end,
    },
    {
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup()
      end,
    },
    {
      "onsails/lspkind.nvim",
    },
    {
      'VidocqH/lsp-lens.nvim',
      event = "BufRead",
      opts = {
        include_declaration = true,
        sections = {
          definition = false,
          references = true,
          implementation = false

        }
      }
    },
    {
      "hedyhli/outline.nvim",
      lazy = true,
      cmd = "Outline",
      config = function()
        require("outline").setup({
          symbols = {
            icon_source = "lspkind",
            icons = {
              Object = { icon = '', hl = 'Type' }
            }
          }
        })
      end
    },
    {
      "sindrets/diffview.nvim",
      dependencies = 'nvim-lua/plenary.nvim',
      config = function()
        require("user/diffview").config()
      end
    },
    {
      "folke/trouble.nvim",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    },
    {
      "stevearc/dressing.nvim",
      config = function()
        require("user/dressing").config()
      end
    },
    {
      "ray-x/lsp_signature.nvim",
      config = function()
        require("user/lsp_sign").config()
      end,
      event = "InsertEnter"
    },
    {
      'saecki/crates.nvim',
      event = { "BufRead Cargo.toml" },
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('user/crates').config()
      end
    },
    {
      'akinsho/git-conflict.nvim',
      version = "*",
      config = function()
        require('git-conflict').setup()
      end
    },
    {
      'tpope/vim-fugitive'
    },
    {
      'zbirenbaum/copilot.lua',
      cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require('copilot').setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
        })
      end
    },
    {
      'zbirenbaum/copilot-cmp',
      config = function()
        require("copilot_cmp").setup()
      end
    },
    {
      'nvim-telescope/telescope-dap.nvim',
      config = function()
        require("telescope").load_extension('dap')
      end,
      dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-telescope/telescope.nvim'
      }
    },
    {
      'stevearc/oil.nvim',
      opts = {},
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require('oil').setup()
      end
    },
    { 'catppuccin/nvim',       name = 'catppuccin', priority = 1000 },
    { 'simonefranza/nvim-conv' }
  }
end
return M

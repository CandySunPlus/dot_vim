local M = {}

M.config = function()
  lvim.plugins = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
      config = function()
        require('user.treesitter').config()
      end,
      dependencies = {
        'nvim-treesitter/nvim-treesitter'
      }
    },
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
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
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
      "nvim-pack/nvim-spectre",
      event = "BufRead",
      config = function()
        require("spectre").setup()
      end,
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
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
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      config = function()
        require("symbols-outline").setup()
      end,
    },
    {
      "sindrets/diffview.nvim",
      dependencies = 'nvim-lua/plenary.nvim',
      config = function()
        require("user/diffview").config()
      end
    },
    {
      "lvimuser/lsp-inlayhints.nvim",
      config = function()
        require("user/lsp_inlayhints").config()
      end,
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
      "jackMort/ChatGPT.nvim",
      config = function()
        require("user/chatgpt").config()
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
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
    {
      'shaunsingh/nord.nvim'
    }
  }
end
return M

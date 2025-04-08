-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
        showbreak = " ↳  ",
        laststatus = 3,
        guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        editorconfig = true,
        python3_host_prog = "~/.pyglobal/.venv/bin/python3",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      x = {
        ["gr"] = false,
        ["gra"] = false,
      },
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["gr"] = false,
        ["gra"] = false,
        ["grn"] = false,
        ["grr"] = false,
        ["gri"] = false,

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader>e"] = false,
        ["<Leader>k"] = { ":Neotree toggle<cr>", silent = true, desc = "Toggle Explorer" },
        ["<Leader>lS"] = false,
        ["<Leader>mi"] = { ":MoltenInit<cr>", silent = true, desc = "Initialize the plugin" },
        ["<Leader>mr"] = { ":MoltenEvaluateOperator<cr>", silent = true, desc = "Run operator selection" },
        ["<Leader>md"] = { ":MoltenDelete<cr>", silent = true, desc = "Delete evaluate cell" },
        ["<Leader>ml"] = { ":MoltenEvaluateLine<cr>", silent = true, desc = "Evaluate line" },
        ["<Leader>mo"] = { ":noautocmd MoltenEnterOutput<cr>", silent = true, desc = "Show or enter output" },
        ["<Leader>mc"] = { ":MoltenReevaluateCell<cr>", silent = true, desc = "Re-evaluate cell" },
        ["<Leader>gg"] = { function() require("snacks").lazygit() end, silent = true, desc = "Lazygit" },
      },
      v = {
        ["<Leader>mr"] = { ":<C-u>MoltenEvaluateVisual<cr>gv", silent = true, desc = "Run visual selection" },
      },
    },
  },
}

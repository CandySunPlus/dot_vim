-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = {                  -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true,         -- sets vim.opt.number
        spell = false,         -- sets vim.opt.spell
        signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
        wrap = true,           -- sets vim.opt.wrap
        showbreak = " ↳  ",
        guicursor =
        "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        editorconfig = true,
        python3_host_prog = '~/.pyenv/versions/neovim/bin/python3'
      },
    },
    rooter = {
      notify = true,
      detector = {
        "lsp",                                                 -- highest priority is getting workspace from running language servers
        { ".git", "_darcs",   ".hg",         ".bzr", ".svn" }, -- next check for a version controlled parent directory
        { "lua",  "MakeFile", "package.json" },                -- lastly check for known project root files
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map
        ["<Leader>e"] = false,
        ["<Leader>k"] = { ":Neotree toggle<cr>", silent = true, desc = "Toggle Explorer" },
        ["<Leader>P"] = { ":Telescope projects<cr>", silent = true, desc = "Project" },
        ["<Leader>lS"] = false,
        ["<Leader>mi"] = { ":MoltenInit<cr>", silent = true, desc = "Initialize the plugin" },
        ["<Leader>mr"] = { ":MoltenEvaluateOperator<cr>", silent = true, desc = "Run operator selection" },
        ["<Leader>md"] = { ":MoltenDelete<cr>", silent = true, desc = "Delete evaluate cell" },
        ["<Leader>ml"] = { ":MoltenEvaluateLine<cr>", silent = true, desc = "Evaluate line" },
        ["<Leader>mo"] = { ":noautocmd MoltenEnterOutput<cr>", silent = true, desc = "Show or enter output" },
        ["<Leader>mc"] = { ":MoltenReevaluateCell<cr>", silent = true, desc = "Re-evaluate cell" },
      },
      v = {
        ["<Leader>mr"] = { ":<C-u>MoltenEvaluateVisual<cr>gv", silent = true, desc = "Run visual selection" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}

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
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
        editorconfig = true,
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
        ["<Leader>k"] = { ":Neotree toggle<cr>", desc = "Toggle Explorer" },
        ["<Leader>P"] = { ":Telescope projects<cr>", desc = "Project" },
        ["<Leader>lS"] = false,
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}

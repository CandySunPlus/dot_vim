-- AstroLSP allows you to customize the features in AstroNvim's LSP configuration engine
-- Configuration documentation can be found with `:h astrolsp`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    -- Configuration table of features provided by AstroLSP
    features = {
      autoformat = true,      -- enable or disable auto formatting on start
      codelens = true,        -- enable/disable codelens refresh on start
      inlay_hints = true,     -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
    },
    config = {
      clangd = {
        settings = {},
        cmd = { "clangd", "--fallback-style=none" },
        root_dir = require("lspconfig.util").root_pattern(
          ".nlsp-settings",
          "compile_commands.json",
          "compile_flags.txt",
          ".git"
        ),
      },
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          "lua",
          "rust",
          "toml",
          "css",
          "less",
          "scss",
          "typescript",
          "typescriptreact",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
        "tsserver",
        "jsonls",
        "biome"
      },
      timeout_ms = 5000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
    mappings = {
      n = {
        ["gd"] = { ":Telescope lsp_definitions<cr>", desc = "Show the definition of current symbol", cond = "textDocument/definition", silent = true },
        ["gr"] = { ":Telescope lsp_references<cr>", desc = "Search referneces", cond = "textDocument/referneces", silent = true },
        ["gI"] = { ":Telescope lsp_implementations<cr>", desc = "Implementation of current symbol", cond = "textDocument/implementation", silent = true },
        ["gy"] = { ":Telescope lsp_type_definitions<cr>", desc = "Definition of current type", cond = "textDocument/typeDefinition", silent = true },
        ["<Leader>lh"] = { ":lua vim.lsp.buf.hover()<cr>", desc = "Show hover", silent = true },
        ["<Leader>lu"] = { ":lua vim.lsp.buf.signature_help()<cr>", desc = "Show hover", silent = true },
        ["<Leader>lo"] = { ":AerialToggle<cr>", desc = "Symbol outline", silent = true },
        ["<Leader>lt"] = { ":Trouble diagnostics<cr>", desc = "Trouble diagnostics", silent = true },
        ["<Leader>lj"] = { ":lua vim.diagnostic.goto_next()<cr>", desc = "Next diagnostics", silent = true },
        ["<Leader>lk"] = { ":lua vim.diagnostics.goto_prev()<cr>", desc = "Prev diagnostics", silent = true },
        ["<Leader>lR"] = { ":Telescope lsp_references<cr>", desc = "Search referneces", cond = "textDocument/referneces", silent = true },
        ["<Leader>lG"] = { ":Telescope lsp_workspace_symbols<cr>", desc = "Search workspace symbols", cond = "textDocument/symbol", silent = true },
      },
    },
  },
}

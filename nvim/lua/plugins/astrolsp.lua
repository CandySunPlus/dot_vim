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
      autoformat = true, -- enable or disable auto formatting on start
      codelens = true, -- enable/disable codelens refresh on start
      inlay_hints = true, -- enable/disable inlay hints on start
      semantic_tokens = true, -- enable/disable semantic token highlighting
      signature_help = false,
    },
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
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
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        "lua_ls",
        "ts_ls",
        "tsserver",
        "jsonls",
        "biome",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      -- clangd = { capabilities = { offsetEncoding = "utf-8" } },
    },
    -- customize how language servers are attached
    handlers = {
      -- a function without a key is simply the default handler, functions take two parameters, the server name and the configured options table for that server
      -- function(server, opts) require("lspconfig")[server].setup(opts) end

      -- the key is the server that is being setup with `lspconfig`
      -- rust_analyzer = false, -- setting a handler to false will disable the set up of that language server
      -- pyright = function(_, opts) require("lspconfig").pyright.setup(opts) end -- or a custom handler function can be passed
    },
    -- Configure buffer local auto commands to add when attaching a language server
    autocmds = {
      -- first key is the `augroup` to add the auto commands to (:h augroup)
      lsp_codelens_refresh = {
        -- Optional condition to create/delete auto command group
        -- can either be a string of a client capability or a function of `fun(client, bufnr): boolean`
        -- condition will be resolved for each client on each execution and if it ever fails for all clients,
        -- the auto commands will be deleted for that buffer
        cond = "textDocument/codeLens",
        -- cond = function(client, bufnr) return client.name == "lua_ls" end,
        -- list of auto commands to set
        {
          -- events to trigger
          event = { "InsertLeave", "BufEnter" },
          -- the rest of the autocmd options (:h nvim_create_autocmd)
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    -- mappings to be set up on attaching of a language server
    mappings = {
      n = {
        -- a `cond` key can provided as the string of a server capability to be required to attach, or a function with `client` and `bufnr` parameters from the `on_attach` that returns a boolean
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
        ["gd"] = {
          function() require("snacks").picker.lsp_definitions() end,
          desc = "Show the definition of current symbol",
          cond = "textDocument/definition",
          silent = true,
        },
        ["gI"] = {
          function() require("snacks").picker.lsp_implementations() end,
          desc = "Implementation of current symbol",
          cond = "textDocument/implementation",
          silent = true,
        },
        ["gR"] = {
          function() require("snacks").picker.lsp_references() end,
          desc = "Search referneces",
          cond = "textDocument/referneces",
          silent = true,
        },
        ["gy"] = {
          function() require("snacks").picker.lsp_type_definitions() end,
          desc = "Definition of current type",
          cond = "textDocument/typeDefinition",
          silent = true,
        },
        ["<Leader>lD"] = {
          function() require("snacks").picker.lsp_declarations() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
          silent = true,
        },
        ["<Leader>lh"] = { ":lua vim.lsp.buf.hover()<cr>", desc = "Show hover", silent = true },
        ["<Leader>lu"] = { ":lua vim.lsp.buf.signature_help()<cr>", desc = "Show hover", silent = true },
        ["<Leader>lo"] = { function() require("aerial").toggle() end, desc = "Symbol outline", silent = true },
        ["<Leader>lt"] = { ":Trouble diagnostics<cr>", desc = "Trouble diagnostics", silent = true },
        ["<Leader>lj"] = { ":lua vim.diagnostic.goto_next()<cr>", desc = "Next diagnostics", silent = true },
        ["<Leader>lk"] = { ":lua vim.diagnostics.goto_prev()<cr>", desc = "Prev diagnostics", silent = true },
        ["<Leader>lR"] = {
          function() require("snacks").picker.lsp_references() end,
          desc = "Search referneces",
          cond = "textDocument/referneces",
          silent = true,
        },
        ["<Leader>lG"] = {
          function() require("snacks").picker.lsp_workspace_symbols() end,
          desc = "Search workspace symbols",
          cond = "textDocument/symbol",
          silent = true,
        },
      },
    },
    -- A custom `on_attach` function to be run after the default `on_attach` function
    -- takes two parameters `client` and `bufnr`  (`:h lspconfig-setup`)
    on_attach = function(client, bufnr)
      -- this would disable semanticTokensProvider for all clients
      -- client.server_capabilities.semanticTokensProvider = nil
    end,
  },
}

-- Customize None-ls sources

---@type LazySpec
return {
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, config)
      -- config variable is the default configuration table for the setup function call
      local null_ls = require("null-ls")
      --
      -- Check supported formatters and linters
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettierd,
        -- null_ls.builtins.formatting.codespell,
        -- null_ls.builtins.formatting.shfmt,
      }
      return config -- return final config table
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = {
        'biome',
        'prettierd',
        'shfmt'
      }
      if not opts.handlers then
        opts.handlers = {}
      end
      opts.handlers = {
        function() end,
        prettierd = function()
          local null_ls = require('null-ls');
          null_ls.register(null_ls.builtins.formatting.prettierd.with({
            condition = function(utils)
              return not utils.root_has_file('biome.json')
            end,
          }))
        end,
        biome = function(source_name, methods)
          local null_ls = require('null-ls');
          null_ls.register(null_ls.builtins.formatting.biome.with({
            args = {
              'check',
              '--fix',
              '--indent-style=space',
              '--formatter-enabled=true',
              '--organize-imports-enabled=true',
              '--linter-enabled=true',
              '--stdin-file-path',
              '$FILENAME',
            },
            to_stdin = true,
            condition = function(utils)
              return utils.root_has_file('biome.json')
            end,
          }))
        end,
        shfmt = function(source_name, methods)
          -- custom logic
          require("mason-null-ls").default_setup(source_name, methods) -- to maintain default behavior
        end,
      }
    end,
  },
}

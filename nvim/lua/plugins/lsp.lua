local function is_visible(cmp) return cmp.core.view:visible() or vim.fn.pumvisible() == 1 end
local function has_words_before()
  local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

---@type LazySpec
return {
  { "folke/lsp-colors.nvim", event = "BufRead" },
  {
    "j-hui/fidget.nvim",
    branch = "legacy",
    config = function()
      require("fidget").setup({})
    end,
  },
  {
    "VidocqH/lsp-lens.nvim",
    event = "BufRead",
    opts = {
      enable = false,
      include_declaration = true,
      sections = {
        definition = false,
        references = true,
        implementation = false,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-P>"] = cmp.mapping(function()
          if is_visible(cmp) then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.complete()
          end
        end),
        ["<C-N>"] = cmp.mapping(function()
          if is_visible(cmp) then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            cmp.complete()
          end
        end),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if is_visible(cmp) then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif vim.api.nvim_get_mode().mode ~= "c" and vim.snippet and vim.snippet.active { direction = 1 } then
            vim.schedule(function() vim.snippet.jump(1) end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if is_visible(cmp) then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          elseif vim.api.nvim_get_mode().mode ~= "c" and vim.snippet and vim.snippet.active { direction = -1 } then
            vim.schedule(function() vim.snippet.jump(-1) end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  }
}

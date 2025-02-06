-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "c",
      "cpp",
      "rust",
      "python",
      "toml",
      "yaml",
      "json",
      "typescript",
      "javascript",
      "bash",
      "cmake",
      "make",
      "comment",
      "dockerfile",
      "html",
      "css",
      -- add more arguments for adding more treesitter parsers
    },
  },
}

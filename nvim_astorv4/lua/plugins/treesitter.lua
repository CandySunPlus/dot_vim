-- Customize Treesitter

---@type LazySpec
return {
  {
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
  },
  {
    "kevinhwang91/nvim-ufo",
    version = "",
    commit = "81f5ffa6e8ba27c48403cf681d4b383d924e03e4",
    branch = "main",
  }
}

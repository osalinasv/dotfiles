return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "c",
        "c_sharp",
        "cpp",
        "css",
        "diff",
        "gitcommit",
        "html",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
      },
      highlight = {
        enabled = true,
        disable = function(_, buf)
          local max_filesize = 10000 * 1024
          local ok, stats =
            pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

          if ok and stats and stats.size > max_filesize then
            vim.notify("Treesitter disabled for large file")
            return true
          end
        end,
      },
    },
  },
}

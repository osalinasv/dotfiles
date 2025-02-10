return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        mappings = {
          ["<Tab>"] = "toggle_node",
        },
      },
      filesystem = {
        use_libuv_file_watcher = false,
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
          },
          never_show = {
            ".git",
          },
        },
      },
    },
  },
}

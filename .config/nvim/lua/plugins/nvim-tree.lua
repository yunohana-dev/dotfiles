return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    vim.g.loaded_netrw       = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort_by = "case_sensitive",

      view = {
        width = 30,
        side  = "left",
      },

      renderer = {
        group_empty        = true,
        root_folder_label  = ":~:s?$?/..?",
        icons              = {
          git_placement = "signcolumn",
          show = {
            file         = true,
            folder       = true,
            folder_arrow = true,
            git          = true,
            modified     = true,
          },
        },
        highlight_git      = false,
        highlight_modified = "name",
      },

      filters = {
        dotfiles = false,
        custom   = { "^.git$" },
      },

      git = {
        enable  = true,
        ignore  = false,
        timeout = 500,
      },

      modified = {
        enable = true,
      },

      update_focused_file = {
        enable      = true,
        update_root = false,
      },

      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },

      hijack_cursor = true,

      on_attach = function(bufnr)
        local api  = require("nvim-tree.api")
        local opts = { buffer = bufnr, silent = true, nowait = true }

        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.del("n", "r",    { buffer = bufnr })
        vim.keymap.set("n", "<F2>", api.fs.rename,                  opts)
        vim.keymap.set("n", "x",    api.node.navigate.parent_close, opts)
        vim.keymap.set("n", "X",    api.tree.collapse_all,          opts)
      end,
    })

    vim.keymap.set("n", "<C-e>", "<cmd>NvimTreeToggle<cr>", { silent = true })
    -- vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFile<cr>", { silent = true })
  end,
}

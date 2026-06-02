return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local builtin   = require("telescope.builtin")

    telescope.setup({
      defaults = {
        file_ignore_patterns = { "node_modules", ".git/", "dist/" },
      },
      extensions = {
        fzf = {
          fuzzy                   = true,
          override_generic_sorter = true,
          override_file_sorter    = true,
        },
      },
    })

    telescope.load_extension("fzf")

    -- ファイル名曖昧検索（git 管理下のみ）
    vim.keymap.set("n", "<M-f>",     builtin.git_files, { silent = true })
    vim.keymap.set("n", "<leader>b", builtin.buffers,   { silent = true })
    -- vim.keymap.set("n", "<leader>g", builtin.live_grep, { silent = true })
  end,
}

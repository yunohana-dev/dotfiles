return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup()

    vim.diagnostic.config({
      signs = true,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "K",         vim.lsp.buf.hover,                                  opts)
        vim.keymap.set("n", "gra",       vim.lsp.buf.code_action,                            opts)
        vim.keymap.set("n", "<C-a>",     vim.lsp.buf.code_action,                            opts)
        vim.keymap.set("n", "<C-.>",     vim.lsp.buf.code_action,                            opts)
        vim.keymap.set("n", "grn",       vim.lsp.buf.rename,                                 opts)
        vim.keymap.set("n", "<F2>",      vim.lsp.buf.rename,                                 opts)
        vim.keymap.set("n", "=-",        vim.lsp.buf.format,                                 opts)
        vim.keymap.set("n", "<A-F>",     vim.lsp.buf.format,                                 opts)
        vim.keymap.set("n", "gd",        vim.lsp.buf.definition,                             opts)
        vim.keymap.set("n", "gri",       vim.lsp.buf.implementation,                         opts)
        vim.keymap.set("n", "grr",       vim.lsp.buf.references,                             opts)
        vim.keymap.set("n", "<F12>",     vim.lsp.buf.definition,                             opts)
        vim.keymap.set("n", "<C+F12>",   vim.lsp.buf.implementation,                         opts)
        vim.keymap.set("n", "<S+F12>",   vim.lsp.buf.references,                             opts)
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float,                          opts)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist,                          opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist,                           opts)
        vim.keymap.set("n", "<C-n>",     function() vim.diagnostic.jump({ count = 1 }) end,  opts)
        vim.keymap.set("n", "<C-p>",     function() vim.diagnostic.jump({ count = -1 }) end, opts)
        vim.keymap.set("n", "<F8>",      function() vim.diagnostic.jump({ count = 1 }) end,  opts)
        vim.keymap.set("n", "<S-F8>",    function() vim.diagnostic.jump({ count = -1 }) end, opts)
      end,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    vim.filetype.add({
      extension = { sqlx = "sql" },
    })
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls",
        "ts_ls",
        "pyright",
        "sqls",
        "marksman",
        "jsonls",
        "yamlls",
        "lua_ls",
      },
      automatic_installation = true,
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["sqls"] = function()
          lspconfig.sqls.setup({
            capabilities = capabilities,
            filetypes = { "sql", "mysql", "sqlx" },
            -- on_attach = function(client)
            --   client.server_capabilities.diagnosticProvider = nil
            -- end,
          })
        end,
      },
    })
  end,
}

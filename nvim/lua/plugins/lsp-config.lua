-- Language Server Protocol

return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    { "jose-elias-alvarez/null-ls.nvim", dependencies = "nvim-lua/plenary.nvim" },
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    -- Setup Mason to manage LSP installations
    require("mason").setup({
      ui = {
        height = 0.8,
      },
    })
    require("mason-lspconfig").setup({ automatic_installation = true })

    -- Set LSP capabilities with nvim-cmp for autocompletion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Lua (lua_ls) setup
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
      capabilities = capabilities,
    })

    -- Ruby (ruby_lsp) setup
    require("lspconfig").ruby_lsp.setup({
      capabilities = capabilities,
      cmd = { "/Users/carl/.asdf/shims/ruby-lsp" },
    })

    -- RuboCop setup
    require("lspconfig").rubocop.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Disable formatting and range formatting, handled by null-ls
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        -- Enable inlay hints if supported
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.buf.inlay_hint(bufnr, true)
        end
      end,
    })

    -- Tailwind CSS setup
    require("lspconfig").tailwindcss.setup({
      capabilities = capabilities,
    })

    -- Vue and TypeScript (volar) setup
    require("lspconfig").volar.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.buf.inlay_hint(bufnr, true)
        end
      end,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    })

    -- TypeScript/JavaScript (tsserver) setup
    require("lspconfig").tsserver.setup({
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
      init_options = {
        plugins = {
          { name = "@vue/typescript-plugin", location = "/usr/local/lib/node_modules/@vue/typescript-plugin" },
        },
      },
    })

    -- CLang setup
    require("lspconfig").clangd.setup({
      capabilities = capabilities,
      cmd = { "clangd", "--compile-commands-dir=." },
      init_options = {
        clangdFileStatus = true,
        usePlaceholders = true,
        completeUnimported = true,
      },
    })

    -- JSON setup
    require("lspconfig").jsonls.setup({
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
        },
      },
    })

    -- PHP setup (Intelephense)
    require("lspconfig").intelephense.setup({
      commands = {
        IntelephenseIndex = {
          function()
            vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
          end,
        },
      },
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      capabilities = capabilities,
    })

    -- PHP setup (PHPActor)
    require("lspconfig").phpactor.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        -- Disable unnecessary features for performance
        for _, capability in ipairs({
          "completionProvider", "hoverProvider", "implementationProvider", "referencesProvider",
          "renameProvider", "selectionRangeProvider", "signatureHelpProvider", "typeDefinitionProvider",
          "workspaceSymbolProvider", "definitionProvider", "documentHighlightProvider",
          "documentSymbolProvider", "documentFormattingProvider", "documentRangeFormattingProvider",
        }) do
          client.server_capabilities[capability] = false
        end
      end,
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end, -- Disable diagnostics
      },
    })

    -- null-ls setup for linting and formatting
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js" })
          end,
        }),
        null_ls.builtins.diagnostics.trail_space.with({ disabled_filetypes = { "NvimTree" } }),
        null_ls.builtins.formatting.eslint_d.with({
          condition = function(utils)
            return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json" })
          end,
        }),
        null_ls.builtins.formatting.pint.with({
          condition = function(utils)
            return utils.root_has_file({ "vendor/bin/pint" })
          end,
        }),
        null_ls.builtins.formatting.prettier.with({
          condition = function(utils)
            return utils.root_has_file({
              ".prettierrc", ".prettierrc.json", ".prettierrc.yml", ".prettierrc.js", "prettier.config.js",
            })
          end,
        }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 5000 })
            end,
          })
        end
      end,
    })

    require("mason-null-ls").setup({ automatic_installation = true })

    -- Keymaps
    vim.keymap.set("n", "<Leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>")
    vim.keymap.set("n", "gd", ":Telescope lsp_definitions<CR>")
    vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    vim.keymap.set("n", "gi", ":Telescope lsp_implementations<CR>")
    vim.keymap.set("n", "gr", ":Telescope lsp_references<CR>")
    vim.keymap.set("n", "<Leader>lr", ":LspRestart<CR>", { silent = true })
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
    vim.keymap.set("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
    vim.keymap.set("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")

    -- Commands
    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format({ timeout_ms = 5000 })
    end, {})

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = false,
      float = { source = true },
    })

    -- Diagnostic signs
    vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
  end,
}


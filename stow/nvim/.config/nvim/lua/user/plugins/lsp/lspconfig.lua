return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- lsp client
      { 'williamboman/mason-lspconfig.nvim', config = true },
      'williamboman/mason.nvim',
      'folke/which-key.nvim',
      'b0o/schemastore.nvim',
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require 'lspconfig'
      local servers = {
        'ts_ls',
        'html',
        'tailwindcss',
        'eslint',
        'ocamllsp',
        'pyright',
        'ruff_lsp',
        'yamlls',
      }

      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end
      lspconfig.jsonls.setup {
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      }
      lspconfig.gopls.setup {
        capabilities = capabilities,
        cmd = { 'gopls' },
        filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
        root_dir = lspconfig.util.root_pattern('go.mod', '.git', 'go.work'),
        settings = {
          gopls = {
            completeUnimported = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
          },
        },
      }
      lspconfig.yamlls.setup {
        settings = {
          yaml = {
            schemaStore = {
              -- You must disable built-in schemaStore support if you want to use
              -- this plugin and its advanced options like `ignore`.
              enable = false,
              -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
              url = '',
            },
            schemas = require('schemastore').yaml.schemas(),
          },
        },
      }
      lspconfig['lua_ls'].setup {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = {
                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                [vim.fn.stdpath 'config' .. '/lua'] = true,
              },
            },
          },
        },
      }

      local wk = require 'which-key'
      local telescope = require 'telescope.builtin'
      wk.register {
        g = {
          name = 'Goto',
          D = { vim.lsp.buf.declaration, 'Declaration' },
          d = { vim.lsp.buf.definition, 'Definition' },
          i = { vim.lsp.buf.implementation, 'Implementation' },
        },
        K = { vim.lsp.buf.hover, 'Documentation' },
        ['<leader>'] = {
          r = { vim.lsp.buf.rename, 'Rename' },
          l = {
            name = 'LSP',
            s = { telescope.lsp_document_symbols, 'Document Symbols' },
            S = { telescope.lsp_dynamic_workspace_symbols, 'Workspace Symbols' },
            e = { telescope.quickfix, 'Telescope Quickfix' },
          },
        },
      }
      -- wk.register({
      --  c = { vim.lsp.buf.code_action, 'Code Action' },
      -- }, { mode = { 'n', 'v' }, prefix = '<leader>' })
    end,
  },
}

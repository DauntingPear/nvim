local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'lua_ls',
  'rust_analyzer',
  'zls',
  'jdtls',
})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local parentDir = vim.fn.expand('%:p:h:t')
local filename = vim.fn.expand('%:t:r')

--vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
--vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
--vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
--vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })


local cmp = require('cmp')

cmp.setup({
    preselect = cmp.PreselectMode.None,
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    }
})


local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)



lsp.set_preferences({
	sign_icons = { }
})

require('mini.clue').setup({
  clues = {
    { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
  },
})


local navic = require("nvim-navic")

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    navic.attach(client, bufnr)

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts, { desc = 'goto definition' })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts, { desc = 'hov menu' })
    vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts, { desc = 'workspace symbol' })
    vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts, { desc = 'open diagnostics' })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts, { desc = 'next diagnostic' })
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts, { desc = 'prev diagnostic' })
    vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts, { desc = 'code action' })
    vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    require('mini.clue').setup({})

    require('lspconfig.ui.windows').default_options.border = 'single'

    if client.name == "jdt.ls" then
      require("jdtls").setup_dap { hotcodereplace = "auto" }
      require("jdtls.dap").setup_dap_main_class_configs()
      vim.lsp.codelens.refresh()
    end
end)

lsp.skip_server_setup({'jdtls'})

lsp.setup()

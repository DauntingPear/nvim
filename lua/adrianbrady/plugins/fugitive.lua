return {
  'tpope/vim-fugitive',
  config = function()
    local AJ_Fugitive = vim.api.nvim_create_augroup('AJ_Fugitive', {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufWinEnter', {
      group = AJ_Fugitive,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        vim.keymap.set('n', '<leader>p', function()
          vim.cmd.Git 'push'
        end, {
          buffer = bufnr,
          remap = false,
          desc = 'git [p]ush',
        })

        -- rebase always
        vim.keymap.set('n', '<leader>P', function()
          vim.cmd.Git { 'pull', '--rebase' }
        end, {
          buffer = bufnr,
          remap = false,
          desc = 'git [p]ull --rebase',
        })

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        vim.keymap.set('n', '<leader>t', ':Git push -u origin ', {
          buffer = bufnr,
          remap = false,
          desc = 'git push -u origin',
        })
      end,
    })

    local wk = require 'which-key'

    wk.register {
      ['<leader>gm'] = { '<cmd>G<cr>', 'Fugitive [M]enu' },
      ['<leader>gc'] = { '<cmd>Git commit<cr>', 'Git [C]ommit' },
      ['<leader>gd'] = { '<cmd>Git diff<cr>', 'Git [D]iff' },
      ['<leader>gl'] = { '<cmd>Git log<cr>', 'Git [L]og' },
      ['<leader>gb'] = { '<cmd>Git blame<cr>', 'Git [B]lame' },
      ['<leader>gt'] = {
        name = 'Git [T]ool',
        m = { '<cmd>Git mergetool<cr>', 'Git [M]ergetool' },
        d = { '<cmd>Git difftool<cr>', 'Git [D]ifftool' },
      },
    }
  end,
}

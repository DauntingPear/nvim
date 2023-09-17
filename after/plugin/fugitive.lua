vim.keymap.set("n", "<leader>gs", vim.cmd.Git, {desc = 'Open Git' })
require('mini.clue').setup({
  clues = {
    { mode = 'n', keys = '<Leader>g', desc = '+Git' },
  },
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require('mini.clue').setup({
  clues = {
    { mode = 'n', keys = '<leader>h', desc = "+[H]arpoon" },
  },
})

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = 'add' })
vim.keymap.set("n", "<leader>he", ui.toggle_quick_menu, { desc = 'menu' })

vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, { desc = 'file 1' })
vim.keymap.set("n", "<leader>ht", function() ui.nav_file(2) end, { desc = 'file 2' })
vim.keymap.set("n", "<leader>hn", function() ui.nav_file(3) end, { desc = 'file 3' })
vim.keymap.set("n", "<leader>hs", function() ui.nav_file(4) end, { desc = 'file 4' })



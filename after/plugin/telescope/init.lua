local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'tele find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = 'tele grep string' })
vim.keymap.set('n', '<C-_>', function()
    builtin.current_buffer_fuzzy_find({ sorting_strategy="ascending", prompt_position="top",  })
end, { desc = 'Buf fzf' })

local function edit_neovim()
    local opts_with_preview, opts_without_preview

    opts_with_preview = {
        prompt_title = "~ dotfiles ~",
        shorten_path = false,
        cwd = "~/.config/nvim",
        theme = "dropdown",

        layout_Strategy = "flex",
        mappings = {
            i = {
                ["<C-y>"] = false,
            },
        },

    }

    opts_without_preview = vim.deepcopy(opts_with_preview)
    opts_without_preview.previewer = false

    require("telescope.builtin").find_files(opts_with_preview)
end

vim.keymap.set('n', '<leader>ne', edit_neovim, { desc = 'edit neovim' })

require('telescope').load_extension('git_diffs')

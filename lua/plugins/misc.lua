return {

    {
        "akinsho/toggleterm.nvim", tag = '*', config = function()
            require("toggleterm").setup()
        end
    },

    {
        'tamton-aquib/duck.nvim',
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, { desc = 'make duck' })
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, { desc = 'cook duck' })
        end
    },

    {
        "epwalsh/obsidian.nvim",
        lazy = true,
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
            "BufReadPre path/to/my-vault/**.md",
            "BufNewFile path/to/my-vault/**.md",
        },
        dependencies = {
            -- Required.
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
            "nvim-telescope/telescope.nvim",
            "ibhagwan/fzf-lua",
            "junegunn/fzf",
        },
    }

}

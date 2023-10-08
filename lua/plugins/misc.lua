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
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    },

}

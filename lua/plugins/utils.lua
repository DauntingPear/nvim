return {

    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    {
        'jedrzejboczar/possession.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    'wellle/targets.vim',

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },



    -- Lua
    { 'echasnovski/mini.clue', version = false },

    {
        'folke/noice.nvim',
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    {
        'paopaol/telescope-git-diffs.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
    },

    'ThePrimeagen/git-worktree.nvim',

    -- Lua
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    -- Lua

    'anuvyklack/hydra.nvim',




    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
}

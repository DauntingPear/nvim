local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require('lazy').setup({    -- Packer can manage itself

    {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end},

    'goolord/alpha-nvim',

    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig"
    },

    {
        'jedrzejboczar/possession.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    'wellle/targets.vim',

    {
        'tamton-aquib/duck.nvim',
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, { desc = 'make duck' })
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, { desc = 'cook duck' })
        end
    },

    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },


    {
        "ray-x/lsp_signature.nvim",
    },

    {
        "utilyre/barbecue.nvim",
        tag = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
    },

    -- Lua
    -- "folke/which-key.nvim",
    'echasnovski/mini.clue',

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
    'abecodes/tabout.nvim',

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    -- Lua

    'anuvyklack/hydra.nvim',

    'mfussenegger/nvim-jdtls',


    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-telescope/telescope-dap.nvim',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    { "catppuccin/nvim", name = "catppuccin" },
    'nvim-treesitter/nvim-treesitter',

    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            build = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
        }
    },


})


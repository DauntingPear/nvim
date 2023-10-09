local headerCatSleep = {
    [[ |\\      _,,,---,,_     ]],
    [[ /,`.-'`'    -.  ;-;;,_  ]],
    [[ |,4-  ) )-,_..;\ (  `'-']],
    [['---''(_/--'  `-'\_)     ]],
}

local headerCat1 = {
    " ⟋|､       ",
    "(°､ ｡ 7    ",
    " |､  ~ヽ   ",
    " じしf_,)〳",
}

local headerCat2 = {
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[]],
    [[ ／l、      ]],
    [[（ﾟ､ ｡ ７   ]],
    [[  l  ~ヽ    ]],
    [[  じしf_,)ノ]],
}

return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")


        dashboard.section.header.val = headerCat2

        dashboard.section.buttons.val = {
            dashboard.button( "e", "New File", ":e<CR>"),
            dashboard.button( "f", "Find files", ":Telescope find_files<CR>"),
            dashboard.button( "w", "Find WS file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
            dashboard.button( "r", "Recent", ":Telescope oldfiles<CR>"),
            dashboard.button( "q", "Quit NVIM", ":qa<CR>"),
        }

        alpha.setup(dashboard.opts)
    end
};


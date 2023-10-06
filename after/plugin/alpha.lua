local M = {}

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
    " ⟋|､       ",
    "(°､ ｡ 7    ",
    " |､  ~ヽ   ",
    " じしf_,)〳",
}

dashboard.section.buttons.val = {
    dashboard.button( "e", "New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button( "t", "Telescope CD", ":Telescope"),
    dashboard.button( "f", "Find WS file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
    dashboard.button( "r", "Recent", "Telescope oldfiles<CR>"),
    dashboard.button( "s", "NVIM Config", ":Telescope<CR>"),
    dashboard.button( "q", "Quit NVIM", ":qa<CR>"),
}

alpha.setup(dashboard.opts)

return M

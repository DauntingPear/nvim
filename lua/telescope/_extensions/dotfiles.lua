local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local function dotfile(opts)
    opts = opts or {}
    pickers.new(opts, {
        prompt_title = "dotfiles",
        finder = finders.new_table {
            results = { "red", "green", "blue" }
        },
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                vim.api.nvim_put({ selection[1] }, "", false, true)
            end)
            return true
        end,
    }):find()
end

return require("telescope").register_extension {
    setup = function(ext_config, config)

    end,
    exports = {
        dotfile = dotfile,
    },
}

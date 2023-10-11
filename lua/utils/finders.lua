local M = {}

function M.find_dotfiles()
    require("telescope.builtin").find_files {
        prompt_title = "<Dotfiles>",
        cwd = "~/.config",
    }
end

vim.keymap.set("n", "<leader>fd", ":lua require('utils.finders').find_dotfiles()<CR>")

function M.find_nvim_cfg()
    require("telescope.builtin").find_files {
        prompt_title = "<Dotfiles>",
        cwd = "~/.config/nvim",
    }
end

vim.keymap.set("n", "<leader>fn", ":lua require('utils.finders').find_nvim_cfg()<CR>")

function M.find_workspace()
    require("telescope.builtin").find_files {
        prompt_title = "Workspace",
        cwd = "~/Workspace",
    }
end

vim.keymap.set("n", "<leader>fw", ":lua require('utils.finders').find_workspace()<CR>")

function M.find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

vim.keymap.set("n", "<leader>fg", ":lua require('utils.finders').find_files_from_project_git_root()<CR>")

return M
